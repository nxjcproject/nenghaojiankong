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
    <script src="js/common/OverViewMonitor.js"></script>
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
                            <td class="DataNameTopTd">生料分布电耗(kW·h/t)
                            </td>
                            <td class="DataValeTopTd">
                                <span id="zc_nxjc>rawMaterialsPreparation_ElectricityConsumption>ProcessConsumption"></span>
                            </td>
                            <td class="DataNameTopTd">熟料分布电耗(kW·h/t)
                            </td>
                            <td class="DataValeTopTd">
                                <span id="zc_nxjc>clinkerPreparation_ElectricityConsumption>ProcessConsumption"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">水泥分布电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd">
                                <span id="zc_nxjc>cementPreparation_ElectricityConsumption>ProcessConsumption"></span>
                            </td>
                            <td class="DataNameTd">吨熟料发电量(kW·h/t)
                            </td>
                            <td class="DataValueTd">
                                <span id="zc_nxjc>clinkerElectricityGeneration_ElectricityConsumption>ProcessConsumption"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">熟料综合电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd">
                                <span id="zc_nxjc>clinker_ElectricityConsumption_Comprehensive>Comprehensive"></span>
                            </td>
                            <td class="DataNameTd">熟料综合煤耗(kg/t)
                            </td>
                            <td class="DataValueTd">
                                <span id="zc_nxjc>clinker_CoalConsumption_Comprehensive>Comprehensive"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">水泥综合电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd">
                                <span id="zc_nxjc>cementmill_ElectricityConsumption_Comprehensive>Comprehensive"></span>
                            </td>
                            <td class="DataNameTd">水泥综合煤耗(kg/t) 
                            </td>
                            <td class="DataValueTd">
                                <span id="zc_nxjc>cementmill_CoalConsumption_Comprehensive>Comprehensive"></span>
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
                            <td class="DataNameTopTd">生料分布电耗(kW·h/t)
                            </td>
                            <td class="DataValeTopTd"><span id="zc_nxjc_ychc>rawMaterialsPreparation_ElectricityConsumption>ProcessConsumption"></span>
                            </td>
                            <td class="DataNameTopTd">熟料分布电耗(kW·h/t)
                            </td>
                            <td class="DataValeTopTd"><span id="zc_nxjc_ychc>clinkerPreparation_ElectricityConsumption>ProcessConsumption"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">水泥分布电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_ychc>cementPreparation_ElectricityConsumption>ProcessConsumption"></span>
                            </td>
                            <td class="DataNameTd">吨熟料发电量(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_ychc>clinkerElectricityGeneration_ElectricityConsumption>ProcessConsumption"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">熟料综合电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_ychc>clinker_ElectricityConsumption_Comprehensive>Comprehensive"></span>
                            </td>
                            <td class="DataNameTd">熟料综合煤耗(kg/t)
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_ychc>clinker_CoalConsumption_Comprehensive>Comprehensive"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">水泥综合电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_ychc>cementmill_ElectricityConsumption_Comprehensive>Comprehensive"></span>
                            </td>
                            <td class="DataNameTd">水泥综合煤耗(kg/t) 
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_ychc>cementmill_CoalConsumption_Comprehensive>Comprehensive"></span>
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
                            <td class="DataNameTopTd">生料分布电耗(kW·h/t)
                            </td>
                            <td class="DataValeTopTd"><span id="zc_nxjc_qtx>rawMaterialsPreparation_ElectricityConsumption>ProcessConsumption"></span>
                            </td>
                            <td class="DataNameTopTd">熟料分布电耗(kW·h/t)
                            </td>
                            <td class="DataValeTopTd"><span id="zc_nxjc_qtx>clinkerPreparation_ElectricityConsumption>ProcessConsumption"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">水泥分布电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_qtx>cementPreparation_ElectricityConsumption>ProcessConsumption"></span>
                            </td>
                            <td class="DataNameTd">吨熟料发电量(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_qtx>clinkerElectricityGeneration_ElectricityConsumption>ProcessConsumption"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">熟料综合电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_qtx>clinker_ElectricityConsumption_Comprehensive>Comprehensive"></span>
                            </td>
                            <td class="DataNameTd">熟料综合煤耗(kg/t)
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_qtx>clinker_CoalConsumption_Comprehensive>Comprehensive"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">水泥综合电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_qtx>cementmill_ElectricityConsumption_Comprehensive>Comprehensive"></span>
                            </td>
                            <td class="DataNameTd">水泥综合煤耗(kg/t) 
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_qtx>cementmill_CoalConsumption_Comprehensive>Comprehensive"></span>
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
                            <td class="DataNameTopTd">生料分布电耗(kW·h/t)
                            </td>
                            <td class="DataValeTopTd"><span id="Span17"></span>
                            </td>
                            <td class="DataNameTopTd">熟料分布电耗(kW·h/t)
                            </td>
                            <td class="DataValeTopTd"><span id="Span18"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">水泥分布电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="Span19"></span>
                            </td>
                            <td class="DataNameTd">吨熟料发电量(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="Span20"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">熟料综合电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="Span21"></span>
                            </td>
                            <td class="DataNameTd">熟料综合煤耗(kg/t)
                            </td>
                            <td class="DataValueTd"><span id="Span22"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">水泥综合电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"><span id="Span23"></span>
                            </td>
                            <td class="DataNameTd">水泥综合煤耗(kg/t) 
                            </td>
                            <td class="DataValueTd"><span id="Span24"></span>
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
                                <div class="DataItemsTitleDiv">中宁水泥</div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">生料分布电耗(kW·h/t)
                            </td>
                            <td class="DataValeTopTd"><span id="Span25"></span>
                            </td>
                            <td class="DataNameTopTd">熟料分布电耗(kW·h/t)
                            </td>
                            <td class="DataValeTopTd"><span id="Span26"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">水泥分布电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="Span27"></span>
                            </td>
                            <td class="DataNameTd">吨熟料发电量(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="Span28"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">熟料综合电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="Span29"></span>
                            </td>
                            <td class="DataNameTd">熟料综合煤耗(kg/t)
                            </td>
                            <td class="DataValueTd"><span id="Span30"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">水泥综合电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"><span id="Span31"></span>
                            </td>
                            <td class="DataNameTd">水泥综合煤耗(kg/t) 
                            </td>
                            <td class="DataValueTd"><span id="Span32"></span>
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
                                <div class="DataItemsTitleDiv">六盘山水泥</div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">生料分布电耗(kW·h/t)
                            </td>
                            <td class="DataValeTopTd"><span id="Span33"></span>
                            </td>
                            <td class="DataNameTopTd">熟料分布电耗(kW·h/t)
                            </td>
                            <td class="DataValeTopTd"><span id="Span34"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">水泥分布电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="Span35"></span>
                            </td>
                            <td class="DataNameTd">吨熟料发电量(kW·h)
                            </td>
                            <td class="DataValueTd"><span id="Span36"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">熟料综合电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="Span37"></span>
                            </td>
                            <td class="DataNameTd">熟料综合煤耗(kg/t)
                            </td>
                            <td class="DataValueTd"><span id="Span38"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">水泥综合电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"><span id="Span39"></span>
                            </td>
                            <td class="DataNameTd">水泥综合煤耗(kg/t) 
                            </td>
                            <td class="DataValueTd"><span id="Span40"></span>
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
                                <div class="DataItemsTitleDiv">白银水泥</div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">生料分布电耗(kW·h/t)
                            </td>
                            <td class="DataValeTopTd"><span id="zc_nxjc_byc>rawMaterialsPreparation_ElectricityConsumption>ProcessConsumption"></span>
                            </td>
                            <td class="DataNameTopTd">熟料分布电耗(kW·h/t)
                            </td>
                            <td class="DataValeTopTd"><span id="zc_nxjc_byc>clinkerPreparation_ElectricityConsumption>ProcessConsumption"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">水泥分布电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_byc>cementPreparation_ElectricityConsumption>ProcessConsumption"></span>
                            </td>
                            <td class="DataNameTd">吨熟料发电量(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_byc>clinkerElectricityGeneration_ElectricityConsumption>ProcessConsumption"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">熟料综合电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_byc>clinker_ElectricityConsumption_Comprehensive>Comprehensive"></span>
                            </td>
                            <td class="DataNameTd">熟料综合煤耗(kg/t)
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_byc>clinker_CoalConsumption_Comprehensive>Comprehensive"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">水泥综合电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_byc>cementmill_ElectricityConsumption_Comprehensive>Comprehensive"></span>
                            </td>
                            <td class="DataNameTd">水泥综合煤耗(kg/t) 
                            </td>
                            <td class="DataValueTd"><span id="zc_nxjc_byc>cementmill_CoalConsumption_Comprehensive>Comprehensive"></span>
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
                            <td class="DataNameTopTd">生料分布电耗(kW·h/t)
                            </td>
                            <td class="DataValeTopTd"><span id="Span49"></span>
                            </td>
                            <td class="DataNameTopTd">熟料分布电耗(kW·h/t)
                            </td>
                            <td class="DataValeTopTd"><span id="Span50"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">水泥分布电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="Span51"></span>
                            </td>
                            <td class="DataNameTd">吨熟料发电量(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="Span52"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">熟料综合电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="Span53"></span>
                            </td>
                            <td class="DataNameTd">熟料综合煤耗(kg/t)
                            </td>
                            <td class="DataValueTd"><span id="Span54"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">水泥综合电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"><span id="Span55"></span>
                            </td>
                            <td class="DataNameTd">水泥综合煤耗(kg/t) 
                            </td>
                            <td class="DataValueTd"><span id="Span56"></span>
                            </td>
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
                            <td class="DataNameTopTd">生料分布电耗(kW·h/t)
                            </td>
                            <td class="DataValeTopTd"><span id="Span57"></span>
                            </td>
                            <td class="DataNameTopTd">熟料分布电耗(kW·h/t)
                            </td>
                            <td class="DataValeTopTd"><span id="Span58"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">水泥分布电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="Span59"></span>
                            </td>
                            <td class="DataNameTd">吨熟料发电量(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="Span60"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">熟料综合电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="Span61"></span>
                            </td>
                            <td class="DataNameTd">熟料综合煤耗(kg/t)
                            </td>
                            <td class="DataValueTd"><span id="Span62"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">水泥综合电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"><span id="Span63"></span>
                            </td>
                            <td class="DataNameTd">水泥综合煤耗(kg/t) 
                            </td>
                            <td class="DataValueTd"><span id="Span64"></span>
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
                                <div class="DataItemsTitleDiv">乌海西水</div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">生料分布电耗(kW·h/t)
                            </td>
                            <td class="DataValeTopTd"><span id="Span65"></span>
                            </td>
                            <td class="DataNameTopTd">熟料分布电耗(kW·h/t)
                            </td>
                            <td class="DataValeTopTd"><span id="Span66"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">水泥分布电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="Span67"></span>
                            </td>
                            <td class="DataNameTd">吨熟料发电量(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="Span68"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">熟料综合电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="Span69"></span>
                            </td>
                            <td class="DataNameTd">熟料综合煤耗(kg/t)
                            </td>
                            <td class="DataValueTd"><span id="Span70"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">水泥综合电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"><span id="Span71"></span>
                            </td>
                            <td class="DataNameTd">水泥综合煤耗(kg/t) 
                            </td>
                            <td class="DataValueTd"><span id="Span72"></span>
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
                                <div class="DataItemsTitleDiv">喀喇沁水泥</div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="DataNameTopTd">生料分布电耗(kW·h/t)
                            </td>
                            <td class="DataValeTopTd"><span id="Span73"></span>
                            </td>
                            <td class="DataNameTopTd">熟料分布电耗(kW·h/t)
                            </td>
                            <td class="DataValeTopTd"><span id="Span74"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">水泥分布电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="Span75"></span>
                            </td>
                            <td class="DataNameTd">吨熟料发电量(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="Span76"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">熟料综合电耗(kW·h/t)
                            </td>
                            <td class="DataValueTd"><span id="Span77"></span>
                            </td>
                            <td class="DataNameTd">熟料综合煤耗(kg/t)
                            </td>
                            <td class="DataValueTd"><span id="Span78"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataNameTd">水泥综合电耗(kW·h/t) 
                            </td>
                            <td class="DataValueTd"><span id="Span79"></span>
                            </td>
                            <td class="DataNameTd">水泥综合煤耗(kg/t) 
                            </td>
                            <td class="DataValueTd"><span id="Span80"></span>
                            </td>
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
