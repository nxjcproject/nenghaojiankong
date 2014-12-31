<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="template3.aspx.cs" Inherits="Monitor.Web.UI_Monitor.ProcessEnergyMonitor.zc_nxjc_qtx_efc_clinker03.view.template3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="/lib/ealib/themes/gray/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/lib/ealib/themes/icon.css" />
    <link href="../../../css/common/Monitor.css" rel="stylesheet" />

    <script type="text/javascript" src="/lib/ealib/jquery.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/common/jquery.utility.js" charset="utf-8"></script>

    <script type="text/javascript" src="/lib/ealib/jquery.easyui.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="/lib/ealib/easyui-lang-zh_CN.js" charset="utf-8"></script>

    <script src="../../../js/common/MonitorPageHaveTable.js"></script>
    <script type="text/javascript">
        var pageData = {
            tabIndex: 3,
            organizationId: "zc_nxjc_qtx_efc_clinker03",
            viewName: "3#熟料制备",
            tableDataView: "Clinker_ClinkerProductionLine"
        };
    </script>
    <title></title>
</head>
<body>
    <div class="easyui-layout" data-options="fit:true,border:false" style="width: 100%;">
        <div data-options="region:'north',border:true,collapsible:false" style="font-size: 15px; height: 3%;">
            当前时间：<span id="timestamp"></span>
        </div>
        <div data-options="region:'center',border:true,collapsible:false" style="height: 97%">
            <div class="easyui-layout" data-options="fit:true,border:false">
                <div id="template" data-options="region:'center',split:true,border:true,collapsible:false">
                </div>
                <div data-options="region:'east',split:true,border:true,collapsible:true" title="电表信息" style="width: 800px;">
                    <div style="width: 100%; height: 50%">
                        <table id="consumption" class="easyui-datagrid" style="width: 100%; height: 100%">
                        </table>
                    </div>
                    <div style="width: 100%; height: 50%">
                        <table id="ammeter" class="easyui-datagrid" style="width: 100%; height: 100%">
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
