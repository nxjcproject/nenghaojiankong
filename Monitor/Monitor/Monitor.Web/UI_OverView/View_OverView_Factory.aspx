<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_OverView_Factory.aspx.cs" Inherits="Monitor.Web.UI_OverView.View_OverView_Factory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head_OverView_Factory" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>分厂总貌</title>

    <link rel="stylesheet" type="text/css" href="/css/common/NormalPage.css" />
    <link rel="stylesheet" type="text/css" href="/UI_OverView/css/page/Style_OverView_Factory.css" />

    <script type="text/javascript" src="/lib/ealib/jquery.min.js" charset="utf-8"></script>
    <!--[if lt IE 8 ]><script type="text/javascript" src="/js/common/json2.min.js"></script><![endif]-->

    <script type="text/javascript" src="js/page/Style_OverView_Factory.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/page/View_OverView_Factory.js" charset="utf-8"></script>
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
                                <div id ="GroupTitle1" class="DataItemsTitleDiv"></div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle1_1" class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id ="ItemText1_1"></span>
                            </td>
                            <td id ="ItemTitle1_2" class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id ="ItemText1_2"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle1_3" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText1_3"></span>
                            </td>
                            <td id ="ItemTitle1_4" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText1_4"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle1_5" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText1_5"></span>
                            </td>
                            <td id ="ItemTitle1_6" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText1_6"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle1_7" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText1_7"></span>
                            </td>
                            <td id ="ItemTitle1_8" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText1_8"></span>
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
                                <div id ="GroupTitle2" class="DataItemsTitleDiv"></div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle2_1" class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id ="ItemText2_1"></span>
                            </td>
                            <td id ="ItemTitle2_2" class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id ="ItemText2_2"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle2_3" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText2_3"></span>
                            </td>
                            <td id ="ItemTitle2_4" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText2_4"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle2_5" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText2_5"></span>
                            </td>
                            <td id ="ItemTitle2_6" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText2_6"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle2_7" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText2_7"></span>
                            </td>
                            <td id ="ItemTitle2_8" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText2_8"></span>
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
                                <div id ="GroupTitle3" class="DataItemsTitleDiv"></div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle3_1" class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id ="ItemText3_1"></span>
                            </td>
                            <td id ="ItemTitle3_2" class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id ="ItemText3_2"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle3_3" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText3_3"></span>
                            </td>
                            <td id ="ItemTitle3_4" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText3_4"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle3_5" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText3_5"></span>
                            </td>
                            <td id ="ItemTitle3_6" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText3_6"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle3_7" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText3_7"></span>
                            </td>
                            <td id ="ItemTitle3_8" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText3_8"></span>
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
                                <div id ="GroupTitle4" class="DataItemsTitleDiv"></div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle4_1" class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id ="ItemText4_1"></span>
                            </td>
                            <td id ="ItemTitle4_2" class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id ="ItemText4_2"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle4_3" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText4_3"></span>
                            </td>
                            <td id ="ItemTitle4_4" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText4_4"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle4_5" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText4_5"></span>
                            </td>
                            <td id ="ItemTitle4_6" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText4_6"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle4_7" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText4_7"></span>
                            </td>
                            <td id ="ItemTitle4_8" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText4_8"></span>
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
                                <div id ="GroupTitle5" class="DataItemsTitleDiv"></div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle5_1" class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id ="ItemText5_1"></span>
                            </td>
                            <td id ="ItemTitle5_2" class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id ="ItemText5_2"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle5_3" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText5_3"></span>
                            </td>
                            <td id ="ItemTitle5_4" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText5_4"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle5_5" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText5_5"></span>
                            </td>
                            <td id ="ItemTitle5_6" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText5_6"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle5_7" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText5_7"></span>
                            </td>
                            <td id ="ItemTitle5_8" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText5_8"></span>
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
                                <div id ="GroupTitle6" class="DataItemsTitleDiv"></div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle6_1" class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id ="ItemText6_1"></span>
                            </td>
                            <td id ="ItemTitle6_2" class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id ="ItemText6_2"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle6_3" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText6_3"></span>
                            </td>
                            <td id ="ItemTitle6_4" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText6_4"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle6_5" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText6_5"></span>
                            </td>
                            <td id ="ItemTitle6_6" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText6_6"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle6_7" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText6_7"></span>
                            </td>
                            <td id ="ItemTitle6_8" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText6_8"></span>
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
                                <div id ="GroupTitle7" class="DataItemsTitleDiv"></div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle7_1" class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id ="ItemText7_1"></span>
                            </td>
                            <td id ="ItemTitle7_2" class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id ="ItemText7_2"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle7_3" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText7_3"></span>
                            </td>
                            <td id ="ItemTitle7_4" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText7_4"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle7_5" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText7_5"></span>
                            </td>
                            <td id ="ItemTitle7_6" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText7_6"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle7_7" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText7_7"></span>
                            </td>
                            <td id ="ItemTitle7_8" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText7_8"></span>
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
                                <div id ="GroupTitle8" class="DataItemsTitleDiv"></div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle8_1" class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id ="ItemText8_1"></span>
                            </td>
                            <td id ="ItemTitle8_2" class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id ="ItemText8_2"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle8_3" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText8_3"></span>
                            </td>
                            <td id ="ItemTitle8_4" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText8_4"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle8_5" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText8_5"></span>
                            </td>
                            <td id ="ItemTitle8_6" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText8_6"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle8_7" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText8_7"></span>
                            </td>
                            <td id ="ItemTitle8_8" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText8_8"></span>
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
                                <div id ="GroupTitle9" class="DataItemsTitleDiv"></div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle9_1" class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id ="ItemText9_1"></span>
                            </td>
                            <td id ="ItemTitle9_2" class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id ="ItemText9_2"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle9_3" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText9_3"></span>
                            </td>
                            <td id ="ItemTitle9_4" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText9_4"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle9_5" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText9_5"></span>
                            </td>
                            <td id ="ItemTitle9_6" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText9_6"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle9_7" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText9_7"></span>
                            </td>
                            <td id ="ItemTitle9_8" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText9_8"></span>
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
                                <div id ="GroupTitle10" class="DataItemsTitleDiv"></div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle10_1" class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id ="ItemText10_1"></span>
                            </td>
                            <td id ="ItemTitle10_2" class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id ="ItemText10_2"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle10_3" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText10_3"></span>
                            </td>
                            <td id ="ItemTitle10_4" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText10_4"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle10_5" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText10_5"></span>
                            </td>
                            <td id ="ItemTitle10_6" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText10_6"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle10_7" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText10_7"></span>
                            </td>
                            <td id ="ItemTitle10_8" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText10_8"></span>
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
                                <div id ="GroupTitle11" class="DataItemsTitleDiv"></div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle11_1" class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id ="ItemText11_1"></span>
                            </td>
                            <td id ="ItemTitle11_2" class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id ="ItemText11_2"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle11_3" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText11_3"></span>
                            </td>
                            <td id ="ItemTitle11_4" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText11_4"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle11_5" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText11_5"></span>
                            </td>
                            <td id ="ItemTitle11_6" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText11_6"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle11_7" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText11_7"></span>
                            </td>
                            <td id ="ItemTitle11_8" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText11_8"></span>
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
                                <div id ="GroupTitle12" class="DataItemsTitleDiv"></div>

                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle12_1" class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id ="ItemText12_1"></span>
                            </td>
                            <td id ="ItemTitle12_2" class="DataNameTopTd">
                            </td>
                            <td class="DataValeTopTd"><span id ="ItemText12_2"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle12_3" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText12_3"></span>
                            </td>
                            <td id ="ItemTitle12_4" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText12_4"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle12_5" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText12_5"></span>
                            </td>
                            <td id ="ItemTitle12_6" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText12_6"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id ="ItemTitle12_7" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText12_7"></span>
                            </td>
                            <td id ="ItemTitle12_8" class="DataNameTd">
                            </td>
                            <td class="DataValueTd"><span id ="ItemText12_8"></span>
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
