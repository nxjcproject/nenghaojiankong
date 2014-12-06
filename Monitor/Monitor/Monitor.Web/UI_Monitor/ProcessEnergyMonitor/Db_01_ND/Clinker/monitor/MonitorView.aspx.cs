using Monitor.Service.ProcessEnergyMonitor;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Monitor.Web.UI_Monitor.ProcessEnergyMonitor.Db_01_ND.Clinker.monitor
{
    public partial class MonitorView : WebStyleBaseForEnergy.webStyleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.InitComponts();
            ////////////////////调试用,自定义的数据授权
            if (!mDataValidIdGroup.ContainsKey("ProductionOrganization"))
            {
                mDataValidIdGroup.Add("ProductionOrganization", new List<string>(1));
                mDataValidIdGroup["ProductionOrganization"].Add("O0101");
                mDataValidIdGroup["ProductionOrganization"].Add("O0102");
            }
            this.OrganisationTree.Organizations = mDataValidIdGroup["ProductionOrganization"];                 //向web用户控件传递数据授权参数
            this.OrganisationTree.PageName = "EnergyConsumptionPlan.aspx";                                     //向web用户控件传递当前调用的页面名称
        }

        [WebMethod]
        public static SceneMonitor GetRealTimeData(string organizationId, string sceneName)
        {
            SceneMonitor result = new SceneMonitor();
            result.time = DateTime.Now;
            result.Name = sceneName;
            result.DataSet = ProcessEnergyMonitorService.GetRealtimeDatas(organizationId,sceneName);
            return result;
        }

        [WebMethod]
        public static MonitorTable GetData(string organizationId, string sceneName)
        {
            MonitorTable result = new MonitorTable();
            result.table1 = "11111";
            result.table2 = "222222";

            return result;
        }
    }
}