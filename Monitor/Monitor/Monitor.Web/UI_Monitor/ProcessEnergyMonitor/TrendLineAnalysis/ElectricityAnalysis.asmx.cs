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
    /// ElectricityAnalysis 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
    [System.Web.Script.Services.ScriptService]
    public class ElectricityAnalysis : System.Web.Services.WebService
    {

        [WebMethod]
        public string GetElectricityUsageTrendline(string organizationId, string levelcode, string startTime, string endTime)
        {
            DataTable dt = GetElectricityUsage(organizationId, levelcode, startTime, endTime);

               IList<string> colNames = new List<string>();
            foreach (DataColumn dc in dt.Columns)
            {
                colNames.Add(dc.ColumnName.ToString());
            }

            return EasyUIJsonParser.ChartJsonParser.GetGridChartJsonString(dt, colNames.ToArray(), new string[] { "用电量" }, "年-月-日-时", "kWh", 1);
        }

        private DataTable GetElectricityUsage(string organizationId, string levelcode, string startTime, string endTime)
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

            DataTable electricityUsageSumTable = ElectricityAnalysisService.GetElectricityUsageGroupByHour(organizationId, levelcode, DateTime.Parse(startTime), DateTime.Parse(endTime));

            return AnalysisTableHelper.VerticalToHorizontalHourly(electricityUsageSumTable, DateTime.Parse(startTime), DateTime.Parse(endTime));
        }
    }
}
