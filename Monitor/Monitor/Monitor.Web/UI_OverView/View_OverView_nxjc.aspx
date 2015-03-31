<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_OverView_nxjc.aspx.cs" Inherits="Monitor.Web.UI_OverView.View_OverView_nxjc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head_OverView_nxjc" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>宁夏建材能源中心系统总貌</title>

    <link rel="stylesheet" type="text/css" href="/css/common/NormalPage.css" />
    <link rel="stylesheet" type="text/css" href="/UI_OverView/css/page/Style_OverView_nxjc.css" />

    <script type="text/javascript" src="/lib/ealib/jquery.min.js" charset="utf-8"></script>
    <!--[if lt IE 8 ]><script type="text/javascript" src="/js/common/json2.min.js"></script><![endif]-->

    <script type="text/javascript" src="js/page/Style_OverView_nxjc.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/page/View_OverView_nxjc.js" charset="utf-8"></script>
</head>
<body>
    <img id="GlobalBackGroundImg" src="images/page/GlobalMap.png" />
    <div id="GlobalBackGroundDiv"></div>
    <div id="GlobalDataTablesDiv">
        <table id="DataTablesContainer" class="DataTablesContainer">
            <tr>
                <td class="DataTableColSpace"></td>
                <td class="DataTableTd">
                    <table class="DataItemsTable">
                        <tr>
                            <td class="DataItemsTitleTop1"></td>
                            <td class="DataItemsTitleTop2"></td>
                            <td class="DataItemsTitleTop1"></td>
                            <td class="DataItemsTitleTop2"></td>
                        </tr>
                        <tr>
                            <td class="DataItemsTitleTd" colspan="2">
                                <div class="DataItemsTitleDiv">宁夏建材集团</div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">总功率(万千瓦)
                            </td>
                            <td class="DataValeTopTd"><span id="zc_nxjc总用电功率(KW)本月累计"></span>
                            </td>
                            <td class="DataNameTopTd">余热发电功率(MW)
                            </td>
                            <td class="DataValeTopTd"><span id="zc_nxjc余热发电功率(MW)本月累计"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">煤磨电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc煤粉制备电耗(KWh/t)本月累计"></span>
                            </td>
                            <td class="DataNameTd">水泥磨电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc水泥磨电耗(KWh/t)本月累计"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">生料磨电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc生料磨电耗(KWh/t)本月累计"></span>
                            </td>
                            <td class="DataNameTd">水泥分步电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc水泥电耗(KWh/t)本月累计"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">熟料综合电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc熟料综合电耗(KWh/t)本月累计"></span>
                            </td>
                            <td class="DataNameTd">熟料综合煤耗(kg/t) 
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc煤耗(kg/t)本月累计"></span>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="DataTableColSpace"></td>
                <td class="DataTableTd">
                    <table class="DataItemsTable">
                        <tr>
                            <td class="DataItemsTitleTop1"></td>
                            <td class="DataItemsTitleTop2"></td>
                            <td class="DataItemsTitleTop1"></td>
                            <td class="DataItemsTitleTop2"></td>
                        </tr>
                        <tr>
                            <td class="DataItemsTitleTd" colspan="2">
                                <div class="DataItemsTitleDiv">银川水泥</div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">总功率(万千瓦)
                            </td>
                            <td class="DataValeTopTd"><span id="zc_nxjc_ychc总用电功率(KW)本月累计"></span>
                            </td>
                            <td class="DataNameTopTd">余热发电功率(MW)
                            </td>
                            <td class="DataValeTopTd"><span id="zc_nxjc_ychc余热发电功率(MW)本月累计"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">煤磨电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_ychc煤粉制备电耗(KWh/t)本月累计"></span>
                            </td>
                            <td class="DataNameTd">水泥磨电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_ychc水泥磨电耗(KWh/t)本月累计"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">生料磨电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_ychc生料磨电耗(KWh/t)本月累计"></span>
                            </td>
                            <td class="DataNameTd">水泥分步电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_ychc水泥电耗(KWh/t)本月累计"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">熟料综合电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_ychc熟料综合电耗(KWh/t)本月累计"></span>
                            </td>
                            <td class="DataNameTd">熟料综合煤耗(kg/t) 
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_ychc煤耗(kg/t)本月累计"></span>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="DataTableColSpace"></td>
                <td class="DataTableTd">
                    <table class="DataItemsTable">
                        <tr>
                            <td class="DataItemsTitleTop1"></td>
                            <td class="DataItemsTitleTop2"></td>
                            <td class="DataItemsTitleTop1"></td>
                            <td class="DataItemsTitleTop2"></td>
                        </tr>
                        <tr>
                            <td class="DataItemsTitleTd" colspan="2">
                                <div class="DataItemsTitleDiv">青铜峡水泥</div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">总功率(万千瓦)
                            </td>
                            <td class="DataValeTopTd"><span id="zc_nxjc_qtx总用电功率(KW)本月累计"></span>
                            </td>
                            <td class="DataNameTopTd">余热发电功率(MW)
                            </td>
                            <td class="DataValeTopTd"><span id="zc_nxjc_qtx余热发电功率(MW)本月累计"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">煤磨电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_qtx煤粉制备电耗(KWh/t)本月累计"></span>
                            </td>
                            <td class="DataNameTd">水泥磨电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_qtx水泥磨电耗(KWh/t)本月累计"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">生料磨电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_qtx生料磨电耗(KWh/t)本月累计"></span>
                            </td>
                            <td class="DataNameTd">水泥分步电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_qtx水泥电耗(KWh/t)本月累计"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">熟料综合电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_qtx熟料综合电耗(KWh/t)本月累计"></span>
                            </td>
                            <td class="DataNameTd">熟料综合煤耗(kg/t) 
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_qtx煤耗(kg/t)本月累计"></span>
                            </td>
                        </tr>
                    </table>
                </td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td class="DataTableTd">
                    <table class="DataItemsTable">
                        <tr>
                            <td class="DataItemsTitleTop1"></td>
                            <td class="DataItemsTitleTop2"></td>
                            <td class="DataItemsTitleTop1"></td>
                            <td class="DataItemsTitleTop2"></td>
                        </tr>
                        <tr>
                            <td class="DataItemsTitleTd" colspan="2">
                                <div class="DataItemsTitleDiv">石嘴山水泥</div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">总功率(万千瓦)
                            </td>
                            <td class="DataValeTopTd"></td>
                            <td class="DataNameTopTd">余热发电功率(MW)
                            </td>
                            <td class="DataValeTopTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">煤磨电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">水泥磨电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">生料磨电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">水泥分步电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">熟料综合电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">熟料综合煤耗(kg/t) 
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                    </table>
                </td>
                <td></td>
                <td class="DataTableTd">
                    <table class="DataItemsTable">
                        <tr>
                            <td class="DataItemsTitleTop1"></td>
                            <td class="DataItemsTitleTop2"></td>
                            <td class="DataItemsTitleTop1"></td>
                            <td class="DataItemsTitleTop2"></td>
                        </tr>
                        <tr>
                            <td class="DataItemsTitleTd" colspan="2">
                                <div class="DataItemsTitleDiv">中宁水泥</div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">总功率(万千瓦)
                            </td>
                            <td class="DataValeTopTd"></td>
                            <td class="DataNameTopTd">余热发电功率(MW)
                            </td>
                            <td class="DataValeTopTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">煤磨电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">水泥磨电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">生料磨电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">水泥分步电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">熟料综合电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">熟料综合煤耗(kg/t) 
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                    </table>
                </td>
                <td></td>
                <td class="DataTableTd">
                    <table class="DataItemsTable">
                        <tr>
                            <td class="DataItemsTitleTop1"></td>
                            <td class="DataItemsTitleTop2"></td>
                            <td class="DataItemsTitleTop1"></td>
                            <td class="DataItemsTitleTop2"></td>
                        </tr>
                        <tr>
                            <td class="DataItemsTitleTd" colspan="2">
                                <div class="DataItemsTitleDiv">六盘山水泥</div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">总功率(万千瓦)
                            </td>
                            <td class="DataValeTopTd"></td>
                            <td class="DataNameTopTd">余热发电功率(MW)
                            </td>
                            <td class="DataValeTopTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">煤磨电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">水泥磨电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">生料磨电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">水泥分步电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">熟料综合电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">熟料综合煤耗(kg/t) 
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                    </table>
                </td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td class="DataTableTd">
                    <table class="DataItemsTable">
                        <tr>
                            <td class="DataItemsTitleTop1"></td>
                            <td class="DataItemsTitleTop2"></td>
                            <td class="DataItemsTitleTop1"></td>
                            <td class="DataItemsTitleTop2"></td>
                        </tr>
                        <tr>
                            <td class="DataItemsTitleTd" colspan="2">
                                <div class="DataItemsTitleDiv">白银水泥</div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">总功率(万千瓦)
                            </td>
                            <td class="DataValeTopTd"><span id="zc_nxjc_byc总用电功率(KW)本月累计"></span>
                            </td>
                            <td class="DataNameTopTd">余热发电功率(MW)
                            </td>
                            <td class="DataValeTopTd"><span id="zc_nxjc_byc余热发电功率(MW)本月累计"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">煤磨电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_byc煤粉制备电耗(KWh/t)本月累计"></span>
                            </td>
                            <td class="DataNameTd">水泥磨电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_byc水泥磨电耗(KWh/t)本月累计"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">生料磨电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_byc生料磨电耗(KWh/t)本月累计"></span>
                            </td>
                            <td class="DataNameTd">水泥分步电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_byc水泥电耗(KWh/t)本月累计"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">熟料综合电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_byc熟料综合电耗(KWh/t)本月累计"></span>
                            </td>
                            <td class="DataNameTd">熟料综合煤耗(kg/t) 
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_byc煤耗(kg/t)本月累计"></span>
                            </td>
                        </tr>
                    </table>
                </td>
                <td></td>
                <td class="DataTableTd">
                    <table class="DataItemsTable">
                        <tr>
                            <td class="DataItemsTitleTop1"></td>
                            <td class="DataItemsTitleTop2"></td>
                            <td class="DataItemsTitleTop1"></td>
                            <td class="DataItemsTitleTop2"></td>
                        </tr>
                        <tr>
                            <td class="DataItemsTitleTd" colspan="2">
                                <div class="DataItemsTitleDiv">天水水泥</div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">总功率(万千瓦)
                            </td>
                            <td class="DataValeTopTd"></td>
                            <td class="DataNameTopTd">余热发电功率(MW)
                            </td>
                            <td class="DataValeTopTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">煤磨电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">水泥磨电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">生料磨电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">水泥分步电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">熟料综合电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">熟料综合煤耗(kg/t) 
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                    </table>
                </td>
                <td></td>
                <td class="DataTableTd"></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td class="DataTableTd">
                    <table class="DataItemsTable">
                        <tr>
                            <td class="DataItemsTitleTop1"></td>
                            <td class="DataItemsTitleTop2"></td>
                            <td class="DataItemsTitleTop1"></td>
                            <td class="DataItemsTitleTop2"></td>
                        </tr>
                        <tr>
                            <td class="DataItemsTitleTd" colspan="2">
                                <div class="DataItemsTitleDiv">乌海赛马</div>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">总功率(万千瓦)
                            </td>
                            <td class="DataValeTopTd"></td>
                            <td class="DataNameTopTd">余热发电功率(MW)
                            </td>
                            <td class="DataValeTopTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">煤磨电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">水泥磨电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">生料磨电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">水泥分步电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">熟料综合电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">熟料综合煤耗(kg/t) 
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                    </table>
                </td>
                <td></td>
                <td class="DataTableTd">
                    <table class="DataItemsTable">
                        <tr>
                            <td class="DataItemsTitleTop1"></td>
                            <td class="DataItemsTitleTop2"></td>
                            <td class="DataItemsTitleTop1"></td>
                            <td class="DataItemsTitleTop2"></td>
                        </tr>
                        <tr>
                            <td class="DataItemsTitleTd" colspan="2">
                                <div class="DataItemsTitleDiv">乌海西水</div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">总功率(万千瓦)
                            </td>
                            <td class="DataValeTopTd"></td>
                            <td class="DataNameTopTd">余热发电功率(MW)
                            </td>
                            <td class="DataValeTopTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">煤磨电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">水泥磨电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">生料磨电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">水泥分步电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">熟料综合电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">熟料综合煤耗(kg/t) 
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                    </table>
                </td>
                <td></td>
                <td class="DataTableTd">
                    <table class="DataItemsTable">
                        <tr>
                            <td class="DataItemsTitleTop1"></td>
                            <td class="DataItemsTitleTop2"></td>
                            <td class="DataItemsTitleTop1"></td>
                            <td class="DataItemsTitleTop2"></td>
                        </tr>
                        <tr>
                            <td class="DataItemsTitleTd" colspan="2">
                                <div class="DataItemsTitleDiv">喀喇沁水泥</div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">总功率(万千瓦)
                            </td>
                            <td class="DataValeTopTd"></td>
                            <td class="DataNameTopTd">余热发电功率(MW)
                            </td>
                            <td class="DataValeTopTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">煤磨电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">水泥磨电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">生料磨电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">水泥分步电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">熟料综合电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">熟料综合煤耗(kg/t) 
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                    </table>
                </td>
                <td></td>
            </tr>
        </table>
    </div>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
