var MaxColumnsCount = 8;
var MaxCellsCount = 24;
var AlarmGroup = new Array();
var BlinkOn = true;
var MaxDataRefreshTime = 60 * 5;
var CurrentRefreshTimeCount = 0;
$(document).ready(function () {
    InitializingEnergyAlarmStatus();
    InitializingEnergyAlarmGroup();
    InitializingAlarmDataGrid({ "rows": [], "total": 0 });
    LoadEnergyAlarmNodesData('');
    setInterval("BlinkInterval()", 1000);
});

function SetEnergyAlarmStatusPic(myData) {
    var m_RowIndex = 0;
    var m_ColumnIndex = 0;
    var m_RowIndexString = "";
    var m_ColumnIndexString = "";
    var m_LineId = "";
    for (var i = 0; i < myData.length; i++) {
        m_RowIndex = Math.floor(i / MaxColumnsCount) + 1;
        m_ColumnIndex = (i % MaxColumnsCount) + 1;
        m_RowIndexString = m_RowIndex.toString();
        m_RowIndexString = m_RowIndexString.length > 1 ? m_RowIndexString : "0" + m_RowIndexString;
        m_ColumnIndexString = m_ColumnIndex.toString();
        m_ColumnIndexString = m_ColumnIndexString.length > 1 ? m_ColumnIndexString : "0" + m_ColumnIndexString;
        m_LineId = 'Line' + m_RowIndexString + m_ColumnIndexString;
        $('#' + m_LineId).css('background-image', 'url(images/page/AlarmCircular_Green.png)');
        /////////////////////////每次加载Pic后需要把信息写入节点信息中////////////////
        SetEnergyAlarmNodeById(m_LineId, myData[i].LevelCode, myData[i].OrganizationId);
    }
    /////////////////////////每次加载新的报警节点后刷新报警值///////////////////
    GetAlarmValues();
}
function SetEnergyNodeText(myData) {
    for (var i = 0; i < myData.length; i++) {
        m_RowIndex = Math.floor(i / MaxColumnsCount) + 1;
        m_ColumnIndex = (i % MaxColumnsCount) + 1;
        m_RowIndexString = m_RowIndex.toString();
        m_RowIndexString = m_RowIndexString.length > 1 ? m_RowIndexString : "0" + m_RowIndexString;
        m_ColumnIndexString = m_ColumnIndex.toString();
        m_ColumnIndexString = m_ColumnIndexString.length > 1 ? m_ColumnIndexString : "0" + m_ColumnIndexString;
        $('#Line' + m_RowIndexString + m_ColumnIndexString).text(myData[i].Name);
    }
}
function LoadEnergyAlarmNodesData(myNodeId) {
    $.ajax({
        type: "POST",
        url: "EnergyAlarmMonitor.aspx/GetAlarmNodes",
        data: "{myNodeId:'" + myNodeId + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (msg) {
            var m_MsgData = jQuery.parseJSON(msg.d);
            SetEnergyAlarmStatusPic(m_MsgData["rows"]);
            SetEnergyNodeText(m_MsgData["rows"]);

        }
    });
}
function LoadSubEnergyAlarmNodesData(myParentLevelCode) {
    $.ajax({
        type: "POST",
        url: "EnergyAlarmMonitor.aspx/GetAlarmNodesByParentLevelCode",
        data: "{myParentLevelCode:'" + myParentLevelCode + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (msg) {
            var m_MsgData = jQuery.parseJSON(msg.d);
            if (m_MsgData['rows'] && m_MsgData['rows'].length > 0) {
                ClearEnergyAlarmNode();
                SetEnergyAlarmStatusPic(m_MsgData["rows"]);
                SetEnergyNodeText(m_MsgData["rows"]);
            }
            else {
                alert("已到达最后一层!");
            }
        }
    });
}
//返回上级报警
function BackToUpFun() {
    if (AlarmGroup[0].LevelCode != "") {
        $.ajax({
            type: "POST",
            url: "EnergyAlarmMonitor.aspx/GetAlarmParentNodesByLevelCode",
            data: "{myLevelCode:'" + AlarmGroup[0].LevelCode + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                var m_MsgData = jQuery.parseJSON(msg.d);
                if (m_MsgData['rows'] && m_MsgData['rows'].length > 0) {
                    ClearEnergyAlarmNode();
                    SetEnergyAlarmStatusPic(m_MsgData["rows"]);
                    SetEnergyNodeText(m_MsgData["rows"]);
                }
                else {
                    alert("已到达最顶层!");
                }
            }
        });
    };
}
// 获得报警信息值
function GetAlarmValues() {
    var m_AlarmNodeLevelCode = "";
    for (var i = 0; i < AlarmGroup.length; i++) {
        if (AlarmGroup[i].LevelCode != '') {
            if (i == 0) {
                m_AlarmNodeLevelCode = AlarmGroup[i].LevelCode;
            }
            else {
                m_AlarmNodeLevelCode = m_AlarmNodeLevelCode + ',' + AlarmGroup[i].LevelCode;
            }
        }
    }
    $.ajax({
        type: "POST",
        url: "EnergyAlarmMonitor.aspx/GetAlarmValueByLevelCode",
        data: "{myAlarmNodeLevelCode:'" + m_AlarmNodeLevelCode + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (msg) {
            var m_MsgData = jQuery.parseJSON(msg.d);
            if (m_MsgData['rows'] && m_MsgData['rows'].length > 0) {
                SetAlarmValueToNodes(m_MsgData['rows']);
                $('#dataGrid_AlarmInfo').datagrid('loadData', m_MsgData);
                //ClearEnergyAlarmNode();
                //SetEnergyAlarmStatusPic(m_MsgData["rows"]);
                //SetEnergyNodeText(m_MsgData["rows"]);
            }
        }
    });
}
function InitializingAlarmDataGrid(myData) {
    $('#dataGrid_AlarmInfo').datagrid({
        title: '',
        data: myData,
        dataType: "json",
        striped: true,
        //loadMsg: '',   //设置本身的提示消息为空 则就不会提示了的。这个设置很关键的
        rownumbers: true,
        singleSelect: true,
        idField: 'OrganizationId',
        fit: true,
        columns: [[{
            width: 200,
            title: '组织机构名称',
            field: 'Name'
        }, {
            width: 200,
            title: '报警工序名称',
            field: 'FormulaName'
        }, {
            width: 150,
            title: '报警开始时间',
            field: 'StartTime'
        }, {
            width: 150,
            title: '报警类型',
            field: 'EnergyConsumptionType'
        }, {
            width: 150,
            title: '报警上限',
            field: 'StandardValue'
        }, {
            width: 150,
            title: '报警实际值',
            field: 'ActualValue'
        }]]
    });
}
function InitializingEnergyAlarmStatus() {
    var m_RowIndex = 0;
    var m_ColumnIndex = 0;
    var m_RowIndexString = "";
    var m_ColumnIndexString = "";
    for (var i = 0; i < MaxCellsCount; i++) {
        m_RowIndex = Math.floor(i / MaxColumnsCount) + 1;
        m_ColumnIndex = (i % MaxColumnsCount) + 1;
        m_RowIndexString = m_RowIndex.toString();
        m_RowIndexString = m_RowIndexString.length > 1 ? m_RowIndexString : "0" + m_RowIndexString;
        m_ColumnIndexString = m_ColumnIndex.toString();
        m_ColumnIndexString = m_ColumnIndexString.length > 1 ? m_ColumnIndexString : "0" + m_ColumnIndexString;
    }
}

function InitializingEnergyAlarmGroup() {
    var m_RowIndex = 0;
    var m_ColumnIndex = 0;
    var m_RowIndexString = "";
    var m_ColumnIndexString = "";
    var m_LineId = "";
    for (var i = 0; i < MaxCellsCount; i++) {
        m_RowIndex = Math.floor(i / MaxColumnsCount) + 1;
        m_ColumnIndex = (i % MaxColumnsCount) + 1;
        m_RowIndexString = m_RowIndex.toString();
        m_RowIndexString = m_RowIndexString.length > 1 ? m_RowIndexString : "0" + m_RowIndexString;
        m_ColumnIndexString = m_ColumnIndex.toString();
        m_ColumnIndexString = m_ColumnIndexString.length > 1 ? m_ColumnIndexString : "0" + m_ColumnIndexString;
        m_LineId = 'Line' + m_RowIndexString + m_ColumnIndexString;
        AlarmGroup.push({ 'id': m_LineId, 'LevelCode': '', 'OrganizationId': '', 'Value': '',
            'AlarmValue': '', 'AlarmType': '', 'AlarmStatus': ''
        });
        $('#Line' + m_RowIndexString + m_ColumnIndexString).dblclick(function () {
            var m_EnergyAlarmNode = GetEnergyAlarmNodeById($(this).attr("id"));
            LoadSubEnergyAlarmNodesData(m_EnergyAlarmNode.LevelCode);
            //双击事件的执行代码
        });
    }
}
function ClearEnergyAlarmNode() {
    var m_RowIndex = 0;
    var m_ColumnIndex = 0;
    var m_RowIndexString = "";
    var m_ColumnIndexString = "";
    for (var i = 0; i < MaxCellsCount; i++) {
        m_RowIndex = Math.floor(i / MaxColumnsCount) + 1;
        m_ColumnIndex = (i % MaxColumnsCount) + 1;
        m_RowIndexString = m_RowIndex.toString();
        m_RowIndexString = m_RowIndexString.length > 1 ? m_RowIndexString : "0" + m_RowIndexString;
        m_ColumnIndexString = m_ColumnIndex.toString();
        m_ColumnIndexString = m_ColumnIndexString.length > 1 ? m_ColumnIndexString : "0" + m_ColumnIndexString;
        $('#Line' + m_RowIndexString + m_ColumnIndexString).css('background-image', '');
        $('#Line' + m_RowIndexString + m_ColumnIndexString).text('');
        AlarmGroup[i].LevelCode = "";
        AlarmGroup[i].OrganizationId = "";
        AlarmGroup[i].Value = "";
        AlarmGroup[i].AlarmValue = "";
        AlarmGroup[i].AlarmType = "";
        AlarmGroup[i].OrganizationId = "";
        AlarmGroup[i].AlarmStatus = "";
    }
}
function SetEnergyAlarmNodeById(myId, myLevelCode, myOrganizationId) {
    for (var i = 0; i < MaxCellsCount; i++) {
        if (AlarmGroup[i].id == myId) {
            AlarmGroup[i].LevelCode = myLevelCode;
            AlarmGroup[i].OrganizationId = myOrganizationId;
        }
    }
}
function SetEnergyAlarmValueNodeById(myId, myValue, myAlarmValue, myAlarmType, myAlarmStatus) {
    for (var i = 0; i < MaxCellsCount; i++) {
        if (AlarmGroup[i].id == myId) {
            AlarmGroup[i].Value = myValue;
            AlarmGroup[i].AlarmValue = myAlarmValue;
            AlarmGroup[i].AlarmType = myAlarmType;
            AlarmGroup[i].AlarmStatus = myAlarmStatus;
        }
    }
}
function GetEnergyAlarmNodeById(myId) {
    for (var i = 0; i < MaxCellsCount; i++) {
        if (AlarmGroup[i].id == myId) {
            return {
                'id': myId, 'LevelCode': AlarmGroup[i].LevelCode, 'OrganizationId': AlarmGroup[i].OrganizationId, 'Value': AlarmGroup[i].Value,
                'AlarmValue': AlarmGroup[i].AlarmValue, 'AlarmType': AlarmGroup[i].AlarmType, 'AlarmStatus': AlarmGroup[i].AlarmStatus
            };
        }
    }
    return '';
}
//////////////////////获取的报警值写入节点信息中///////////////////////
function SetAlarmValueToNodes(myData) {
    for (var j = 0; j < AlarmGroup.length; j++) {
        //var aa = myData[i].LevelCode.indexOf(AlarmGroup[j].LevelCode);
        AlarmGroup[j].Value = "";
        AlarmGroup[j].AlarmValue = "";
        AlarmGroup[j].AlarmType = "";
        AlarmGroup[j].AlarmStatus = "";
    }
    for (var i = 0; i < myData.length; i++) {
        for (var j = 0; j < AlarmGroup.length; j++) {
            if (myData[i].LevelCode.indexOf(AlarmGroup[j].LevelCode) >= 0) {
                AlarmGroup[j].Value = "";
                AlarmGroup[j].AlarmValue = "";
                AlarmGroup[j].AlarmType = "";
                AlarmGroup[j].AlarmStatus = 1;
                break;
            }
        }
    }
    for (var i = 0; i < myData.length; i++) {
        for (var j = 0; j < AlarmGroup.length; j++) {
            var aa = myData[i].LevelCode.indexOf(AlarmGroup[j].LevelCode);
            if (myData[i].LevelCode == AlarmGroup[j].LevelCode) {
                AlarmGroup[j].Value = myData[i].ActualValue;
                AlarmGroup[j].AlarmValue = myData[i].StandardValue;
                AlarmGroup[j].AlarmType = myData[i].EnergyConsumptionType;
                AlarmGroup[j].AlarmStatus = 2;
                break;
            }
        }
    }
}
/////////////////////////////闪烁定时//////////////////////////////////
function BlinkInterval() {
    if (CurrentRefreshTimeCount >= MaxDataRefreshTime) {
        /////////////////////////每次加载新的报警节点后刷新报警值///////////////////
        GetAlarmValues();
        CurrentRefreshTimeCount = 0;
    }
    else {
        CurrentRefreshTimeCount = CurrentRefreshTimeCount + 1;
    }

    //BlinkDataGridBackColor(BlinkOn);       //改变datagrid背景颜色
    if (BlinkOn == true) {
        for (var i = 0; i < AlarmGroup.length; i++) {
            if (AlarmGroup[i].LevelCode != "") {
                if (AlarmGroup[i].AlarmStatus == "1") {
                    $('#' + AlarmGroup[i].id).css('background-image', 'url(images/page/AlarmCircular_Red.png)');
                }
                else if (AlarmGroup[i].AlarmStatus == "2") {
                    $('#' + AlarmGroup[i].id).css('background-image', 'url(images/page/AlarmCircular_Yellow.png)');
                }
                else {
                    $('#' + AlarmGroup[i].id).css('background-image', 'url(images/page/AlarmCircular_Green.png)');
                }
            }
        }
        
        BlinkOn = false;
    }
    else {
        for (var i = 0; i < AlarmGroup.length; i++) {
            if (AlarmGroup[i].LevelCode != "") {
                if (AlarmGroup[i].AlarmStatus == "1") {
                    $('#' + AlarmGroup[i].id).css('background-image', '');
                }
                else if (AlarmGroup[i].AlarmStatus == "2") {
                    $('#' + AlarmGroup[i].id).css('background-image', 'url(images/page/AlarmCircular_Red.png)');
                }
                else {
                    $('#' + AlarmGroup[i].id).css('background-image', 'url(images/page/AlarmCircular_Green.png)');
                }
            }
        }
        BlinkOn = true;
    }
}
function BlinkDataGridBackColor(myBackColorFlag) {
    $('#dataGrid_AlarmInfo').datagrid({
        rowStyler: function (index, row) {
            if (myBackColorFlag == true) {
                return 'background-color:red;';
            }
            else {
                return 'background-color:Yellow;';
            }
        }
    });
}

