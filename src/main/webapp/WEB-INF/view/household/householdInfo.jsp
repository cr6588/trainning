<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>家长个人信息</title>
</head>
<body>
<form id="form" enctype="multipart/form-data">
    <input type="hidden" id="id" name="id" value="${loginHousehold.id }">
    <table class="table-input">
        <tr>
            <td class="w-60"><label for="username">用户名:</label></td>
            <td><input id="username" name="username" readonly="readonly"></td>
        </tr>
        <tr>
            <td><label for="name">真实姓名:</label></td>
            <td><input id="name" name="name" readonly="readonly"></td>
        </tr>
        <tr>
            <td><label>性别:</label></td>
            <td><input type="radio" name="sex" id="man" value="男" disabled="disabled">男
            <input type="radio" name="sex" id="woman" value="女" disabled="disabled">女</td>
        </tr>
        <tr>
            <td><label for="birthday">出生年月:</label></td>
            <td><input id="birthday" name="birthday" class="laydate-icon" readonly="readonly"></td>
        </tr>
        <tr>
            <td><label for="phone">手机号码:</label></td>
            <td><input id="phone" name="phone"  readonly="readonly"></td>
        </tr>
        <tr>
            <td></td>
            <td><div><img style="width: 182px;height: 182px;" id="uploadPictureImg" alt="" src=""></div></td>
        </tr>
        <tr>
            <td><label>上传头像:</label></td>
            <td><input type="button" value="浏览" hidden="hidden" name="scan" onclick="javascript:$('#uploadPictureFile').click()" class="button white small">
            <input type="file" hidden="hidden" id="uploadPictureFile" name="uploadPictureFile" onchange="view(this,'uploadPictureImg');"></td>
        </tr>
        <tr>
            <td><input type="hidden" name="status" value="0"></td>
            <td><input type="button" value="编辑" id="edit" onclick="editObject();" class="button white medium">
            <input type="button" value="提交" id="submit" hidden="hidden" onclick="addObject();" class="button white medium"></td>
        </tr>
    </table>
</form>
<script type="text/javascript">
$(function (){
    $.post("/household/getHouseholdById", {id:$("#id").val()} , function (result) {
        $("#username").val(result.username);
        $("#name").val(result.name);
        if(result.sex == "男"){
            $("#man").attr("checked",'checked');
        }else{
            $("#woman").attr("checked",'checked');
        }
        $("#birthday").val(result.birthday);
        $("#phone").val(result.phone);
        $("#uploadPictureImg").attr("src", result.uploadPicture  + "?&RAND_ID=" + Math.random());
    })
});
function editObject() {
    $("#name").attr("readonly", false);
    $("#man").attr("readonly", false);
    $("#woman").attr("readonly", false);
    $("#birthday").attr("readonly", false);
    $("input[name='sex']").attr("disabled", false);
    $("#birthday").attr("onclick", "laydate({istime: true, format: 'YYYY-MM-DD'})");
    $("#phone").attr("readonly", false);
    $("input[name='scan']").show();
    $("#submit").show();
    $("#edit").hide();
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
    }else if($("#uploadPictureImg").attr("src") == ""){
        layer.alert("请上传头像", {icon : 0}, function (index){
            layer.close(index);
        });
        return false;
    }
    return true;
}
function addObject(){
    if(checkData()){
        var option ={
                url: "/household/updateHousehold",
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