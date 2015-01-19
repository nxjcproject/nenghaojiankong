<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MachineHaltAlarmMonitor.aspx.cs" Inherits="Monitor.Web.UI_EnergyAlarmMonitor.MachineHaltAlarmMonitor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>主从机延时停机报警状态</title>
    <link rel="stylesheet" type="text/css" href="/lib/ealib/themes/gray/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/lib/ealib/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/lib/extlib/themes/syExtIcon.css" />
    <link rel="stylesheet" type="text/css" href="/lib/extlib/themes/syExtCss.css" />


    <link rel="stylesheet" type="text/css" href="css/page/EnergyAlarmMonitor.css" />

    <script type="text/javascript" src="/lib/ealib/jquery.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/common/jquery.utility.js"></script>
    <script type="text/javascript" src="/lib/ealib/jquery.easyui.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="/lib/ealib/easyui-lang-zh_CN.js" charset="utf-8"></script>

    <script type="text/javascript" src="js/page/MachineHaltAlarmMonitor.js"></script>
</head>
<body>
    <div class="easyui-layout" data-options="fit:true,border:false">
        <div data-options="region:'north',border:false,collapsible:false" style="padding-top:5px;padding-left:20px;height:35px;">
        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true"
             onclick ="BackToUpFun();">返回</a>
        </div>
        <div data-options="region:'center',border:false,collapsible:false" style="padding:10px;">
            <table>
                <tr>
                    <td id ="Line0101"  class ="EnergyAlarmPic"></td>
                    <td class ="EnergyAlarmHorizontalBlank"></td>
                    <td id ="Line0102" class ="EnergyAlarmPic"></td>
                    <td class ="EnergyAlarmHorizontalBlank"></td>
                    <td id ="Line0103" class ="EnergyAlarmPic"></td>
                    <td class ="EnergyAlarmHorizontalBlank"></td>
                    <td id ="Line0104" class ="EnergyAlarmPic"></td>
                    <td class ="EnergyAlarmHorizontalBlank"></td>
                    <td id ="Line0105" class ="EnergyAlarmPic"></td>
                    <td class ="EnergyAlarmHorizontalBlank"></td>
                    <td id ="Line0106" class ="EnergyAlarmPic"></td>
                    <td class ="EnergyAlarmHorizontalBlank"></td>
                    <td id ="Line0107" class ="EnergyAlarmPic"></td>
                    <td class ="EnergyAlarmHorizontalBlank"></td>
                    <td id ="Line0108" class ="EnergyAlarmPic"></td>
                </tr>
                <tr>
                    <td class ="EnergyAlarmVerticalBlank"></td>
                    <td></td>
                    <td class ="EnergyAlarmVerticalBlank"></td>
                    <td></td>
                    <td class ="EnergyAlarmVerticalBlank"></td>
                    <td></td>
                    <td class ="EnergyAlarmVerticalBlank"></td>
                    <td></td>
                    <td class ="EnergyAlarmVerticalBlank"></td>
                </tr>
                                <tr>
                    <td id ="Line0201" class ="EnergyAlarmPic"></td>
                    <td class ="EnergyAlarmHorizontalBlank"></td>
                    <td id ="Line0202" class ="EnergyAlarmPic"></td>
                    <td class ="EnergyAlarmHorizontalBlank"></td>
                    <td id ="Line0203" class ="EnergyAlarmPic"></td>
                    <td class ="EnergyAlarmHorizontalBlank"></td>
                    <td id ="Line0204" class ="EnergyAlarmPic"></td>
                    <td class ="EnergyAlarmHorizontalBlank"></td>
                    <td id ="Line0205" class ="EnergyAlarmPic"></td>
                    <td class ="EnergyAlarmHorizontalBlank"></td>
                    <td id ="Line0206" class ="EnergyAlarmPic"></td>
                    <td class ="EnergyAlarmHorizontalBlank"></td>
                    <td id ="Line0207" class ="EnergyAlarmPic"></td>
                    <td class ="EnergyAlarmHorizontalBlank"></td>
                    <td id ="Line0208" class ="EnergyAlarmPic"></td>
                </tr>
                <tr>
                    <td class ="EnergyAlarmVerticalBlank"></td>
                    <td></td>
                    <td class ="EnergyAlarmVerticalBlank"></td>
                    <td></td>
                    <td class ="EnergyAlarmVerticalBlank"></td>
                    <td></td>
                    <td class ="EnergyAlarmVerticalBlank"></td>
                    <td></td>
                    <td class ="EnergyAlarmVerticalBlank"></td>
                </tr>
                <tr>
                    <td id ="Line0301" class ="EnergyAlarmPic"></td>
                    <td class ="EnergyAlarmHorizontalBlank"></td>
                    <td id ="Line0302" class ="EnergyAlarmPic"></td>
                    <td class ="EnergyAlarmHorizontalBlank"></td>
                    <td id ="Line0303" class ="EnergyAlarmPic"></td>
                    <td class ="EnergyAlarmHorizontalBlank"></td>
                    <td id ="Line0304" class ="EnergyAlarmPic"></td>
                    <td class ="EnergyAlarmHorizontalBlank"></td>
                    <td id ="Line0305" class ="EnergyAlarmPic"></td>
                    <td class ="EnergyAlarmHorizontalBlank"></td>
                    <td id ="Line0306" class ="EnergyAlarmPic"></td>
                    <td class ="EnergyAlarmHorizontalBlank"></td>
                    <td id ="Line0307" class ="EnergyAlarmPic"></td>
                    <td class ="EnergyAlarmHorizontalBlank"></td>
                    <td id ="Line0308" class ="EnergyAlarmPic"></td>
                </tr>
            </table>
        </div>
        <div data-options="region:'south',border:true,collapsible:false" style="height:160px;">
        <table id="dataGrid_AlarmInfo" class="easyui-datagrid" data-options="fit:true,border:true"></table>
        </div>
    </div>
    <form id="form1" runat="server"></form>
</body>
</html>
