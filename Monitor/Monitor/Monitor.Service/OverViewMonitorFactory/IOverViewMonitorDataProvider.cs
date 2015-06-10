using Monitor.Service.ProcessEnergyMonitor;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor.Service.OverViewMonitorFactory
{
    public interface IOverViewMonitorDataProvider
    {
        IEnumerable<DataItem> GetDataItem(string organizationId, params string[] variableIds);
    }
}
