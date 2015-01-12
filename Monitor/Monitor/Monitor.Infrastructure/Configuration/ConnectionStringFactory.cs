using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor.Infrastructure.Configuration
{
    public static class ConnectionStringFactory
    {
        //private static string _connString = "Data Source=QH-20140814XCYI;Initial Catalog=NXJC;Integrated Security=True";
        //private static string _connString = "Data Source=DEC-WINSVR12;Initial Catalog=NXJC_DEVELOP;User Id=sa; Password = jsh123+";
        //private static string _connString = "Data Source=Lenovo-PC;Initial Catalog=Db_01_YFC;User Id=sa;Password=jsh123+";
        //public static string NXJCConnectionString { get { return _connString; } }

        public static string NXJCConnectionString { get { return ConfigurationManager.ConnectionStrings["ConnNXJC"].ToString(); } }
        public static string zc_nxjc_qtx_efc_cementmill01 { get { return ConfigurationManager.ConnectionStrings["zc_nxjc_qtx_efc_cementmill01"].ToString(); } }
        public static string zc_nxjc_qtx_efc_clinker02 { get { return ConfigurationManager.ConnectionStrings["zc_nxjc_qtx_efc_clinker02"].ToString(); } }
        public static string zc_nxjc_qtx_efc_clinker03 { get { return ConfigurationManager.ConnectionStrings["zc_nxjc_qtx_efc_clinker03"].ToString(); } }

        public static string GetDCSConnectionString(string organizationId)
        {
            string connString = ConfigurationManager.ConnectionStrings[organizationId].ToString();
            return connString;
        }
    }
}
