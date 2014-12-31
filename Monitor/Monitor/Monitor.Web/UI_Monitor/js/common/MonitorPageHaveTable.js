$(function () {
    InitializePage();
});
var publicData = {
    realTimer: {},
    tableTimer: {},
    pollingIntervals: 10000,
    tablePollingIntervals: 600000
};

function InitializePage() {
    initializeTable();
    loadTemplate("../view/template" + pageData.tabIndex + ".html");

    setTimeout(getData, 1000);
}
function getData() {
    getLatestData();
    getTableData();
}
function loadTemplate(url) {
    // 将模板加载至 templatePlaceHolder
    $("#template").load(url);
}
function getLatestData() {
    //var m_MsgData;
    var dataToServer = {
        organizationId: pageData.organizationId,
        sceneName: pageData.viewName
    };
    var urlString = "template" + pageData.tabIndex + ".aspx/GetRealTimeData";
    $.ajax({
        type: "POST",
        //async: false,          //同步执行
        url: urlString,
        data: JSON.stringify(dataToServer),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            serviceSuccessful(data);
        }
    });
}
function serviceSuccessful(resultObject) {
    displayScene(resultObject.d);
    setupTimerToPollLatestData();
}
function setupTimerToPollLatestData() {
    // 设置获取最新数据定时器
    clearTimeout(publicData.realTimer);
    publicData.realTimer = setTimeout(
        function () {
            getLatestData();
        }, publicData.pollingIntervals);
}
function displayScene(scene) {
    // 显示监控画面参数
    // $("#sceneName").html(scene.Name);
    var datetime = $.jsonDateToDateTime(scene.time);
    $("#timestamp").html(datetime);
    // 显示数据项
    displayDataItem(scene.DataSet);
}
function displayDataItem(dataSets) {
    $.each(dataSets, function (i, item) {
        var value = Number(item.Value)
        $("#" + item.ID).val(value.toFixed(2));
    });
}

function getTableData() {
    //var m_MsgData;
    var dataToServer = {
        organizationId: pageData.organizationId,
        sceneName: pageData.tableDataView
    };
    var urlString = "template" + pageData.tabIndex + ".aspx/GetData";
    $.ajax({
        type: "POST",
        url: urlString,
        data: JSON.stringify(dataToServer),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: loadDataForTable
    });
}
function loadDataForTable(resultObject) {
    var consumption = $.parseJSON(resultObject.d.consumption);
    var ammeter = $.parseJSON(resultObject.d.ammeter);
    $('#consumption').datagrid('loadData', consumption);
    $('#ammeter').datagrid('loadData', ammeter);
    setupTimerToGetTableData();
}
function setupTimerToGetTableData() {
    // 设置获取最新数据定时器
    clearTimeout(publicData.tableTimer);
    publicData.tableTimer = setTimeout(
        function () {
            getTableData();
        }, publicData.tablePollingIntervals);
}

function initializeTable() {
    $('#consumption').datagrid({
        title: '产量/电量/电耗',
        iconCls: 'icon-save', singleSelect: true, rownumbers: true, striped: true,
        columns: [[
            { field: '项目指标', title: '项目指标', width: '20%', align: 'center' },
            { field: '本日甲班', title: '本日甲班', width: '13%', align: 'right', formatter: numberFormatter },
            { field: '本日乙班', title: '本日乙班', width: '13%', align: 'right', formatter: numberFormatter },
            { field: '本日丙班', title: '本日丙班', width: '13%', align: 'right', formatter: numberFormatter },
            { field: '本日合计', title: '本日合计', width: '13%', align: 'right', formatter: numberFormatter },
            { field: '本月累计', title: '本月累计', width: '13%', align: 'right', formatter: numberFormatter },
            { field: '本年累计', title: '本年累计', width: '13%', align: 'right', formatter: numberFormatter }
        ]]
    });
    $('#ammeter').datagrid({
        title: '电表值',
        iconCls: 'icon-save', singleSelect: true, rownumbers: true, striped: true,
        columns: [[
            { field: 'Flag', title: '电表编号', width: '12%', align: 'center' },
            { field: 'Shifts', title: '设备名称', width: '26%', align: 'center' },
            { field: 'StartTime', title: '电表读数(kw.h)', width: '12%', align: 'right', formatter: numberFormatter },
            { field: 'EndTime', title: '功率(kw)', width: '12%', align: 'right', formatter: numberFormatter },
            { field: 'Description', title: '日合计(kw.h)', width: '12%', align: 'right', formatter: numberFormatter },
            { field: 'CreatedDate', title: '月合计(kw.h)', width: '12%', align: 'right', formatter: numberFormatter },
            { field: 'CreatedDate', title: '年累计(kw.h)', width: '12%', align: 'right', formatter: numberFormatter }
        ]]
    });
}
function numberFormatter(val) {
    //if ($.isNumeric(val)) {
    //    return value.toFixed(2);
    //}
    //else {
    //    return "";
    //}
    if (val != "") {
        var value = Number(val);
        return value.toFixed(2);
    }
    else {
        return 0;
    }
}