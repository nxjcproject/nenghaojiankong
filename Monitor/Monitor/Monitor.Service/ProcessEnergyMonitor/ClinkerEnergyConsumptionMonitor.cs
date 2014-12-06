using Monitor.Infrastructure.Configuration;
using SqlServerDataAdapter;
using StatisticalReport.Infrastructure.Report;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor.Service.ProcessEnergyMonitor
{
    public class ClinkerEnergyConsumptionMonitor
    {
        private static SqlServerDataFactory sqlServer;
        private static string connectionstring;
        private static TZHelper tzHelper;
        //private static DataTable temp;

        static ClinkerEnergyConsumptionMonitor()
        {
            connectionstring = ConnectionStringFactory.NXJCConnectionString;
            sqlServer = new SqlServerDataFactory(connectionstring);
            tzHelper = new TZHelper(connectionstring);
            //temp=ReportHelper.GetViewParametersTable("辅助");
        }

        public static DataTable TableQuery(string _organizeID, string _viewName)
        {
            string date = DateTime.Now.ToString("yyyy-MM-dd");
            string month = date.Substring(0, 7);
            DataTable table = new DataTable();

            CreatTableStructure(table);
            switch (_viewName)
            {
                case "原料":
                    GetRawMaterialTable(_organizeID, table, date);
                    break;
                case "生料":
                    GetRawBatchTable(_organizeID, table, date);
                    break;
                case "燃料":
                    GetFuelTable(_organizeID, table, date);
                    break;
                case "熟料":
                    GetClinkerTable(_organizeID, table, date);
                    break;
                default:
                    return table;
            }
            return table;
        }
        /// <summary>
        /// 返回原料表
        /// </summary>
        /// <returns></returns>
        private static void GetRawMaterialTable(string _organizeID, DataTable _table, string _date)//原料
        {
            //DataRow[] rows=new DataRow[2];
            //rows[0] = table.NewRow();
            //for (int i = 0; i < 2; i++)
            //{
            //    DataRow row = table.NewRow();               
            //    table.Rows.Add(row);               
            //}
            string year_month = _date.Substring(0, 7);
            string year = _date.Substring(0, 4);
            string month = _date.Substring(5, 2);
            string day = _date.Substring(8, 2);
            DataRow[] rows = new DataRow[2];
            rows[0] = _table.NewRow();
            rows[0]["项目指标"] = "原料消耗(t)";
            rows[1] = _table.NewRow();
            rows[1]["项目指标"] = "石灰石消耗(t)";
            foreach (DataRow dr in rows)
            {
                _table.Rows.Add(dr);
            }
            DataTable monthData = tzHelper.GetReportData("tz_Report", _organizeID, year_month, "table_ClinkerMonthlyOutput");
            DataRow[] monthRow = monthData.Select("vDate='" + day + "'");
            _table.Rows[1]["本日甲班"] = monthRow.Count() > 0 ? monthRow[0]["LimestoneConsumptionFirstShift"] : 0;
            _table.Rows[1]["本日乙班"] = monthRow.Count() > 0 ? monthRow[0]["LimestoneConsumptionSecondShift"] : 0;
            _table.Rows[1]["本日丙班"] = monthRow.Count() > 0 ? monthRow[0]["LimestoneConsumptionThirdShift"] : 0;
            _table.Rows[1]["本日合计"] = monthRow.Count() > 0 ? monthRow[0]["LimestoneConsumptionSum"] : 0;
            DataTable yearData = tzHelper.GetReportData("tz_Report", _organizeID, year, "table_ClinkerYearlyOutput");
            DataRow[] yearRow = yearData.Select("vDate='" + month + "'");
            _table.Rows[1]["本月累计"] = yearRow.Count() > 0 ? yearRow[0]["LimestoneConsumptionSum"] : 0;
            DataRow[] yearSumRow = yearData.Select("vDate='合计'");
            _table.Rows[1]["本年累计"] = yearSumRow.Count() > 0 ? yearSumRow[0]["LimestoneConsumptionSum"] : 0;
        }
        /// <summary>
        /// 返回生料表
        /// </summary>
        /// <returns></returns>
        private static void GetRawBatchTable(string _organizeID, DataTable _table, string _date)//
        {
            string year_month = _date.Substring(0, 7);
            string year = _date.Substring(0, 4);
            string month = _date.Substring(5, 2);
            string day = _date.Substring(8, 2);
            DataRow[] rows = new DataRow[6];
            for (int i = 0; i < 6; i++)
            {
                rows[i] = _table.NewRow();
            }
            rows[0]["项目指标"] = "生料产量(t)";
            rows[1]["项目指标"] = "生料制备用电量(KWh)";
            rows[2]["项目指标"] = "原料制备用电量(KWh)";
            rows[3]["项目指标"] = "生料磨用电量(KWh)";
            rows[4]["项目指标"] = "生料制备电耗(KWh/t)";
            rows[5]["项目指标"] = "生料磨电耗(KWh/t)";
            foreach (DataRow dr in rows)
            {
                _table.Rows.Add(dr);
            }
            DataTable monthData_first = tzHelper.GetReportData("tz_Report", _organizeID, year_month, "table_ClinkerMonthlyOutput");
            DataRow[] monthRow_first = monthData_first.Select("vDate='" + day + "'");
            _table.Rows[0]["本日甲班"] = monthRow_first.Count() > 0 ? monthRow_first[0]["RawBatchProductionFirstShift"] : 0;
            _table.Rows[0]["本日乙班"] = monthRow_first.Count() > 0 ? monthRow_first[0]["RawBatchProductionSecondShift"] : 0;
            _table.Rows[0]["本日丙班"] = monthRow_first.Count() > 0 ? monthRow_first[0]["RawBatchProductionThirdShift"] : 0;
            _table.Rows[0]["本日合计"] = monthRow_first.Count() > 0 ? monthRow_first[0]["RawBatchProductionSum"] : 0;
            DataTable yearData_first = tzHelper.GetReportData("tz_Report", _organizeID, year, "table_ClinkerYearlyOutput");
            DataRow[] yearRow_first = yearData_first.Select("vDate='" + month + "'");
            _table.Rows[0]["本月累计"] = yearRow_first.Count() > 0 ? yearRow_first[0]["RawBatchProductionSum"] : 0;
            DataRow[] yearSumRow_first = yearData_first.Select("vDate='合计'");
            _table.Rows[0]["本年累计"] = yearSumRow_first.Count() > 0 ? yearSumRow_first[0]["RawBatchProductionSum"] : 0;

            DataTable monthData_second = tzHelper.GetReportData("tz_Report", _organizeID, year_month, "table_ClinkerMonthlyElectricity_sum");
            DataRow[] monthRow_second = monthData_second.Select("vDate='" + day + "'");
            _table.Rows[1]["本日甲班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["AmounttoRawBatchPreparationFirstShift"] : 0;
            _table.Rows[2]["本日甲班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["RawMaterialPreparationFirstShift"] : 0;
            _table.Rows[3]["本日甲班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["RawBatchGrindingFirstShift"] : 0;
            _table.Rows[1]["本日乙班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["AmounttoRawBatchPreparationSecondShift"] : 0;
            _table.Rows[2]["本日乙班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["RawMaterialPreparationSecondShift"] : 0;
            _table.Rows[3]["本日乙班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["RawBatchGrindingSecondShift"] : 0;
            _table.Rows[1]["本日丙班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["AmounttoRawBatchPreparationThirdShift"] : 0;
            _table.Rows[2]["本日丙班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["RawMaterialPreparationThirdShift"] : 0;
            _table.Rows[3]["本日丙班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["RawBatchGrindingThirdShift"] : 0;
            _table.Rows[1]["本日合计"] = monthRow_second.Count() > 0 ? monthRow_second[0]["AmounttoRawBatchPreparationSum"] : 0;
            _table.Rows[2]["本日合计"] = monthRow_second.Count() > 0 ? monthRow_second[0]["RawMaterialPreparationSum"] : 0;
            _table.Rows[3]["本日合计"] = monthRow_second.Count() > 0 ? monthRow_second[0]["RawBatchGrindingSum"] : 0;
            DataTable yearData_second = tzHelper.GetReportData("tz_Report", _organizeID, year, "table_ClinkerYearlyElectricity_sum");
            DataRow[] yearRow_second = yearData_second.Select("vDate='" + month + "'");
            _table.Rows[1]["本月累计"] = yearRow_second.Count() > 0 ? yearRow_second[0]["AmounttoRawBatchPreparationSum"] : 0;
            _table.Rows[2]["本月累计"] = yearRow_second.Count() > 0 ? yearRow_second[0]["RawMaterialPreparationSum"] : 0;
            _table.Rows[3]["本月累计"] = yearRow_second.Count() > 0 ? yearRow_second[0]["RawBatchGrindingSum"] : 0;
            DataRow[] yearSumRow_second = yearData_second.Select("vDate='合计'");
            _table.Rows[1]["本年累计"] = yearSumRow_second.Count() > 0 ? yearSumRow_second[0]["AmounttoRawBatchPreparationSum"] : 0;
            _table.Rows[2]["本年累计"] = yearSumRow_second.Count() > 0 ? yearSumRow_second[0]["RawMaterialPreparationSum"] : 0;
            _table.Rows[3]["本年累计"] = yearSumRow_second.Count() > 0 ? yearSumRow_second[0]["RawBatchGrindingSum"] : 0;

            for (int i = 1; i <= 6; i++)
            {
                _table.Rows[4][i] = Convert.ToDecimal(_table.Rows[0][i]) != 0 ? Convert.ToDecimal(_table.Rows[1][i]) / Convert.ToDecimal(_table.Rows[0][i]) : 0;
                _table.Rows[5][i] = Convert.ToDecimal(_table.Rows[0][i]) != 0 ? Convert.ToDecimal(_table.Rows[3][i]) / Convert.ToDecimal(_table.Rows[0][i]) : 0;
            }

        }
        /// <summary>
        /// 返回燃料表
        /// </summary>
        /// <returns></returns>
        private static void GetFuelTable(string _organizeID, DataTable _table, string _date)//
        {
            string year_month = _date.Substring(0, 7);
            string year = _date.Substring(0, 4);
            string month = _date.Substring(5, 2);
            string day = _date.Substring(8, 2);
            DataRow[] rows = new DataRow[3];
            for (int i = 0; i < 3; i++)
            {
                rows[i] = _table.NewRow();
            }
            rows[0]["项目指标"] = "煤粉产量(t)";
            rows[1]["项目指标"] = "煤粉制备用电量(KWh)";
            rows[2]["项目指标"] = "煤粉制备电耗(KWh/t)";
            foreach (DataRow dr in rows)
            {
                _table.Rows.Add(dr);
            }
            DataTable monthData_first = tzHelper.GetReportData("tz_Report", _organizeID, year_month, "table_ClinkerMonthlyOutput");
            DataRow[] monthRow_first = monthData_first.Select("vDate='" + day + "'");
            _table.Rows[0]["本日甲班"] = monthRow_first.Count() > 0 ? monthRow_first[0]["CoalDustProductionFirstShift"] : 0;
            _table.Rows[0]["本日乙班"] = monthRow_first.Count() > 0 ? monthRow_first[0]["CoalDustProductionSecondShift"] : 0;
            _table.Rows[0]["本日丙班"] = monthRow_first.Count() > 0 ? monthRow_first[0]["CoalDustProductionThirdShift"] : 0;
            _table.Rows[0]["本日合计"] = monthRow_first.Count() > 0 ? monthRow_first[0]["CoalDustProductionSum"] : 0;
            DataTable yearData_first = tzHelper.GetReportData("tz_Report", _organizeID, year, "table_ClinkerYearlyOutput");
            DataRow[] yearRow_first = yearData_first.Select("vDate='" + month + "'");
            _table.Rows[0]["本月累计"] = yearRow_first.Count() > 0 ? yearRow_first[0]["CoalDustProductionSum"] : 0;
            DataRow[] yearSumRow_first = yearData_first.Select("vDate='合计'");
            _table.Rows[0]["本年累计"] = yearSumRow_first.Count() > 0 ? yearSumRow_first[0]["CoalDustProductionSum"] : 0;

            DataTable monthData_second = tzHelper.GetReportData("tz_Report", _organizeID, year_month, "table_ClinkerMonthlyElectricity_sum");
            DataRow[] monthRow_second = monthData_first.Select("vDate='" + day + "'");
            _table.Rows[1]["本日甲班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["CoalMillSystemFirstShift"] : 0;
            _table.Rows[1]["本日乙班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["CoalMillSystemSecondShift"] : 0;
            _table.Rows[1]["本日丙班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["CoalMillSystemThirdShift"] : 0;
            _table.Rows[1]["本日合计"] = monthRow_second.Count() > 0 ? monthRow_second[0]["CoalMillSystemSum"] : 0;
            DataTable yearData_second = tzHelper.GetReportData("tz_Report", _organizeID, year, "table_ClinkerYearlyElectricity_sum");
            DataRow[] yearRow_second = yearData_second.Select("vDate='" + month + "'");
            _table.Rows[1]["本月累计"] = yearRow_second.Count() > 0 ? yearRow_second[0]["CoalMillSystemSum"] : 0;
            DataRow[] yearSumRow_second = yearData_second.Select("vDate='合计'");
            _table.Rows[1]["本年累计"] = yearSumRow_second.Count() > 0 ? yearSumRow_second[0]["CoalMillSystemSum"] : 0;
            for (int i = 1; i <= 6; i++)
            {
                _table.Rows[2][i] = Convert.ToDecimal(_table.Rows[0][i]) != 0 ? Convert.ToDecimal(_table.Rows[1][i]) / Convert.ToDecimal(_table.Rows[0][i]) : 0;
            }
        }
        /// <summary>
        /// 返回熟料表
        /// </summary>
        /// <returns></returns>
        private static void GetClinkerTable(string _organizeID, DataTable _table, string _date)//原料
        {
            string year_month = _date.Substring(0, 7);
            string year = _date.Substring(0, 4);
            string month = _date.Substring(5, 2);
            string day = _date.Substring(8, 2);
            DataRow[] rows = new DataRow[16];
            for (int i = 0; i < 16; i++)
            {
                rows[i] = _table.NewRow();
            }
            rows[0]["项目指标"] = "熟料产量(t)";
            rows[1]["项目指标"] = "熟料制备用电量(KWh)";
            rows[2]["项目指标"] = "煤磨系统用电量(KWh)";
            rows[3]["项目指标"] = "烧成系统用电量(KWh)";
            rows[4]["项目指标"] = "生料均化用电量(KWh)";
            rows[5]["项目指标"] = "窑系统用电量(KWh)";
            rows[6]["项目指标"] = "废气处理用电量(KWh)";
            rows[7]["项目指标"] = "熟料制备电耗(KWh/t）";
            rows[8]["项目指标"] = "烧成系统电耗(KWh/t）";
            rows[9]["项目指标"] = "生料均化电耗(KWh/t）";
            rows[10]["项目指标"] = "窑系统电耗(KWh/t）";
            rows[11]["项目指标"] = "废气处理电耗(KWh/t）";
            rows[12]["项目指标"] = "煤粉消耗量(t)";
            rows[13]["项目指标"] = "窑头煤粉消耗量(t)";
            rows[14]["项目指标"] = "窑尾煤粉消耗量(t)";
            rows[15]["项目指标"] = "煤耗(kg/t)";
            foreach (DataRow dr in rows)
            {
                _table.Rows.Add(dr);
            }
            DataTable monthData_first = tzHelper.GetReportData("tz_Report", _organizeID, year_month, "table_ClinkerMonthlyOutput");
            DataRow[] monthRow_first = monthData_first.Select("vDate='" + day + "'");
            _table.Rows[0]["本日甲班"] = monthRow_first.Count() > 0 ? monthRow_first[0]["ClinkerProductionFirstShift"] : 0;
            _table.Rows[12]["本日甲班"] = monthRow_first.Count() > 0 ? monthRow_first[0]["AmounttoCoalDustConsumptionFirstShift"] : 0;
            _table.Rows[13]["本日甲班"] = monthRow_first.Count() > 0 ? monthRow_first[0]["KilnHeadCoalDustConsumptionFirstShift"] : 0;
            _table.Rows[14]["本日甲班"] = monthRow_first.Count() > 0 ? monthRow_first[0]["KilnTailCoalDustConsumptionFirstShift"] : 0;
            _table.Rows[0]["本日乙班"] = monthRow_first.Count() > 0 ? monthRow_first[0]["ClinkerProductionSecondShift"] : 0;
            _table.Rows[12]["本日乙班"] = monthRow_first.Count() > 0 ? monthRow_first[0]["AmounttoCoalDustConsumptionSecondShift"] : 0;
            _table.Rows[13]["本日乙班"] = monthRow_first.Count() > 0 ? monthRow_first[0]["KilnHeadCoalDustConsumptionSecondShift"] : 0;
            _table.Rows[14]["本日乙班"] = monthRow_first.Count() > 0 ? monthRow_first[0]["KilnTailCoalDustConsumptionSecondShift"] : 0;
            _table.Rows[0]["本日丙班"] = monthRow_first.Count() > 0 ? monthRow_first[0]["ClinkerProductionThirdShift"] : 0;
            _table.Rows[12]["本日丙班"] = monthRow_first.Count() > 0 ? monthRow_first[0]["AmounttoCoalDustConsumptionThirdShift"] : 0;
            _table.Rows[13]["本日丙班"] = monthRow_first.Count() > 0 ? monthRow_first[0]["KilnHeadCoalDustConsumptionThirdShift"] : 0;
            _table.Rows[14]["本日丙班"] = monthRow_first.Count() > 0 ? monthRow_first[0]["KilnTailCoalDustConsumptionThirdShift"] : 0;
            _table.Rows[0]["本日合计"] = monthRow_first.Count() > 0 ? monthRow_first[0]["ClinkerProductionSum"] : 0;
            _table.Rows[12]["本日合计"] = monthRow_first.Count() > 0 ? monthRow_first[0]["AmounttoCoalDustConsumptionSum"] : 0;
            _table.Rows[13]["本日合计"] = monthRow_first.Count() > 0 ? monthRow_first[0]["KilnHeadCoalDustConsumptionSum"] : 0;
            _table.Rows[14]["本日合计"] = monthRow_first.Count() > 0 ? monthRow_first[0]["KilnTailCoalDustConsumptionSum"] : 0;
            DataTable yearData_first = tzHelper.GetReportData("tz_Report", _organizeID, year, "table_ClinkerYearlyOutput");
            DataRow[] yearRow_first = yearData_first.Select("vDate='" + month + "'");
            _table.Rows[0]["本月累计"] = yearRow_first.Count() > 0 ? yearRow_first[0]["ClinkerProductionSum"] : 0;
            _table.Rows[12]["本月累计"] = monthRow_first.Count() > 0 ? monthRow_first[0]["AmounttoCoalDustConsumptionSum"] : 0;
            _table.Rows[13]["本月累计"] = monthRow_first.Count() > 0 ? monthRow_first[0]["KilnHeadCoalDustConsumptionSum"] : 0;
            _table.Rows[14]["本月累计"] = monthRow_first.Count() > 0 ? monthRow_first[0]["KilnTailCoalDustConsumptionSum"] : 0;
            DataRow[] yearSumRow_first = yearData_first.Select("vDate='合计'");
            _table.Rows[0]["本年累计"] = yearSumRow_first.Count() > 0 ? yearSumRow_first[0]["ClinkerProductionSum"] : 0;
            _table.Rows[12]["本年累计"] = monthRow_first.Count() > 0 ? monthRow_first[0]["AmounttoCoalDustConsumptionSum"] : 0;
            _table.Rows[13]["本年累计"] = monthRow_first.Count() > 0 ? monthRow_first[0]["KilnHeadCoalDustConsumptionSum"] : 0;
            _table.Rows[14]["本年累计"] = monthRow_first.Count() > 0 ? monthRow_first[0]["KilnTailCoalDustConsumptionSum"] : 0;

            DataTable monthData_second = tzHelper.GetReportData("tz_Report", _organizeID, year_month, "table_ClinkerMonthlyElectricity_sum");
            DataRow[] monthRow_second = monthData_second.Select("vDate='" + day + "'");
            _table.Rows[1]["本日甲班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["AmounttoFirstShift"] : 0;
            _table.Rows[2]["本日甲班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["CoalMillSystemFirstShift"] : 0;
            _table.Rows[3]["本日甲班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["FiringSystemFirstShift"] : 0;
            _table.Rows[4]["本日甲班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["RawBatchHomogenizeFirstShift"] : 0;
            _table.Rows[5]["本日甲班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["KilnSystemFirstShift"] : 0;
            _table.Rows[6]["本日甲班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["ExhaustDisposeFirstShift"] : 0;
            _table.Rows[1]["本日乙班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["AmounttoSecondShift"] : 0;
            _table.Rows[2]["本日乙班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["CoalMillSystemSecondShift"] : 0;
            _table.Rows[3]["本日乙班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["FiringSystemSecondShift"] : 0;
            _table.Rows[4]["本日乙班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["RawBatchHomogenizeSecondShift"] : 0;
            _table.Rows[5]["本日乙班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["KilnSystemSecondShift"] : 0;
            _table.Rows[6]["本日乙班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["ExhaustDisposeSecondShift"] : 0;
            _table.Rows[1]["本日丙班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["AmounttoThirdShift"] : 0;
            _table.Rows[2]["本日丙班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["CoalMillSystemThirdShift"] : 0;
            _table.Rows[3]["本日丙班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["FiringSystemThirdShift"] : 0;
            _table.Rows[4]["本日丙班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["RawBatchHomogenizeThirdShift"] : 0;
            _table.Rows[5]["本日丙班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["KilnSystemThirdShift"] : 0;
            _table.Rows[6]["本日丙班"] = monthRow_second.Count() > 0 ? monthRow_second[0]["ExhaustDisposeThirdShift"] : 0;
            _table.Rows[1]["本日合计"] = monthRow_second.Count() > 0 ? monthRow_second[0]["AmounttoSum"] : 0;
            _table.Rows[2]["本日合计"] = monthRow_second.Count() > 0 ? monthRow_second[0]["CoalMillSystemSum"] : 0;
            _table.Rows[3]["本日合计"] = monthRow_second.Count() > 0 ? monthRow_second[0]["FiringSystemSum"] : 0;
            _table.Rows[4]["本日合计"] = monthRow_second.Count() > 0 ? monthRow_second[0]["RawBatchHomogenizeSum"] : 0;
            _table.Rows[5]["本日合计"] = monthRow_second.Count() > 0 ? monthRow_second[0]["KilnSystemSum"] : 0;
            _table.Rows[6]["本日合计"] = monthRow_second.Count() > 0 ? monthRow_second[0]["ExhaustDisposeSum"] : 0;
            DataTable yearData_second = tzHelper.GetReportData("tz_Report", _organizeID, year, "table_ClinkerYearlyElectricity_sum");
            DataRow[] yearRow_second = yearData_second.Select("vDate='" + month + "'");
            _table.Rows[1]["本月累计"] = yearRow_second.Count() > 0 ? yearRow_second[0]["AmounttoSum"] : 0;
            _table.Rows[2]["本月累计"] = yearRow_second.Count() > 0 ? yearRow_second[0]["CoalMillSystemSum"] : 0;
            _table.Rows[3]["本月累计"] = yearRow_second.Count() > 0 ? yearRow_second[0]["FiringSystemSum"] : 0;
            _table.Rows[4]["本月累计"] = yearRow_second.Count() > 0 ? yearRow_second[0]["RawBatchHomogenizeSum"] : 0;
            _table.Rows[5]["本月累计"] = yearRow_second.Count() > 0 ? yearRow_second[0]["KilnSystemSum"] : 0;
            _table.Rows[6]["本月累计"] = yearRow_second.Count() > 0 ? yearRow_second[0]["ExhaustDisposeSum"] : 0;
            DataRow[] yearSumRow_second = yearData_second.Select("vDate='合计'");
            _table.Rows[1]["本年累计"] = yearSumRow_second.Count() > 0 ? yearSumRow_second[0]["AmounttoSum"] : 0;
            _table.Rows[2]["本年累计"] = yearSumRow_second.Count() > 0 ? yearSumRow_second[0]["CoalMillSystemSum"] : 0;
            _table.Rows[3]["本年累计"] = yearSumRow_second.Count() > 0 ? yearSumRow_second[0]["FiringSystemSum"] : 0;
            _table.Rows[4]["本年累计"] = yearSumRow_second.Count() > 0 ? yearSumRow_second[0]["RawBatchHomogenizeSum"] : 0;
            _table.Rows[5]["本年累计"] = yearSumRow_second.Count() > 0 ? yearSumRow_second[0]["KilnSystemSum"] : 0;
            _table.Rows[6]["本年累计"] = yearSumRow_second.Count() > 0 ? yearSumRow_second[0]["ExhaustDisposeSum"] : 0;

            for (int i = 1; i <= 6; i++)
            {
                _table.Rows[9][i] = Convert.ToDecimal(_table.Rows[0][i]) != 0 ? Convert.ToDecimal(_table.Rows[4][i]) / Convert.ToDecimal(_table.Rows[0][i]) : 0;
                _table.Rows[10][i] = Convert.ToDecimal(_table.Rows[0][i]) != 0 ? Convert.ToDecimal(_table.Rows[5][i]) / Convert.ToDecimal(_table.Rows[0][i]) : 0;
                _table.Rows[11][i] = Convert.ToDecimal(_table.Rows[0][i]) != 0 ? Convert.ToDecimal(_table.Rows[6][i]) / Convert.ToDecimal(_table.Rows[0][i]) : 0;

                _table.Rows[7][i] = Convert.ToDecimal(_table.Rows[0][i]) != 0 ? Convert.ToDecimal(_table.Rows[1][i]) / Convert.ToDecimal(_table.Rows[0][i]) : 0;
                _table.Rows[8][i] = Convert.ToDecimal(_table.Rows[0][i]) != 0 ? Convert.ToDecimal(_table.Rows[3][i]) / Convert.ToDecimal(_table.Rows[0][i]) : 0;
                _table.Rows[15][i] = Convert.ToDecimal(_table.Rows[0][i]) != 0 ? Convert.ToDecimal(_table.Rows[12][i]) * 1000 / Convert.ToDecimal(_table.Rows[0][i]) : 0;
            }
        }
        private static void CreatTableStructure(DataTable table)
        {
            DataColumn[] columns = new DataColumn[7];
            columns[0] = new DataColumn("项目指标", Type.GetType("System.String"));
            columns[1] = new DataColumn("本日甲班", Type.GetType("System.Decimal"));
            columns[2] = new DataColumn("本日乙班", Type.GetType("System.Decimal"));
            columns[3] = new DataColumn("本日丙班", Type.GetType("System.Decimal"));
            columns[4] = new DataColumn("本日合计", Type.GetType("System.Decimal"));
            columns[5] = new DataColumn("本月累计", Type.GetType("System.Decimal"));
            columns[6] = new DataColumn("本年累计", Type.GetType("System.Decimal"));
            foreach (DataColumn cl in columns)
            {
                table.Columns.Add(cl);
            }
        }
    }
}
