using Monitor.Service.ProcessEnergyMonitor;
using SqlServerDataAdapter;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor.Service.BalanceEnergy
{
    public class BalanceEnergyService
    {
        private SqlServerDataFactory _dataFactory;

        public BalanceEnergyService(string connString)
        {
            _dataFactory = new SqlServerDataFactory(connString);
        }

        private string GetKeyId(DateTime dateTime)
        {
            string result = "";
            string mydate = String.Format("{0:d}", dateTime);
            string queryString = "select BalanceId from tz_Balance where TimeStamp=@time";
            
            SqlParameter[] parameters = {new SqlParameter("@time", mydate)};
            DataTable table = _dataFactory.Query(queryString, parameters);
            if (table.Rows.Count > 0)
            {
                result = table.Rows[0]["BalanceId"].ToString().Trim();
            }
            return result;
        }

        private DataTable GetBalanceEnergyValues(string organizationId,DateTime dateTime)
        {
            DataTable result;
            string keyId = GetKeyId(dateTime);
            if (keyId != "")
            {
                string queryString = "select * from balance_Energy where OrganizationID like @organizationId";
                SqlParameter[] parameters = {new SqlParameter("@organizationId", organizationId + "%")};
                result = _dataFactory.Query(queryString, parameters);
            }
            else
            {
                result = new DataTable();
            }
            return result;
        }

        public IEnumerable<DataItem> GetMonitorValues(string organizationId, DateTime dateTime)
        {
            IList<DataItem> result = new List<DataItem>();

            return result;
        }
    }
}
