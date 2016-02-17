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
<title>添加课程</title>
</head>
<body>
    <form enctype="multipart/form-data">
        <input type="hidden" name="bigCourseTypeId" id="bigCourseTypeId" value="${bigCourseTypeId }">
        <input type="hidden" name="teacherId" id="teacherId" value="${loginTeacher.id }">
        <input type="hidden" name="addUser" id="addUser" value="${loginTeacher.username }">
        <table class="table-input">
            <c:if test="${bigCourseTypeId == 1 || bigCourseTypeId == 2}">
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
                <td><input name="title" id="title"></td>
            </tr>
            <c:if test="${bigCourseTypeId == 1 }">
                <tr>
                    <td class="td-right"><b class="red">*</b>&nbsp;家教经验：</td>
                    <td>
                        <input type="radio" name="familyEducationExperience" value="有">有
                        <input type="radio" name="familyEducationExperience" value="无">无
                    </td>
                </tr>
            </c:if>
            <c:if test="${bigCourseTypeId == 1  || bigCourseTypeId == 2}">
            <tr>
                <td class="td-right"><b class="red">*</b>&nbsp;期望时薪：</td>
                <td><input name="hourlyRateStart">—<input name="hourlyRateEnd">元/时</td>
            </tr>
            </c:if>
            <c:if test="${bigCourseTypeId == 2  || bigCourseTypeId == 3 || bigCourseTypeId == 4 || bigCourseTypeId == 5 || bigCourseTypeId == 6 || bigCourseTypeId == 7 || bigCourseTypeId == 8}">
                <tr>
                    <td class="td-right"><b class="red">*</b>&nbsp;授课人数：</td>
                    <td><input name="peopleNumStart">—<input name="peopleNumEnd">人/班</td>
                </tr>
            </c:if>
            <c:if test="${bigCourseTypeId == 3 || bigCourseTypeId == 4 || bigCourseTypeId == 5 || bigCourseTypeId == 6 || bigCourseTypeId == 7 }">
                <tr>
                    <td class="td-right"><b class="red">*</b>&nbsp;类别：</td>
                    <td class="courseTypeTd">
                        <select name="courseTypeId">
                            <option value="-1">请选择</option>
                        </select>
                    </td>
                </tr>
<!--                 小类有可能为空比如游泳中的小类 -->
                <tr hidden="hidden">
                    <td class="td-right"><b class="red">*</b>&nbsp;小类：</td>
                    <td></td>
                </tr>
            </c:if>
            <c:if test="${bigCourseTypeId == 8}">
                <tr>
                    <td class="td-right"><b class="red">*</b>&nbsp;国家：</td>
                    <td class="courseTypeTd">
                        <select name="courseTypeId">
                            <option value="-1">请选择</option>
                        </select>
                    </td>
                </tr>
<!--                 小类有可能为空比如游泳中的小类 -->
                <tr hidden="hidden">
                    <td class="td-right"><b class="red">*</b>&nbsp;申请学历：</td>
                    <td></td>
                </tr>
            </c:if>
            <c:if test="${bigCourseTypeId == 3 || bigCourseTypeId == 4}">
                <tr>
                    <td class="td-right">&nbsp;对象：</td>
                    <td><input type="radio" name="object" value="少儿/幼儿">少儿/幼儿<input type="radio" name="object" value="成人">成人<input type="radio" name="object" value="女子">女子<input type="radio" name="object" value="男士">男士</td>
                </tr>
            </c:if>
            <c:if test="${bigCourseTypeId == 5}">
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
            <c:if test="${bigCourseTypeId == 6 || bigCourseTypeId == 7}">
                <tr>
                    <td class="td-right"><b class="red">*</b>&nbsp;形式：</td>
                    <td>
                        <input type="radio" name="classType" value="脱产班">脱产班
                        <input type="radio" name="classType" value="脱产班">寒暑假班
                        <input type="radio" name="classType" value="周末班">周末班
                        <input type="radio" name="classType" value="工作日班">工作日班
                        <input type="radio" name="classType" value="网络班">网络班
                    </td>
                </tr>
            </c:if>
            <c:if test="${bigCourseTypeId == 2 || bigCourseTypeId == 3 || bigCourseTypeId == 4 || bigCourseTypeId == 5 || bigCourseTypeId == 6 || bigCourseTypeId == 7 || bigCourseTypeId == 8}">
                <tr>
                    <td class="td-right"><b class="red">*</b>&nbsp;详细地址：</td>
                    <td class="normal-area">
                        <select name="sheng" id="sheng"></select>
                        <select name="shi" id="shi"></select>
                        <select name="xian" id="xian"></select>
                        <input id="detailAddress" name="detailAddress">
                    </td>
                </tr>
            </c:if>
            <c:if test="${bigCourseTypeId == 2 || bigCourseTypeId == 3 || bigCourseTypeId == 4 || bigCourseTypeId == 5 || bigCourseTypeId == 6 || bigCourseTypeId == 7 || bigCourseTypeId == 8}">
                <tr>
                    <td class="td-right">&nbsp;课程环境：</td>
                    <td>
                        <input type="button" value="浏览" onclick="javascript:$('#courseEnvirmentFile').click()" class="button white small">
                        <input type="file" hidden="hidden" id="courseEnvirmentFile" name="courseEnvirmentFile" onchange="view(this,'courseEnvirmentImg');">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><img style="width: 255px; height: 156px;" id="courseEnvirmentImg" alt="" src=""></td>
                </tr>
            </c:if>
            <tr>
                <td class="td-right"><b class="red">*</b>&nbsp;详细说明：</td>
                <td><div id="detailExplain" class="textarea-div" contenteditable="true"></div></td>
            </tr>
            <c:if test="${bigCourseTypeId == 1 }">
                <tr>
                    <td class="td-right"><b class="red">*</b>&nbsp;辅导区域：</td>
                    <td class="area">
                        <select name="sheng"></select>
                        <select name="shi"></select>
                    </td>
                </tr>
                <tr class="h-50">
                    <td class="td-right"><label hidden="hidden"><b class="red">*</b>&nbsp;辅导区域：</label></td>
                    <td>
                        <div></div>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td></td>
                <td><input type="button" value="发布信息" onclick="addObject();" class="button white medium"></td>
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
for(var i = 0; i < shengArray.length; i++){
    if(!isUndefined($(".area")[0])){
        $(".area select:eq(0)")[0].options.add(new Option(shengArray[i].split(",")[0],shengArray[i].split(",")[1]));
    }
    if(!isUndefined($(".normal-area")[0])){
        $(".normal-area select:eq(0)")[0].options.add(new Option(shengArray[i].split(",")[0],shengArray[i].split(",")[1]));
    }
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
                        $(smallCourseTypeTd).append("<input type='radio' name='smallCourseTypeId' value=" + smallCourseType.id + ">" + smallCourseType.smallCourseTypeName);
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
        $(courseTypeTd).append("<input type='radio' name='courseTypeId' value=" + courseType.id + ">" + courseType.courseTypeName);
    }
    for(var i = 0; i < courseTypeArray[0].smallCourseTypeList.length; i++){
        var smallCourseType = courseTypeArray[0].smallCourseTypeList[i];
        $(smallCourseTypeTd).append("<input type='radio' name='smallCourseTypeId' value=" + smallCourseType.id + ">" + smallCourseType.smallCourseTypeName);
    }
}
function addObject(){
    if(checkData()){
        var option ={
                url: "/addCourse",
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
                        layer.msg("添加成功", {
                            icon: 1,
                            time: 1000
                        },function (){
                            window.location.href="/teacher/allCourse";
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
    if(${loginTeacher.status != 1}) {
        layer.alert("请先通过审核之后再提交课程", {icon : 0}, function (index){
            layer.close(index);
        });
        return false;
    }
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