$(function () {
    Initialize();
});

function Initialize() {
    //添加tab标题
    for (var i = 0; i < viewNames.length; i++) {
        $('#myTabs').tabs('add', {
            title: viewNames[i],
            //content: content,
            //closable: true
        });
    }
    //如果视图数量为一个，初始化第一个tab
    if (viewNames.length == 1) {
        var url = "../view/template0.aspx";
        var tab = $('#myTabs').tabs('getTab', 0);
        $('#myTabs').tabs('update', {
            tab: tab,
            options: {
                content: '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>'
            }
        });
    }

    $('#myTabs').tabs({
        //tabPosition:'bottom',
        onSelect: function (title, index) {

            //清楚iframe占用的内存
            //var frame = $('iframe', this);
            //for (var i = 0; i < frame.length; i++) {
            //    frame[i].contentWindow.document.write('');
            //    frame[i].contentWindow.close();
            //    frame.remove();
            //    if ($.browser.msie) {
            //        CollectGarbage();
            //    }
            //}

            for (var i = 0; i < viewNames.length; i++) {
                var tab = $('#myTabs').tabs('getTab', i);
                $('#myTabs').tabs('update', {
                    tab: tab,
                    options: {
                        content: '<iframe scrolling="auto" frameborder="0"  src="about:blank" style="width:100%;height:100%;"></iframe>'
                    }
                });
            }

            var url = "../view/template" + index + ".aspx";
            var tab = $('#myTabs').tabs('getTab', index);
            $('#myTabs').tabs('update', {
                tab: tab,
                options: {
                    content: '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>'
                }
            });
        }
    });
}