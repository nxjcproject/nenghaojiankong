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
    <img id ="GlobalBackGroundDivImg" src ="images/page/BackGroundDiv.png" />
    <img id ="GlobalBackGroundImg" src ="images/page/BackGroundMap.png" />
    <%--第一个显示页面，银川--%>
    <div id ="GlobalLeftDiv1" class ="GlobalLeftDiv">
        <table class ="FrameTable" >
            <tr>
                <td class ="FloatDivBorderLeftTop" >
                </td>
                <td class ="FloatDivBorderTop" style ="width: 270px;">
                </td>
                <td class = "FloatDataDivTitle">
                数据汇总
                </td>
                <td class ="FloatDivBorderTop" style ="width: 270px;">
                </td>
                <td  class ="FloatDivBorderRightTop">
                </td>
            </tr>
            <tr>
                <td id ="DataTableMainHeightCell1" class ="FloatDivBorderLeft" >
                </td>
                <td class ="DataTablesContainer" colspan ="3">
                    <table>
                        <tr>
                            <td class ="DataTablesRowsSpacing1"></td>
                            <td class ="DataTablesRowsSpacing2"></td>
                            <td class ="DataTablesRowsSpacing1"></td>
                        </tr>
                        <tr>
                            <td class ="DataTablesRowsSpacing1"></td>
                            <td class ="DataTablesRowsSpacing2"></td>
                            <td class ="DataTablesRowsSpacing1"></td>
                        </tr>
                        <tr>
                            <td class="DataTableContainer">
                                <table class ="DataItemsTable">
                                    <tr>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataItemsTitleTd" colspan ="2">
                                            <div class ="DataItemsTitleDiv">宁夏建材集团</div>
                                            
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTopTd">总功率(万千瓦)
                                        </td>
                                        <td class ="DataValeTopTd"><span id="zc_nxjc总用电功率(KW)本月累计"></span>
                                        </td>
                                        <td class ="DataNameTopTd">余热发电功率(MW)
                                        </td>
                                        <td class ="DataValeTopTd"><span id="zc_nxjc余热发电功率(MW)本月累计"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">煤磨电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd"><span id="zc_nxjc煤粉制备电耗(KWh/t)本月累计"></span>
                                        </td>
                                        <td class ="DataNameTd">水泥磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd"><span id="zc_nxjc水泥磨电耗(KWh/t)本月累计"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">生料磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd"><span id="zc_nxjc生料磨电耗(KWh/t)本月累计"></span>
                                        </td>
                                        <td class ="DataNameTd">水泥分步电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd"><span id="zc_nxjc水泥电耗(KWh/t)本月累计"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">熟料综合电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd"><span id="zc_nxjc熟料综合电耗(KWh/t)本月累计"></span>
                                        </td>
                                        <td class ="DataNameTd">熟料综合煤耗(kg/t) 
                                        </td>
                                        <td class ="DataValueTd"><span id="zc_nxjc煤耗(kg/t)本月累计"></span>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td class="DataTableColsSpacing"></td>
                            <td class="DataTableContainer">
                                <table class ="DataItemsTable">
                                    <tr>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataItemsTitleTd" colspan ="2">
                                            <div class ="DataItemsTitleDiv">银川水泥</div>
                                            
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTopTd">总功率(万千瓦)
                                        </td>
                                        <td class ="DataValeTopTd"><span id="zc_nxjc_ychc总用电功率(KW)本月累计"></span>
                                        </td>
                                        <td class ="DataNameTopTd">余热发电功率(MW)
                                        </td>
                                        <td class ="DataValeTopTd"><span id="zc_nxjc_ychc余热发电功率(MW)本月累计"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">煤磨电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd"><span id="zc_nxjc_ychc煤粉制备电耗(KWh/t)本月累计"></span>
                                        </td>
                                        <td class ="DataNameTd">水泥磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd"><span id="zc_nxjc_ychc水泥磨电耗(KWh/t)本月累计"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">生料磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd"><span id="zc_nxjc_ychc生料磨电耗(KWh/t)本月累计"></span>
                                        </td>
                                        <td class ="DataNameTd">水泥分步电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd"><span id="zc_nxjc_ychc水泥电耗(KWh/t)本月累计"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">熟料综合电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd"><span id="zc_nxjc_ychc熟料综合电耗(KWh/t)本月累计"></span>
                                        </td>
                                        <td class ="DataNameTd">熟料综合煤耗(kg/t) 
                                        </td>
                                        <td class ="DataValueTd"><span id="zc_nxjc_ychc煤耗(kg/t)本月累计"></span>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class ="DataTablesRowsSpacing1"></td>
                            <td class ="DataTablesRowsSpacing2"></td>
                            <td class ="DataTablesRowsSpacing1"></td>
                        </tr>
                        <tr>
                            <td class="DataTableContainer">
                                <table class ="DataItemsTable">
                                    <tr>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataItemsTitleTd" colspan ="2">
                                            <div class ="DataItemsTitleDiv">青铜峡水泥</div>
                                            
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTopTd">总功率(万千瓦)
                                        </td>
                                        <td class ="DataValeTopTd"><span id="zc_nxjc_qtx总用电功率(KW)本月累计"></span>
                                        </td>
                                        <td class ="DataNameTopTd">余热发电功率(MW)
                                        </td>
                                        <td class ="DataValeTopTd"><span id="zc_nxjc_qtx余热发电功率(MW)本月累计"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">煤磨电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd"><span id="zc_nxjc_qtx煤粉制备电耗(KWh/t)本月累计"></span>
                                        </td>
                                        <td class ="DataNameTd">水泥磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd"><span id="zc_nxjc_qtx水泥磨电耗(KWh/t)本月累计"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">生料磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd"><span id="zc_nxjc_qtx生料磨电耗(KWh/t)本月累计"></span>
                                        </td>
                                        <td class ="DataNameTd">水泥分步电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd"><span id="zc_nxjc_qtx水泥电耗(KWh/t)本月累计"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">熟料综合电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd"><span id="zc_nxjc_qtx熟料综合电耗(KWh/t)本月累计"></span>
                                        </td>
                                        <td class ="DataNameTd">熟料综合煤耗(kg/t) 
                                        </td>
                                        <td class ="DataValueTd"><span id="zc_nxjc_qtx煤耗(kg/t)本月累计"></span>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td  class="DataTableColsSpacing"></td>
                            <td class="DataTableContainer">
                                <table class ="DataItemsTable">
                                    <tr>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataItemsTitleTd" colspan ="2">
                                            <div class ="DataItemsTitleDiv">石嘴山水泥</div>
                                            
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTopTd">总功率(万千瓦)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                        <td class ="DataNameTopTd">余热发电功率(MW)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">煤磨电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">生料磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥分步电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">熟料综合电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">熟料综合煤耗(kg/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class ="DataTablesRowsSpacing1"></td>
                            <td class ="DataTablesRowsSpacing2"></td>
                            <td class ="DataTablesRowsSpacing1"></td>
                        </tr>
                        <tr>
                            <td class="DataTableContainer">
                                <table class ="DataItemsTable">
                                    <tr>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataItemsTitleTd" colspan ="2">
                                            <div class ="DataItemsTitleDiv">中宁水泥</div>
                                            
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTopTd">总功率(万千瓦)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                        <td class ="DataNameTopTd">余热发电功率(MW)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">煤磨电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">生料磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥分步电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">熟料综合电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">熟料综合煤耗(kg/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td  class="DataTableColsSpacing"></td>
                            <td class="DataTableContainer">
                                <table class ="DataItemsTable">
                                    <tr>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataItemsTitleTd" colspan ="2">
                                            <div class ="DataItemsTitleDiv">六盘山水泥</div>
                                            
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTopTd">总功率(万千瓦)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                        <td class ="DataNameTopTd">余热发电功率(MW)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">煤磨电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">生料磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥分步电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">熟料综合电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">熟料综合煤耗(kg/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class ="FloatDivBorderRight">
                </td>
            </tr>
            <tr>
                <td class ="FloatDivBorderLeftBottom">
                </td>
                <td class ="FloatDivBorderBottom" >
                </td>
                <td class ="FloatDivBorderBottom" >
                </td>
                <td class ="FloatDivBorderBottom" >
                </td>
                <td class ="FloatDivBorderRightBottom" >
                </td>
            </tr>
        </table>
    </div>
    <div id ="GlobalRightDiv1" class ="GlobalRightDiv">
        <table class ="FrameTable" >
            <tr>
                <td class="FloatDivBorderLeftTop" >
                </td>
                <td class="FloatDivBorderTop"  style ="width:70px;">
                </td>
                <td class="FloatMapDivTitle">
                辅助信息
                </td>
                <td class="FloatDivBorderTop" style ="width:70px;">
                </td>
                <td class ="FloatDivBorderRightTop">
                </td>
            </tr>
            <tr>
                <td id ="MapTableMainHeightCell1"  class="FloatDivBorderLeft">
                </td>
                <td class ="RegionalMapContainer"  colspan ="3">
                    <div class ="RegionalYinChuanMapDiv"></div>
                    <table class ="RegionalMapDescription">
                        <tr>
                            <td>
                                宁夏建材集团总部位于宁夏回族自治区银川市，主要经营水泥制造、销售，水泥制品、水泥熟料的制造与销售，混凝土骨料的制造与销售等。现拥有10家水泥生产企业、7家商混企业，分布在宁夏、甘肃、内蒙古等省区，年水泥产能2100万吨，商品混凝土年产能1020万方。
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="FloatDivBorderRight">
                </td>
            </tr>
            <tr>
                <td class="FloatDivBorderLeftBottom">
                </td>
                <td  class="FloatDivBorderBottom">
                </td>
                <td class="FloatDivBorderBottom">
                </td>
                <td class="FloatDivBorderBottom">
                </td>
                <td class="FloatDivBorderRightBottom">
                </td>
            </tr>
        </table>
        <table class ="FrameTable" style ="margin-top:10px;" >
            <tr>
                <td class="LittleFloatDivBorderLeftTop">
                </td>
                <td class="LittleFloatDivBorderTop">
                </td>
                <td class="LittleFloatDivBorderRightTop">
                </td>
            </tr>
            <tr>
                <td class="LittleFloatDivBorderLeft">
                </td>
                <td class ="MainButtonsContainer">
                    <table class ="FrameTable" style ="margin-top:5px; margin-left:5px;">
                        <tr>
                            <td class ="MainButtonItem" onclick ="PreviousPageFun();">
                            上一页
                            </td>
                            <td class ="MainButtonItemBlank" style ="width:110px; ">
                            </td>
                            <td class ="MainButtonItem" onclick ="ManualLoopFun();">
                            手动循环
                            </td>
                        </tr>
                        <tr>
                            <td class ="MainButtonItemBlank" style ="height:10px;"></td>
                            <td class ="MainButtonItemBlank" style ="width:110px; "></td>
                            <td class ="MainButtonItemBlank"></td>
                        </tr>
                        <tr>
                            <td class ="MainButtonItem" onclick ="NextPageFun();">
                            下一页
                            </td>
                            <td class ="MainButtonItemBlank"></td>
                            <td class ="MainButtonItem" onclick ="AutomaticLoopFun();">
                            自动循环
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="LittleFloatDivBorderRight">
                </td>
            </tr>
            <tr>
                <td class="LittleFloatDivBorderLeftBottom">
                </td>
                <td class="LittleFloatDivBorderBottom">
                </td>
                <td class="LittleFloatDivBorderRightBottom">
                </td>
            </tr>
        </table>
    </div>
    <%--第二个显示页面,甘肃--%>
    <div id ="GlobalLeftDiv2" class ="GlobalHiddenLeftDiv">
        <table class ="FrameTable" >
            <tr>
                <td class ="FloatDivBorderLeftTop" >
                </td>
                <td class ="FloatDivBorderTop" style ="width: 270px;">
                </td>
                <td class = "FloatDataDivTitle">
                数据汇总
                </td>
                <td class ="FloatDivBorderTop" style ="width: 270px;">
                </td>
                <td  class ="FloatDivBorderRightTop">
                </td>
            </tr>
            <tr>
                <td id ="DataTableMainHeightCell2" class ="FloatDivBorderLeft" >
                </td>
                <td class ="DataTablesContainer" colspan ="3">
                    <table>
                        <tr>
                            <td class ="DataTablesRowsSpacing1"></td>
                            <td class ="DataTablesRowsSpacing2"></td>
                            <td class ="DataTablesRowsSpacing1"></td>
                        </tr>
                        <tr>
                            <td class ="DataTablesRowsSpacing1"></td>
                            <td class ="DataTablesRowsSpacing2"></td>
                            <td class ="DataTablesRowsSpacing1"></td>
                        </tr>
                        <tr>
                            <td class="DataTableContainer">
                                <table class ="DataItemsTable">
                                    <tr>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataItemsTitleTd" colspan ="2">
                                            <div class ="DataItemsTitleDiv">白银水泥</div>
                                            
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTopTd">总功率(万千瓦)
                                        </td>
                                        <td class ="DataValeTopTd"><span id="zc_nxjc_byc总用电功率(KW)本月累计"></span>
                                        </td>
                                        <td class ="DataNameTopTd">余热发电功率(MW)
                                        </td>
                                        <td class ="DataValeTopTd"><span id="zc_nxjc_byc余热发电功率(MW)本月累计"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">煤磨电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd"><span id="zc_nxjc_byc煤粉制备电耗(KWh/t)本月累计"></span>
                                        </td>
                                        <td class ="DataNameTd">水泥磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd"><span id="zc_nxjc_byc水泥磨电耗(KWh/t)本月累计"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">生料磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd"><span id="zc_nxjc_byc生料磨电耗(KWh/t)本月累计"></span>
                                        </td>
                                        <td class ="DataNameTd">水泥分步电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd"><span id="zc_nxjc_byc水泥电耗(KWh/t)本月累计"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">熟料综合电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd"><span id="zc_nxjc_byc熟料综合电耗(KWh/t)本月累计"></span>
                                        </td>
                                        <td class ="DataNameTd">熟料综合煤耗(kg/t) 
                                        </td>
                                        <td class ="DataValueTd"><span id="zc_nxjc_byc煤耗(kg/t)本月累计"></span>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td class="DataTableColsSpacing">

                            </td>
                            <td class="DataTableContainer">
                                <table class ="DataItemsTable">
                                    <tr>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataItemsTitleTd" colspan ="2">
                                            <div class ="DataItemsTitleDiv">天水水泥</div>
                                            
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTopTd">总功率(万千瓦)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                        <td class ="DataNameTopTd">余热发电功率(MW)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">煤磨电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">生料磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥分步电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">熟料综合电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">熟料综合煤耗(kg/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class ="DataTablesRowsSpacing1"></td>
                            <td class ="DataTablesRowsSpacing2"></td>
                            <td class ="DataTablesRowsSpacing1"></td>
                        </tr>
                        <tr>
                            <td class="DataTableContainer">
                                <table class ="HiddenDataItemsTable">
                                    <tr>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataItemsTitleTd" colspan ="2">
                                            <div class ="DataItemsTitleDiv">宁夏建材</div>
                                            
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTopTd">总功率(万千瓦)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                        <td class ="DataNameTopTd">余热发电功率(MW)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">煤磨电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">生料磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥分步电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">熟料综合电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">熟料综合煤耗(kg/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>

                            </td>
                            <td class="DataTableContainer">
                                <table class ="HiddenDataItemsTable">
                                    <tr>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataItemsTitleTd" colspan ="2">
                                            <div class ="DataItemsTitleDiv">宁夏建材</div>
                                            
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTopTd">总功率(万千瓦)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                        <td class ="DataNameTopTd">余热发电功率(MW)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">煤磨电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">生料磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥分步电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">熟料综合电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">熟料综合煤耗(kg/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class ="DataTablesRowsSpacing1"></td>
                            <td class ="DataTablesRowsSpacing2"></td>
                            <td class ="DataTablesRowsSpacing1"></td>
                        </tr>
                        <tr>
                            <td class="DataTableContainer">
                                <table class ="HiddenDataItemsTable">
                                    <tr>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataItemsTitleTd" colspan ="2">
                                            <div class ="DataItemsTitleDiv">宁夏建材</div>
                                            
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTopTd">总功率(万千瓦)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                        <td class ="DataNameTopTd">余热发电功率(MW)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">煤磨电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">生料磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥分步电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">熟料综合电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">熟料综合煤耗(kg/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>

                            </td>
                            <td class="DataTableContainer">
                                <table class ="HiddenDataItemsTable">
                                    <tr>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataItemsTitleTd" colspan ="2">
                                            <div class ="DataItemsTitleDiv">宁夏建材</div>
                                            
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTopTd">总功率(万千瓦)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                        <td class ="DataNameTopTd">余热发电功率(MW)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">煤磨电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">生料磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥分步电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">熟料综合电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">熟料综合煤耗(kg/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class ="FloatDivBorderRight">
                </td>
            </tr>
            <tr>
                <td class ="FloatDivBorderLeftBottom">
                </td>
                <td class ="FloatDivBorderBottom" >
                </td>
                <td class ="FloatDivBorderBottom" >
                </td>
                <td class ="FloatDivBorderBottom" >
                </td>
                <td class ="FloatDivBorderRightBottom" >
                </td>
            </tr>
        </table>
    </div>
    <div id ="GlobalRightDiv2" class ="GlobalHiddenRightDiv">
        <table class ="FrameTable" >
            <tr>
                <td class="FloatDivBorderLeftTop" >
                </td>
                <td class="FloatDivBorderTop"  style ="width:70px;">
                </td>
                <td class="FloatMapDivTitle">
                辅助信息
                </td>
                <td class="FloatDivBorderTop" style ="width:70px;">
                </td>
                <td class ="FloatDivBorderRightTop">
                </td>
            </tr>
            <tr>
                <td id ="MapTableMainHeightCell2"  class="FloatDivBorderLeft">
                </td>
                <td class ="RegionalMapContainer"  colspan ="3">
                    <div class ="RegionalGanSuMapDiv"></div>
                    <table class ="RegionalMapDescription">
                        <tr>
                            <td>
                                宁夏建材集团控股中材甘肃水泥有限责任公司和天水中材水泥有限责任公司。中材甘肃水泥地处甘肃市白银市，现有1条日产4500吨新型干法水泥生产线；天水中材水泥地处甘肃省天水市秦州区关子镇，现有两条2500t/d新型干法水泥生产线。
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="FloatDivBorderRight">
                </td>
            </tr>
            <tr>
                <td class="FloatDivBorderLeftBottom">
                </td>
                <td  class="FloatDivBorderBottom">
                </td>
                <td class="FloatDivBorderBottom">
                </td>
                <td class="FloatDivBorderBottom">
                </td>
                <td class="FloatDivBorderRightBottom">
                </td>
            </tr>
        </table>
        <table class ="FrameTable" style ="margin-top:10px;" >
            <tr>
                <td class="LittleFloatDivBorderLeftTop">
                </td>
                <td class="LittleFloatDivBorderTop">
                </td>
                <td class="LittleFloatDivBorderRightTop">
                </td>
            </tr>
            <tr>
                <td class="LittleFloatDivBorderLeft">
                </td>
                <td class ="MainButtonsContainer">
                    <table class ="FrameTable" style ="margin-top:5px; margin-left:5px;">
                        <tr>
                            <td class ="MainButtonItem" onclick ="PreviousPageFun();">
                            上一页
                            </td>
                            <td class ="MainButtonItemBlank" >
                            </td>
                            <td class ="MainButtonItem" onclick ="ManualLoopFun();">
                            手动循环
                            </td>
                        </tr>
                        <tr>
                            <td class ="MainButtonItemBlank" style ="height:10px;"></td>
                            <td class ="MainButtonItemBlank" style ="width:110px; "></td>
                            <td class ="MainButtonItemBlank"></td>
                        </tr>
                        <tr>
                            <td class ="MainButtonItem" onclick ="NextPageFun();">
                            下一页
                            </td>
                            <td class ="MainButtonItemBlank"></td>
                            <td class ="MainButtonItem" onclick ="AutomaticLoopFun();">
                            自动循环
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="LittleFloatDivBorderRight">
                </td>
            </tr>
            <tr>
                <td class="LittleFloatDivBorderLeftBottom">
                </td>
                <td class="LittleFloatDivBorderBottom">
                </td>
                <td class="LittleFloatDivBorderRightBottom">
                </td>
            </tr>
        </table>
    </div>
    <%--第三个显示页面,内蒙古--%>
    <div id ="GlobalLeftDiv3" class ="GlobalHiddenLeftDiv">
        <table class ="FrameTable" >
            <tr>
                <td class ="FloatDivBorderLeftTop" >
                </td>
                <td class ="FloatDivBorderTop" style ="width: 270px;">
                </td>
                <td class = "FloatDataDivTitle">
                数据汇总
                </td>
                <td class ="FloatDivBorderTop" style ="width: 270px;">
                </td>
                <td  class ="FloatDivBorderRightTop">
                </td>
            </tr>
            <tr>
                <td id ="DataTableMainHeightCell3" class ="FloatDivBorderLeft" >
                </td>
                <td class ="DataTablesContainer" colspan ="3">
                    <table>
                        <tr>
                            <td class ="DataTablesRowsSpacing1"></td>
                            <td class ="DataTablesRowsSpacing2"></td>
                            <td class ="DataTablesRowsSpacing1"></td>
                        </tr>
                        <tr>
                            <td class ="DataTablesRowsSpacing1"></td>
                            <td class ="DataTablesRowsSpacing2"></td>
                            <td class ="DataTablesRowsSpacing1"></td>
                        </tr>
                        <tr>
                            <td class="DataTableContainer">
                                <table class ="DataItemsTable">
                                    <tr>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataItemsTitleTd" colspan ="2">
                                            <div class ="DataItemsTitleDiv">乌海赛马</div>                              
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTopTd">总功率(万千瓦)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                        <td class ="DataNameTopTd">余热发电功率(MW)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">煤磨电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">生料磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥分步电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">熟料综合电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">熟料综合煤耗(kg/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td class="DataTableColsSpacing">

                            </td>
                            <td class="DataTableContainer">
                                <table class ="DataItemsTable">
                                    <tr>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataItemsTitleTd" colspan ="2">
                                            <div class ="DataItemsTitleDiv">乌海西水</div>
                                            
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTopTd">总功率(万千瓦)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                        <td class ="DataNameTopTd">余热发电功率(MW)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">煤磨电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">生料磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥分步电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">熟料综合电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">熟料综合煤耗(kg/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class ="DataTablesRowsSpacing1"></td>
                            <td class ="DataTablesRowsSpacing2"></td>
                            <td class ="DataTablesRowsSpacing1"></td>
                        </tr>
                        <tr>
                            <td class="DataTableContainer">
                                <table class ="DataItemsTable">
                                    <tr>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataItemsTitleTd" colspan ="2">
                                            <div class ="DataItemsTitleDiv">喀喇沁水泥</div>
                                            
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTopTd">总功率(万千瓦)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                        <td class ="DataNameTopTd">余热发电功率(MW)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">煤磨电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">生料磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥分步电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">熟料综合电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">熟料综合煤耗(kg/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>

                            </td>
                            <td class="DataTableContainer">
                                <table class ="HiddenDataItemsTable">
                                    <tr>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataItemsTitleTd" colspan ="2">
                                            <div class ="DataItemsTitleDiv">宁夏建材</div>
                                            
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTopTd">总功率(万千瓦)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                        <td class ="DataNameTopTd">余热发电功率(MW)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">煤磨电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">生料磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥分步电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">熟料综合电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">熟料综合煤耗(kg/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class ="DataTablesRowsSpacing1"></td>
                            <td class ="DataTablesRowsSpacing2"></td>
                            <td class ="DataTablesRowsSpacing1"></td>
                        </tr>
                        <tr>
                            <td class="DataTableContainer">
                                <table class ="HiddenDataItemsTable">
                                    <tr>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataItemsTitleTd" colspan ="2">
                                            <div class ="DataItemsTitleDiv">宁夏建材</div>
                                            
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTopTd">总功率(万千瓦)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                        <td class ="DataNameTopTd">余热发电功率(MW)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">煤磨电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">生料磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥分步电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">熟料综合电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">熟料综合煤耗(kg/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>

                            </td>
                            <td class="DataTableContainer">
                                <table class ="HiddenDataItemsTable">
                                    <tr>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                        <td class ="DataItemsTitleTop1">
                                        </td>
                                        <td class ="DataItemsTitleTop2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataItemsTitleTd" colspan ="2">
                                            <div class ="DataItemsTitleDiv">宁夏建材</div>
                                            
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTopTd">总功率(万千瓦)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                        <td class ="DataNameTopTd">余热发电功率(MW)
                                        </td>
                                        <td class ="DataValeTopTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">煤磨电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">生料磨电耗(kW·h/t)
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">水泥分步电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class ="DataNameTd">熟料综合电耗(kW·h/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                        <td class ="DataNameTd">熟料综合煤耗(kg/t) 
                                        </td>
                                        <td class ="DataValueTd">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class ="FloatDivBorderRight">
                </td>
            </tr>
            <tr>
                <td class ="FloatDivBorderLeftBottom">
                </td>
                <td class ="FloatDivBorderBottom" >
                </td>
                <td class ="FloatDivBorderBottom" >
                </td>
                <td class ="FloatDivBorderBottom" >
                </td>
                <td class ="FloatDivBorderRightBottom" >
                </td>
            </tr>
        </table>
    </div>
    <div id ="GlobalRightDiv3" class ="GlobalHiddenRightDiv">
        <table class ="FrameTable" >
            <tr>
                <td class="FloatDivBorderLeftTop" >
                </td>
                <td class="FloatDivBorderTop"  style ="width:70px;">
                </td>
                <td class="FloatMapDivTitle">
                辅助信息
                </td>
                <td class="FloatDivBorderTop" style ="width:70px;">
                </td>
                <td class ="FloatDivBorderRightTop">
                </td>
            </tr>
            <tr>
                <td id ="MapTableMainHeightCell3"  class="FloatDivBorderLeft">
                </td>
                <td class ="RegionalMapContainer"  colspan ="3">
                    <div class ="RegionalNeiMengGuMapDiv"></div>
                    <table class ="RegionalMapDescription">
                        <tr>
                            <td>
                                宁夏建材集团控股喀喇沁草原水泥有限公司和两个全资子公司：乌海赛马水泥有限责任公司、乌海市西水水泥有限责任公司。喀喇沁草原水泥现有1条4500t/d新型干法水泥生产线；乌海赛马水泥现有1条2500t/d新型干法水泥生产线；乌海市西水水泥现拥有1条2500t/d、1条5000t/d新型干法水泥熟料生产线。
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="FloatDivBorderRight">
                </td>
            </tr>
            <tr>
                <td class="FloatDivBorderLeftBottom">
                </td>
                <td  class="FloatDivBorderBottom">
                </td>
                <td class="FloatDivBorderBottom">
                </td>
                <td class="FloatDivBorderBottom">
                </td>
                <td class="FloatDivBorderRightBottom">
                </td>
            </tr>
        </table>
        <table class ="FrameTable" style ="margin-top:10px;" >
            <tr>
                <td class="LittleFloatDivBorderLeftTop">
                </td>
                <td class="LittleFloatDivBorderTop">
                </td>
                <td class="LittleFloatDivBorderRightTop">
                </td>
            </tr>
            <tr>
                <td class="LittleFloatDivBorderLeft">
                </td>
                <td class ="MainButtonsContainer">
                    <table class ="FrameTable" style ="margin-top:5px; margin-left:5px;">
                        <tr>
                            <td class ="MainButtonItem" onclick ="PreviousPageFun();">
                            上一页
                            </td>
                            <td class ="MainButtonItemBlank" >
                            </td>
                            <td class ="MainButtonItem" onclick ="ManualLoopFun();">
                            手动循环
                            </td>
                        </tr>
                        <tr>
                            <td class ="MainButtonItemBlank" style ="height:10px;"></td>
                            <td class ="MainButtonItemBlank" style ="width:110px; "></td>
                            <td class ="MainButtonItemBlank"></td>
                        </tr>
                        <tr>
                            <td class ="MainButtonItem" onclick ="NextPageFun();">
                            下一页
                            </td>
                            <td class ="MainButtonItemBlank"></td>
                            <td class ="MainButtonItem" onclick ="AutomaticLoopFun();">
                            自动循环
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="LittleFloatDivBorderRight">
                </td>
            </tr>
            <tr>
                <td class="LittleFloatDivBorderLeftBottom">
                </td>
                <td class="LittleFloatDivBorderBottom">
                </td>
                <td class="LittleFloatDivBorderRightBottom">
                </td>
            </tr>
        </table>
    </div>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
