using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor.Service.OverViewMonitorFactory
{
    public class NullProvider : IOverViewMonitorDataProvider
    {
        public IEnumerable<ProcessEnergyMonitor.DataItem> GetDataItem(string organizationId, params string[] variableIds)
        {
            throw new NotImplementedException();
        }
    }
}
