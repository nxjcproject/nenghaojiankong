<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_OverView_nxjc_qtx.aspx.cs" Inherits="Monitor.Web.UI_OverView.View_OverView_nxjc_qtx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head_OverView_nxjc" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>青铜峡系统总貌</title>
    <link rel="stylesheet" type="text/css" href="/lib/ealib/themes/gray/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/lib/ealib/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/lib/extlib/themes/syExtIcon.css" />
    <link rel="stylesheet" type="text/css" href="/lib/extlib/themes/syExtCss.css" />

    <link rel="stylesheet" type="text/css" href="/css/common/NormalPage.css" />
    <link rel="stylesheet" type="text/css" href="/UI_OverView/css/page/View_OverView_nxjc_qtx.css" />

    <script type="text/javascript" src="/lib/ealib/jquery.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="/lib/ealib/jquery.easyui.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="/lib/ealib/easyui-lang-zh_CN.js" charset="utf-8"></script>

    <script type="text/javascript" src="js/page/View_OverView_nxjc_qtx.js" charset="utf-8"></script>

</head>
<body>
    <div class="easyui-layout" data-options="fit:true,border:false">
        <div data-options="region:'center',border:false,collapsible:false" style="padding-top: 10px; padding-left: 20px;">
            <table>
                <tr>
                    <td colspan="2" class="SumStaticsItemsTd">
                        <div class="easyui-panel" title="二分厂" style="padding: 2px; width: 446px;">
                            <table class="table" style="width: 440px;">
                                <tr>
                                    <th class="StaticsItemName">总功率(KWh)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc总功率(KWh)本年累计"></span></td>
                                    <th class="StaticsItemName">总用电量(年累)(KWh)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc总用电量(KWh)本年累计"></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">总用电量(日累)(KWh)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc总用电量(KWh)本日合计"></span></td>
                                    <th class="StaticsItemName">总用电量(月累)(KWh)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc总用电量(KWh)本月累计"></span></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                    <td colspan="2" class="SumStaticsItemsTd">
                        <div class="easyui-panel" title="太阳山分厂" style="padding: 2px; width: 446px;">
                            <table class="table" style="width: 440px;">
                                <tr>
                                    <th class="StaticsItemName">总功率(KWh)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_tys总功率(KWh)本年累计"></span></td>
                                    <th class="StaticsItemName">总用电量(年累)(KWh)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_tys总用电量(KWh)本年累计"></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">总用电量(日累)(KWh)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_tys总用电量(KWh)本日合计"></span></td>
                                    <th class="StaticsItemName">总用电量(月累)(KWh)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_tys总用电量(KWh)本月累计"></span></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="StaticsItemsLeftTd">
                        <div class="easyui-panel" title="熟料生产环节" style="padding: 2px; width: 366px;">
                            <table class="table">
                                <tr>
                                    <th class="StaticsItemName">项目指标</th>
                                    <th class="StaticsItemValue">本日合计</th>
                                    <th class="StaticsItemValue">本月累计</th>
                                    <th class="StaticsItemValue">本年累计</th>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">熟料用电量(KWh)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc熟料用电量(KWh)本日合计"></span></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc熟料用电量(KWh)本月累计"></span></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc熟料用电量(KWh)本年累计"></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">熟料产量(t)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc熟料产量(t)本日合计"></span></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc熟料产量(t)本月累计"></span></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc熟料产量(t)本年累计"></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">熟料综合电耗(KWh/t)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc熟料综合电耗(KWh/t)本日合计"></span></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc熟料综合电耗(KWh/t)本月累计"></span></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc熟料综合电耗(KWh/t)本年累计"></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">煤粉消耗量(t)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc煤粉消耗量(t)本日合计"></span></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc煤粉消耗量(t)本月累计"></span></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc煤粉消耗量(t)本年累计"></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">煤耗(kg/t)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc煤耗(kg/t)本日合计"></span></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc煤耗(kg/t)本月累计"></span></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc煤耗(kg/t)本年累计"></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">生料产量(t)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc生料产量(t)本日合计"></span></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc生料产量(t)本月累计"></span></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc生料产量(t)本年累计"></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">生料制备用电量(KWh)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc生料制备用电量(KWh)本日合计"></span></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc生料制备用电量(KWh)本月累计"></span></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc生料制备用电量(KWh)本年累计"></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">生料磨用电量(KWh)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc生料磨用电量(KWh)本日合计"></span></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc生料磨用电量(KWh)本月累计"></span></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc生料磨用电量(KWh)本年累计"></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">生料制备电耗(KWh/t)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc生料制备电耗(KWh/t)本日合计"></span></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc生料制备电耗(KWh/t)本月累计"></span></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc生料制备电耗(KWh/t)本年累计"></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">生料磨电耗(KWh/t)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc生料磨电耗(KWh/t)本日合计"></span></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc生料磨电耗(KWh/t)本月累计"></span></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc生料磨电耗(KWh/t)本年累计"></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">熟料制备用电量(KWh)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc熟料制备用电量(KWh)本日合计"></span></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc熟料制备用电量(KWh)本月累计"></span></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc熟料制备用电量(KWh)本年累计"></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">煤磨系统用电量(KWh)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc煤磨系统用电量(KWh)本日合计"></span></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc煤磨系统用电量(KWh)本月累计"></span></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc煤磨系统用电量(KWh)本年累计"></span></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">烧成系统用电量(KWh)</th>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc烧成系统用电量(KWh)本日合计" /></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc烧成系统用电量(KWh)本月累计" /></td>
                                    <td class="StaticsItemValue"><span id="zc_nxjc_qtx_efc烧成系统用电量(KWh)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">熟料制备电耗(KWh/t)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc熟料制备电耗(KWh/t)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc熟料制备电耗(KWh/t)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc熟料制备电耗(KWh/t)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">烧成系统电耗(KWh/t)	</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc烧成系统电耗(KWh/t)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc烧成系统电耗(KWh/t)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc烧成系统电耗(KWh/t)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">煤磨系统电耗(KWh/t)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc煤磨系统电耗(KWh/t)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc煤磨系统电耗(KWh/t)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc煤磨系统电耗(KWh/t)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">煤粉制备电耗(KWh/t)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc煤粉制备电耗(KWh/t)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc煤粉制备电耗(KWh/t)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc煤粉制备电耗(KWh/t)本年累计" /></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                    <td class="StaticsItemsLeftTd">
                        <div class="easyui-panel" title="水泥生产环节" style="padding: 2px; width: 366px;">
                            <table class="table">
                                <tr>
                                    <th class="StaticsItemName">项目指标</th>
                                    <th class="StaticsItemValue">本日合计</th>
                                    <th class="StaticsItemValue">本月累计</th>
                                    <th class="StaticsItemValue">本年累计</th>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">水泥合计用电量(KWh)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc水泥合计用电量(KWh)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc水泥合计用电量(KWh)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc水泥合计用电量(KWh)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">水泥产量(t)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc水泥产量(t)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc水泥产量(t)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc水泥产量(t)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">水泥电耗(KWh/t)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc水泥电耗(KWh/t)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc水泥电耗(KWh/t)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc水泥电耗(KWh/t)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">水泥制备用电量(KWh)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc水泥制备用电量(KWh)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc水泥制备用电量(KWh)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc水泥制备用电量(KWh)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">原料制备用电量(KWh)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc原料制备用电量(KWh)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc原料制备用电量(KWh)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc原料制备用电量(KWh)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">水泥磨用电量(KWh)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc水泥磨用电量(KWh)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc水泥磨用电量(KWh)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc水泥磨用电量(KWh)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">水泥包装用电量(KWh)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc水泥包装用电量(KWh)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc水泥包装用电量(KWh)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc水泥包装用电量(KWh)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">水泥制备电耗(KWh/t)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc水泥制备电耗(KWh/t)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc水泥制备电耗(KWh/t)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc水泥制备电耗(KWh/t)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">水泥磨电耗(KWh/t)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc水泥磨电耗(KWh/t)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc水泥磨电耗(KWh/t)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_efc水泥磨电耗(KWh/t)本年累计" /></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                    <td class="StaticsItemsRightTd">
                        <div class="easyui-panel" title="熟料生产环节" style="padding: 2px; width: 366px;">
                            <table class="table">
                                <tr>
                                    <th class="StaticsItemName">项目指标</th>
                                    <th class="StaticsItemValue">本日合计</th>
                                    <th class="StaticsItemValue">本月累计</th>
                                    <th class="StaticsItemValue">本年累计</th>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">熟料用电量(KWh)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys熟料用电量(KWh)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys熟料用电量(KWh)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys熟料用电量(KWh)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">熟料产量(t)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys熟料产量(t)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys熟料产量(t)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys熟料产量(t)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">熟料综合电耗(KWh/t)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys熟料综合电耗(KWh/t)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys熟料综合电耗(KWh/t)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys熟料综合电耗(KWh/t)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">煤粉消耗量(t)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys煤粉消耗量(t)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys煤粉消耗量(t)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys煤粉消耗量(t)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">煤耗(kg/t)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys煤耗(kg/t)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys煤耗(kg/t)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys煤耗(kg/t)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">生料产量(t)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys生料产量(t)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys生料产量(t)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys生料产量(t)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">生料制备用电量(KWh)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys生料制备用电量(KWh)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys生料制备用电量(KWh)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys生料制备用电量(KWh)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">生料磨用电量(KWh)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys生料磨用电量(KWh)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys生料磨用电量(KWh)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys生料磨用电量(KWh)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">生料制备电耗(KWh/t)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys生料制备电耗(KWh/t)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys生料制备电耗(KWh/t)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys生料制备电耗(KWh/t)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">生料磨电耗(KWh/t)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys生料磨电耗(KWh/t)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys生料磨电耗(KWh/t)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys生料磨电耗(KWh/t)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">熟料制备用电量(KWh)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys熟料制备用电量(KWh)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys熟料制备用电量(KWh)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys熟料制备用电量(KWh)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">煤磨系统用电量(KWh)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys煤磨系统用电量(KWh)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys煤磨系统用电量(KWh)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys煤磨系统用电量(KWh)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">烧成系统用电量(KWh)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys烧成系统用电量(KWh)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys烧成系统用电量(KWh)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys烧成系统用电量(KWh)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">熟料制备电耗(KWh/t)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys熟料制备电耗(KWh/t)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys熟料制备电耗(KWh/t)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys熟料制备电耗(KWh/t)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">烧成系统电耗(KWh/t)	</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys烧成系统电耗(KWh/t)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys烧成系统电耗(KWh/t)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys烧成系统电耗(KWh/t)本年累计" /></td>
                                </tr>
                                <tr>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys煤磨系统电耗(KWh/t)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys煤磨系统电耗(KWh/t)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys煤磨系统电耗(KWh/t)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">煤粉制备电耗(KWh/t)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys煤粉制备电耗(KWh/t)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys煤粉制备电耗(KWh/t)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys煤粉制备电耗(KWh/t)本年累计" /></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                    <td class="StaticsItemsRightTd">
                        <div class="easyui-panel" title="水泥生产环节" style="padding: 2px; width: 366px;">
                            <table class="table">
                                <tr>
                                    <th class="StaticsItemName">项目指标</th>
                                    <th class="StaticsItemValue">本日合计</th>
                                    <th class="StaticsItemValue">本月累计</th>
                                    <th class="StaticsItemValue">本年累计</th>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">水泥合计用电量(KWh)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys水泥合计用电量(KWh)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys水泥合计用电量(KWh)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys水泥合计用电量(KWh)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">水泥产量(t)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys水泥产量(t)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys水泥产量(t)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys水泥产量(t)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">水泥电耗(KWh/t)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys水泥电耗(KWh/t)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys水泥电耗(KWh/t)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys水泥电耗(KWh/t)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">水泥制备用电量(KWh)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys水泥制备用电量(KWh)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys水泥制备用电量(KWh)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys水泥制备用电量(KWh)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">原料制备用电量(KWh)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys原料制备用电量(KWh)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys原料制备用电量(KWh)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys原料制备用电量(KWh)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">水泥磨用电量(KWh)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys水泥磨用电量(KWh)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys水泥磨用电量(KWh)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys水泥磨用电量(KWh)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">水泥包装用电量(KWh)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys水泥包装用电量(KWh)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys水泥包装用电量(KWh)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys水泥包装用电量(KWh)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">水泥制备电耗(KWh/t)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys水泥制备电耗(KWh/t)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys水泥制备电耗(KWh/t)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys水泥制备电耗(KWh/t)本年累计" /></td>
                                </tr>
                                <tr>
                                    <th class="StaticsItemName">水泥磨电耗(KWh/t)</th>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys水泥磨电耗(KWh/t)本日合计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys水泥磨电耗(KWh/t)本月累计" /></td>
                                    <td class="StaticsItemName"><span id="zc_nxjc_qtx_tys水泥磨电耗(KWh/t)本年累计" /></td>
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

