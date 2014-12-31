﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="template0.aspx.cs" Inherits="Monitor.Web.UI_Monitor.ProcessEnergyMonitor.zc_nxjc_qtx.view.template0" %>

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

    <script src="../../../js/common/MonitorPage.js"></script>
    <script type="text/javascript">
        var pageData = {
            tabIndex: 0,
            organizationId: "zc_nxjc_qtx",
            viewName: "1#水泥制备"
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
            <div id="template">
            </div>
        </div>
    </div>
</body>
</html>
