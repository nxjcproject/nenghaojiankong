var WidthBlankSize = 20;
var HeightBlankSize = 10;
var LeftDivWidth = 0;
var LeftDivHeight = 0;
var RightDivWidth = 0;
var RightDivHeight = 0;
var MoveDivIdArray;
var ShowDivIndex = 0;
var MinDisplayWidth = 1360;
var MinDisplayHeight = 456;
var ManualDisplay = true;
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

    InitializatingDivId();
    SetGlobalSize(m_DocumentWidth, m_DocumentHeight);
    SetBackImgSize(m_DocumentWidth, m_DocumentHeight);
    SetHiddenMoveDiv();

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
function InitializatingDivId() {
    MoveDivIdArray = new Array();
    MoveDivIdArray.push({ "LeftDiv": "GlobalLeftDiv1", "RightDiv": "GlobalRightDiv1", "DataTableMainHeightCell": "DataTableMainHeightCell1", "MapTableMainHeightCell": "MapTableMainHeightCell1" });
    MoveDivIdArray.push({ "LeftDiv": "GlobalLeftDiv2", "RightDiv": "GlobalRightDiv2", "DataTableMainHeightCell": "DataTableMainHeightCell2", "MapTableMainHeightCell": "MapTableMainHeightCell2" });
    MoveDivIdArray.push({ "LeftDiv": "GlobalLeftDiv3", "RightDiv": "GlobalRightDiv3", "DataTableMainHeightCell": "DataTableMainHeightCell3", "MapTableMainHeightCell": "MapTableMainHeightCell3" });
    
}
function SetGlobalSize(myDocumentWidth, myDocumentHeight) {

    LeftDivWidth = 900;                                //MinDisplayWidth * 0.66;
    LeftDivHeight = myDocumentHeight - HeightBlankSize * 2;
    RightDivWidth = 400;                    //MinDisplayWidth - LeftDivWidth - WidthBlankSize * 3;
    RightDivHeight = myDocumentHeight - HeightBlankSize * 2;

    $('#GlobalBackGroundDivImg').css('width', MinDisplayWidth);
    $('#GlobalBackGroundDivImg').css('height', myDocumentHeight);
    $('#GlobalBackGroundDivImg').css('left', (myDocumentWidth - MinDisplayWidth) / 2);
    $('#GlobalBackGroundDivImg').css('top', 0);

    if (MoveDivIdArray != null && MoveDivIdArray != undefined) {
        for (var i = 0; i < MoveDivIdArray.length; i++) {
            $('#' + MoveDivIdArray[i].LeftDiv).css('width', LeftDivWidth);
            $('#' + MoveDivIdArray[i].LeftDiv).css('height', LeftDivHeight);
            $('#' + MoveDivIdArray[i].LeftDiv).css('left', WidthBlankSize + (myDocumentWidth - MinDisplayWidth) / 2);   //加上背景画布的左边位置

            $('#' + MoveDivIdArray[i].RightDiv).css('width', RightDivWidth);
            $('#' + MoveDivIdArray[i].RightDiv).css('height', RightDivHeight);
            $('#' + MoveDivIdArray[i].RightDiv).css('left', LeftDivWidth + WidthBlankSize * 2 + (myDocumentWidth - MinDisplayWidth) / 2);   //加上背景画布的左边位置

            $('#' + MoveDivIdArray[i].DataTableMainHeightCell).css('height', LeftDivHeight - 60);
            $('#' + MoveDivIdArray[i].MapTableMainHeightCell).css('height', RightDivHeight - 60 - 120);
            if (i == ShowDivIndex) {
                $('#' + MoveDivIdArray[i].LeftDiv).css('top', HeightBlankSize);
                $('#' + MoveDivIdArray[i].RightDiv).css('top', HeightBlankSize);
            }
            else {

                $('#' + MoveDivIdArray[i].LeftDiv).css('top', -LeftDivHeight);
                $('#' + MoveDivIdArray[i].RightDiv).css('top',-RightDivHeight);
            }
        }
    }
}
function SetHiddenMoveDiv() {
    if (MoveDivIdArray != null && MoveDivIdArray != undefined) {
        for (var i = 0; i < MoveDivIdArray.length; i++) {
            if (i > 0) {
                $('#' + MoveDivIdArray[i].LeftDiv).hide();
                $('#' + MoveDivIdArray[i].RightDiv).hide();
                $('#' + MoveDivIdArray[i].LeftDiv).css('visibility', 'visible');
                $('#' + MoveDivIdArray[i].RightDiv).css('visibility', 'visible');
            }
        }
    }
}
function SetBackImgSize(myDocumentWidth, myDocumentHeight) {
    var m_RatioFactor = 1920 / 1080;
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
function AutoDisplayMoveDiv() {
    if (ManualDisplay == false) {
        setTimeout(AutoDisplayMoveDiv, 60000);
        DisPlayByOrder();
    }
}
/////////////////顺序播放
function DisPlayByOrder() {
    if (MoveDivIdArray != null && MoveDivIdArray != undefined) {
        var m_CurrentDivIndex = ShowDivIndex;
        ShowDivIndex = (ShowDivIndex + 1) % MoveDivIdArray.length;
        MoveOutToTop(MoveDivIdArray[m_CurrentDivIndex].LeftDiv, MoveDivIdArray[ShowDivIndex].LeftDiv, LeftDivHeight + HeightBlankSize);
        MoveOutToTop(MoveDivIdArray[m_CurrentDivIndex].RightDiv, MoveDivIdArray[ShowDivIndex].RightDiv, RightDivHeight + HeightBlankSize);

    }
}
/////////////////逆序播放
function DisPlayByReverseOrder() {
    if (MoveDivIdArray != null && MoveDivIdArray != undefined) {
        var m_CurrentDivIndex = ShowDivIndex;
        ShowDivIndex = (ShowDivIndex - 1) < 0 ? MoveDivIdArray.length - 1 : ShowDivIndex - 1;
        MoveOutToTop(MoveDivIdArray[m_CurrentDivIndex].LeftDiv, MoveDivIdArray[ShowDivIndex].LeftDiv, LeftDivHeight + HeightBlankSize);
        MoveOutToTop(MoveDivIdArray[m_CurrentDivIndex].RightDiv, MoveDivIdArray[ShowDivIndex].RightDiv, RightDivHeight + HeightBlankSize);
    }
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

function MoveOutToLeft(myDocumentId, myDocumentWidth, myLeftBlankSize) {
    $("#" + myDocumentId).animate({
        left: "-=" + myLeftBlankSize + "px" //相对左移
    }, 100)
    .animate({
        width: "0px"
    },700, function () {
        $("#" + myDocumentId).hide();
        MoveInFromLeft(myDocumentId, myDocumentWidth, myLeftBlankSize);
    });
}
function MoveInFromLeft(myDocumentId, myDocumentWidth, myLeftBlankSize) {
    $("#" + myDocumentId).show();
    $("#" + myDocumentId).animate({
        width: myDocumentWidth + "px"
    }, 700)
    .animate({
        left: "+=" + myLeftBlankSize + "px"//相对右移
    }, 100, function () {
        //MoveOutToLeft(myDocumentId, myDocumentWidth, myLeftBlankSize); 
    });
}
function MoveOutToRight(myDocumentId, myDocumentWidth, myRightBlankSize) {
    $("#" + myDocumentId).animate({
        left: "+=" + myRightBlankSize + "px" //相对右移
    }, 100)
    .animate({
        left: "+=" + myDocumentWidth + "px", //相对右移
        width: "0px"

    }, 700, function () {
        $("#" + myDocumentId).hide();
        MoveInFromRight(myDocumentId, myDocumentWidth, myRightBlankSize)
    });
}
function MoveInFromRight(myDocumentId, myDocumentWidth, myRightBlankSize) {
    $("#" + myDocumentId).show();
    $("#" + myDocumentId).animate({
        left: "-=" + myDocumentWidth + "px", //相对左移
        width: myDocumentWidth + "px"
    }, 700)
    .animate({
        left: "-=" + myRightBlankSize + "px"//相对左移
    }, 100, function () {
        //MoveOutToRight(myDocumentId, myDocumentWidth, myLeftBlankSize); 
    });
}
function MoveOutToTop(myDocumentId, myNextDocumentId, myDocumentHeight) {
    $("#" + myDocumentId).animate({
        top: "-=" + myDocumentHeight + "px" //相对上移
    }, 700, function () {
        $("#" + myDocumentId).hide();
        MoveInDelay(myNextDocumentId, myDocumentHeight);
    });
}
function MoveInFromTop(myDocumentId, myDocumentHeight) {
    $("#" + myDocumentId).show();
    $("#" + myDocumentId).animate({
        top: "+=" + myDocumentHeight + "px"//相对下移
    }, 700, function () {

    });
}
function MoveInDelay(myDocumentId, myDocumentHeight) {
    setTimeout(function () { MoveInFromTop(myDocumentId, myDocumentHeight); }, 500);
}

//////////////////////////操作///////////////////////////
function PreviousPageFun() {
    DisPlayByReverseOrder();
}
function NextPageFun() {
    DisPlayByOrder()
}
function ManualLoopFun() {
    ManualDisplay = true;
}
function AutomaticLoopFun() {
    ManualDisplay = false;
    AutoDisplayMoveDiv();
}
