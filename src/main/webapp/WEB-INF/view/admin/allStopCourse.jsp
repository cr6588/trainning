<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/common.css">
<script type="text/javascript" src="/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/resources/js/jquery/jquery.form.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/layer/layer.js"></script>
<script type="text/javascript" src="/resources/js/laypage/laypage.js"></script>
<title>课程浏览</title>
<style type="text/css">
.course-scan-table {
}
.course-scan-table td {
    height: 90px;
    padding: 0px;
    border-bottom: solid #e5e5e5 1px;
}
.t2 {
    font-size: 12px;
    color: #585858;
}
.t2 a {
    text-decoration: none;
    font-size: 17px;
}
.t2 a:hover {
    text-decoration: underline;
    font-size: 17px;
    color: #e50;
}
.t2 div {
    padding-left: 6px;
}
.t2 div div {
    padding-left: 6px;
}
.phoneTd {
    font: 700 14px/14px Arial;
    color: #e50;
}
.t3 {
    font-size: 12px;
    color: #585858;
    text-align: center;
}
.fl {
    float: left;
}
</style>
</head>
<body onload="displayInfo()">
    <table id="selectTable" class="select-table">
        <tr>
            <td class="td-right secitem w-92">标题：</td>
            <td><div class='fl'><input name="title" id="title"></div><div class='fl'><input type="button" value="搜索 " class="button white small" onclick="displayInfo()"></div></td>
            <td></td>
        </tr>
        <tr>
            <td id="bigCourseTypeTd" class="td-right">大类：</td>
        </tr>
        <tr>
            <td class="td-right">老师身份：</td>
            <td>
                <input type="radio" name="shenfen" value="大学生" onclick="displayInfo()">大学生
                <input type="radio" name="shenfen" value="专业教师" onclick="displayInfo()">专业教师
                <input type="radio" name="shenfen" value="外教" onclick="displayInfo()">外教
                <input type="radio" name="shenfen" value="其他" onclick="displayInfo()">其他
            </td>
        </tr>
        <tr>
            <td id="courseTypeTd" class="td-right"></td>
            <td></td>
        </tr>
        <tr>
            <td id="smallCourseTypeTd" class="td-right"></td>
            <td class="w848"></td>
        </tr>
    </table>
    <div id="dataDiv"></div>
    <div id="pageDiv"></div>
<script type="text/javascript">
var loadIndex = layer.load(1);
$.post("/getAllBigCourseType",function (result) {
    var htmlStr = "";
    htmlStr += "<td>";
    for(var i = 0; i < result.length; i++){
        htmlStr += "<input type='radio' value='" + result[i].id +"' name='bigCourseTypeId' onclick='clickBigCourseType(" + result[i].id +")'>" + result[i].bigCourseTypeName;
    }
    htmlStr += "</td>";
    $("#bigCourseTypeTd").after(htmlStr);
});
function clickBigCourseType(bigCourseTypeId) {
    //将小类先置为空字符串
    $("#smallCourseTypeTd").text("");
    $("#smallCourseTypeTd").next().html("");
    //设置类别
    $.post("/getCourseTypeByBigCourseTypeId", {bigCourseTypeId: bigCourseTypeId}, function (result) {
        if(bigCourseTypeId == 1 || bigCourseTypeId == 2) {
            var courseTypeHtmlStr = "";
            for(var i = 0; i < result.length; i++){
                courseTypeHtmlStr += "<input type='radio' value='" + result[i].id +"' name='courseTypeId' onclick='clickCourseType(" + result[i].id +")'>" + result[i].courseTypeName;
            }
            $("#courseTypeTd").text("辅导阶段：");
            $("#courseTypeTd").next().html(courseTypeHtmlStr);
            var smallCourseTypeHtmlStr = "";
            for(var i = 0; i < result[0].smallCourseTypeList.length; i++){
                smallCourseTypeHtmlStr += "<input type='radio' value='" + result[0].smallCourseTypeList[i].id +"' name='smallCourseTypeId' onclick='clickSmallCourseType(" + result[0].smallCourseTypeList[i].id +")'>" + result[0].smallCourseTypeList[i].smallCourseTypeName;
            }
            $("#smallCourseTypeTd").text("辅导科目：");
            $("#smallCourseTypeTd").next().html(smallCourseTypeHtmlStr);
        } else {
            var courseTypeHtmlStr = "";
            for(var i = 0; i < result.length; i++){
                courseTypeHtmlStr += "<input type='radio' value='" + result[i].id +"' name='courseTypeId' onclick='clickCourseType(" + result[i].id +")'>" + result[i].courseTypeName;
            }
            if(bigCourseTypeId != 8) {
                $("#courseTypeTd").text("类别：");
            } else {
                $("#courseTypeTd").text("国家：");
            }
            $("#courseTypeTd").next().html(courseTypeHtmlStr);
        }
    });
    //设置区域
    if($("tr[name='areaTr']").length > 0) {
        $("tr[name='areaTr']").remove();
    }
    if(bigCourseTypeId == 1) {
        var htmlStr = "";
        htmlStr += '<tr name="areaTr">';
        htmlStr += '<td class="td-right">辅导区域：</td>';
        htmlStr += '<td class="area ">';
        htmlStr += '<select name="sheng" class="address-select" onchange="displayInfo()"></select>';
        htmlStr += '<select name="shi" class="address-select" onchange="displayInfo()"></select>';
        htmlStr += '</td>';
        htmlStr += '</tr>';
        htmlStr += '<tr name="areaTr">';
        htmlStr += '<td></td>';
        htmlStr += '<td>';
        htmlStr += '<div></div>';
        htmlStr += '</td>';
        htmlStr += '</tr>';
        $("#selectTable").append(htmlStr);
    } else {
        var htmlStr = "";
        htmlStr += '<tr name="areaTr">';
        htmlStr += '<td class="td-right">详细地址：</td>';
        htmlStr += '<td class="normal-area">';
        htmlStr += '<select name="sheng" class="address-select" id="sheng"  onchange="displayInfo()"></select>';
        htmlStr += '<select name="shi" class="address-select" id="shi" onchange="displayInfo()"></select>';
        htmlStr += '<select name="xian" class="address-select" id="xian" onchange="displayInfo()"></select>';
        htmlStr += '</td>';
        htmlStr += '</tr>';
        $("#selectTable").append(htmlStr);
    }
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
                    for(var i = 0; i < xianArray.length; i++){
                        var xianCode = xianArray[i].split(",")[1].substr(0, 4);
                        if(shiCode == xianCode){
                            $(xian).append("<input type='checkbox' onclick='displayInfo()' name='xian' value='" + xianArray[i].split(",")[1] + "'>"  + xianArray[i].split(",")[0]);
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
                $(xian)[0].options.add(new Option("请选择","-1"));
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
    displayInfo();
}
function clickCourseType(courseTypeId) {
    //7以上才是第3类
    if(courseTypeId >= 7) {
        $.post("/getSmallCourseTypeByCourseTypeId", {courseTypeId: courseTypeId}, function (result) {
            var smallCourseTypeHtmlStr = "";
            for(var i = 0; i < result.length; i++){
                smallCourseTypeHtmlStr += "<input type='radio' value='" + result[i].id +"' name='smallCourseTypeId' onclick='clickSmallCourseType(" + result[i].id +")'>" + result[i].smallCourseTypeName;
            }
            if(courseTypeId < 31){
                $("#smallCourseTypeTd").text("小类：");
            }else {
                $("#smallCourseTypeTd").text("申请学历：");
            }
            $("#smallCourseTypeTd").next().html(smallCourseTypeHtmlStr);
        });
    }
    displayInfo();
}
function clickSmallCourseType(){
    displayInfo();
}
function displayInfo() {
    var sheng;
    var shi;
    if($("select[name='sheng']").val() != "-1"){
        sheng = $("select[name='sheng']").val();
    }
    if($("select[name='shi']").val() != "-1"){
        shi = $("select[name='shi']").val();
    }
    //区域是复选框时
    var xian;
    if(!isUndefined($(".area")[0])){
        if($("input[name=xian]:checked").length > 0){
            xian = "";
            $("input[name=xian]:checked").each(function () {
                xian += $(this).val() + ",";
            })
            xian = xian.substr(0, xian.length - 1);
        }
    }
    //区域是含有3个select时
    if(!isUndefined($(".normal-area")[0])){
        if($("select[name='xian']").val() != "-1"){
            xian = $("select[name='xian']").val();
        }
    }
    $.get('/getCourseByPage', {page: 1,
        bigCourseTypeId: $("input[name='bigCourseTypeId']:checked").val(),
        courseTypeId: $("input[name='courseTypeId']:checked").val(),
        smallCourseTypeId: $("input[name='smallCourseTypeId']:checked").val(),
        sheng:sheng,
        shi:shi,
        xian:xian,
        shenfen:$("input[name='shenfen']:checked").val(),
        title:$("#title").val(),
        courseStatus:0
    }, function(res){ //从第1页开始请求。
        laypage({
            cont: 'pageDiv', //容器。值支持id名、原生dom对象，jquery对象。
            pages: res.pager.totalPage, //通过后台拿到的总页数
            skip: true, //是否开启跳页
            curr: 1, //初始化当前页
            jump: function(e){ //触发分页后的回调
                $.get('/getCourseByPage', {page: e.curr,
                    bigCourseTypeId: $("input[name='bigCourseTypeId']:checked").val(),
                    courseTypeId: $("input[name='courseTypeId']:checked").val(),
                    smallCourseTypeId: $("input[name='smallCourseTypeId']:checked").val(),
                    sheng:sheng,
                    shi:shi,
                    xian:xian,
                    shenfen:$("input[name='shenfen']:checked").val(),
                    title:$("#title").val(),
                    courseStatus:0
                }, function(res){
                    var view = $('#dataDiv'); //你也可以直接使用jquery
                    var htmlStr = "";
                    htmlStr += "<table class='course-scan-table'>"
                    for(var i = 0; i < res.rows.length; i++) {
                        htmlStr += "<tr>"
                        var item = res.rows[i];
                        htmlStr += "<td class='w-60'><img class='course-teacher-uploadpicture' src='"+ item.teacher.uploadPicture +"?&RAND_ID=" + Math.random() +"'></td>";
                        htmlStr += "<td class='t2'><div><a href='/admin/courseInfo?id=" + item.id + "'>【" + item.teacher.name.substr(0,1) + "老师】" + item.title + "</a><br><div>" + item.detailExplain + "<br>" + displayTeacherShenfen(item.teacher);
                        htmlStr += "<br>" + item.bigCourseType.bigCourseTypeName + "-" + item.courseType.courseTypeName + "-" + item.smallCourseType.smallCourseTypeName + "</div></div></td>";
                        htmlStr += "<td class='phoneTd phone-w'>" + item.teacher.phone + "</td>";
                        htmlStr += "<td class='t3 time-w'>" + item.addTime.substr(0, 16) + "</td>";
                        if(item.personNum == null){
                            item.personNum = 0;
                        }
                        htmlStr += "<td class='t3'>" + item.personNum + "人预约</td>";
                        htmlStr += "</tr>"
                    }
                    htmlStr += "</table>";
                    layer.close(loadIndex);
                    $(view).html(htmlStr);
                });
            }
        });
    });
}
function displayTeacherShenfen(teacher) {
    var shenfenVal = teacher.shenfen;
    if(shenfenVal == "大学生") {
        return teacher.shenfenAboutInfo + '/' + teacher.xueli;
    } else if(shenfenVal == "专业教师") {
        return teacher.shenfenAboutInfo + '/' + teacher.eduAge + '年教龄';
    } else if(shenfenVal == "外教") {
        return teacher.shenfenAboutInfo + '教师';
    } else {
        return teacher.xueli;
    }
}
</script>
</body>
</html>