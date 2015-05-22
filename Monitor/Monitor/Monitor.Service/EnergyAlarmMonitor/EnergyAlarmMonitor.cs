using Monitor.Infrastructure.Configuration;
using SqlServerDataAdapter;
using SqlServerDataAdapter.Infrastruction;
using StatisticalReport.Infrastructure.Report;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace Monitor.Service.EnergyAlarmMonitor
{
    public class EnergyAlarmMonitor
    {
        private static readonly string _connStr = ConnectionStringFactory.NXJCConnectionString;
        private static readonly ISqlServerDataFactory _dataFactory = new SqlServerDataFactory(_connStr);
        public static DataTable GetAlarmNodes(List<string> myOrganizationIdList)
        {
            string m_Sql = @"Select 
                        A.OrganizationID as OrganizationId, 
                        A.Name as Name,
                        A.LevelCode as LevelCode 
                        from system_Organization A 
					    where A.Enabled = {1}
                        and {0}
                        order by A.LevelCode";

            string m_SqlConditionTemp = @" A.OrganizationID in ({0}) ";
            string m_SqlCondition = "";                 //数据数据授权

            //tz_Formula B, formula_FormulaDetail C
            if (myOrganizationIdList != null)                //数据授权约束
            {
                for (int i = 0; i < myOrganizationIdList.Count; i++)
                {
                    if (i == 0)
                    {
                        m_SqlCondition = "'" + myOrganizationIdList[i] + "'";
                    }
                    else
                    {
                        m_SqlCondition = m_SqlCondition + ",'" + myOrganizationIdList[i] + "'";
                    }
                }
                m_SqlConditionTemp = string.Format(m_SqlConditionTemp, m_SqlCondition);
            }

            if (m_SqlCondition != "")
            {
                m_Sql = string.Format(m_Sql, m_SqlConditionTemp, "1");
            }
            else
            {
                m_Sql = string.Format(m_Sql, "A.OrganizationID <> A.OrganizationID", "1");
            }

            try
            {
                DataTable m_Result = _dataFactory.Query(m_Sql);
                return m_Result;
            }
            catch (Exception)
            {
                return null;
            }
        }
        public static DataTable GetAlarmNodesByParentLevelCode(string myParentNodeLevelCode, List<string> myOrganizationIdList)
        {
            List<string> m_Organizations = DataBaseHelper.GetOrganisationLevelCodeById(myOrganizationIdList, _dataFactory);
            string m_Sql = @"Select 
                    M.OrganizationID as OrganizationId, 
                    M.Name as Name, 
                    M.LevelCode as LevelCode 
                    from 
                        (Select 
                        A.OrganizationID as OrganizationID, 
                        A.Name as Name,
                        A.LevelCode as LevelCode 
                        from system_Organization A 
					    where A.Enabled = {1}
                        and (A.LevelType = 'Company' or A.LevelType = 'Factory' or A.LevelType = 'ProductionLine')
                        and {0} 
                        union 
                        select 
					    CONVERT(varchar(64), C.ID) as OrganizationID, 
                        C.Name as Name,
                        A.LevelCode + substring(C.LevelCode,2 ,len(C.LevelCode)-1) as LevelCode
                        from system_Organization A, tz_Formula B, formula_FormulaDetail C  
					    where A.Enabled = {1}
                        and A.LevelType = 'ProductionLine'
                        and {0} 
                        and A.OrganizationID = B.OrganizationID 
                        and B.Type = 2
                        and B.Enable = 1 
                        and B.KeyID = C.KeyID) M 
                    where M.LevelCode like '{2}%' 
                    and len(M.LevelCode) = len('{2}') + 2 
                    order by M.LevelCode";
           
            string m_SqlConditionTemp = @" A.LevelCode like '{0}%' ";
            string m_SqlCondition = "";                 //数据数据授权

            //tz_Formula B, formula_FormulaDetail C
            if (myOrganizationIdList != null)                //数据授权约束
            {
                for (int i = 0; i < myOrganizationIdList.Count; i++)
                {
                    if (i == 0)
                    {
                        m_SqlCondition = string.Format(m_SqlConditionTemp, m_Organizations[i]);
                    }
                    else
                    {
                        m_SqlCondition = m_SqlCondition + string.Format(" or " + m_SqlConditionTemp, m_Organizations[i]);
                    }
                }
            }

            if (m_SqlCondition != "")
            {
                m_Sql = string.Format(m_Sql, "(" + m_SqlCondition + ")", "1", myParentNodeLevelCode);
            }
            else
            {
                m_Sql = string.Format(m_Sql, "A.OrganizationID <> A.OrganizationID", "1", myParentNodeLevelCode);
            }

            try
            {
                DataTable m_Result = _dataFactory.Query(m_Sql);
                return m_Result;
            }
            catch (Exception)
            {
                return null;
            }
        }
        //获得报警值
        public static DataTable GetAlarmValueByLevelCode(string[] myAlarmNodeLevelCode)
        {
            string m_Sql = @"Select 
                        A.OrganizationID as OrganizationId, 
						A.KeyId as KeyId, 
                        (case when A.AlarmType = 'EnergyConsumption' then '电耗报警' when A.AlarmType = 'Power' then '功率报警' when A.AlarmType = 'CoalConsumption' then '煤耗报警' else A.AlarmType end) as AlarmType,
                        A.VariableID as VariableID,
                        D.LevelCode + substring(C.LevelCode,2 ,len(C.LevelCode)-1) as LevelCode,
                        C.Name as FormulaName, 
                        D.Name as Name, 
                        E.StandardValue as StandardValue,
                        E.ActualValue as ActualValue,
                        E.StartTime as StartTime 
						from system_TenDaysRealtimeAlarm A, tz_Formula B, formula_FormulaDetail C, system_Organization D, shift_EnergyConsumptionAlarmLog E 
						where A.VariableID is not null
						and A.AlarmType in ('EnergyConsumption','Power','CoalConsumption') 
						and B.Type = 2
						and B.ENABLE = 1
						and B.State = 0
						and A.OrganizationID = B.OrganizationID
						and B.KeyID = C.KeyID
						and A.VariableID = C.VariableID
						and A.OrganizationID = D.OrganizationID
                        and A.KeyId = E.EnergyConsumptionAlarmLogID
                        and {0}";

            string m_SqlConditionTemp = @" D.LevelCode + substring(C.LevelCode,2 ,len(C.LevelCode)-1) like '{0}%' ";
            string m_SqlCondition = "";                 //数据数据授权

            //tz_Formula B, formula_FormulaDetail C
            if (myAlarmNodeLevelCode != null)                //数据授权约束
            {
                for (int i = 0; i < myAlarmNodeLevelCode.Length; i++)
                {
                    if (i == 0)
                    {
                        m_SqlCondition = string.Format(m_SqlConditionTemp, myAlarmNodeLevelCode[i]);
                    }
                    else
                    {
                        m_SqlCondition = m_SqlCondition + " or " + string.Format(m_SqlConditionTemp, myAlarmNodeLevelCode[i]);
                    }
                }
            }

            if (m_SqlCondition != "")
            {
                m_Sql = string.Format(m_Sql, "(" + m_SqlCondition + ")");
            }
            else
            {
                m_Sql = string.Format(m_Sql, "A.OrganizationID <> A.OrganizationID");
            }

            try
            {
                DataTable m_Result = _dataFactory.Query(m_Sql);
                return m_Result;
            }
            catch (Exception)
            {
                return null;
            }
        }
        
    }
}
