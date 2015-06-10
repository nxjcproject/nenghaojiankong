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
    public class ProcessConsumptionProvider : IOverViewMonitorDataProvider
    {
        private ISqlServerDataFactory _connFactory;
        public ProcessConsumptionProvider(string connString)
        {
            _connFactory = new SqlServerDataFactory(connString);
        }

        public IEnumerable<DataItem> GetDataItem(string organizationId, params string[] variableIds)
        {
            IList<DataItem> result = new List<DataItem>();

            string templateString = @"select VariableId,ValueFormula from balance_Energy_Template
                                    where Enabled='true' and (VariableId='rawMaterialsPreparation_ElectricityConsumption' 
                                    or VariableId='clinkerPreparation_ElectricityConsumption'
                                    or VariableId='cementPreparation_ElectricityConsumption' or VariableId='clinkerElectricityGeneration_ElectricityConsumption')";
            DataTable templateTable = _connFactory.Query(templateString);

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

            string[] calculateColumns = {"monthBalance"};
            DataTable resultDt = EnergyConsumption.EnergyConsumptionCalculate.Calculate(table, templateTable, "ValueFormula", calculateColumns);

            foreach (DataRow row in resultDt.Rows)
            {
                DataItem item = new DataItem
                {
                    ID = organizationId + ">" + row["VariableId"] + ">ProcessConsumption",
                    Value = row["monthBalance"].ToString().Trim()
                };
                result.Add(item);
            }

            return result;
        }
    }
}
