using EasyUIJsonParser;
using Monitor.Infrastructure.Utility;
using Monitor.Service.TrendlineAnalysis;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Monitor.Web.UI_Monitor.ProcessEnergyMonitor.TrendLineAnalysis
{
    /// <summary>
    /// HorizontalAnalysis 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
    [System.Web.Script.Services.ScriptService]
    public class HorizontalAnalysis : System.Web.Services.WebService
    {
        [WebMethod]
        public string GetHorizontalAnalysisTrendline(string tagItems, string trendlineType, string startTime, string endTime)
        {
            // tagItems 格式：
            // OrganizationID（组织机构ID）   LevelCode（层次码）    Name（名称）
            DataTable tagTable = DataGridJsonParser.JsonToDataTable(tagItems.JsonPickArray("rows"), GetTagTable());

            DataTable dt = GetElectricityUsage(tagTable, startTime, endTime);

            // 获取横坐标（列，时间信息）
            IList<string> colNames = new List<string>();
            foreach (DataColumn dc in dt.Columns)
            {
                colNames.Add(dc.ColumnName.ToString());
            }
            
            // 获取图例（行，数据信息）
            IList<string> rowName = new List<string>();
            foreach (DataRow dr in tagTable.Rows)
            {
                rowName.Add(dr["Name"].ToString());
            }

            return EasyUIJsonParser.ChartJsonParser.GetGridChartJsonString(dt, colNames.ToArray(), rowName.ToArray(), "年-月-日-时", "kWh", 1);
        }

        /// <summary>
        /// 获取标签列表的表格结构
        /// </summary>
        /// <returns></returns>
        private DataTable GetTagTable()
        {
            DataTable tagTable = new DataTable();
            tagTable.Columns.Add("OrganizationID", typeof(string));
            tagTable.Columns.Add("LevelCode", typeof(string));
            tagTable.Columns.Add("Source", typeof(string));
            tagTable.Columns.Add("Name", typeof(string));

            return tagTable;
        }


        private DataTable GetElectricityUsage(DataTable tagTable, string startTime, string endTime)
        {
            #region 参数验证
            try
            {
                DateTime.Parse(startTime);
                DateTime.Parse(endTime);
            }
            catch
            {
                throw new ArgumentException("时间参数不正确");
            }
            #endregion

            DataTable electricityUsageSumTable = HorizontalAnalysisService.GetElectricityUsageGroupByHour(tagTable, DateTime.Parse(startTime), DateTime.Parse(endTime));

            return AnalysisTableHelper.VerticalToHorizontalHourly(electricityUsageSumTable, DateTime.Parse(startTime), DateTime.Parse(endTime));
        }
    }
}
