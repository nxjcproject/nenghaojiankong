﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_OverView_zhuzhou.aspx.cs" Inherits="Monitor.Web.UI_OverView.View_OverView_zhuzhou" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head_OverView_nxjc" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>株洲水泥能源中心系统总貌</title>

    <link rel="stylesheet" type="text/css" href="/css/common/NormalPage.css" />
    <link rel="stylesheet" type="text/css" href="/UI_OverView/css/page/Style_OverView_nxjc.css" />

    <script type="text/javascript" src="/lib/ealib/jquery.min.js" charset="utf-8"></script>
    <!--[if lt IE 8 ]><script type="text/javascript" src="/js/common/json2.min.js"></script><![endif]-->

    <script type="text/javascript" src="js/page/Style_OverView_zcshn.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/page/View_OverView_zcshn.js" charset="utf-8"></script>
    <script src="js/common/OverViewMonitor.js"></script>
</head>
<body>
    <img id="GlobalBackGroundImg" src="images/page/GlobalMap_zhuhzou.png" />
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
                                <div class="DataItemsTitleDiv">株洲水泥</div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">生料分布电耗(kW·h/t)
                            </td>
                            <td class="DataValeTopTd">
                                <span id="zc_zcshn>rawMaterialsPreparation_ElectricityConsumption>ProcessConsumption"></span>
                            </td>
                            <td class="DataNameTopTd">熟料分布电耗(kW·h/t)
                            </td>
                            <td class="DataValeTopTd">
                                <span id="zc_zcshn>clinkerPreparation_ElectricityConsumption>ProcessConsumption"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">水泥分布电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd">
                                <span id="zc_zcshn>cementPreparation_ElectricityConsumption>ProcessConsumption"></span>
                            </td>
                            <td class="DataNameTd">吨熟料发电量(kW·h/t)
                            </td>
                            <td class="DataValueTd">
                                <span id="zc_zcshn>clinkerElectricityGeneration_ElectricityConsumption>ProcessConsumption"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">熟料综合电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd">
                                <span id="zc_zcshn>clinker_ElectricityConsumption_Comprehensive>Comprehensive"></span>
                            </td>
                            <td class="DataNameTd">熟料综合煤耗(kg/t)
                            </td>
                            <td class="DataValueTd">
                                <span id="zc_zcshn>clinker_CoalConsumption_Comprehensive>Comprehensive"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">水泥综合电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd">
                                <span id="zc_zcshn>cementmill_ElectricityConsumption_Comprehensive>Comprehensive"></span>
                            </td>
                            <td class="DataNameTd">水泥综合煤耗(kg/t) 
                            </td>
                            <td class="DataValueTd">
                                <span id="zc_zcshn>cementmill_CoalConsumption_Comprehensive>Comprehensive"></span>
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
                                <div class="DataItemsTitleDiv"></div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id="zc_zcshn_ychc总用电功率(KW)本月累计"></span>
                            </td>
                            <td class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id="zc_zcshn_ychc余热发电功率(MW)本月累计"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id="zc_zcshn_ychc煤粉制备电耗(KWh/t)本月累计"></span>
                            </td>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id="zc_zcshn_ychc水泥磨电耗(KWh/t)本月累计"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id="zc_zcshn_ychc生料磨电耗(KWh/t)本月累计"></span>
                            </td>
                            <td class="DataNameTd"> 
                            </td>
                            <td class="DataValueTd"><span id="zc_zcshn_ychc水泥电耗(KWh/t)本月累计"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id="zc_zcshn_ychc熟料综合电耗(KWh/t)本月累计"></span>
                            </td>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id="zc_zcshn_ychc煤耗(kg/t)本月累计"></span>
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
                                <div class="DataItemsTitleDiv"></div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id="zc_zcshn_qtx总用电功率(KW)本月累计"></span>
                            </td>
                            <td class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id="zc_zcshn_qtx余热发电功率(MW)本月累计"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id="zc_zcshn_qtx煤粉制备电耗(KWh/t)本月累计"></span>
                            </td>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id="zc_zcshn_qtx水泥磨电耗(KWh/t)本月累计"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id="zc_zcshn_qtx生料磨电耗(KWh/t)本月累计"></span>
                            </td>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id="zc_zcshn_qtx水泥电耗(KWh/t)本月累计"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id="zc_zcshn_qtx熟料综合电耗(KWh/t)本月累计"></span>
                            </td>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id="zc_zcshn_qtx煤耗(kg/t)本月累计"></span>
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
                                <div class="DataItemsTitleDiv"></div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"></td>
                            <td class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">
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
                                <div class="DataItemsTitleDiv"></div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"></td>
                            <td class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">
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
                                <div class="DataItemsTitleDiv"></div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"></td>
                            <td class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">
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
                                <div class="DataItemsTitleDiv"></div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id="zc_zcshn_byc总用电功率(KW)本月累计"></span>
                            </td>
                            <td class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id="zc_zcshn_byc余热发电功率(MW)本月累计"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id="zc_zcshn_byc煤粉制备电耗(KWh/t)本月累计"></span>
                            </td>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id="zc_zcshn_byc水泥磨电耗(KWh/t)本月累计"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id="zc_zcshn_byc生料磨电耗(KWh/t)本月累计"></span>
                            </td>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id="zc_zcshn_byc水泥电耗(KWh/t)本月累计"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id="zc_zcshn_byc熟料综合电耗(KWh/t)本月累计"></span>
                            </td>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id="zc_zcshn_byc煤耗(kg/t)本月累计"></span>
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
                                <div class="DataItemsTitleDiv"></div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"></td>
                            <td class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">
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
                                <div class="DataItemsTitleDiv"></div>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"></td>
                            <td class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">
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
                                <div class="DataItemsTitleDiv"></div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"></td>
                            <td class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">
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
                                <div class="DataItemsTitleDiv"></div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"></td>
                            <td class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">
                            </td>
                            <td class="DataValueTd"></td>
                        </tr>
                        <tr>
                            <td class="DataNameTd"> 
                            </td>
                            <td class="DataValueTd"></td>
                            <td class="DataNameTd">
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