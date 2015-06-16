$(function () {
    getLatestData();
});
function getLatestData() {
    var urlString = "View_OverView_Factory.aspx/GetRealTimeData";
    $.ajax({
        type: "POST",
        url: urlString,
        data: "",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var m_MsgData = jQuery.parseJSON(data.d);
            SetValueByType(m_MsgData);
        }
    });
}
function SetValueByType(m_MsgData) {
    SetMaterialOutputValue(m_MsgData["MaterialOutput"]);  //产量
    SetMaterialInputValue(m_MsgData["MaterialInput"]);    //消耗量
    SetCommonElectrictyValue(m_MsgData["CommonElectricty"]); //公共电量
    SetProductionLineValue(m_MsgData["ProductionLine"]);   //产线电耗
}
function SetMaterialOutputValue(myMaterialOutputValue) {
    $('#GroupTitle1').html("物料月产量");
    if (myMaterialOutputValue != null && myMaterialOutputValue != undefined) {
        var m_MaxLength = myMaterialOutputValue.length <= 8 ? myMaterialOutputValue.length : 8;   //最多8条数据
        for (var i = 1; i <= m_MaxLength; i++) {
            $('#ItemTitle1_' + i).html(myMaterialOutputValue[i - 1].Title);
            $('#ItemText1_' + i).html(myMaterialOutputValue[i - 1].Value);
        }
    }
    
}
function SetMaterialInputValue(myMaterialInputValue) {
    $('#GroupTitle2').html("物料月消耗量");
    if (myMaterialInputValue != null && myMaterialInputValue != undefined) {
        var m_MaxLength = myMaterialInputValue.length <= 8 ? myMaterialInputValue.length : 8;   //最多8条数据
        for (var i = 1; i <= m_MaxLength; i++) {
            $('#ItemTitle2_' + i).html(myMaterialInputValue[i - 1].Title);
            $('#ItemText2_' + i).html(myMaterialInputValue[i - 1].Value);
        }
    }

}
function SetCommonElectrictyValue(myCommonElectrictyValue) {
    $('#GroupTitle3').html("月公共用电量");
    if (myCommonElectrictyValue != null && myCommonElectrictyValue != undefined) {
        var m_MaxLength = myCommonElectrictyValue.length <= 8 ? myCommonElectrictyValue.length : 8;   //最多8条数据
        for (var i = 1; i <= m_MaxLength; i++) {
            $('#ItemTitle3_' + i).html(myCommonElectrictyValue[i - 1].Title);
            $('#ItemText3_' + i).html(myCommonElectrictyValue[i - 1].Value);
        }
    }

}
function SetProductionLineValue(myProductionLineValue) {
    if (myProductionLineValue != null && myProductionLineValue != undefined) {
        var m_MaxItems = myProductionLineValue.length <= 9 ? myProductionLineValue.length : 9;
        for (var i = 0; i <= m_MaxItems; i++) {
            if (myProductionLineValue[i] != null && myProductionLineValue[i] != undefined) {
                $('#GroupTitle' + (i + 4)).html(myProductionLineValue[i]["Title"]);
                var m_ValueList = myProductionLineValue[i]["List"];
                var m_MaxLength = m_ValueList.length <= 8 ? m_ValueList.length : 8;   //最多8条数据
                for (var j = 1; j <= m_MaxLength; j++) {
                    var m_Index = (i + 4) + '_' + j;
                    $('#ItemTitle' + m_Index).html(m_ValueList[j - 1].Title);
                    $('#ItemText' + m_Index).html(m_ValueList[j - 1].Value);
                }
            }
        }
    }
}