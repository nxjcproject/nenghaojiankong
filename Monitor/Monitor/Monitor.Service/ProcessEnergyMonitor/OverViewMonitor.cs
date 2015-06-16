using Monitor.Infrastructure.Configuration;
using SqlServerDataAdapter;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor.Service.ProcessEnergyMonitor
{
    public class OverViewMonitor
    {
        private static readonly string _connStr = ConnectionStringFactory.NXJCConnectionString;
        private static readonly ISqlServerDataFactory _dataFactory = new SqlServerDataFactory(_connStr);

        public static DataTable GetStaticValueByProductionLine(string myStartTime, string myEndTime, string myOrganizationIdsString)
        {
            string m_Sql = @"select 
                                G.VariableId as VariableId,
                                G.OrganizationID as OrganizationId, 
								J.Name as OrganizationName,
								(Case when H.Name is not null then H.Name else I.Name end) as VariableName,
                                G.TotalPeakValleyFlat as Value,
                                I.LevelType as LevelType, 
                                I.LevelCode as LevelCode
                                 from 
                                (
                                Select
                                A.VariableId as VariableId,
                                A.OrganizationID as OrganizationID,
                                sum(A.TotalPeakValleyFlatB) as TotalPeakValleyFlat 
                                from balance_Energy A , tz_Balance B
                                where A.KeyId = B.BalanceId 
								and A.ValueType not like '%Consumption'
                                and A.ValueType not like '%Consumption'
                                and B.StaticsCycle = 'day' 
                                and B.TimeStamp >= @StartTime 
                                and B.TimeStamp < @EndTime
                                and A.OrganizationID in ({0})
                                group by A.OrganizationID, A.VariableId
                                ) G
								left join 
								    (select 
									C.OrganizationID as OrganizationID, 
									D.VariableId as VariableId,
									D.Name as Name 
									from tz_Material C, material_MaterialDetail D 
									where C.OrganizationID in ({0})
									and C.Enable = 1
									and C.State = 0
									and C.KeyID = D.KeyID) H on G.VariableId = H.VariableId and G.OrganizationID = H.OrganizationID
								left join 
								    (select 
									E.OrganizationID as OrganizationID, 
									F.VariableId + '_ElectricityQuantity' as VariableId,
									F.LevelType as LevelType,
                                    F.LevelCode as LevelCode, 
									F.Name as Name
									from tz_Formula E, formula_FormulaDetail F 
									where E.OrganizationID in ({0})
									and E.Enable = 1
									and E.State = 0
									and E.KeyID = F.KeyID) I on G.VariableId = I.VariableId and G.OrganizationID = I.OrganizationID
								left join system_Organization J on G.OrganizationID = J.OrganizationID    
                                order by G.OrganizationID";
            try
            {
                SqlParameter[] m_Parameters = { new SqlParameter("@StartTime", myStartTime), 
                                                  new SqlParameter("@EndTime", myEndTime)};
                m_Sql = string.Format(m_Sql, myOrganizationIdsString);
                DataTable m_Result = _dataFactory.Query(m_Sql, m_Parameters);
                return m_Result;
            }
            catch (Exception e)
            {
                return null;
            }
        }
        /// <summary>
        /// 获得总计统计数据
        /// </summary>
        /// <param name="myStationId">当前web站点组织机构ID</param>
        /// <returns></returns>
        public static DataTable GetMaterialTotalValue(string myStartTime, string myEndTime, string myOrganizationIdsString)
        {
            string m_Sql = @"Select 
                             E.VariableId as VariableId,
                             F.Name as Name, 
                             F.Unit as Unit, 
                             E.TotalPeakValleyFlat as Value
                             from 
                                (Select 
                                    A.VariableId as VariableId, 
                                    sum(A.TotalPeakValleyFlatB) as TotalPeakValleyFlat 
                                    from balance_Energy A , tz_Balance B
                                    where A.KeyId = B.BalanceId
                                    and B.StaticsCycle = 'day' 
                                    and B.TimeStamp >= @StartTime
                                    and B.TimeStamp < @EndTime
                                    and B.OrganizationID in ({0})
                                    group by A.VariableId) E, 
                                (Select 
                                    distinct D.VariableId as VariableId,
                                    D.Name as Name, 
                                    D.Unit as Unit   
                                    from tz_Material C, material_MaterialDetail D
                                    where C.Enable = 1
                                    and C.State = 0
                                    and C.OrganizationID in ({0})
                                    and C.KeyID = D.KeyID) F 
                                where E.VariableId = F.VariableId";
            try
            {
                SqlParameter[] m_Parameters = { new SqlParameter("@StartTime", myStartTime), 
                                                  new SqlParameter("@EndTime", myEndTime)};
                m_Sql = string.Format(m_Sql, myOrganizationIdsString);
                DataTable m_Result = _dataFactory.Query(m_Sql, m_Parameters);
                return m_Result;
            }
            catch (Exception e)
            {
                return null;
            }
        }
        public static DataTable GetOrganizationIdsByStationId(string myStationId)
        {
            string m_Sql = @"Select
                                B.OrganizationID as OrganizationId,
                                B.Name as Name, 
                                B.Type as Type 
                                from system_Organization A, system_Organization B 
                                where A.OrganizationID = @OrganizationID
                                and B.LevelCode like A.LevelCode + '%'
                                order by B.Type, B.OrganizationID";
            try
            {
                SqlParameter[] m_Parameters = { new SqlParameter("@OrganizationID", myStationId) };
                DataTable m_Result = _dataFactory.Query(m_Sql, m_Parameters);
                return m_Result;
            }
            catch (Exception e)
            {
                return null;
            }
        }
        public static DataTable GetConsumptionTempplateTable()
        {
            string m_Sql = @"Select
                                A.VariableId as VariableId,
                                A.VariableName as VariableName, 
                                A.TemplateType as TemplateType, 
                                A.ValueType as ValueType,
                                A.ProductionLineType as ProductionLineType, 
                                A.ValueFormula as ValueFormula,
                                D.LevelCode as LevelCode
                                from balance_Energy_Template A
                                left join 
                                    (select 
                                        distinct C.VariableId as VariableId,
                                        C.LevelCode as LevelCode
                                        from tz_Formula B, formula_FormulaDetail C
                                        where B.KeyID = C.KeyID 
                                        and B.ENABLE = 1
                                        and B.State = 0
										and C.LevelType <> 'MainMachine'
                                    ) D on A.VariableId = D.VariableId + '_ElectricityConsumption' 
                                where A.TemplateTypeDepth = 2
                                and (A.ValueType = 'ElectricityConsumption' or A.ValueType = 'CoalConsumption')
                                and A.Enabled = 1
                                order by A.ValueType";
            try
            {
                DataTable m_Result = _dataFactory.Query(m_Sql);
                return m_Result;
            }
            catch (Exception e)
            {
                return null;
            }
        }
    }
}
