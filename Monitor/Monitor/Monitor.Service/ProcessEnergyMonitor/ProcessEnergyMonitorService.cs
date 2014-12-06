using Monitor.Infrastructure.Configuration;
using SqlServerDataAdapter;
using SqlServerDataAdapter.Infrastruction;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor.Service.ProcessEnergyMonitor
{
    public class ProcessEnergyMonitorService
    {
        private static readonly string _connStr = ConnectionStringFactory.NXJCConnectionString;
        private static ISqlServerDataFactory _dataFactory = new SqlServerDataFactory(_connStr);

        /// <summary>
        /// 获得DataSetInformation
        /// </summary>
        /// <param name="viewName"></param>
        /// <returns></returns>
        private static IEnumerable<DataSetInformation> GetDataSetInformation(string organizationId,string viewName)
        {
            IList<DataSetInformation> results = new List<DataSetInformation>();
            Query query = new Query("EnergyConsumptionContrast");
            query.AddCriterion("ViewName", "viewName", viewName, CriteriaOperator.Equal);
            query.AddCriterion("OrganizationID", "organizationId", organizationId, CriteriaOperator.Equal);
            DataTable table = _dataFactory.Query(query);
            foreach (DataRow item in table.Rows)
            {
                results.Add(new DataSetInformation
                {
                    ViewId = item["VariableName"].ToString().Trim(),
                    FieldName = item["FieldName"].ToString().Trim(),
                    TableName = item["TableName"].ToString().Trim()
                });
            }
            return results;
        }

        /// <summary>
        /// 获得实时数据的table表
        /// </summary>
        /// <param name="dataSetInformations"></param>
        /// <returns></returns>
        private static DataTable GetDataItemTable(IEnumerable<DataSetInformation> dataSetInformations)
        {
            //DataItem result = new DataItem();
            ComplexQuery cmpquery = new ComplexQuery();
            foreach (var item in dataSetInformations)
            {
                cmpquery.AddNeedField(item.TableName, item.FieldName, item.ViewId);
            }
            cmpquery.JoinCriterion = new JoinCriterion
            {
                DefaultJoinFieldName = "v_date",
                JoinType = JoinType.FULL_JOIN
            };
            cmpquery.TopNumber = 1;
            //cmpquery.OrderByClause = new OrderByClause("realtime_line_data.v_date", true);
            DataTable table = _dataFactory.Query(cmpquery);

            return table;
        }

        /// <summary>
        /// 获得实时视图数据
        /// </summary>
        /// <param name="viewName"></param>
        /// <returns></returns>
        public static IEnumerable<DataItem> GetRealtimeDatas(string organizationId, string viewName)
        {
            IList<DataItem> result = new List<DataItem>();
            //ArrayList idList = GetParametorsId(viewName);
            IEnumerable<DataSetInformation> dataSetInfor = GetDataSetInformation(organizationId,viewName);
            if (dataSetInfor.Count() != 0)
            {
                DataTable table = GetDataItemTable(dataSetInfor);
                string[] idList = GetTableColumnName(table);
                foreach (var item in idList)
                {
                    result.Add(new DataItem
                    {
                        ID = item,
                        Value = table.Rows[0][item].ToString().Trim()
                    });
                }
            }            
            return result;
        }
        /// <summary>
        /// 获得table的字段名
        /// </summary>
        /// <param name="dt"></param>
        /// <returns></returns>
        private static string[] GetTableColumnName(DataTable dt)
        {
            IList<string> result = new List<string>();
            foreach (DataColumn item in dt.Columns)
            {
                result.Add(item.ColumnName);
            }
            return result.ToArray();
        }

        /// <summary>
        /// 获得视图中所有变量的Id值
        /// </summary>
        /// <param name="viewName"></param>
        /// <returns></returns>
        private static ArrayList GetParametorsId(string viewName)
        {
            ArrayList result = new ArrayList();
            ComplexQuery cmpquery = new ComplexQuery();
            cmpquery.AddNeedField("ContrastTable", "VariableName");
            cmpquery.AddCriterion("ViewName", viewName, CriteriaOperator.Equal);
            DataTable data = _dataFactory.Query(cmpquery);
            foreach (DataRow row in data.Rows)
            {
                result.Add(row["VariableName"].ToString().Trim());
            }
            return result;
        }
    }

    public class DataSetInformation
    {
        public string ViewId { get; set; }
        public string FieldName { get; set; }
        public string TableName { get; set; }
    }

    public class DataItem
    {
        public string ID { get; set; }
        public string Value { get; set; }
    }

    public class SceneMonitor
    {
        public DateTime time { get; set; }
        public string Name { get; set; }
        public IEnumerable<DataItem> DataSet { get; set; }
    }

    public class MonitorTable
    {
        public string consumption { get; set; }
        public string ammeter { get; set; }
    }
}
