<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
<title>管理员个人信息</title>
</head>
<body>
<form id="form">
    <input type="hidden" id="id" name="id" value="${loginAdmin.id }">
    <table class="table-input">
    <tr>
        <td class="td-right w-100"><label for="username">用户名:</label></td>
        <td><input id="username" name="username" readonly="readonly"></td>
    </tr>
    <tr>
        <td class="td-right w-100"><label for="name">真实姓名:</label></td>
        <td><input id="name" name="name" readonly="readonly"></td>
    </tr>
    <tr>
        <td class="td-right w-100"><label for="phone">手机号码:</label></td>
        <td><input id="phone" name="phone"  readonly="readonly"></td>
    </tr>
    <tr>
    <td><input type="hidden" name="status" value="0"></td>
    <td><input type="button" value="编辑" id="edit" onclick="editObject();" class="button small white">
    <input type="button" value="提交" id="submit" hidden="hidden" onclick="addObject();" class="button small white"></td>
    </tr>
    </table>
</form>
<script type="text/javascript">
$(function (){
    $.post("/admin/getAdminById", {id:$("#id").val()} , function (result) {
        $("#username").val(result.username);
        $("#name").val(result.name);
        $("#phone").val(result.phone);
    })
});
function editObject() {
    $("#name").attr("readonly", false);
    $("#phone").attr("readonly", false);
    $("#submit").show();
    $("#edit").hide();
}
function isNotPhoneNo(phoneNo){
    if(!(/1[3|5|7|8|][0-9]{9}/.test(phoneNo))){ 
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
    }
    return true;
}
function addObject(){
    if(checkData()){
        var option ={
                url: "/admin/updateAdmin",
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