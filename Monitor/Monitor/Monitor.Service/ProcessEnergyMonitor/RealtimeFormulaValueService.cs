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
    public class RealtimeFormulaValueService
    {
        private ISqlServerDataFactory _dataFactory;
        private ISqlServerDataFactory _dcsdataFactory;

        public RealtimeFormulaValueService(string connString,string dscconnString)
        {
            _dataFactory = new SqlServerDataFactory(connString);
            _dcsdataFactory = new SqlServerDataFactory(dscconnString);
        }

        private DataTable GetFormulaTable(string organizationId)
        {
            string queryString = "select * from RealtimeFormulaValue where OrganizationID like @organizationId";
            SqlParameter[] parameters = { new SqlParameter("@organizationId", organizationId + "%") };
            DataTable result = _dataFactory.Query(queryString, parameters);
            return result;
        }

        private DataTable GetDCSIncrementTable()
        {
            string queryString = @"select top 1 * from HistoryDCSIncrement order by vDate desc";
            DataTable result = _dataFactory.Query(queryString);
            return result;
        }

        private string FormulaLevelCodeContrast(string levelCode)
        {

            return "S101";
        }

        public IEnumerable<DataItem> GetFormulaPowerConsumption(string organizationId)
        {
            IList<DataItem> result = new List<DataItem>();

            DataTable formulaTable = GetFormulaTable(organizationId);
            DataTable DcsIncrementTable = GetDCSIncrementTable();

            foreach (DataRow item in formulaTable.Rows)
            {
                DataItem dataItem = new DataItem();
                dataItem.ID = item["OrganizationID"].ToString().Trim() + item["LevelCode"].ToString().Trim();

                decimal formulaValue = 0;
                decimal.TryParse(item["FormulaValue"].ToString().Trim(), out formulaValue);

                string contrastCode = FormulaLevelCodeContrast(item["LevelCode"].ToString().Trim());
                if (!Convert.IsDBNull(DcsIncrementTable.Rows[0][contrastCode]))
                {
                    decimal output = 0;
                    decimal.TryParse(DcsIncrementTable.Rows[0][contrastCode].ToString().Trim(), out output);
                    if (output != 0)
                    {
                        dataItem.Value = (formulaValue / output).ToString();
                    }
                    else
                    {
                        dataItem.Value = "";
                    }
                }
                else
                {
                    dataItem.Value = "";
                }
                result.Add(dataItem);
            }
            return result;
        }
    }
}
