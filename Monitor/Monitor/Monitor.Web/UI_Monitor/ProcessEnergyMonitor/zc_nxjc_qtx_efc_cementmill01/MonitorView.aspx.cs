using Monitor.Infrastructure.Configuration;
using Monitor.Service.FormulaEnergy;
using Monitor.Service.ProcessEnergyMonitor;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Monitor.Web.UI_Monitor.ProcessEnergyMonitor.zc_nxjc_qtx_efc_cementmill01
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
            IList<DataItem> dataItems = new List<DataItem>();
            string factoryLevel = OrganizationHelper.GetFactoryLevel(organizationId);

            //#region 获得表中实时数据
            //ProcessPowerMonitor precessPower = new ProcessPowerMonitor(connString);
            //DataTable sourceDt = precessPower.GetMonitorDatas(factoryLevel);
            //DataRow[] rows = sourceDt.Select(String.Format("OrganizationID='{0}'", organizationId));

            //string[] fields = { "本日合计", "本月累计", "本年累计" };
            //dataItems = ProcessEnergyMonitorService.GetPowerMonitor(rows, fields).ToList();
            //#endregion

            #region 获得dcs实时数据
            string dcsConn = ConnectionStringFactory.GetDCSConnectionString(organizationId);
            ProcessEnergyMonitorService monitorService = new ProcessEnergyMonitorService(dcsConn);
            IEnumerable<DataItem> monitorItems = monitorService.GetRealtimeDatas(organizationId, sceneName);
            foreach (var item in monitorItems)
            {
                dataItems.Add(item);
            }
            #endregion

            #region 获得电表功率数据
            string ammeterConn = ConnectionStringFactory.GetAmmeterConnectionString(factoryLevel);
            ProcessEnergyMonitorService ammeterService = new ProcessEnergyMonitorService(ammeterConn);
            IEnumerable<DataItem> ammeterItems = ammeterService.GetRealtimeDatas(organizationId, sceneName);
            foreach (var item in ammeterItems)
            {
                dataItems.Add(item);
            }
            #endregion

            //#region 获得实时电能消耗数据
            //RealtimeFormulaValueService formulaValue = new RealtimeFormulaValueService(ammeterConn, "");
            //IEnumerable<DataItem> formulaValueItems = formulaValue.GetFormulaPowerConsumption(factoryLevel);
            //foreach (var item in formulaValueItems)
            //{
            //    dataItems.Add(item);
            //}
            //#endregion

            #region  获得实时公式电耗
            FormulaEnergyService formulaEnergyServer = new FormulaEnergyService(connString);
            IEnumerable<DataItem> formulaEnergyItems = formulaEnergyServer.GetFormulaPowerConsumption(factoryLevel);
            foreach (var item in formulaEnergyItems)
            {
                dataItems.Add(item);
            }
            #endregion

            #region 获得实时公式功率
            FormulaPowerService formulaPowerServer = new FormulaPowerService(connString);
            IEnumerable<DataItem> formulaPowerItems = formulaPowerServer.GetFormulaPower(factoryLevel);
            foreach (var item in formulaPowerItems)
            {
                dataItems.Add(item);
            }
            #endregion

            SceneMonitor result = new SceneMonitor();
            result.Name = sceneName;
            result.time = DateTime.Now;
            result.DataSet = dataItems;

            return result;
        }
    }
}