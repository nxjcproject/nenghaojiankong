<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MonitorView.aspx.cs" Inherits="Monitor.Web.UI_Monitor.ProcessEnergyMonitor.zc_nxjc.monitor.MonitorView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="/lib/ealib/themes/gray/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/lib/ealib/themes/icon.css" />
<%--    <link href="../../../css/common/Monitor.css" rel="stylesheet" />--%>

    <script type="text/javascript" src="/lib/ealib/jquery.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/common/jquery.utility.js" charset="utf-8"></script>

    <script type="text/javascript" src="/lib/ealib/jquery.easyui.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="/lib/ealib/easyui-lang-zh_CN.js" charset="utf-8"></script>

    <script type="text/javascript" src="../../../js/common/Monitor.js" charset="utf-8"></script>
    <script type="text/javascript" charset="utf-8">
        var viewNames = ["能源消耗总貌"];
    </script>

    <title></title>
</head>
<body>
    <div class="easyui-layout" data-options="fit:true,border:false" style="width: 100%;">
        <div data-options="region:'center',border:true,collapsible:false">
            <div id="myTabs" class="easyui-tabs" data-options="fit:true" style="float: left;">
            </div>
        </div>
    </div>
</body>
</html>
