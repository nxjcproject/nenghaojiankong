<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MonitorView.aspx.cs" Inherits="Monitor.Web.UI_Monitor.ProcessEnergyMonitor.zc_nxjc_qtx_efc_cementmill02.MonitorView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="/lib/ealib/themes/gray/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/lib/ealib/themes/icon.css" />
    <link href="../../css/common/mymonitor.css" rel="stylesheet" />

    <script type="text/javascript" src="/lib/ealib/jquery.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/common/jquery.utility.js" charset="utf-8"></script>

    <script type="text/javascript" src="/lib/ealib/jquery.easyui.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="/lib/ealib/easyui-lang-zh_CN.js" charset="utf-8"></script>

    <script src="../../js/common/myMonitor.js"></script>
    <script src="../../js/common/trendlineAnalysis_monitorView.js"></script>
    <script type="text/javascript">
        var pageData = {
            organizationId: "zc_nxjc_qtx_efc_cementmill02",
            viewName: "saa"
        };
    </script>

    <title></title>
</head>
<body class="easyui-layout" data-options="border:false" >
    <div data-options="region:'center'">
        <div id="template" style="height:100%; overflow: auto;"></div>
    </div>
    <div data-options="region:'south',title:'趋势分析',split:true,collapsed:false" style="height:334px;">
        <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'west',split:false" style="height:100%;width:285px">
                <div id="tagListContainer" class="easyui-layout" data-options="fit:true"></div>
            </div>
            <div data-options="region:'center'">
                <div id="Windows_Container" class="easyui-layout" data-options="fit:true">
                </div>
            </div>
        </div>
    </div>
</body>
</html>
