using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor.Service.OverViewMonitorFactory
{
    public enum DataItemProviderType
    {
        /// <summary>
        /// 分步工序电耗
        /// </summary>
        ProcessConsumption,
        /// <summary>
        /// 综合电耗、煤耗
        /// </summary>
        Comprehensive
    }
}
