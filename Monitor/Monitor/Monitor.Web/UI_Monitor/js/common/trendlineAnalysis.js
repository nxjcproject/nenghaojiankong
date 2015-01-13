$(document).ready(function () {

    // 为设备描点挂载双击事件

    $('.selectable').dblclick(function () {

        // 获取标题

        var title = $(this).attr("data-title");

        // 获取描点所属组织机构ID

        var organizationId = $(this).attr("data-organizationId");

        // 获取描点对应的工序LevelCode

        var levelcode = $(this).attr("data-levelcode");

        var endTime = new Date();

        var startTime = new Date(endTime.getTime() - 1000 * 60 * 60 * 24 * 2);

        var x = $(this).offset().top;
        var y = $(this).offset().left;

        query(title, organizationId, levelcode, startTime.toLocaleDateString(), endTime.toLocaleDateString(), x, y);

    });


});


function query(title, organizationId, levelcode, startTime, endTime, x, y) {
    $.ajax({
        type: "POST",
        url: "/UI_Monitor/ProcessEnergyMonitor/TrendLineAnalysis/ElectricityAnalysis.asmx/GetElectricityUsageTrendline",
        data: "{organizationId:'" + organizationId + "',levelcode:'"+ levelcode +"',startTime:'" + startTime + "',endTime:'" + endTime + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (msg) {
            updateChart(JSON.parse(msg.d), title, x, y);
        }
    });
}

function updateChart(data, title, x, y) {
    // 更新Chart

    var m_WindowContainerId = 'Windows_Container';

    WindowsDialogOpen(data, m_WindowContainerId, title, false, 'Line', 500, 200, y + 200, x, true, false, false);
}


///////////////////////获取window初始位置////////////////////////////
function GetWindowPostion(myWindowIndex, myWindowContainerId) {
    var m_ParentObj = $('#' + myWindowContainerId);
    var m_ParentWidth = m_ParentObj.width();
    var m_ParentHeight = m_ParentObj.height();
    var m_ZeroLeft = 0;
    var m_ZeroTop = 0;
    var m_Padding = 5;
    var m_Width = (m_ParentWidth - m_Padding) / 2;
    var m_Height = (m_ParentHeight - m_Padding) / 2;
    var m_Left = 0;
    var m_Top = 0;
    if (myWindowIndex == 0) {
        m_Left = m_ZeroLeft;
        m_Top = m_ZeroTop;
    }
    else if (myWindowIndex == 1) {
        m_Left = m_ZeroLeft + m_Width + m_Padding;
        m_Top = m_ZeroTop;
    }
    else if (myWindowIndex == 2) {
        m_Left = m_ZeroLeft;
        m_Top = m_ZeroTop + m_Height + m_Padding;
    }
    else if (myWindowIndex == 3) {
        m_Left = m_ZeroLeft + m_Width + m_Padding;
        m_Top = m_ZeroTop + m_Height + m_Padding;
    }

    return [m_Width, m_Height, m_Left, m_Top]
}
///////////////////////////////////////////打开window窗口//////////////////////////////////////////
function WindowsDialogOpen(myData, myContainerId, myTitle, myIsShowGrid, myChartType, myWidth, myHeight, myLeft, myTop, myDraggable, myMaximizable, myMaximized) {
    ;
    var m_WindowId = OpenWindows(myContainerId, myTitle, myWidth, myHeight, myLeft, myTop, myDraggable, myMaximizable, myMaximized); //弹出windows
    var m_WindowObj = $('#' + m_WindowId);
    if (myMaximized != true) {
        CreateGridChart(myData, m_WindowId, myIsShowGrid, myChartType);               //生成图表
    }

    m_WindowObj.window({
        onBeforeClose: function () {
            ///////////////////////释放图形空间///////////////
            //var m_ContainerId = GetWindowIdByObj($(this));
            ReleaseGridChartObj(m_WindowId);
            CloseWindow($(this))
        },
        onMaximize: function () {
            TopWindow(m_WindowId);
            ChangeSize(m_WindowId);
            CreateGridChart(myData, m_WindowId, myIsShowGrid, myChartType);

        },
        onRestore: function () {
            //TopWindow(m_WindowId);
            ChangeSize(m_WindowId);
            CreateGridChart(myData, m_WindowId, myIsShowGrid, myChartType);
        }
    });
}
