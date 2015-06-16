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

namespace Monitor.Web.UI_OverView
{
    public partial class View_OverView_Factory : System.Web.UI.Page
    {
        private static string StationId;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                StationId = System.Configuration.ConfigurationManager.AppSettings["StationId"].ToString();
            }
            catch(Exception err)
            {
                StationId = "";
            }

        }
        [WebMethod]
        public static string GetRealTimeData()
        {
            return GetStaticValue();
        }
        /// <summary>
        /// 根据站点信息获取该站点所有组织机构ID
        /// </summary>
        /// <returns>组织机构列表，string类型Sql查询条件格式</returns>
        private static string GetOrganizationIdsByStationId(DataTable myOrganizationIdsTable)
        {
            string m_OrganizationIds = "";
            if (myOrganizationIdsTable != null)
            {
                for (int i = 0; i < myOrganizationIdsTable.Rows.Count; i++)
                {
                    if (i == 0)
                    {
                        m_OrganizationIds = "'" + myOrganizationIdsTable.Rows[i]["OrganizationId"].ToString() + "'";
                    }
                    else
                    {
                        m_OrganizationIds = m_OrganizationIds + ",'" + myOrganizationIdsTable.Rows[i]["OrganizationId"].ToString() + "'";
                    }
                }
            }
            return m_OrganizationIds;
        }
        private static string GetStaticValue()
        {
            string m_StartTime = DateTime.Now.ToString("yyyy-MM") + "-01";
            string m_EndTime = DateTime.Now.AddMonths(1).ToString("yyyy-MM") + "-01";

            DataTable m_OrganizationIdsTable = Monitor.Service.ProcessEnergyMonitor.OverViewMonitor.GetOrganizationIdsByStationId(StationId);
            string m_OrganizationIdsString = GetOrganizationIdsByStationId(m_OrganizationIdsTable);

            //总物料量统计
            DataTable m_MaterialTotalValueTable = Monitor.Service.ProcessEnergyMonitor.OverViewMonitor.GetMaterialTotalValue(m_StartTime, m_EndTime, m_OrganizationIdsString);
            //分产线、工序物料量、用电量统计
            DataTable m_StaticValueTable = Monitor.Service.ProcessEnergyMonitor.OverViewMonitor.GetStaticValueByProductionLine(m_StartTime, m_EndTime, m_OrganizationIdsString);
            //电耗统计模板
            DataTable m_ConsumptionTempplateTable = Monitor.Service.ProcessEnergyMonitor.OverViewMonitor.GetConsumptionTempplateTable();

            //物料产出量统计
            string m_MaterialOutputValueJson = GetMaterialValue("MaterialOutput", "Output", m_MaterialTotalValueTable);
            //物料消耗量统计
            string m_MaterialIutputValueJson = GetMaterialValue("MaterialInput", "Input", m_MaterialTotalValueTable);
            //公共工序用电量统计
            string m_CommonElectricityValueJson = GetElectricityValue("CommonElectricty", "LevelType", "Common", m_StaticValueTable);
            //分产线电耗、煤耗统计
            List<string> m_ProductionLineValueJson = GetConsumptionValue(m_OrganizationIdsTable, m_ConsumptionTempplateTable, m_StaticValueTable);

            string m_ReturnJson = "{" + m_MaterialOutputValueJson + "," + m_MaterialIutputValueJson + "," + m_CommonElectricityValueJson;
            string m_ProductionLine = "\"ProductionLine\":[";
            for (int i = 0; i < m_ProductionLineValueJson.Count; i++)
            {
                if (i == 0)
                {
                    m_ProductionLine = m_ProductionLine + "{" + m_ProductionLineValueJson[i] + "}";
                }
                else
                {
                    m_ProductionLine = m_ProductionLine + ",{" + m_ProductionLineValueJson[i] + "}";
                }
            }
            m_ProductionLine = m_ProductionLine + "]";
            m_ReturnJson = m_ReturnJson + "," + m_ProductionLine + "}";
            return m_ReturnJson;
        }
        private static string GetMaterialValue(string myId, string myKeyword, DataTable myMaterialValueTable)
        {
            string m_ValueJson = "\"" + myId + "\":[";

            DataRow[] m_DataRows = myMaterialValueTable.Select("VariableId like '%" + myKeyword + "'");

            if (m_DataRows != null)
            {
                for (int i = 0; i < m_DataRows.Length; i++)
                {
                    string m_ColumnValue = EasyUIJsonParser.GetConfigInfo.FormatDecimalPlaces(m_DataRows[i]["Value"], myMaterialValueTable.Columns["Value"].DataType);  //增加保留小数点功能
                    if (i == 0)
                    {
                        m_ValueJson = m_ValueJson + "{\"Title\":\"" + m_DataRows[i]["Name"] + "(" + m_DataRows[i]["Unit"] + ")\",\"Value\":" + m_ColumnValue + "}";
                    }
                    else
                    {
                        m_ValueJson = m_ValueJson + ",{\"Title\":\"" + m_DataRows[i]["Name"] + "(" + m_DataRows[i]["Unit"] + ")\",\"Value\":" + m_ColumnValue + "}";
                    }
                }
            }
            m_ValueJson = m_ValueJson + "]";
            return m_ValueJson;
        }
        private static string GetElectricityValue(string myId, string myColumnName, string myKeyword, DataTable myStaticValueTable)
        {
            string m_ValueJson = "\"" + myId + "\":[";
            DataRow[] m_DataRows = myStaticValueTable.Select(myColumnName + " like '%" + myKeyword + "'");
            if (m_DataRows != null)
            {
                for (int i = 0; i < m_DataRows.Length; i++)
                {
                    string m_ColumnValue = EasyUIJsonParser.GetConfigInfo.FormatDecimalPlaces(m_DataRows[i]["Value"], myStaticValueTable.Columns["Value"].DataType);  //增加保留小数点功能
                    if (i == 0)
                    {
                        m_ValueJson = m_ValueJson + "{\"Title\":\"" + m_DataRows[i]["VariableName"] + "(kW·h)\",\"Value\":" + m_ColumnValue + "}";
                    }
                    else
                    {
                        m_ValueJson = m_ValueJson + ",{\"Title\":\"" + m_DataRows[i]["VariableName"] + "(kW·h)\",\"Value\":" + m_ColumnValue + "}";
                    }
                }
            }
            m_ValueJson = m_ValueJson + "]";
            return m_ValueJson;
        }
        private static List<string> GetConsumptionValue(DataTable myOrganizationIds, DataTable myEnergyConsumptionTemplate, DataTable myStaticValueTable)
        {
            List<string> m_ValueJsonList = new List<string>(2);
            if (myOrganizationIds != null)
            {
                for (int i = 0; i < myOrganizationIds.Rows.Count; i++)
                {
                    if (myOrganizationIds.Rows[i]["Type"].ToString() != "")
                    {
                        DataRow[] m_EnergyConsumptionTemplateRows = myEnergyConsumptionTemplate.Select(string.Format("ProductionLineType = '{0}'", myOrganizationIds.Rows[i]["Type"].ToString()), "LevelCode asc");
                        DataRow[] m_StaticValueRows = myStaticValueTable.Select(string.Format("OrganizationId = '{0}' and LevelType <> '{1}'", myOrganizationIds.Rows[i]["OrganizationId"].ToString(), "MainMachine"), "LevelCode asc");
                        if (m_EnergyConsumptionTemplateRows.Length > 0 && m_StaticValueRows.Length > 0)
                        {
                            DataTable m_EnergyConsumptionTemplateTable = m_EnergyConsumptionTemplateRows.CopyToDataTable();
                            DataTable m_StaticValueTable = m_StaticValueRows.CopyToDataTable();
                            string m_ProductionConsumptionJson = GetProductionConsumptionJson(myOrganizationIds.Rows[i]["Name"].ToString(), m_EnergyConsumptionTemplateTable, m_StaticValueTable);
                            m_ValueJsonList.Add(m_ProductionConsumptionJson);
                        }
                    }
                }
            }

            return m_ValueJsonList;
        }
        private static string GetProductionConsumptionJson(string myOrganiztionName, DataTable myEnergyConsumptionTemplateTable, DataTable myStaticValueTable)
        {
            DataTable m_EnergyConsumption = EnergyConsumption.EnergyConsumptionCalculate.Calculate(myStaticValueTable, myEnergyConsumptionTemplateTable, "ValueFormula", new string[] { "Value" });
            string m_ValueJson = "\"Title\":\"" + myOrganiztionName + "\",\"List\":[";
            if (m_EnergyConsumption != null)
            {
                for (int i = 0; i < m_EnergyConsumption.Rows.Count; i++)
                {
                    string m_ColumnValue = EasyUIJsonParser.GetConfigInfo.FormatDecimalPlaces(m_EnergyConsumption.Rows[i]["Value"], m_EnergyConsumption.Columns["Value"].DataType);  //增加保留小数点功能
                    string m_VariableNameAndUnit = "";
                    if (m_EnergyConsumption.Rows[i]["ValueType"].ToString() == "ElectricityConsumption")
                    {
                        m_VariableNameAndUnit = "(kW·h/t)";
                    }
                    else if(m_EnergyConsumption.Rows[i]["ValueType"].ToString() == "CoalConsumption")
                    {
                        m_VariableNameAndUnit = "(kg/t)";
                    }
                    
                    if (i == 0)
                    {
                        m_ValueJson = m_ValueJson + "{\"Title\":\"" + m_EnergyConsumption.Rows[i]["VariableName"] + m_VariableNameAndUnit + "\",\"Value\":" + m_ColumnValue + "}";
                    }
                    else
                    {
                        m_ValueJson = m_ValueJson + ",{\"Title\":\"" + m_EnergyConsumption.Rows[i]["VariableName"] + m_VariableNameAndUnit + "\",\"Value\":" + m_ColumnValue + "}";
                    }
                }
            }
            m_ValueJson = m_ValueJson + "]";
            return m_ValueJson;
        }
    }
}