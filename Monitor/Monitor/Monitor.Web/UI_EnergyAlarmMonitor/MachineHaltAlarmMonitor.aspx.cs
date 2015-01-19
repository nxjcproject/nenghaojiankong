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
                List<string> m_DataValidIdItems = new List<string>() { "zc_nxjc_yc", "zc_nxjc_qtx" };
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
            string m_LevelCode = "";
            int m_LevelCodeIndex = 1;
            if (m_AlarmNodesTable != null)
            {
                for (int i = 0; i < m_AlarmNodesTable.Rows.Count; i++)
                {
                    string m_MachineLevelCode = m_AlarmNodesTable.Rows[i]["LevelCode"].ToString();
                    string m_OrganizationType = m_AlarmNodesTable.Rows[i]["OrganizationType"].ToString();
                    if (m_LevelCode != m_MachineLevelCode && m_OrganizationType == "MasterMachine")
                    {
                        m_LevelCode = m_MachineLevelCode;
                        m_LevelCodeIndex = 1;
                        m_AlarmNodesTable.Rows[i]["LevelCode"] = m_LevelCode.Substring(0, m_LevelCode.Length - 2) + m_LevelCodeIndex.ToString("D2");
                    }
                    else if (m_LevelCode == m_MachineLevelCode && m_OrganizationType == "MasterMachine")
                    {
                        m_LevelCodeIndex = m_LevelCodeIndex + 1;
                        if (m_LevelCodeIndex < 100)
                        {
                            m_AlarmNodesTable.Rows[i]["LevelCode"] = m_LevelCode.Substring(0, m_LevelCode.Length - 2) + m_LevelCodeIndex.ToString("D2");
                        }
                    }
                }
            }

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
    }
}