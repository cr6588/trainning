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
<title>添加管理员</title>
</head>
<body>
    <form>
        <table class="table-input">
            <tr>
                <td class="td-right w-100">用户名:</td>
                <td><input id="username" name="username"></td>
            </tr>
            <tr>
                <td class="td-right w-100">真实姓名:</td>
                <td><input id="name" name="name"></td>
            </tr>
            <tr>
                <td class="td-right w-100">密码:</td>
                <td><input type="password" id="password" name="password"></td>
            </tr>
            <tr>
                <td class="td-right w-100">确认密码:</td>
                <td><input type="password" id="conPassword" name="conPassword"></td>
            </tr>
            <tr>
                <td class="td-right w-100">手机号码:</td>
                <td><input id="phone" name="phone"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="button" value="提交" onclick="addObject();" class="button white small"></td>
            </tr>
        </table>
    </form>
<script type="text/javascript">
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
    }else if($("#password").val() == ""){
        layer.alert("请填写密码", {icon : 0}, function (index){
            layer.close(index);
        });
        return false;
    }else if($("#password").val() != $("#conPassword").val()){
        layer.alert("2次密码输入不一致", {icon : 0}, function (index){
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
    }else if(haveUsername()){
        layer.alert("用户名已存在请重新输入", {icon : 0}, function (index){
            layer.close(index);
        });
        return false;
    }
    return true;
}
function haveUsername(){
    var bol = false;
    $.ajax({
        url: "/admin/getAdminByUsername",
        type: "POST",
        async: false,
        data: {username:$("#username").val()},
        success: function (result){
            if(result != null && result != ""){
                //不能直接在$.ajax里使用return ture;
                bol = true;
            }
        }
    });
    return bol;
}
function addObject(){
    if(checkData()){
        $("#password").val($.md5($("#password").val()));
        var option ={
                url: "/admin/addAdmin",
                type: "post",
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
                            location.href="/admin/allAdmin";
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
</script>
</body>
</html>