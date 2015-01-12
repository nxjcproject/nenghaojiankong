using Monitor.Infrastructure.Configuration;
using SqlServerDataAdapter;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor.Service.TrendlineAnalysis
{
    public static class ElectricityAnalysisService
    {
        public static DataTable GetElectricityUsageGroupByHour(string organizationId, string levelcode, DateTime startTime, DateTime endTime)
        {
            string connectionString = ConnectionStringFactory.NXJCConnectionString;
            ISqlServerDataFactory dataFactory = new SqlServerDataFactory(connectionString);

            string queryString = @"SELECT YEAR([vDate]) AS [Year], MONTH([vDate]) AS [Month], DAY([vDate]) AS [Day], DATEPART(HOUR, [vDate]) AS [Hour], SUM([Value]) AS [Sum]
                                     FROM [dbo].[temp_ProcessValue]
                                    WHERE [OrganizationID] = @organizationId
                                      AND [LevelCode] = @levelcode
                                      AND [vDate] >= @startTime
                                      AND [vDate] <= @endTime
                                 GROUP BY YEAR([vDate]), MONTH([vDate]), DAY([vDate]), DATEPART(HOUR, [vDate])
                                ";


            SqlParameter[] parameters = new SqlParameter[]{
                new SqlParameter("organizationId", organizationId),
                new SqlParameter("levelcode", levelcode),
                new SqlParameter("startTime", startTime),
                new SqlParameter("endTime", endTime)
            };

            return dataFactory.Query(queryString, parameters);
        }
    }
}
