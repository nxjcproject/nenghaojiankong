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
    public class MachineHaltAlarmMonitor
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
                        A.LevelType as OrganizationType
                        from system_Organization A 
					    where A.Enabled = 1
                        and (A.LevelType = 'Company' or A.LevelType = 'Factory' or A.LevelType = 'ProductionLine')
                        and ( A.LevelCode like 'O0301%' ) 
                        union 
                        select 
					    CONVERT(varchar(64), D.ID) as OrganizationID, 
                        D.VariableDescription as Name,
                        A.LevelCode + (case when len(D.LevelCode) = 1 then '0' + D.LevelCode else D.LevelCode end) as LevelCode,
                        'MasterMachine' as OrganizationType 
                        from system_Organization A, 
						(select 
						    B.ID as ID,
							cast(row_number() over(order by B.ID desc) as varchar) as LevelCode, 
							B.OrganizationID as OrganizationID,
						    B.VariableDescription as VariableDescription 
						    from system_MasterMachineDescription B ) D 
					    where A.Enabled = {1}
                        and A.LevelType = 'ProductionLine'
                        and {0} 
                        and A.OrganizationID = D.OrganizationID ) M 
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
            string m_Sql = @"select 
					            CONVERT(varchar(64), D.ID) as Id, 
						        A.OrganizationID as OrganizationId,
                                A.Name as OrganizationName, 
                                F.EquipmentName as Name,
                                A.LevelCode + (case when len(D.LevelCode) = 1 then '0' + D.LevelCode else D.LevelCode end) as LevelCode,
                                'MasterMachine' as OrganizationType,
                                F.HaltTime as StartTime,
                                F.ReasonText as ReasonText  
                                from system_Organization A, 
						        (select 
						            B.ID as ID,
							        cast(row_number() over(order by B.ID desc) as varchar) as LevelCode, 
							        B.OrganizationID as OrganizationID,
						            B.VariableDescription as VariableDescription 
						            from system_MasterMachineDescription B ) D, system_TenDaysRealtimeAlarm E, shift_MachineHaltLog F
					            where A.Enabled = 1
                                and A.LevelType = 'ProductionLine'
                                and A.OrganizationID = D.OrganizationID
						        and D.ID = F.EquipmentID
						        and A.OrganizationID = E.OrganizationID
						        and (E.AlarmType = 'MachineHalt' or E.AlarmType = 'SlaverHaltDelay')
						        and E.KeyID = F.MachineHaltLogID
                                and {0}";

            string m_SqlConditionTemp = @" A.LevelCode + (case when len(D.LevelCode) = 1 then '0' + D.LevelCode else D.LevelCode end) like '{0}%' ";
           
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
        //获得报警值(树)
        public static DataTable GetAlarmValueTreeByLevelCode(string[] myAlarmNodeLevelCode)
        {
            string m_Sql = @"select 
					            CONVERT(varchar(64), D.ID) as Id, 
						        A.OrganizationID as OrganizationId,
                                A.Name as OrganizationName, 
                                '' as ParentId,
                                F.EquipmentName as Name,
                                A.LevelCode + (case when len(D.LevelCode) = 1 then '0' + D.LevelCode else D.LevelCode end) as LevelCode,
                                'MasterMachine' as OrganizationType,
                                F.HaltTime as StartTime,
                                F.ReasonText as ReasonText  
                                from system_Organization A, 
						        (select 
						            B.ID as ID,
							        cast(row_number() over(order by B.ID desc) as varchar) as LevelCode, 
							        B.OrganizationID as OrganizationID,
						            B.VariableDescription as VariableDescription 
						            from system_MasterMachineDescription B ) D, system_TenDaysRealtimeAlarm E, shift_MachineHaltLog F
					            where A.Enabled = 1
                                and A.LevelType = 'ProductionLine'
                                and A.OrganizationID = D.OrganizationID
						        and D.ID = F.EquipmentID
						        and A.OrganizationID = E.OrganizationID
						        and (E.AlarmType = 'MachineHalt' or E.AlarmType = 'SlaverHaltDelay')
						        and E.KeyID = F.MachineHaltLogID
                                and {0} 
                            union all
                            select 
                                CONVERT(varchar(64), G1.MachineHaltLogID) as Id,
						        A1.OrganizationID as OrganizationId,
                                A1.Name as OrganizationName, 
					            CONVERT(varchar(64), D1.ID) as ParentId, 
                                G1.EquipmentName as Name,
                                'X00000001' as LevelCode,
                                'SlaveMachine' as OrganizationType,
                                G1.WarmingTime as StartTime,
                                G1.ReasonText as ReasonText 
                                from system_Organization A1, 
						        (select 
						            B1.ID as ID,
							        cast(row_number() over(order by B1.ID desc) as varchar) as LevelCode, 
							        B1.OrganizationID as OrganizationID,
						            B1.VariableDescription as VariableDescription 
						            from system_MasterMachineDescription B1 ) D1, system_TenDaysRealtimeAlarm E1, shift_MachineHaltLog F1, shift_SlaverHaltDelayAlarmLog G1
					            where A1.Enabled = 1
                                and A1.LevelType = 'ProductionLine'
                                and A1.OrganizationID = D1.OrganizationID
						        and D1.ID = F1.EquipmentID
						        and A1.OrganizationID = E1.OrganizationID
						        and (E1.AlarmType = 'MachineHalt' or E1.AlarmType = 'SlaverHaltDelay')
						        and E1.KeyID = F1.MachineHaltLogID
                                and G1.KeyID = F1.MachineHaltLogID
                                and {1}";

            string m_SqlConditionTemp = @" A.LevelCode + (case when len(D.LevelCode) = 1 then '0' + D.LevelCode else D.LevelCode end) like '{0}%' ";
            string m_SqlConditionTemp1 = @" A1.LevelCode + (case when len(D1.LevelCode) = 1 then '0' + D1.LevelCode else D1.LevelCode end) like '{0}%' ";
            string m_SqlCondition = "";                 //数据数据授权
            string m_SqlCondition1 = "";                 //数据数据授权

            //tz_Formula B, formula_FormulaDetail C
            if (myAlarmNodeLevelCode != null)                //数据授权约束
            {
                for (int i = 0; i < myAlarmNodeLevelCode.Length; i++)
                {
                    if (i == 0)
                    {
                        m_SqlCondition = string.Format(m_SqlConditionTemp, myAlarmNodeLevelCode[i]);
                        m_SqlCondition1 = string.Format(m_SqlConditionTemp1, myAlarmNodeLevelCode[i]);
                    }
                    else
                    {
                        m_SqlCondition = m_SqlCondition + " or " + string.Format(m_SqlConditionTemp, myAlarmNodeLevelCode[i]);
                        m_SqlCondition1 = m_SqlCondition1 + " or " + string.Format(m_SqlConditionTemp1, myAlarmNodeLevelCode[i]);
                    }
                }
            }

            if (m_SqlCondition != "")
            {
                m_Sql = string.Format(m_Sql, "(" + m_SqlCondition + ")", "(" + m_SqlCondition1 + ")");
            }
            else
            {
                m_Sql = string.Format(m_Sql, "A.OrganizationID <> A.OrganizationID", "A.OrganizationID <> A.OrganizationID");
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
