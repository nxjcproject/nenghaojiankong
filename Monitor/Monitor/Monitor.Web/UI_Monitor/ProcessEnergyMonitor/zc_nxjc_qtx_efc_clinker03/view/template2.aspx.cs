using Monitor.Infrastructure.Configuration;
using Monitor.Service.ProcessEnergyMonitor;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Monitor.Web.UI_Monitor.ProcessEnergyMonitor.zc_nxjc_qtx_efc_clinker03.view
{
    public partial class template2 : Page
    {
        private static readonly string connString = ConnectionStringFactory.zc_nxjc_qtx_efc_clinker03;          //DCS连接字符串

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static SceneMonitor GetRealTimeData(string organizationId, string sceneName)
        {
            ProcessEnergyMonitorService monitorService = new ProcessEnergyMonitorService(connString);
            SceneMonitor result = new SceneMonitor();
            result.time = DateTime.Now;
            result.Name = sceneName;
            result.DataSet = monitorService.GetRealtimeDatas(organizationId, sceneName);
            return result;
        }

        [WebMethod]
        public static MonitorTable GetData(string organizationId, string sceneName)
        {
            DataTable consumption = EnergyConsumptionMonitor.EnergyConsumptionTableQuery(organizationId, sceneName);
            //DataTable ammeter = EnergyConsumptionMonitor.AmmeterTableQuery(organizationId, sceneName);
            MonitorTable result = new MonitorTable();
            result.consumption = EasyUIJsonParser.DataGridJsonParser.DataTableToJson(consumption);
            //result.ammeter = EasyUIJsonParser.DataGridJsonParser.DataTableToJson(ammeter);

            return result;
        }
    }
}