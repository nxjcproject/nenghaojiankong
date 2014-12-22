<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MonitorView.aspx.cs" Inherits="Monitor.Web.UI_Monitor.ProcessEnergyMonitor.zc_nxjc_qtx_efc_clinker03.monitor.MonitorView" %>

<%@ Register Src="/UI_WebUserControls/OrganizationSelector/OrganisationTree.ascx" TagPrefix="uc1" TagName="OrganisationTree" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="/lib/ealib/themes/gray/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/lib/ealib/themes/icon.css" />

    <script type="text/javascript" src="/lib/ealib/jquery.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/common/jquery.utility.js" charset="utf-8"></script>

    <script type="text/javascript" src="/lib/ealib/jquery.easyui.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="/lib/ealib/easyui-lang-zh_CN.js" charset="utf-8"></script>

    <script type="text/javascript" charset="utf-8">
        var viewNames = ["scyt", "view2", "view3", "view4", "view5"];
    </script>
    <script type="text/javascript" src="../../../js/common/Monitor.js" charset="utf-8"></script>

    <title>3#熟料线能耗监控</title>
</head>
<body>
    <div class="easyui-layout" data-options="fit:true,border:false" style="width: 100%;">
        <div data-options="region:'north',border:true,collapsible:false" style="font-size:15px;height:3%;">
            当前时间：<span id="timestamp"></span>         
        </div>
        <div data-options="region:'center',border:true,collapsible:false" style="height:97%">
            <div class="easyui-layout" data-options="fit:true,border:false">
                <div data-options="region:'center',split:true,border:true,collapsible:false">
                    <div id="myTabs" class="easyui-tabs" data-options="fit:true" style="float: left;">
                        <div title="1" style="width: 100%">
                            <div id="template0">
                            </div>
                        </div>
                        <div title="2" style="width: 100%">
                            <div id="template1">
                            </div>
                        </div>
                        <div title="3" style="width: 100%">
                            <div id="template2">
                            </div>
                        </div>
                    </div>
                </div>
                <div data-options="region:'east',split:true,border:true,collapsible:true" title="电表信息" style="width: 910px;">
                    <div style="width: 100%; height: 400px">
                        <table id="consumption" class="easyui-datagrid" style="width: 100%; height: 100%">
                        </table>
                    </div>
                    <div style="width: 100%; height: 400px">
                        <table id="ammeter" class="easyui-datagrid" style="width: 100%; height: 100%">
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
