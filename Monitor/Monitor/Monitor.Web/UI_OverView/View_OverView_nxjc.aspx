<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_OverView_nxjc.aspx.cs" Inherits="Monitor.Web.UI_OverView.View_OverView_nxjc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head_OverView_nxjc" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>宁夏建材能源中心系统总貌</title>
    <link rel="stylesheet" type="text/css" href="/lib/ealib/themes/gray/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/lib/ealib/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/lib/extlib/themes/syExtIcon.css" />
    <link rel="stylesheet" type="text/css" href="/lib/extlib/themes/syExtCss.css" />

    <link rel="stylesheet" type="text/css" href="/css/common/NormalPage.css" />
    <link rel="stylesheet" type="text/css" href="/UI_OverView/css/page/View_OverView_nxjc.css" />

    <script type="text/javascript" src="/lib/ealib/jquery.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="/lib/ealib/jquery.easyui.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="/lib/ealib/easyui-lang-zh_CN.js" charset="utf-8"></script>

    <script type="text/javascript" src="js/page/View_OverView_nxjc.js" charset="utf-8"></script>

</head>
<body>
    <div class="easyui-layout" data-options="fit:true,border:false">
        <div data-options="region:'center',border:false,collapsible:false" style ="padding-top:10px; padding-left:30px;">
            <table>
                <tr>
                    <td class ="StaticsItemsLeftTd">
                        <div class="easyui-panel" title="银川水泥" style ="padding:2px; width:406px;">
                            <table class="table">
                                <tr>
                                    <th class="StaticsItemName">总功率(万千瓦)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">余热发电功率(MW)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">煤磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">水泥磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">生料磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">水泥分步电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">熟料综合电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">熟料综合煤耗(kg/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                    <td class ="StaticsItemsCenterTd">
                        <div class="easyui-panel" title="宁夏建材集团" style="padding: 2px; width:406px;">
                            <table class="table">
                                <tr>
                                    <th class="StaticsItemName">总功率(万千瓦)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc总用电功率(KW)本年累计"></span></td>
                                    <th class="StaticsItemName">余热发电功率(MW)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc余热发电功率(MW)本年累计"></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">煤磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc煤粉制备电耗(KWh/t)本年累计"></span></td>
                                    <th class="StaticsItemName">水泥磨电耗(KWh/t)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc水泥磨电耗(KWh/t)本年累计"></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">生料磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc生料磨电耗(KWh/t)本年累计"></span></td>
                                    <th class="StaticsItemName">水泥分步电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc水泥电耗(KWh/t)本年累计"></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">熟料综合电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc熟料综合电耗(KWh/t)本年累计"></span></td>
                                    <th class="StaticsItemName">熟料综合煤耗(kg/t)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc煤耗(kg/t)本年累计"></span></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                    <td class ="StaticsItemsRightTd">
                        <div class="easyui-panel" title="石嘴山水泥" style="padding: 2px; width:406px;">
                            <table class="table">
                                <tr>
                                    <th class="StaticsItemName">总功率(万千瓦)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">余热发电功率(MW)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">煤磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">水泥磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">生料磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">水泥分步电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">熟料综合电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">熟料综合煤耗(kg/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class ="StaticsItemsLeftTd">
                        <div class="easyui-panel" title="青铜峡水泥" style="padding: 2px; width:406px;">
                            <table class="table">
                                <tr>
                                    <th class="StaticsItemName">总功率(万千瓦)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx总用电功率(KW)本年累计"></span></td>
                                    <th class="StaticsItemName">余热发电功率(MW)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx余热发电功率(MW)本年累计"></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">煤磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx煤粉制备电耗(KWh/t)本年累计"></span></td>
                                    <th class="StaticsItemName">水泥磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx水泥磨电耗(KWh/t)本年累计"></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">生料磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx生料磨电耗(KWh/t)本年累计"></span></td>
                                    <th class="StaticsItemName">水泥分步电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx水泥电耗(KWh/t)本年累计"></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">熟料综合电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx熟料综合电耗(KWh/t)本年累计"></span></td>
                                    <th class="StaticsItemName">熟料综合煤耗(kg/t)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx煤耗(kg/t)本年累计"></span></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                    <td class ="StaticsItemsCenterTd" rowspan="4" style="background-image: url('images/page/GlobalMapArrow_nxjc.png'); background-repeat: no-repeat">
                    </td>
                    <td class ="StaticsItemsRightTd">
                        <div class="easyui-panel" title="天山水泥" style="padding: 2px; width:406px;">
                            <table class="table">
                                <tr>
                                    <th class="StaticsItemName">总功率(万千瓦)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">余热发电功率(MW)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">煤磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">水泥磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">生料磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">水泥分步电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">熟料综合电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">熟料综合煤耗(kg/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class ="StaticsItemsLeftTd">
                        <div class="easyui-panel" title="中宁水泥" style="padding: 2px; width:406px;">
                            <table class="table">
                                <tr>
                                    <th class="StaticsItemName">总功率(万千瓦)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">余热发电功率(MW)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">煤磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">水泥磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">生料磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">水泥分步电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">熟料综合电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">熟料综合煤耗(kg/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                    <td class ="StaticsItemsRightTd">
                        <div class="easyui-panel" title="乌海赛马" style="padding: 2px; width:406px;">
                            <table class="table">
                                <tr>
                                    <th class="StaticsItemName">总功率(万千瓦)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">余热发电功率(MW)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">煤磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">水泥磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">生料磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">水泥分步电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">熟料综合电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">熟料综合煤耗(kg/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class ="StaticsItemsLeftTd">
                        <div class="easyui-panel" title="六盘山水泥" style="padding: 2px; width:406px;">
                            <table class="table">
                                <tr>
                                    <th class="StaticsItemName">总功率(万千瓦)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">余热发电功率(MW)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">煤磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">水泥磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">生料磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">水泥分步电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">熟料综合电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">熟料综合煤耗(kg/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                    <td class ="StaticsItemsRightTd">
                        <div class="easyui-panel" title="白银水泥" style="padding: 2px; width:406px;">
                            <table class="table">
                                <tr>
                                    <th class="StaticsItemName">总功率(万千瓦)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">余热发电功率(MW)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">煤磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">水泥磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">生料磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">水泥分步电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">熟料综合电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">熟料综合煤耗(kg/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class ="StaticsItemsLeftTd">
                        <div class="easyui-panel" title="乌海西水" style="padding: 2px; width:406px;">
                            <table class="table">
                                <tr>
                                    <th class="StaticsItemName">总功率(万千瓦)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">余热发电功率(MW)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">煤磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">水泥磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">生料磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">水泥分步电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">熟料综合电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">熟料综合煤耗(kg/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                    <td class ="StaticsItemsRightTd">
                        <div class="easyui-panel" title="喀喇沁水泥" style="padding: 2px; width:406px;">
                            <table class="table">
                                <tr>
                                    <th class="StaticsItemName">总功率(万千瓦)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">余热发电功率(MW)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">煤磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">水泥磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">生料磨电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">水泥分步电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">熟料综合电耗(kW·h/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                    <th class="StaticsItemName">熟料综合煤耗(kg/t)</th>
                                    <td class="StaticsItemValue"><span id=""></span></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table> 
        </div>
    </div>

    <form id="formOverView_nxjc" runat="server">
        <div>
            <asp:HiddenField ID="HiddenField_PageName" runat="server" />
        </div>
    </form>
</body>
</html>


