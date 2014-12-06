<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MonitorView.aspx.cs" Inherits="Monitor.Web.UI_Monitor.ProcessEnergyMonitor.Clinker.monitor.MonitorView" %>

<%@ Register Src="/UI_WebUserControls/OrganizationSelector/OrganisationTree.ascx" TagPrefix="uc1" TagName="OrganisationTree" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="/lib/ealib/themes/gray/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/lib/ealib/themes/icon.css" />

    <script type="text/javascript" src="/lib/ealib/jquery.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/common/jquery.utility.js" charset="utf-8"></script>

    <script type="text/javascript" src="/lib/ealib/jquery.easyui.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="/lib/ealib/easyui-lang-zh_CN.js" charset="utf-8"></script>

    <script type="text/javascript" charset="utf-8">
        var viewNames = ["scyt", "view2", "view3"];
    </script>
    <script type="text/javascript" src="../../../js/common/Monitor.js" charset="utf-8"></script>

    <title>熟料工序能耗监控</title>
</head>
<body>
    <div class="easyui-layout" data-options="fit:true,border:false" style="width: 100%;">
        <div data-options="region:'west',split:true,border:true" title="生产线信息" style="width: 220px;">
            <uc1:OrganisationTree runat="server" ID="OrganisationTree" />
        </div>
        <div data-options="region:'center',border:true,collapsible:false">
            <div style="position: fixed; top: 0; padding-left: 5px; width: 100%; background: white; height: 20px; z-index: 100;">
                时间：<span id="timestamp"></span>
            </div>
            <br />
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
                            <div id="template2" style="float: left; width: 800px; height: 600px; overflow: scroll;">
                            </div>
                        </div>
                    </div>
                </div>
                <div data-options="region:'east',split:true,border:true,collapsible:true" title="电表信息" style="width: 680px;">
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
