var WidthBlankSize = 20;
var HeightBlankSize = 10;
var MinDisplayWidth = 1360;
var MinDisplayHeight = 456;
$(document).ready(function () {
    //alert($(window).height()); //浏览器时下窗口可视区域高度
    //alert($(document).height()); //浏览器时下窗口文档的高度
    //alert($(document.body).height());//浏览器时下窗口文档body的高度
    //alert($(document.body).outerHeight(true));//浏览器时下窗口文档body的总高度 包括border padding margin
    //alert($(window).width()); //浏览器时下窗口可视区域宽度
    //alert($(document).width());//浏览器时下窗口文档对于象宽度
    //alert($(document.body).width());//浏览器时下窗口文档body的高度
    //alert($(document.body).outerWidth(true));//浏览器时下窗口文档body的总宽度 包括border padding margin 
    var m_DocumentWidth = GetGlobalWidth($(document.body).outerWidth(true));
    var m_DocumentHeight = GetGlobalHeight($(document.body).outerHeight(true));

    SetGlobalSize(m_DocumentWidth, m_DocumentHeight);
    SetBackImgSize(m_DocumentWidth, m_DocumentHeight);

    //AutoDisplayMoveDiv();

    /////////////窗口改变大小跟随
    $(window).resize(function () {
        //setTimeout(ChangeGlobalSize, 5000);
        ChangeGlobalSize();
    });
});
function ChangeGlobalSize() {
    var m_ParentFrameWidth = MinDisplayWidth;
    var m_ParentFrameHeight = MinDisplayHeight;

    if (window.parent.document.getElementById("DefalutMainFrame") != undefined && window.parent.document.getElementById("DefalutMainFrame") != null) {
        m_ParentFrameWidth = window.parent.document.getElementById("DefalutMainFrame").clientWidth;
        m_ParentFrameHeight = window.parent.document.getElementById("DefalutMainFrame").clientHeight;
    }
    else {
        m_ParentFrameWidth = $(document.body).outerWidth(true);
        m_ParentFrameHeight = $(document.body).outerHeight(true);
    }
    var m_DocumentChangeWidth = GetGlobalWidth(m_ParentFrameWidth);
    var m_DocumentChangeHeight = GetGlobalHeight(m_ParentFrameHeight);
    SetGlobalSize(m_DocumentChangeWidth, m_DocumentChangeHeight);
    SetBackImgSize(m_DocumentChangeWidth, m_DocumentChangeHeight);
}
function SetGlobalSize(myDocumentWidth, myDocumentHeight) {

    $('#GlobalBackGroundDiv').css('width', MinDisplayWidth);
    $('#GlobalBackGroundDiv').css('height', myDocumentHeight);
    $('#GlobalBackGroundDiv').css('left', (myDocumentWidth - MinDisplayWidth) / 2);
    $('#GlobalBackGroundDiv').css('top', 0);

    $('#GlobalDataTablesDiv').css('width', MinDisplayWidth);
    $('#GlobalDataTablesDiv').css('height', myDocumentHeight);
    $('#GlobalDataTablesDiv').css('left', (myDocumentWidth - MinDisplayWidth) / 2);
    $('#GlobalDataTablesDiv').css('top', 0);


    $('#DataTablesContainer').css('width', MinDisplayWidth);
    $('#DataTablesContainer').css('height', myDocumentHeight);

    $(".DataTableRowSpace").css('height', parseInt(myDocumentHeight / 4));
    $(".DataTableColSpace").css('width', parseInt((myDocumentWidth - 3 * 426) / 4));
}
function SetBackImgSize(myDocumentWidth, myDocumentHeight) {
    var m_RatioFactor = 1360 / 500;
    var m_ImgWidth = 0;
    var m_ImgHeight = 0;
    if (myDocumentHeight > MinDisplayHeight) {
        m_ImgWidth = m_RatioFactor * myDocumentHeight;
        m_ImgHeight = myDocumentHeight;
        if (m_ImgWidth > MinDisplayWidth) {
            m_ImgWidth = MinDisplayWidth;
            m_ImgHeight = m_ImgWidth / m_RatioFactor;
        }
    }
    else {
        m_ImgWidth = m_RatioFactor * MinDisplayHeight;
        m_ImgHeight = MinDisplayHeight;
    }
    $('#GlobalBackGroundImg').css('width', m_ImgWidth);
    $('#GlobalBackGroundImg').css('height', m_ImgHeight);
    $('#GlobalBackGroundImg').css('top', (myDocumentHeight - m_ImgHeight) / 2);
    $('#GlobalBackGroundImg').css('left', (myDocumentWidth - m_ImgWidth) / 2);
}
function GetGlobalWidth(myDocumentWidth) {
    if (myDocumentWidth > MinDisplayWidth) {
        return myDocumentWidth;
    }
    else {
        return MinDisplayWidth;
    }
}
function GetGlobalHeight(myDocumentHeight) {
    if (myDocumentHeight > MinDisplayHeight) {
        return myDocumentHeight;
    }
    else {
        return MinDisplayHeight;
    }
}
