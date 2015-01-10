using Monitor.Service.ProcessEnergyMonitor;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebUserControls.Infrastructure.Configuration;

namespace Monitor.Web.UI_Monitor.ProcessEnergyMonitor.zc_nxjc_qtx_efc
{
    public partial class MonitorView : System.Web.UI.Page
    {
        private static readonly string connString = ConnectionStringFactory.NXJCConnectionString;          //DCS连接字符串

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static SceneMonitor GetRealTimeData(string organizationId, string sceneName)
        {
            ProcessPowerMonitor precessPower = new ProcessPowerMonitor(connString);
            DataTable sourceDt = precessPower.GetMonitorDatas(organizationId);

            int sourceDTRowsCount = sourceDt.Rows.Count;
            for (int i = sourceDTRowsCount - 1; i >= 0; i--)
            {
                DataRow row = sourceDt.Rows[i];
                if (row["OrganizationID"].ToString().Split('_').Length != 5)
                {
                    sourceDt.Rows.Remove(row);
                }
            }
            string[] fields = { "本日合计", "本月累计", "本年累计" };

            SceneMonitor result = new SceneMonitor();
            result.time = DateTime.Now;
            result.Name = sceneName;
            result.DataSet = ProcessEnergyMonitorService.GetPowerMonitor(sourceDt, fields);
            return result;
        }
    }
}