using Monitor.Service.ProcessEnergyMonitor;
using SqlServerDataAdapter;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor.Service.FormulaEnergy
{
    public class FormulaEnergyService
    {
        private SqlServerDataFactory _dataFactory;

        public FormulaEnergyService(string connString)
        {
            _dataFactory = new SqlServerDataFactory(connString);
        }

        private DataTable GetFormulaValues(string organizationId)
        {
            DataTable result;
            string queryString = "select * from RealtimeFormulaValue where OrganizationID like @organizationId";
            SqlParameter[] parameters = { new SqlParameter("@organizationId", organizationId + "%") };

            result = _dataFactory.Query(queryString, parameters);
            return result;
        }

        private DataTable CalculatePowerConsumption(DataTable sourceTable)
        {
            DataColumn newCol = new DataColumn("PowerConsumption", typeof(decimal));
            sourceTable.Columns.Add(newCol);
            foreach(DataRow item in sourceTable.Rows)
            {
                if ((Convert.ToDecimal(item["DenominatorValue"]) != 0) && (!Convert.IsDBNull(item["DenominatorValue"])))
                {
                    item["PowerConsumption"] = (decimal)item["FormulaValue"] / (decimal)item["DenominatorValue"];
                }
                else
                {
                    item["PowerConsumption"] = 0;
                }
            }
            return sourceTable;
        }

        private IEnumerable<DataItem> ConvertToDataItems(DataTable sourceTable)
        {
            string[] columns = { "PowerConsumption" };
            IList<DataItem> result = new List<DataItem>();
            foreach(DataRow item in sourceTable.Rows)
            {
                foreach(string col in columns)
                {
                    DataItem value = new DataItem();
                    value.ID = item["OrganizationID"].ToString().Trim() + item["LevelCode"].ToString().Trim() + col;
                    value.Value = item["PowerConsumption"].ToString().Trim();
                    result.Add(value);
                }
            }
            return result;
        }
        /// <summary>
        /// 根据公式获得电耗的键值对，
        /// 键为OrganizationID值、LevelCode值和PowerConsumption字符的连接字符串
        /// 值为PowerConsumption字段对应的值
        /// </summary>
        /// <param name="organizaionId"></param>
        /// <param name="time"></param>
        /// <returns></returns>
        public IEnumerable<DataItem> GetFormulaPowerConsumption(string organizaionId)
        {
            DataTable sourceTable = GetFormulaValues(organizaionId);   //获得RealtimeFormulaValue表值
            sourceTable = CalculatePowerConsumption(sourceTable);            //根据表中电量消耗值和产量计算电耗值
            IEnumerable<DataItem> result = ConvertToDataItems(sourceTable);  //将表中电耗值转换为键值对
            return result;
        }
    }
}
