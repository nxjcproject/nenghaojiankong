/*!
 * 趋势分析 Javascript库
 * 张迪 - 第1次修改(2015-01-16)
 *
 * Include jQuery easyui (http://jeasyui.com/)
 */

// 当前锚点

var currentAnchor = null;

$(document).ready(function () {

    if ($.getUrlParam('fullscreen') != 1) {
        // 添加全屏

        $('#trendlineAnalysisContainer').append(getFullscreenHtml());
    }

    // 为趋势容器添加标签选择器

    $('#trendlineAnalysisContainer').append(getTagSelectorHtml());

    // 为趋势容器添加右键菜单

    $('#trendlineAnalysisContainer').append(getContextMenuHtml());

    // 为趋势容器添加标签列表窗口

    $('#trendlineAnalysisContainer').append(getTagListWindowHtml());

    // 为趋势容器添加图标容器

    $('#trendlineAnalysisContainer').append('<div id="Windows_Container"></div>');

    // 解析趋势容器

    $.parser.parse('#trendlineAnalysisContainer');

    // 为页面绑定单击事件

    $(document).click(function () {

        // 单击任意位置清空当前锚点

        unsetCurrentAnchor();
    });

    // 为设备描点挂载双击事件

    $('.selectable').dblclick(function () {

        // 设置触发双击事件的锚点为当前锚点

        setCurrentAnchor($(this));

        // 弹出单条趋势

        //popupSimpleTrendline();

        // 添加当前锚点至标签列表

        addCurrentAchorToTagList();

        // 清空当前锚点

        unsetCurrentAnchor();

    });


    // 为设备描点绑定菜单事件

    $('.selectable').bind('contextmenu', function (e) {

        // 将当前锚点设置为当前弹出菜单项的锚点

        setCurrentAnchor($(this));

        // 阻止默认菜单

        e.preventDefault();

        // 弹出菜单项

        $('#contextMenu').menu('show', {
            left: e.pageX,
            top: e.pageY
        });
    });

});

// 获取全屏按钮HTML

function getFullscreenHtml() {
    var html = '<div style="position: absolute; z-index: 10; margin-left: 10px; margin-top: 5px;">\
                    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:\'ext-icon-arrow_out\',plain:true" onclick="window.open(document.location + \'&fullscreen=1\', \'\', \'fullscreen=yes\');">全屏</a>\
                </div>';
    return html;
}

// 获取标签选择器HTML

function getTagSelectorHtml() {
    var html = '<div id="tagSelectorWindow" class="easyui-dialog" data-options="title:\'工序选择\', iconCls:\'icon-search\',resizable:false,modal:true,closed:true" style="width:600px;height:400px;overflow:hidden">\
                    <iframe id="tagSelector" src="about:blank" style="width:100%;height:100%;" frameborder="0" marginheight="0" marginwidth="0"></iframe>\
                </div>';
    return html;
}

// 标签选择器

function onTagItemSelect(item) {

    // 最多只允许添加8个标签

    if ($('#tagItems').datagrid('getRows').length >= 8) {
        $.messager.alert('提示', '最多允许添加8个标签!');
        return;
    }

    // 添加标签

    $('#tagItems').datagrid('appendRow', {
        OrganizationID: item.OrganizationID,
        LevelCode: item.LevelCode,
        Source: '标签选择',
        Name: item.Name
    });

    // 提示添加成功

    $.messager.show({
        title: '提示',
        msg: '标签"' + item.Name + '"添加成功.',
        timeout: 5000,
        showType: 'slide'
    });
}

// 获取右键菜单HTML

function getContextMenuHtml() {
    var html = '<div id="contextMenu" class="easyui-menu" data-options="onClick:menuHandler" style="width:120px;">\
                    <div data-options="name:\'add\',iconCls:\'icon-add\'">添加</div>\
                </div>';
    return html;
}

// 右键菜单单击事件

function menuHandler(item) {

    // 添加当前锚点至标签列表

    addCurrentAchorToTagList();

    // 清空当前锚点

    unsetCurrentAnchor();
}

// 获取标签列表窗口HTML

function getTagListWindowHtml() {
    var html = '<div id="tagListWindow" class="easyui-window" title="项目列表" data-options="iconCls:\'icon-filter\', minimizable: false, maximizable: false, collapsible: false, resizable:false, closed:true" style="width:300px;height:334px;">\
                    <div class="easyui-layout" data-options="fit:true">\
                        <div data-options="region:\'north\'" style="height:70px;padding:5px;background-color:rgb(250, 250, 250);">\
                            <div>\
                            时间段：\
                            <input id="StartTime" class="easyui-datebox" data-options="validType:\'md[\\\'2012-10\\\']\', required:true" style="width: 100px" />\
                            <span id="InnerlLine">-</span>\
                            <input id="EndTime" class="easyui-datebox" data-options="validType:\'md[\\\'2012-10-10\\\']\', required:true" style="width: 100px" />\
                            </div>\
                            <div style="margin-top:8px;">\
                            趋势类型：\
                            <select id="trendlineType" class="easyui-combobox" name="trendlineType" data-options="panelHeight: \'auto\',editable: false" style="width:60px;">\
                                <option value="electricityUsage">电量</option>\
                                <option value="electricityConsumption">电耗</option>\
                                <option value="power">功率</option>\
                            </select>\
                            <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:\'icon-add\'" onclick="popupAddTagItemWindow();">添加项目</a>\
                            <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:\'ext-icon-chart_curve\'" onclick="popupHorizontalTrendline();">分析</a>\
                            </div>\
                        </div>\
                        <div data-options="region:\'center\'">\
                            <table id="tagItems" class="easyui-datagrid" data-options="rownumbers:true, stripe:true, singleSelect:true, onDblClickRow: tagItemsDblClickHandler">\
                                <thead>\
                                    <tr>\
                                        <th data-options="field:\'OrganizationID\', hidden:true"></th>\
                                        <th data-options="field:\'LevelCode\', hidden:true"></th>\
                                        <th data-options="field:\'Source\'" style="width: 100px;">标签来源</th>\
                                        <th data-options="field:\'Name\'" style="width: 155px;">项目名称</th>\
                                    </tr>\
                                </thead>\
                            </table>\
                        </div>\
                    </div>\
	            </div>';
    return html;
}

// 标签列表双击事件
// 双击标签将标签从标签列表中移除

function tagItemsDblClickHandler(index, row) {
    $('#tagItems').datagrid('deleteRow', index);
}

// 设置当前锚点

function setCurrentAnchor(anchor) {
    unsetCurrentAnchor();
    currentAnchor = anchor;
    currentAnchor.removeClass('actived').addClass('actived');
}

// 清空当前锚点

function unsetCurrentAnchor() {
    if (currentAnchor != null) {
        currentAnchor.removeClass('actived');
        currentAnchor = null;
    }
}

// 添加当前锚点至标签列表

function addCurrentAchorToTagList() {

    // 如果当前锚点为空，则不做处理

    if (currentAnchor == null)
        return;

    // 显示标签列表窗口
    $('#tagListWindow').window('open');

    // 如果标签列表已满，则不不做处理

    if ($('#tagItems').datagrid('getRows').length >= 8) {
        $.messager.alert('提示', '最多允许添加8个标签');
        return;
    }

    // 获取标题

    var title = currentAnchor.attr("data-title");

    // 获取描点所属组织机构ID

    var organizationId = currentAnchor.attr("data-organizationId");

    // 获取描点对应的工序LevelCode

    var levelcode = currentAnchor.attr("data-levelcode");

    // 添加当前锚点至标签列表

    $('#tagItems').datagrid('appendRow', {
        OrganizationID: organizationId,
        LevelCode: levelcode,
        Source: '当前画面',
        Name: title
    });

    // 提示添加成功

    $.messager.show({
        title: '提示',
        msg: '标签"' + title + '"添加成功.',
        timeout: 5000,
        showType: 'slide'
    });
}

// 弹出标签选择窗口

function popupAddTagItemWindow() {
    $('#tagSelectorWindow').dialog('open');
    if ($('#tagSelector').attr('src') == 'about:blank')
        $('#tagSelector').attr('src', '/UI_Monitor/ProcessEnergyMonitor/TrendLineAnalysis/ProcessSelector.aspx?PageId=5CE25714-15AE-490B-947E-13C28BA20316');
}

// 弹出简单趋势

function popupSimpleTrendline() {

    // 如果当前锚点为空，则不做处理

    if (currentAnchor == null)
        return;

    // 获取标题

    var title = currentAnchor.attr("data-title");

    // 获取描点所属组织机构ID

    var organizationId = currentAnchor.attr("data-organizationId");

    // 获取描点对应的工序LevelCode

    var levelcode = currentAnchor.attr("data-levelcode");

    // 设置结束时间为当前时间

    var endTime = new Date();

    // 设置起始时间为10天前

    var startTime = new Date(endTime.getTime() - 1000 * 60 * 60 * 24 * 2);

    // 获取当前锚点的坐标
    var x = currentAnchor.offset().left;
    var y = currentAnchor.offset().top;

    simpleTrendlineQuery(title, organizationId, levelcode, startTime.toLocaleDateString(), endTime.toLocaleDateString(), x, y);

}


// 查询单条趋势

function simpleTrendlineQuery(title, organizationId, levelcode, startTime, endTime, x, y) {
    $.ajax({
        type: "POST",
        url: "/UI_Monitor/ProcessEnergyMonitor/TrendLineAnalysis/ElectricityAnalysis.asmx/GetElectricityUsageTrendline",
        data: "{organizationId:'" + organizationId + "',levelcode:'"+ levelcode +"',startTime:'" + startTime + "',endTime:'" + endTime + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (msg) {
            updateSimpleTrendlineChart(JSON.parse(msg.d), title, x, y);
        }
    });
}

// 更新单条趋势窗口

function updateSimpleTrendlineChart(data, title, x, y) {

    var m_WindowContainerId = 'Windows_Container';

    WindowsDialogOpen(data, m_WindowContainerId, title, false, 'Line', 800, 400, x + 80, y, true, false, false);
}

// 弹出横向比较趋势
function popupHorizontalTrendline() {
    horizontalTrendlineQuery();
}

function horizontalTrendlineQuery() {
    var tagItems = JSON.stringify($('#tagItems').datagrid('getData'));
    var trendlineType = $('#trendlineType').combobox('getValue');

    // 获取起止时间

    var startTime = new Date($('#StartTime').datebox('getValue'));
    var endTime = new Date($('#EndTime').datebox('getValue'));


    $.ajax({
        type: "POST",
        url: "/UI_Monitor/ProcessEnergyMonitor/TrendLineAnalysis/HorizontalAnalysis.asmx/GetHorizontalAnalysisTrendline",
        data: "{tagItems:'" + tagItems + "',trendlineType:'" + trendlineType + "',startTime:'" + startTime.toLocaleDateString() + "',endTime:'" + endTime.toLocaleDateString() + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (msg) {
            updateHorizontalTrendlineChart(JSON.parse(msg.d));
        }
    });

}

// 更新横向对比趋势窗口

function updateHorizontalTrendlineChart(data) {

    var m_WindowContainerId = 'Windows_Container';
    var trendlineType = $('#trendlineType').combobox('getText');

    WindowsDialogOpen(data, m_WindowContainerId, "横向对比-" + trendlineType, false, 'Line', 800, 400, 80, 80, true, false, false);
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
    var m_WindowId = OpenWindows(myContainerId, myTitle, myWidth, myHeight, myLeft, myTop, myDraggable, myMaximizable, myMaximized, true); //弹出windows
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
