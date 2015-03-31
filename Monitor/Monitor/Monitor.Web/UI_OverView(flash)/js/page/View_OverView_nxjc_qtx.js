$(function () {
    getData();
});

var pageData = {
    tabIndex: 0,
    organizationId: "zc_nxjc_qtx",
    viewName: "saa"
};

var publicData = {
    realTimer: {},
    pollingIntervals: 10000
};

function getData() {
    getLatestData();
}

function getLatestData() {
    //var m_MsgData;
    var dataToServer = {
        organizationId: pageData.organizationId,
        sceneName: pageData.viewName
    };
    var urlString = "View_OverView_nxjc_qtx.aspx/GetRealTimeData";
    $.ajax({
        type: "POST",
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
    //var datetime = $.jsonDateToDateTime(scene.time);
    //$("#timestamp").html(datetime);

    // 显示数据项
    displayDataItem(scene.DataSet);
}
function displayDataItem(dataSets) {
    $.each(dataSets, function (i, item) {
        var value = Number(item.Value)
        $(document.getElementById(item.ID)).html(value.toFixed(2));
    });
}