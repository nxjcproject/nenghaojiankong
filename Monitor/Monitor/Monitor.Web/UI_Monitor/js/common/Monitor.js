$(function () {
    //getSelectedTabIndex();
    InitializePage();
});

var publicData = {
    realTimer: {},
    tableTimer: {},
    organizationId: "",
    tabIndex: "0",
    pollingIntervals: 10000,
    tablePollingIntervals: 10000,//"600000"
};
var dataToServer = {
    organizationId: publicData.organizationId,
    sceneName: viewNames[publicData.tabIndex]
};

function InitializePage() {
    initializeTable();
    loadTemplate(publicData.tabIndex, "../view/template" + publicData.tabIndex + ".html");

    getLatestData();
    getTableData();

    $('#myTabs').tabs({
        //tabPosition:'bottom',
        onSelect: function (title, index) {
            publicData.tabIndex = index;
            loadTemplate(publicData.tabIndex, "../view/template" + publicData.tabIndex + ".html");
            dataToServer = {
                organizationId: publicData.organizationId,
                sceneName: viewNames[publicData.tabIndex]
            };
            getLatestData();
            getTableData();
        }
    });
}
function loadTemplate(tabIndex, url) {
    // 将模板加载至 templatePlaceHolder
    $("#template" + tabIndex).load(url);
}
function getLatestData() {
    //var m_MsgData;
    $.ajax({
        type: "POST",
        url: "MonitorView.aspx/GetRealTimeData",
        data: JSON.stringify(dataToServer),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function(data){
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
        $("#v" + publicData.tabIndex + "_" + item.ID).val(item.Value);
    });
}

function getTableData() {
    //var m_MsgData;
    $.ajax({
        type: "POST",
        url: "MonitorView.aspx/GetData",
        data: JSON.stringify(dataToServer),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: loadDataForTable
    });
}
function loadDataForTable(resultObject) {
    var consumption = $.parserJSON(resultObject.d.consumption);
    var ammeter = $.parserJSON(resultObject.d.ammeter);
    $('#consumption').datagrid('loadData', consumption);
    $('#ammeter').datagrid('loadData', consumption);
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
            title:'产量/电量/电耗',
            iconCls: 'icon-save', singleSelect: true, rownumbers: true, striped: true,
            columns: [[
                { field: 'Flag', title: '项目指标', width: '28%', align: 'center' },
                { field: 'Shifts', title: '本日甲班', width: '12%', align: 'center' },
                { field: 'StartTime', title: '本日乙班', width: '12%', align: 'center' },
                { field: 'EndTime', title: '本日丙班', width: '12%', align: 'center' },
                { field: 'Description', title: '本日合计', width: '12%', align: 'center' },
                { field: 'CreatedDate', title: '本月累计', width: '12%', align: 'center' },
                { field: 'CreatedDate', title: '本年累计',width:'12%', align: 'center' }
            ]]
        });
    $('#ammeter').datagrid({
            title: '电表值',
            iconCls: 'icon-save', singleSelect: true, rownumbers: true, striped: true,
            columns: [[
                { field: 'Flag', title: '电表编号', width: '12%', align: 'center' },
                { field: 'Shifts', title: '设备名称', width: '26%', align: 'center' },
                { field: 'StartTime', title: '电表读数(kw.h)', width: '12%', align: 'center' },
                { field: 'EndTime', title: '功率(kw)', width: '12%', align: 'center' },
                { field: 'Description', title: '日合计(kw.h)', width: '12%', align: 'center' },
                { field: 'CreatedDate', title: '月合计(kw.h)', width: '12%', align: 'center' },
                { field: 'CreatedDate', title: '年累计(kw.h)', width: '12%', align: 'center' }
            ]]
        });
}
