$(function () {
    InitializePage();
});
var publicData = {
    ids: "",
    realTimer: {},
    pollingIntervals: 3600000
};

function InitializePage() {
    var spans = document.getElementsByTagName("span");
    for (var i = 0; i < spans.length; i++) {
        publicData.ids = publicData.ids + spans[i].id + ",";
    }
    setTimeout(getLatestData, 1000);
}
function getLatestData() {
    //var m_MsgData;
    var dataToServer = {
        ids: publicData.ids
    };
    var urlString = "OverViewMonitor.asmx/GetRealTimeData";
    $.ajax({
        type: "POST",
        url: urlString,
        data: JSON.stringify(dataToServer),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            serviceSuccessful(data);
        },
        error: function () {
            setupTimerToPollLatestData();
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
        var element = $(document.getElementById(item.ID));
        //if (element.attr("tagName") == "span")
        element.html(value.toFixed(0));
        //else
        //element.val(value.toFixed(0));
    });
}