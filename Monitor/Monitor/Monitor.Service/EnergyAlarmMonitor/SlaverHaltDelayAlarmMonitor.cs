using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Monitor.Infrastructure.Configuration;
using SqlServerDataAdapter;
using SqlServerDataAdapter.Infrastruction;
using StatisticalReport.Infrastructure.Report;

namespace Monitor.Service.EnergyAlarmMonitor
{
    public class SlaverHaltDelayAlarmMonitor
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
                    M.LevelCode as LevelCode,
                    M.OrganizationType as OrganizationType 
                    from 
                        (Select 
                        A.OrganizationID as OrganizationID, 
                        A.Name as Name,
                        A.LevelCode as LevelCode, 
                        'ProductionLine' as OrganizationType
                        from system_Organization A 
					    where A.Enabled = {1}
                        and len(A.LevelCode) <= 7
                        and {0} 
                        union 
                        select 
					    CONVERT(varchar(64), B.ID) as OrganizationID, 
                        B.VariableDescription as Name,
                        A.LevelCode + substring(A.LevelCode,6,2) as LevelCode,
                        'MasterMachine' as OrganizationType 
                        from system_Organization A, system_MasterMachineDescription B  
					    where A.Enabled = {1}
                        and len(A.LevelCode) = 7 
                        and {0} 
                        and A.OrganizationID = B.OrganizationID ) M 
                    where M.LevelCode like '{2}%' 
                    and len(M.LevelCode) = len('{2}') + 2 
                    order by M.OrganizationType, M.LevelCode";

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
            string m_EndTime = DateTime.Now.AddMinutes(-10).ToString("yyyy-MM-dd HH:mm:ss");
            string m_Sql = @"Select 
                        A.OrganizationID as OrganizationId, 
                        D.Name as Name, 
                        D.LevelCode + substring(A.LevelCode,2 ,len(A.LevelCode)-1) as LevelCode, 
                        C.Name as FormulaName, 
                        A.StandardValue as StandardValue,
                        A.ActualValue as ActualValue,
                        A.StartTime as StartTime, 
						A.EnergyConsumptionType as EnergyConsumptionType   
                        from shift_EnergyConsumptionAlarmLog A  
                        left join system_Organization D on A.OrganizationID = D.OrganizationID, 
						tz_Formula B, formula_FormulaDetail C
					    where A.OrganizationID = B.OrganizationID 
                        and B.Type = 2 
                        and B.Enable = 1 
                        and B.KeyID = C.KeyID
                        and C.LevelCode = A.LevelCode
                        and A.EndTime > '{1}' 
                        and {0}";

            string m_SqlConditionTemp = @" D.LevelCode + substring(A.LevelCode,2 ,len(A.LevelCode)-1) like '{0}%' ";
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
                m_Sql = string.Format(m_Sql, "(" + m_SqlCondition + ")", m_EndTime);
            }
            else
            {
                m_Sql = string.Format(m_Sql, "A.OrganizationID <> A.OrganizationID", m_EndTime);
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
