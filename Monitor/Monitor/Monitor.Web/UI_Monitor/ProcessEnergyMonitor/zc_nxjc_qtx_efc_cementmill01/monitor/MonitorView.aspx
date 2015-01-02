﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MonitorView.aspx.cs" Inherits="Monitor.Web.UI_Monitor.ProcessEnergyMonitor.zc_nxjc_qtx_efc_cementmill01.monitor.MonitorView" %>

<%@ Register Src="/UI_WebUserControls/OrganizationSelector/OrganisationTree.ascx" TagPrefix="uc1" TagName="OrganisationTree" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="/lib/ealib/themes/gray/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/lib/ealib/themes/icon.css" />
    <link href="../../../css/common/Monitor.css" rel="stylesheet" />

    <script type="text/javascript" src="/lib/ealib/jquery.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/common/jquery.utility.js" charset="utf-8"></script>

    <script type="text/javascript" src="/lib/ealib/jquery.easyui.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="/lib/ealib/easyui-lang-zh_CN.js" charset="utf-8"></script>

    <script type="text/javascript" src="../../../js/common/Monitor.js" charset="utf-8"></script>
    <script type="text/javascript" charset="utf-8">
        var viewNames = ["1#水泥制备"];
    </script>

    <title>1#水泥磨能耗监控</title>
</head>
<body>
    <div class="easyui-layout" data-options="fit:true,border:false" style="width: 100%;">
        <div data-options="region:'center',border:true,collapsible:false" style="overflow:hidden;">
            <div id="myTabs" class="easyui-tabs" data-options="fit:true">
            </div>
        </div>
    </div>
</body>
</html>
