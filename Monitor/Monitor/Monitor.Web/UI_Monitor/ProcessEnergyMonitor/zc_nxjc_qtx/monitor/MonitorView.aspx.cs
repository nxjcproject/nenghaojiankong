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

namespace Monitor.Web.UI_Monitor.ProcessEnergyMonitor.zc_nxjc_qtx.monitor
{
    public partial class MonitorView : WebStyleBaseForEnergy.webStyleBase
    {
        private static readonly string connString = ConnectionStringFactory.NXJCConnectionString;          //DCS连接字符串

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
            ProcessPowerMonitor precessPower = new ProcessPowerMonitor(connString);
            DataTable sourceDt = precessPower.GetMonitorDatas(organizationId);
            foreach (DataRow dr in sourceDt.Rows)
            {
                if (dr["OrganizationID"].ToString().Split('_').Length == 5)
                {
                    sourceDt.Rows.Remove(dr);
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