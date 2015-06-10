using Monitor.Service.ProcessEnergyMonitor;
using SqlServerDataAdapter;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor.Service.OverViewMonitorFactory
{
    public class ComprehensiveConsumptionProvider : IOverViewMonitorDataProvider
    {
         private ISqlServerDataFactory _connFactory;
         public ComprehensiveConsumptionProvider(string connString)
        {
            _connFactory = new SqlServerDataFactory(connString);
        }

        public IEnumerable<ProcessEnergyMonitor.DataItem> GetDataItem(string organizationId, params string[] variableIds)
        {
            Standard_GB16780_2012.Function_EnergyConsumption_V1 EnergyConsumption_V1 = new Standard_GB16780_2012.Function_EnergyConsumption_V1();
            Standard_GB16780_2012.Parameters_ComprehensiveData m_ComprehensiveData = new Standard_GB16780_2012.Parameters_ComprehensiveData();
            m_ComprehensiveData.ClinkerOutsourcing_PowerConsumption = 55;        //外购熟料综合电耗
            m_ComprehensiveData.ClinkerOutsourcing_CoalConsumption = 100;        //外购熟料综合煤耗

            m_ComprehensiveData.CoalLowCalorificValue = 29307m;                  //煤粉低位发热量
            m_ComprehensiveData.CoalWaterContent = 0m;                           //煤粉水分

            m_ComprehensiveData.ElectricityToCoalFactor = 0.1229m;               //用电折合用煤系数
            m_ComprehensiveData.StandardCalorificValue = 29307m;                 //标准煤发热量

            IList<DataItem> result = new List<DataItem>();

//            string templateString = @"select VariableId,ValueFormula from balance_Energy_Template
//                                    where Enabled='true' and (VariableId='rawMaterialsPreparation_ElectricityConsumption' 
//                                    or VariableId='clinkerPreparation_ElectricityConsumption'
//                                    or VariableId='cementPreparation_ElectricityConsumption' or VariableId='clinkerElectricityGeneration_ElectricityConsumption')";
//            DataTable templateTable = _connFactory.Query(templateString);

            string dataString;
            if (organizationId == "zc_nxjc")
            {
                dataString = @"select E.VariableId,SUM(E.monthBalance) as monthBalance from
                                (select C.OrganizationID,C.VariableId,
                                SUM(C.TotalBalance+(case when D.CumulantDay is null then 0 else D.CumulantDay end)) as monthBalance from 
                                (select A.OrganizationID,B.VariableId,B.OrganizationID as detailO,SUM(B.TotalPeakValleyFlatB) as TotalBalance 
                                from (select BalanceId,OrganizationID,TimeStamp from tz_Balance) as A
                                right join balance_Energy as B
                                on A.BalanceId=B.KeyId where TimeStamp like CONVERT(varchar(7),GETDATE(),20) + '%'
                                group by A.OrganizationID,B.VariableId,B.OrganizationID) AS C
                                left join (select OrganizationID,VariableId,(case when CumulantDay is null then 0 else CumulantDay end) as CumulantDay
                                from RealtimeIncrementCumulant) AS D
                                on C.detailO=D.OrganizationID and C.VariableId=D.VariableId group by C.OrganizationID,C.VariableId) AS E
                                group by E.VariableId";
            }
            else
            {
                dataString = @"select VariableId,SUM(monthBalance) as monthBalance from
                                (select * from(
                                select C.OrganizationID,C.VariableId,
                                SUM(C.TotalBalance+(case when D.CumulantDay is null then 0 else D.CumulantDay end)) as monthBalance from 
                                (select A.OrganizationID,B.VariableId,B.OrganizationID as detailO,SUM(B.TotalPeakValleyFlatB) as TotalBalance 
                                from (select BalanceId,OrganizationID,TimeStamp from tz_Balance) as A
                                right join balance_Energy as B
                                on A.BalanceId=B.KeyId where TimeStamp like CONVERT(varchar(7),GETDATE(),20) + '%'
                                group by A.OrganizationID,B.VariableId,B.OrganizationID) AS C
                                left join (select OrganizationID,VariableId,(case when CumulantDay is null then 0 else CumulantDay end) as CumulantDay
                                from RealtimeIncrementCumulant) AS D
                                on C.detailO=D.OrganizationID and C.VariableId=D.VariableId group by C.OrganizationID,C.VariableId) AS E
                                where OrganizationID like @organizationId) AS F group by VariableId";
            }
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(new SqlParameter("@organizationId", organizationId + "%"));
            DataTable table = _connFactory.Query(dataString, parameters.ToArray());

            EnergyConsumption_V1.LoadComprehensiveData(table, m_ComprehensiveData,"VariableId","monthBalance");

            DataItem clinker_ElectricityConsumption_Comprehensive = new DataItem
            {
                ID = organizationId + ">clinker_ElectricityConsumption_Comprehensive>Comprehensive",
                Value = EnergyConsumption_V1.GetClinkerPowerConsumption().ToString()
            };
            result.Add(clinker_ElectricityConsumption_Comprehensive);

            DataItem clinker_CoalConsumption_Comprehensive = new DataItem
            {
                ID = organizationId + ">clinker_CoalConsumption_Comprehensive>Comprehensive",
                Value = EnergyConsumption_V1.GetClinkerCoalConsumption().ToString()
            };
            result.Add(clinker_CoalConsumption_Comprehensive);

            decimal defaultCE = 0;
            decimal.TryParse(clinker_ElectricityConsumption_Comprehensive.Value, out defaultCE);
            DataItem cementmill_ElectricityConsumption_Comprehensive = new DataItem
            {
                ID = organizationId + ">cementmill_ElectricityConsumption_Comprehensive>Comprehensive",
                Value = EnergyConsumption_V1.GetCementPowerConsumption(defaultCE).ToString()
            };
            result.Add(cementmill_ElectricityConsumption_Comprehensive);

            decimal defaultCC = 0;
            decimal.TryParse(clinker_CoalConsumption_Comprehensive.Value, out defaultCC);
            DataItem cementmill_CoalConsumption_Comprehensive = new DataItem
            {
                ID = organizationId + ">cementmill_CoalConsumption_Comprehensive>Comprehensive",
                Value = EnergyConsumption_V1.GetCementCoalConsumption(defaultCC).ToString()
            };
            result.Add(cementmill_CoalConsumption_Comprehensive);

            return result;
        }
    }
}
