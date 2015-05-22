using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using WebStyleBaseForEnergy;
namespace Monitor.Web.UI_EnergyAlarmMonitor
{
    public partial class MachineHaltAlarmMonitor : WebStyleBaseForEnergy.webStyleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.InitComponts();
            if (!IsPostBack)
            {
                ////////////////////调试用,自定义的数据授权
#if DEBUG
                List<string> m_DataValidIdItems = new List<string>() { "zc_nxjc_byc_byf"};
                AddDataValidIdGroup("ProductionOrganization", m_DataValidIdItems);
#elif RELEASE
#endif
            }
        }
        [WebMethod]
        public static string GetAlarmNodes(string myNodeId)
        {
            DataTable m_AlarmNodesTable = Monitor.Service.EnergyAlarmMonitor.MachineHaltAlarmMonitor.GetAlarmNodes(GetDataValidIdGroup("ProductionOrganization"));
            string result = EasyUIJsonParser.DataGridJsonParser.DataTableToJson(m_AlarmNodesTable);
            return result;
        }
        [WebMethod]
        public static string GetAlarmNodesByParentLevelCode(string myParentLevelCode)
        {
            DataTable m_AlarmNodesTable = Monitor.Service.EnergyAlarmMonitor.MachineHaltAlarmMonitor.GetAlarmNodesByParentLevelCode(myParentLevelCode, GetDataValidIdGroup("ProductionOrganization"));
            string result = EasyUIJsonParser.DataGridJsonParser.DataTableToJson(m_AlarmNodesTable);
            return result;
        }
        [WebMethod]
        public static string GetAlarmParentNodesByLevelCode(string myLevelCode)
        {
            if (myLevelCode.Length > 3)                //不是第一层
            {
                string m_ParentLevelCode = myLevelCode.Substring(0, myLevelCode.Length - 4);
                DataTable m_AlarmNodesTable = Monitor.Service.EnergyAlarmMonitor.MachineHaltAlarmMonitor.GetAlarmNodesByParentLevelCode(m_ParentLevelCode, GetDataValidIdGroup("ProductionOrganization"));
                string result = EasyUIJsonParser.DataGridJsonParser.DataTableToJson(m_AlarmNodesTable);
                return result;
            }
            else
            {
                return "{\"rows\":[],\"total\":0}";
            }
        }

        [WebMethod]
        public static string GetAlarmValueByLevelCode(string myAlarmNodeLevelCode)
        {
            if (myAlarmNodeLevelCode != "")
            {
                string[] m_Nodes = myAlarmNodeLevelCode.Split(',');
                DataTable m_AlarmNodesTable = Monitor.Service.EnergyAlarmMonitor.MachineHaltAlarmMonitor.GetAlarmValueByLevelCode(m_Nodes);
                string result = EasyUIJsonParser.DataGridJsonParser.DataTableToJson(m_AlarmNodesTable);
                return result;
            }
            else
            {
                return "{\"rows\":[],\"total\":0}";
            }
        }

        [WebMethod]
        public static string GetAlarmValueTreeByLevelCode(string myAlarmNodeLevelCode)
        {
            if (myAlarmNodeLevelCode != "")
            {
                string[] m_Nodes = myAlarmNodeLevelCode.Split(',');
                DataTable m_AlarmNodesTable = Monitor.Service.EnergyAlarmMonitor.MachineHaltAlarmMonitor.GetAlarmValueTreeByLevelCode(m_Nodes);
                string result = EasyUIJsonParser.TreeGridJsonParser.DataTableToJson(m_AlarmNodesTable, "Id", "ParentId");
                return result;
            }
            else
            {
                return "{\"rows\":[],\"total\":0}";
            }
        }
    }
}