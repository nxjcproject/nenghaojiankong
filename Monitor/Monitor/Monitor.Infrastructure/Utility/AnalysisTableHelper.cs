using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor.Infrastructure.Utility
{
    public static class AnalysisTableHelper
    {
        /// <summary>
        /// 将统计表转换为以时间为字段的横表（按小时统计）（自定义时间段统计）
        /// </summary>
        /// <param name="source"></param>
        /// <param name="startTime"></param>
        /// <param name="endTime"></param>
        /// <returns></returns>
        public static DataTable VerticalToHorizontalHourly(DataTable source, DateTime startTime, DateTime endTime)
        {
            DataTable destination = new DataTable();

            for (DateTime hourLooper = startTime; hourLooper <= endTime; hourLooper = hourLooper.AddHours(1))
            {
                DataColumn dc = new DataColumn(hourLooper.ToString("yyyy-MM-dd-HH"), typeof(decimal));
                dc.DefaultValue = 0;
                destination.Columns.Add(dc);
            }

            DataRow dr = destination.NewRow();

            for (int i = 0; i < source.Rows.Count; i++)
            {
                string columnName = source.Rows[i]["Year"].ToString() + "-" + ((int)source.Rows[i]["Month"]).ToString("00") + "-" + ((int)source.Rows[i]["Day"]).ToString("00") + "-" + ((int)source.Rows[i]["Hour"]).ToString("00");
                dr[columnName] = (decimal)source.Rows[i]["Sum"];
            }

            destination.Rows.Add(dr);

            return destination;
        }
    }
}
