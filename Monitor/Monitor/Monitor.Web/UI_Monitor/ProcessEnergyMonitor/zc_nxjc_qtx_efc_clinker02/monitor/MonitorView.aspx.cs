using Monitor.Service.ProcessEnergyMonitor;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Monitor.Web.UI_Monitor.ProcessEnergyMonitor.zc_nxjc_qtx_efc_clinker02.monitor
{
    public partial class MonitorView : WebStyleBaseForEnergy.webStyleBase
    {
        private static readonly string connString = "";          //DCS连接字符串

        protected void Page_Load(object sender, EventArgs e)
        {
            base.InitComponts();
#if DEBUG
            // 调试用,自定义的数据授权
            List<string> m_DataValidIdItems = new List<string>() { "C41B1F47-A48A-495F-A890-0AABB2F3BFF7", "zc_nxjc_qtx_efc", "zc_nxjc_qtx_tys" };
            AddDataValidIdGroup("ProductionOrganization", m_DataValidIdItems);
#endif
        }

        [WebMethod]
        public static SceneMonitor GetRealTimeData(string organizationId, string sceneName)
        {
            SceneMonitor result = new SceneMonitor();
            result.time = DateTime.Now;
            result.Name = sceneName;
            result.DataSet = ProcessEnergyMonitorService.GetRealtimeDatas(connString,organizationId, sceneName);
            return result;
        }

        [WebMethod]
        public static MonitorTable GetData(string organizationId, string sceneName)
        {
            DataTable consumption = EnergyConsumptionMonitor.EnergyConsumptionTableQuery(organizationId, sceneName);
            DataTable ammeter = EnergyConsumptionMonitor.AmmeterTableQuery(organizationId, sceneName);
            MonitorTable result = new MonitorTable();
            result.consumption = EasyUIJsonParser.DataGridJsonParser.DataTableToJson(consumption);
            result.ammeter = EasyUIJsonParser.DataGridJsonParser.DataTableToJson(ammeter);

            return result;
        }
    }
}