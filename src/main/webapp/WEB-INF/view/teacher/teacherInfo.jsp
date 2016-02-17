<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/common.css">
<script type="text/javascript" src="/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/resources/js/jquery/jquery.form.js"></script>
<script type="text/javascript" src="/resources/js/jquery/jquery.md5.js"></script>
<script type="text/javascript" src="/resources/js/layer/layer.js"></script>
<script type="text/javascript" src="/resources/js/laydate/laydate.js"></script>
<title>教师个人信息</title>
</head>
<body>
<form id="form" enctype="multipart/form-data">
    <input type="hidden" id="id" name="id" value="${loginTeacher.id }">
    <input type="hidden" name="status" value="0">
    <table class="table-input">
        <tr>
            <td class="td-right">用户名:</td>
            <td><input id="username" name="username" readonly="readonly">
                <c:if test="${loginTeacher.status == 0 }">审核中，当前不能提交课程</c:if>
                <c:if test="${loginTeacher.status == 1 }">审核通过，当前可以提交课程</c:if>
                <c:if test="${loginTeacher.status == 2 }">审核未通过，原因：${loginTeacher.failReason }</c:if>
                <c:if test="${loginTeacher.status == 3 }">你已被禁用</c:if>
            </td>
        </tr>
        <tr>
            <td class="td-right">真实姓名:</td>
            <td><input id="name" name="name" readonly="readonly"></td>
        </tr>
        <tr>
            <td class="td-right">性别:</td>
            <td>
                <input type="radio" name="sex" id="man" value="男"  disabled="disabled">男
                <input type="radio" name="sex" id="woman" value="女"  disabled="disabled">女
            </td>
        </tr>
        <tr>
            <td class="td-right">身份:</td>
            <td>
                <input type="radio" name="shenfen" value="大学生" disabled="disabled">大学生
                <input type="radio" name="shenfen" value="专业教师" disabled="disabled">专业教师
                <input type="radio" name="shenfen" value="外教" disabled="disabled">外教
                <input type="radio" name="shenfen" value="其他" disabled="disabled">其他
            </td>
        </tr>
        <tr>
            <td class="td-right">出生年月:</td>
            <td><input id="birthday" name="birthday" class="laydate-icon" readonly="readonly"></td>
        </tr>
        <tr>
            <td class="td-right">手机号码:</td>
            <td><input id="phone" name="phone"  readonly="readonly"></td>
        </tr>
        <tr>
            <td class="td-right">身份证号码:</td>
            <td><input id="idCardNo" name="idCardNo"  readonly="readonly"></td>
        </tr>
        <tr>
            <td class="td-right">上传头像:</td>
            <td><input type="button" value="浏览" class="button white small"hidden="hidden" name="scan" onclick="javascript:$('#uploadPictureFile').click()"></td>
            
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="file" hidden="hidden" id="uploadPictureFile" name="uploadPictureFile" onchange="view(this,'uploadPictureImg');">
                <div><img style="width: 182px;height: 182px;" id="uploadPictureImg" alt="" src=""></div>
            </td>
        </tr>
        <tr>
            <td class="td-right">身份证附件:</td>
            <td><input type="button" value="浏览" class="button white small" name="scan" hidden="hidden" onclick="javascript:$('#idCardAttacheFile').click()"></td>
           
        </tr>
        <tr>
            <td></td>
            <td>
                 <input type="file" hidden="hidden" id="idCardAttacheFile" name="idCardAttacheFile" onchange="view(this,'idCardAttacheImg');">
                <div><img style="width: 255px;height: 156px;" id="idCardAttacheImg" alt="" src=""></div>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <c:if test="${loginTeacher.status != 0 && loginTeacher.status != 3}">
                    <input type="button" value="编辑" id="edit" onclick="editObject();" class="button white medium">
                </c:if>
                <input type="button" value="提交" id="submit" hidden="hidden" onclick="addObject();" class="button white medium">
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript">
$("input[name='shenfen']").click(function () {
    if($("tr[name='flag']").length > 0) {
        $("tr[name='flag']").remove();
    }
    var shenfenVal = $("input[name='shenfen']:checked").val();
    var shenfenDiv = $("input[name='shenfen']").parents("tr");
    var htmlStr = "";
    if(shenfenVal == "大学生") {
        htmlStr += "<tr name='flag'>"
        htmlStr += "<td class='td-right'>院校名称:</td>";
        htmlStr += "<td><input name='shenfenAboutInfo' id='shenfenAboutInfo'></td>";
        htmlStr += "<td><select name='xueli'><option value='大专'>大专</option><option value='本科'>本科</option><option value='硕士'>硕士</option><option value='博士'>博士</option></select></td>";
        htmlStr += "</tr>";
    } else if(shenfenVal == "专业教师") {
        htmlStr += "<tr name='flag'>"
        htmlStr += "<td class='td-right'>任教学校:</td>";
        htmlStr += "<td><input name='shenfenAboutInfo' id='shenfenAboutInfo'><td>";
        htmlStr += "</tr>";
        htmlStr += "<tr name='flag'>"
        htmlStr += "<td class='td-right'>教龄:</td>";
        htmlStr += "<td><input name='eduAge' id='eduAge'>年<td>";
        htmlStr += "</tr>";
    } else if(shenfenVal == "外教") {
        htmlStr += "<tr name='flag'>"
        htmlStr += "<td class='td-right'>国家:</td>";
        htmlStr += "<td><input name='shenfenAboutInfo' id='shenfenAboutInfo'><td>";
        htmlStr += "</tr>";
    } else {
        htmlStr += "<tr name='flag'>"
        htmlStr += "<td class='td-right'>学历:</td>";
        htmlStr += "<td><select name='xueli'><option value='大专'>大专</option><option value='本科'>本科</option><option value='硕士'>硕士</option><option value='博士'>博士</option></select></td>";
        htmlStr += "</tr>";
    }
    $(shenfenDiv).after(htmlStr);
})
$(function (){
    $.post("/teacher/getTeacherById", {id:$("#id").val()} , function (result) {
        $("#username").val(result.username);
        $("#name").val(result.name);
        if(result.sex == "男"){
            $("#man").attr("checked",'checked');
        }else{
            $("#woman").attr("checked",'checked');
        }
        var shenfenDiv = $("input[name='shenfen']").parents("tr");
        var htmlStr = "";
        if(result.shenfen == "大学生") {
            $("input[name='shenfen']").eq(0).attr("checked",'checked');
            htmlStr += "<tr name='flag'>"
            htmlStr += "<td class='td-right'>院校名称:</td>";
            htmlStr += "<td><input readonly='readonly' name='shenfenAboutInfo' id='shenfenAboutInfo' value='" + result.shenfenAboutInfo + "'></td>";
            htmlStr += "<td><select readonly='readonly' name='xueli'><option value='大专'>大专</option><option value='本科'>本科</option><option value='硕士'>硕士</option><option value='博士'>博士</option></select></td>";
            htmlStr += "</tr>";
        }else if (result.shenfen == "专业教师") {
            $("input[name='shenfen']").eq(1).attr("checked",'checked');
            htmlStr += "<tr name='flag'>"
            htmlStr += "<td class='td-right'>任教学校:</td>";
            htmlStr += "<td><input readonly='readonly' name='shenfenAboutInfo' id='shenfenAboutInfo' value='" + result.shenfenAboutInfo + "'><td>";
            htmlStr += "</tr>";
            htmlStr += "<tr name='flag'>"
            htmlStr += "<td class='td-right'>教龄:</td>";
            htmlStr += "<td><input readonly='readonly' name='eduAge' id='eduAge' value='" + result.eduAge + "'>年<td>";
            htmlStr += "</tr>";
        }else if (result.shenfen == "外教") {
            $("input[name='shenfen']").eq(2).attr("checked",'checked');
            htmlStr += "<tr name='flag'>"
            htmlStr += "<td class='td-right'>国家:</td>";
            htmlStr += "<td><input readonly='readonly' name='shenfenAboutInfo' id='shenfenAboutInfo' value='" + result.shenfenAboutInfo + "'><td>";
            htmlStr += "</tr>";
        }else if (result.shenfen == "其他") {
            $("input[name='shenfen']").eq(3).attr("checked",'checked');
            htmlStr += "<tr name='flag'>"
            htmlStr += "<td class='td-right'>学历:</td>";
            htmlStr += "<td><select readonly='readonly' name='xueli'><option value='大专'>大专</option><option value='本科'>本科</option><option value='硕士'>硕士</option><option value='博士'>博士</option></select></td>";
            htmlStr += "</tr>";
        }
        $(shenfenDiv).after(htmlStr);
        if($("select[name='xueli']").length > 0) {
            for(var i = 0; i < $("select[name='xueli'] option").length; i++) {
                if($("select[name='xueli'] option").eq(i).val() == result.xueli) {
                    $("select[name='xueli'] option").eq(i).attr('selected', "selected");
                }
            }
        }
        $("#birthday").val(result.birthday);
        $("#phone").val(result.phone);
        $("#idCardNo").val(result.idCardNo);
        $("#uploadPictureImg").attr("src", result.uploadPicture  + "?&RAND_ID=" + Math.random());
        $("#idCardAttacheImg").attr("src", result.idCardAttache  + "?&RAND_ID=" + Math.random());
    })
});
function editObject() {
    layer.confirm("编辑之后需要重新审核，确定编辑吗？", {icon: 4}, function (index) {
        layer.close(index);
        $("#name").attr("readonly", false);
        $("input[name='sex']").attr("disabled", false);
        $("#birthday").attr("readonly", false);
        $("input[name='shenfen']").attr("disabled", false);
        $("tr[name='flag'] input").attr("readonly", false);
        $("tr[name='flag'] select").attr("readonly", false);
        $("#birthday").attr("onclick", "laydate({istime: true, format: 'YYYY-MM-DD'})");
        $("#phone").attr("readonly", false);
        $("#idCardNo").attr("readonly", false);
        $("input[name='scan']").show();
        $("#submit").show();
        $("#edit").hide();
    });
}
function view(obj, imgId){
    var src="";
    if(document.all){
        obj.select();
        src = document.selection.createRange().text;
        document.selection.empty();
    }else{
        var file=obj.files[0];
        src=window.createObjectURL&&window.createObjectURL(file)||window.URL&&window.URL.createObjectURL(file)||window.webkitURL && window.webkitURL.createObjectURL(file);
    }
    document.getElementById(imgId).src=src;
}
function isNotPhoneNo(phoneNo){
    if(!(/1[3|5|7|8|][0-9]{9}/.test(phoneNo))){ 
        return true; 
    }else{
        return false;
    }
}
function isNotCardNo(card)  {
    // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X  
    var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
    if(reg.test(card) == false)  {  
        return true;  
    }else{
        return false;
    }
 }
function checkData(){
    if($("#username").val() == ""){
        layer.alert("请填写用户名", {icon : 0}, function (index){
            layer.close(index);
        });
        return false;
    }else if($("#name").val() == ""){
        layer.alert("请输入真实姓名", {icon : 0}, function (index){
            layer.close(index);
        });
        return false;
    }else if($("#sex").val() == ""){
        layer.alert("请选择性别", {icon : 0}, function (index){
            layer.close(index);
        });
        return false;
    }else if($("#birthday").val() == ""){
        layer.alert("请选择出生年月", {icon : 0}, function (index){
            layer.close(index);
        });
        return false;
    }else if($("#phone").val() == ""){
        layer.alert("请填写手机号码", {icon : 0}, function (index){
            layer.close(index);
        });
        return false;
    }else if(isNotPhoneNo($("#phone").val())){
        layer.alert("不是完整的11位手机号或者正确的手机号前七位", {icon : 0}, function (index){
            layer.close(index);
        });
        return false;
    }else if($("#idCardNo").val() == ""){
        layer.alert("请填写身份证号码", {icon : 0}, function (index){
            layer.close(index);
        });
        return false;
    }else if(isNotCardNo($("#idCardNo").val())){
        layer.alert("身份证输入不合法", {icon : 0}, function (index){
            layer.close(index);
        });
        return false;
    }else if($("#uploadPictureImg").attr("src") == ""){
        layer.alert("请上传头像", {icon : 0}, function (index){
            layer.close(index);
        });
        return false;
    }else if($("#idCardAttacheImg").attr("src") == ""){
        layer.alert("请选择身份证附件", {icon : 0}, function (index){
            layer.close(index);
        });
        return false;
    }
    return true;
}
function addObject(){
    if(checkData()){
        var option ={
                url: "/teacher/updateTeacher",
                type: "post",
                error: function(){
                    layer.alert("服务器出错", {icon : 0}, function (index){
                        layer.close(index);
                    });
                },
                success: function(result){
                    if(result.code == 0){
                        layer.msg("修改成功", {
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
        $("#form").ajaxSubmit(option);
    }
}
</script>
</body>
</html>