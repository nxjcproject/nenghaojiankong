using Monitor.Service.OverViewMonitorFactory;
using Monitor.Service.ProcessEnergyMonitor;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Monitor.Web.UI_OverView
{
    /// <summary>
    /// OverViewMonitor 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
    [System.Web.Script.Services.ScriptService]
    public class OverViewMonitor : System.Web.Services.WebService
    {

        [WebMethod]
        public SceneMonitor GetRealTimeData(string ids)
        {
            IList<DataItem> dataItems = new List<DataItem>();

            string[] iditems = ids.Split(',');
            int count = iditems.Count();

            Dictionary<string, IList<string>> idDictionary = new Dictionary<string, IList<string>>();
            #region 分类Id
            for (int i = 0; i < count - 1; i++)
            {
                string[] itemArry = iditems[i].Split('>');
                if (itemArry.Count() == 3)
                {
                    if (itemArry[2] == "ProcessConsumption")
                    {
                        string key = itemArry[0] + ",ProcessConsumption";
                        if (!idDictionary.Keys.Contains(key))
                        {
                            idDictionary.Add(key, new List<string>());
                            idDictionary[key].Add(itemArry[1]);
                        }
                        else
                        {
                            idDictionary[key].Add(itemArry[1]);
                        }
                    }
                    else if (itemArry[2] == "Comprehensive")
                    {
                        string key = itemArry[0] + ",Comprehensive";

                        if (!idDictionary.Keys.Contains(key))
                        {
                            idDictionary.Add(key, new List<string>());
                            idDictionary[key].Add(itemArry[1]);
                        }
                        else
                        {
                            idDictionary[key].Add(itemArry[1]);
                        }
                    }
                    else
                    {
                    }
                }
            }
            #endregion

            foreach (var keyitem in idDictionary.Keys)
            {
                string[] keyArry = keyitem.Split(',');
                string[] mvariableids = idDictionary[keyitem].ToArray();

                if (Enum.IsDefined(typeof(DataItemProviderType), keyArry[1]))
                {
                    IEnumerable<DataItem> items = DataItemProviderFactory.CreateDataItemProvider((DataItemProviderType)Enum.Parse(typeof(DataItemProviderType), keyArry[1])).GetDataItem(keyArry[0], mvariableids);
                    foreach (var item in items)
                    {
                        dataItems.Add(item);
                    }
                }
            }

            SceneMonitor result = new SceneMonitor();
            result.time = DateTime.Now;
            result.DataSet = dataItems;

            return result;
        }
    }
}
