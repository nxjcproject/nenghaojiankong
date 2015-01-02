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

namespace Monitor.Web.UI_Monitor.ProcessEnergyMonitor.zc_nxjc_qtx_efc_clinker02.view
{
    public partial class template0 : Page
    {
        private static readonly string connString = ConnectionStringFactory.zc_nxjc_qtx_efc_clinker02;          //DCS连接字符串
        private static readonly string nxjcConnString = ConnectionStringFactory.NXJCConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static SceneMonitor GetRealTimeData(string organizationId, string sceneName)
        {
            ProcessEnergyMonitorService monitorService = new ProcessEnergyMonitorService(connString);
            ProcessPowerMonitor precessPower = new ProcessPowerMonitor(connString);

            SceneMonitor result = new SceneMonitor();
            result.time = DateTime.Now;
            result.Name = sceneName;
            result.DataSet = monitorService.GetRealtimeDatas(organizationId, sceneName);

            IList<DataItem> items = result.DataSet.ToList();
            DataTable powerDt = precessPower.GetPowerDatas(organizationId);
            foreach (DataRow dr in powerDt.Rows)
            {
                DataItem item = new DataItem();
                item.ID = dr["LevelCode"].ToString().Trim();
                item.Value = dr["PowerValue"].ToString().Trim();
                items.Add(item);
            }
            result.DataSet = items;

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