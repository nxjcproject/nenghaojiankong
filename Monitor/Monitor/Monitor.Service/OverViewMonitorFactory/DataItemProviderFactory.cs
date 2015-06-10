using Monitor.Infrastructure.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor.Service.OverViewMonitorFactory
{
    public class DataItemProviderFactory
    {
        public static IOverViewMonitorDataProvider CreateDataItemProvider(DataItemProviderType type)
        {
            string connString = ConnectionStringFactory.NXJCConnectionString;
            IOverViewMonitorDataProvider result;

            if (type == DataItemProviderType.ProcessConsumption)
            {
                result = new ProcessConsumptionProvider(connString);
            }
            else if (type == DataItemProviderType.Comprehensive)
            {
                result = new ComprehensiveConsumptionProvider(connString);
            }
            else
            {
                result = new NullProvider();
            }

            return result;
        }
    }
}
