<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/common.css">
<script type="text/javascript" src="/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/resources/js/jquery/jquery.form.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/layer/layer.js"></script>
<title>编辑课程</title>
</head>
<body>
    <form enctype="multipart/form-data">
        <input type="hidden" name="bigCourseTypeId" id="bigCourseTypeId" value="${course.bigCourseTypeId }">
        <input type="hidden" name="teacherId" id="teacherId" value="${loginTeacher.id }">
        <input type="hidden" name="updateUser" id="updateUser" value="${loginTeacher.username }">
        <input type="hidden" name="id" id="id" value="${course.id }">
        <table class="table-input">
            <c:if test="${course.bigCourseTypeId == 1 || course.bigCourseTypeId == 2}">
                <tr>
                    <td class="td-right"><b class="red">*</b>&nbsp;辅导阶段：</td>
                    <td class="courseTypeTd">
                    </td>
                </tr>
                <tr>
                    <td class="td-right"><b class="red">*</b>&nbsp;辅导科目：</td>
                    <td>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td class="td-right"><b class="red">*</b>&nbsp;标题：</td>
                <td><input name="title" id="title" value="${course.title }"></td>
            </tr>
            <c:if test="${course.bigCourseTypeId == 1 }">
                <tr>
                    <td class="td-right"><b class="red">*</b>&nbsp;家教经验：</td>
                    <td>
                        <input type="radio" name="familyEducationExperience" value="有" <c:if test="${course.familyEducationExperience == '有' }">checked="checked"</c:if> >有
                        <input type="radio" name="familyEducationExperience" value="无" <c:if test="${course.familyEducationExperience == '无' }">checked="checked"</c:if> >无
                    </td>
                </tr>
            </c:if>
            <c:if test="${course.bigCourseTypeId == 1  || course.bigCourseTypeId == 2}">
            <tr>
                <td class="td-right"><b class="red">*</b>&nbsp;期望时薪：</td>
                <td><input name="hourlyRateStart" value="${course.hourlyRateStart }" >—<input name="hourlyRateEnd" value="${course.hourlyRateEnd }" >元/时</td>
            </tr>
            </c:if>
            <c:if test="${course.bigCourseTypeId == 2  || course.bigCourseTypeId == 3 || course.bigCourseTypeId == 4 || course.bigCourseTypeId == 5 || course.bigCourseTypeId == 6 || course.bigCourseTypeId == 7 || course.bigCourseTypeId == 8}">
                <tr>
                    <td class="td-right"><b class="red">*</b>&nbsp;授课人数：</td>
                    <td><input name="peopleNumStart" value="${course.peopleNumStart }" >—<input name="peopleNumEnd" value="${course.peopleNumEnd }" >人/班</td>
                </tr>
            </c:if>
            <c:if test="${course.bigCourseTypeId == 3 || course.bigCourseTypeId == 4 || course.bigCourseTypeId == 5 || course.bigCourseTypeId == 6 || course.bigCourseTypeId == 7 }">
                <tr>
                    <td class="td-right"><b class="red">*</b>&nbsp;类别：</td>
                    <td class="courseTypeTd">
                        <select name="courseTypeId">
                            <option value="-1">请选择</option>
                        </select>
                    </td>
                </tr>
<!--                 小类有可能为空比如游泳中的小类 -->
                <c:if test="${course.smallCourseType != null }">
                    <tr >
                        <td class="td-right"><b class="red">*</b>&nbsp;小类：</td>
                        <td></td>
                    </tr>
                </c:if>
            </c:if>
            <c:if test="${course.bigCourseTypeId == 8}">
                <tr>
                    <td class="td-right"><b class="red">*</b>&nbsp;国家：</td>
                    <td class="courseTypeTd">
                        <select name="courseTypeId">
                            <option value="-1">请选择</option>
                        </select>
                    </td>
                </tr>
<!--                 小类有可能为空比如游泳中的小类 -->
                <c:if test="${course.smallCourseType != null }">
                    <tr >
                        <td class="td-right"><b class="red">*</b>&nbsp;小类：</td>
                        <td></td>
                    </tr>
                </c:if>
            </c:if>
            <c:if test="${course.bigCourseTypeId == 3 || course.bigCourseTypeId == 4}">
                <tr>
                    <td class="td-right">&nbsp;对象：</td>
                    <td>
                        <input type="radio" name="object" value="少儿/幼儿" <c:if test="${course.object == '少儿/幼儿' }">checked="checked"</c:if> >少儿/幼儿
                        <input type="radio" name="object" value="成人" <c:if test="${course.object == '成人' }">checked="checked"</c:if> >成人
                        <input type="radio" name="object" value="女子"  <c:if test="${course.object == '女子' }">checked="checked"</c:if> >女子
                        <input type="radio" name="object" value="男士"  <c:if test="${course.object == '男士' }">checked="checked"</c:if> >男士
                    </td>
                </tr>
            </c:if>
            <c:if test="${course.bigCourseTypeId == 5}">
                <tr>
                    <td class="td-right">&nbsp;专项：</td>
                    <td>
                        <input type="checkbox" name="special" value="作文">作文
                        <input type="checkbox" name="special" value="口语">口语
                        <input type="checkbox" name="special" value="听力">听力
                        <input type="checkbox" name="special" value="考试">考试
                        <input type="checkbox" name="special" value="词汇">词汇
                        <input type="checkbox" name="special" value="语法">语法
                        <input type="checkbox" name="special" value="阅读">阅读
                    </td>
                </tr>
            </c:if>
            <c:if test="${course.bigCourseTypeId == 6 || course.bigCourseTypeId == 7}">
                <tr>
                    <td class="td-right"><b class="red">*</b>&nbsp;形式：</td>
                    <td>
                        <input type="radio" name="classType" value="脱产班" <c:if test="${course.classType == '脱产班' }">checked="checked"</c:if> >脱产班
                        <input type="radio" name="classType" value="寒暑假班" <c:if test="${course.classType == '寒暑假班' }">checked="checked"</c:if> >寒暑假班
                        <input type="radio" name="classType" value="周末班" <c:if test="${course.classType == '周末班' }">checked="checked"</c:if> >周末班
                        <input type="radio" name="classType" value="工作日班" <c:if test="${course.classType == '工作日班' }">checked="checked"</c:if> >工作日班
                        <input type="radio" name="classType" value="网络班" <c:if test="${course.classType == '网络班' }">checked="checked"</c:if> >网络班
                    </td>
                </tr>
            </c:if>
            <c:if test="${course.bigCourseTypeId == 2 || course.bigCourseTypeId == 3 || course.bigCourseTypeId == 4 || course.bigCourseTypeId == 5 || course.bigCourseTypeId == 6 || course.bigCourseTypeId == 7 || course.bigCourseTypeId == 8}">
                <tr>
                    <td class="td-right"><b class="red">*</b>&nbsp;详细地址：</td>
                    <td class="normal-area">
                        <select name="sheng" id="sheng"></select>
                        <select name="shi" id="shi"></select>
                        <select name="xian" id="xian"></select>
                        <input id="detailAddress" name="detailAddress" value="${course.detailAddress }">
                    </td>
                </tr>
            </c:if>
            <c:if test="${course.bigCourseTypeId == 2 || course.bigCourseTypeId == 3 || course.bigCourseTypeId == 4 || course.bigCourseTypeId == 5 || course.bigCourseTypeId == 6 || course.bigCourseTypeId == 7 || course.bigCourseTypeId == 8}">
                <tr>
                    <td class="td-right">&nbsp;课程环境：</td>
                    <td>
                        <input type="button" value="浏览" class="button white small" onclick="javascript:$('#courseEnvirmentFile').click()">
                        <input type="file" hidden="hidden" id="courseEnvirmentFile" name="courseEnvirmentFile" onchange="view(this,'courseEnvirmentImg');">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><img style="width: 255px; height: 156px;" id="courseEnvirmentImg" alt="" src="${course.courseEnvirment }"></td>
                </tr>
            </c:if>
            <tr>
                <td class="td-right"><b class="red">*</b>&nbsp;详细说明：</td>
                <td><div id="detailExplain" class="textarea-div" contenteditable="true">${course.detailExplain }</div></td>
            </tr>
            <c:if test="${course.bigCourseTypeId == 1 }">
                <tr>
                    <td class="td-right"><b class="red">*</b>&nbsp;辅导区域：</td>
                    <td class="area">
                        <select name="sheng"></select>
                        <select name="shi"></select>
                    </td>
                </tr>
                <tr class="h-50">
                    <td><label hidden="hidden"><b class="red">*</b>&nbsp;辅导区域：</label></td>
                    <td>
                        <div></div>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td></td>
                <td><input type="button" value="更改信息" class="button white medium" onclick="updateObject();"></td>
            </tr>
        </table>
    </form>
<script type="text/javascript">
var bigCourseTypeId = $("#bigCourseTypeId").val();
//区域是复选框时
if(!isUndefined($(".area")[0])){
    $(".area select:eq(0)")[0].options.add(new Option("请选择","-1"));
    $(".area select:eq(1)")[0].options.add(new Option("请选择","-1"));
    var xian = $(".area").parent().next().find("div");
    $(function (){
        $(".area select:eq(0)").change(function (){
            $(".area select:eq(1)").empty();
            $(".area select:eq(1)")[0].options.add(new Option("请选择","-1"));
            $(xian).empty();
            var shengCode = $(".area select:eq(0)").val().substr(0, 2);
            if(shengCode != -1){
                for(var i = 0; i < shiArray.length; i++){
                    var shiCode = shiArray[i].split(",")[1].substr(0, 2);
                    if(shiCode == shengCode){
                        $(".area select:eq(1)")[0].options.add(new Option(shiArray[i].split(",")[0], shiArray[i].split(",")[1]));
                    }
                    if(shiCode > shengCode){
                        break;
                    }
                }
            }
        });
        $(".area select:eq(1)").change(function (){
            $(xian).empty();
            var shiCode = $(".area select:eq(1)").val().substr(0, 4);
            if(shiCode != -1){
                var num = 0;
                for(var i = 0; i < xianArray.length; i++){
                    var xianCode = xianArray[i].split(",")[1].substr(0, 4);
                    if(shiCode == xianCode){
                        num++;
                        $(xian).append("<input type='checkbox' name='xian' value='" + xianArray[i].split(",")[1] + "'>"  + xianArray[i].split(",")[0]);
                        if(num == 9){
                            $(xian).append("<br>");
                            num = 0;
                        }
                    }
                    if(xianCode > shiCode){
                        break;
                    }
                }
            }
        });
    });
}
//区域是含有3个select时
if(!isUndefined($(".normal-area")[0])){
    $(".normal-area select:eq(0)")[0].options.add(new Option("请选择","-1"));
    $(".normal-area select:eq(1)")[0].options.add(new Option("请选择","-1"));
    $(".normal-area select:eq(2)")[0].options.add(new Option("请选择","-1"));
    $(function () {
        var sheng = $(".normal-area select:eq(0)");
        var shi = $(".normal-area select:eq(1)");
        var xian = $(".normal-area select:eq(2)");
        $(sheng).change(function () {
            $(shi).empty();
            $(shi)[0].options.add(new Option("请选择","-1"));
            $(xian).empty();
            $(xian)[0].options.add(new Option("请选择","-1"));
            var shengCode = $(sheng).val().substr(0, 2);
            if(shengCode != -1){
                for(var i = 0; i < shiArray.length; i++){
                    var shiCode = shiArray[i].split(",")[1].substr(0, 2);
                    if(shiCode == shengCode){
                        $(shi)[0].options.add(new Option(shiArray[i].split(",")[0], shiArray[i].split(",")[1]));
                    }
                    if(shiCode > shengCode){
                        break;
                    }
                }
            }
        });
        $(shi).change(function () {
            $(xian).empty();
            var shiCode = $(shi).val().substr(0, 4);
            if(shiCode != -1){
                var num = 0;
                for(var i = 0; i < xianArray.length; i++){
                    var xianCode = xianArray[i].split(",")[1].substr(0, 4);
                    if(shiCode == xianCode){
                        num++;
                        $(xian)[0].options.add(new Option(xianArray[i].split(",")[0], xianArray[i].split(",")[1]));
                    }
                    if(xianCode > shiCode){
                        break;
                    }
                }
            }
        });
    });
}
function displaySheng(className) {
    for(var i = 0; i < shengArray.length; i++){
        if(shengArray[i].split(",")[1] == "${course.sheng }"){
            $("." + className + " select:eq(0)").append("<option value='" + shengArray[i].split(",")[1] + "' selected='selected'>" + shengArray[i].split(",")[0] + "</option>");
        }else {
            $("." + className + " select:eq(0)")[0].options.add(new Option(shengArray[i].split(",")[0],shengArray[i].split(",")[1]));
        }
    }
}
function displayShi(className) {
    for(var i = 0; i < shiArray.length; i++){
        if(shiArray[i].split(",")[1] == "${course.shi }"){
            $("." + className + " select:eq(1)").append("<option value='" + shiArray[i].split(",")[1] + "' selected='selected'>" + shiArray[i].split(",")[0] + "</option>");
        }else if(shiArray[i].split(",")[1].substr(0, 2) == "${course.shi }".substr(0, 2)){
            $("." + className + " select:eq(1)")[0].options.add(new Option(shiArray[i].split(",")[0],shiArray[i].split(",")[1]));
        }else if(shiArray[i].split(",")[1].substr(0, 2) > "${course.shi }".substr(0, 2)) {
            break;
        }
    }
}
function displayXian(className) {
    for(var i = 0; i < shiArray.length; i++){
        if(xianArray[i].split(",")[1] == "${course.xian }"){
            $("." + className + " select:eq(2)").append("<option value='" + xianArray[i].split(",")[1] + "' selected='selected'>" + xianArray[i].split(",")[0] + "</option>");
        }else if(xianArray[i].split(",")[1].substr(0, 4) == "${course.xian }".substr(0, 4)){
            $("." + className + " select:eq(2)")[0].options.add(new Option(xianArray[i].split(",")[0],xianArray[i].split(",")[1]));
        }else if(xianArray[i].split(",")[1].substr(0, 4) > "${course.xian }".substr(0, 4)) {
            break;
        }
    }
}
if(!isUndefined($(".area")[0])){
    displaySheng("area");
    displayShi("area");
    var xianStrArray = "${course.xian }".split(",");
//     xianStrArray是顺序增长的
    var j = 0;
    for(var i = 0; i < xianArray.length; i++) {
        var checked = "";
        if(xianArray[i].split(",")[1] == xianStrArray[j]) {
            $(".area").parent().next().find("div").append("<input type='checkbox' name= 'xian' checked='checked' value=" + xianArray[i].split(",")[1] + ">" + xianArray[i].split(",")[0]);
        }else if(xianArray[i].split(",")[1].substr(0 ,4) == xianStrArray[j].substr(0 ,4)) {
            $(".area").parent().next().find("div").append("<input type='checkbox' name= 'xian' value=" + xianArray[i].split(",")[1] + ">" + xianArray[i].split(",")[0]);
        }else if(xianArray[i].split(",")[1].substr(0 ,4) > xianStrArray[j].substr(0 ,4)) {
            break;
        }
        if(xianArray[i].split(",")[1] == xianStrArray[j] && j+1 < xianStrArray.length) {
//         不能写在第一个if里面，因为如果xian只有一个时，else if会直接报错
            j++;
        }
    }
}
if(!isUndefined($(".normal-area")[0])){
    displaySheng("normal-area");
    displayShi("normal-area");
    displayXian("normal-area");
}
// jQuery选择器获取页面的element时，无论element是否存在，都会返回一个object对象，所以加上[0]转化为js对象，在用typeof判断，或者用其leng的长度判定
//显示类别
var courseTypeTd = $(".courseTypeTd");
var smallCourseTypeTd = $(".courseTypeTd").parent().next().find("td").eq(1);
var select = $(".courseTypeTd select");
var courseTypeArray;
$.ajax({
    url: "/getCourseTypeByBigCourseTypeId",
    type: "post",
    async: false,
    data: {bigCourseTypeId: bigCourseTypeId},
    success: function (result) {
        courseTypeArray = result;
    }
});
//类别是select时
if($(select).length > 0){
    for (var i = 0; i < courseTypeArray.length; i++) {
        $(select)[0].options.add(new Option(courseTypeArray[i].courseTypeName, courseTypeArray[i].id));
        if(courseTypeArray[i].id == "${course.courseType.id}") {
            //多了一个请选择
            $(select).find("option").eq(i+1).attr("selected","selected");
            for(var j = 0; j < courseTypeArray[i].smallCourseTypeList.length; j++){
                if(courseTypeArray[i].smallCourseTypeList[j].id == "${course.smallCourseType.id}") {
                    $(smallCourseTypeTd).append("<input type='radio' checked='checked' value=" + courseTypeArray[i].smallCourseTypeList[j].id + ">" + courseTypeArray[i].smallCourseTypeList[j].smallCourseTypeName);
                }else {
                    $(smallCourseTypeTd).append("<input type='radio' value=" + courseTypeArray[i].smallCourseTypeList[j].id + ">" + courseTypeArray[i].smallCourseTypeList[j].smallCourseTypeName);
                }
            }
        }
    }
    $(select).change(function() {
        var selectVal = $(select).val();
        if (selectVal != -1) {
            $(smallCourseTypeTd).parent().show();
            $(smallCourseTypeTd).empty();
            for(var i = 0; i < courseTypeArray.length; i++){
                if(courseTypeArray[i].id == selectVal){
                    if(courseTypeArray[i].smallCourseTypeList.length == 0) {
                        $(smallCourseTypeTd).parent().hide();
                    }
                    for(var j = 0; j < courseTypeArray[i].smallCourseTypeList.length; j++){
                        var smallCourseType = courseTypeArray[i].smallCourseTypeList[j];
                        $(smallCourseTypeTd).append("<input type='radio' name='smallCourseType' value=" + smallCourseType.id + ">" + smallCourseType.smallCourseTypeName);
                    }
                    break;
                }
            }
        } else {
            $(smallCourseTypeTd).parent().hide();
        }
        
    });
}else{
    //课程类别的td中不含有select时
    for(var i = 0; i < courseTypeArray.length; i++){
        var courseType = courseTypeArray[i];
        if(courseType.id != "${course.courseType.id}") {
            $(courseTypeTd).append("<input type='radio' name='courseTypeId' value=" + courseType.id + ">" + courseType.courseTypeName);
        }else {
            $(courseTypeTd).append("<input type='radio' name='courseTypeId' checked='checked' value=" + courseType.id + ">" + courseType.courseTypeName);
        }
    }
    for(var i = 0; i < courseTypeArray[0].smallCourseTypeList.length; i++){
        var smallCourseType = courseTypeArray[0].smallCourseTypeList[i];
        if(smallCourseType.id != "${course.smallCourseType.id}") {
            $(smallCourseTypeTd).append("<input type='radio' name='smallCourseTypeId' value=" + smallCourseType.id + ">" + smallCourseType.smallCourseTypeName);
        }else {
            $(smallCourseTypeTd).append("<input type='radio' name='smallCourseTypeId' checked='checked' value=" + smallCourseType.id + ">" + smallCourseType.smallCourseTypeName);
        }
    }
}
//显示专项
if($("input[name='special']").length > 0) {
    var specialArray = "${course.special}".split(",");
    var j = 0;
    for(var i = 0; i < $("input[name='special']").length; i++) {
        if($("input[name='special']").eq(i).val() == specialArray[j]){
            $("input[name='special']").eq(i).attr("checked", "checked");
            j++;
        }
    }
}
function updateObject(){
    if(checkData()){
        var option ={
                url: "/updateCourse",
                type: "post",
                data: {
                    detailExplain: $("#detailExplain").text()
                },
                error: function(){
                    layer.alert("服务器出错", {icon : 0}, function (index){
                        layer.close(index);
                    });
                },
                success: function(result){
                    if(result.code == 0){
                        layer.msg(result.msg, {
                            icon: 1,
                            time: 1000
                        },function (){
                            location.reload();
                        });
                    }else{
                        layer.alert(result.msg, {icon : 0}, function (index){
                            layer.close(index);
                        });
                    }
                }
        }
        $("form").ajaxSubmit(option);
    }
}
function checkData(){
    var tr = $("tr");
    for(var i = 0; i < tr.length; i++){
        var firstTd = $(tr).eq(i).find("td").first();
        var secTd = $(firstTd).next();
        //如果第一个td中含有*就表示必填
        if($(firstTd).text().indexOf("*") != -1){
            //选取 type="radio" 的 元素
//             var radio = $(secTd).find(":radio");
            if($(secTd).find(":radio").length > 0){
                //用$(radio).find(":checked")无用可能是find的问题
                //含有radio的类型没有被选中
                if($(secTd).find(":radio:checked").length == 0){
                    layer.alert("请选取" + $(firstTd).text().substring(2,$(firstTd).text().length - 1), {icon : 0}, function (index){
                        layer.close(index);
                    });
                    return false;
                }
            }
            for(var j = 0; j < $(secTd).find("select").length; j++){
                if($(secTd).find("select:eq(" + j + ")").val() == -1){
                    layer.alert("请选取" + $(firstTd).text().substring(2,$(firstTd).text().length - 1), {icon : 0}, function (index){
                        layer.close(index);
                    });
                    return false;
                }
           }
            for(var j = 0; j < $(secTd).find(":text").length; j++){
                 if($(secTd).find(":text").eq(j).val() == ""){
                     layer.alert("请输入" + $(firstTd).text().substring(2,$(firstTd).text().length - 1), {icon : 0}, function (index){
                         layer.close(index);
                     });
                     return false;
                 }
            }
            //即使没有div,$(secTd).find("div").text() == ""也为true;
            if($(secTd).find("div").length > 0 && $(secTd).find("div").text() == ""){
                layer.alert("请输入" + $(firstTd).text().substring(2,$(firstTd).text().length - 1), {icon : 0}, function (index){
                    layer.close(index);
                });
                return false;
            }
            if($(secTd).find(":checkbox").length > 0){
                if($(secTd).find(":checkbox:checked").length == 0){
                    layer.alert("请选取" + $(firstTd).text().substring(2,$(firstTd).text().length - 1), {icon : 0}, function (index){
                        layer.close(index);
                    });
                    return false;
                }
            }
        }
    }
    return true;
}
</script>
</body>
</html>