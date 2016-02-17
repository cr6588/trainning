<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/teacher/login.css">
<link rel="stylesheet" href="/resources/css/common.css">
<script type="text/javascript" src="/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/resources/js/jquery/jquery.form.js"></script>
<script type="text/javascript" src="/resources/js/jquery/jquery.md5.js"></script>
<script type="text/javascript" src="/resources/js/layer/layer.js"></script>
<script type="text/javascript" src="/resources/js/laydate/laydate.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<title>家长注册</title>
</head>
<body>
    <div style="background-color: #606060;height: 50px;">
    <div style="margin: 0 auto;width: 978px;">
        <div style="color: white;font-size: 20px;padding: 10px 0 0 0;">在线培训登记管理系统</div>
    </div>
    </div>
    <div style="margin: 0 auto;width: 978px;"><h2>家长用户注册</h2></div>
    <div style="margin: 0 auto 50px auto;width: 978px;height: 680px;border: 1px solid #EAEAEA;box-shadow: 0px 0px 2px 2px #aaaaaa;">
        <div class="left" style="height: 651px;">
            <h3>创建一个家长用户</h3>
            <p>家长用户能够浏览搜索预订退订课程信息，管理自己的子女信息等。已有帐号？<a href="/household/login">立即登录。</a>
            </p>
        </div>
        <div class="right" style="height: 651px;">
            <h3>注册</h3>
                <form id="form" enctype="multipart/form-data">
                    <table class="table-input">
                    <tr>
                        <td></td>
                        <td><img style="width: 182px;height: 182px;" id="uploadPictureImg" alt="" src=""></td>
                    </tr>
                    <tr>
                        <td><label>上传头像:</label></td>
                        <td><input class="button white small" type="button" value="浏览" onclick="javascript:$('#uploadPictureFile').click()">
                        <input type="file" hidden="hidden" id="uploadPictureFile" name="uploadPictureFile" onchange="view(this,'uploadPictureImg');"></td>
                    </tr>
                    <tr>
                        <td><label for="username">用户名:</label></td>
                        <td><input class="input" id="username" name="username"></td>
                    </tr>
                    <tr>
                        <td><label for="password">密码:</label></td>
                        <td><input class="input" type="password" id="password" name="password"></td>
                    </tr>
                    <tr>
                        <td><label for="conPassword">确认密码:</label></td>
                        <td><input class="input" type="password" id="conPassword" name="conPassword"></td>
                    </tr>
                    <tr>
                        <td><label for="name">真实姓名:</label></td>
                        <td><input class="input" id="name" name="name"></td>
                    </tr>
                    <tr>
                        <td><label>性别:</label>
                        <td><input type="radio" name="sex" value="男">男
                        <input type="radio" name="sex" value="女">女</td>
                    </tr>
                    <tr>
                        <td><label for="birthday">出生年月:</label></td>
                        <td><input class="input" id="birthday" name="birthday" onclick="laydate({istime: true, format: 'YYYY-MM-DD'})"></td>
                    </tr>
                    <tr>
                        <td><label for="phone">手机号码:</label></td>
                        <td><input class="input" id="phone" name="phone"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="button" value="提交" onclick="addObject();" class="button white medium"></td>
                    </tr>
                    </table>
                </form>
                </div>
            </div>
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
    }else if($("input[name='sex']:checked").length == 0){
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
    }else if($("#uploadPictureFile").val() == ""){
        layer.alert("请上传头像", {icon : 0}, function (index){
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
        url: "/household/getHouseholdByUsername",
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
                url: "/household/addHousehold",
                type: "post",
                error: function(){
                    layer.alert("服务器出错", {icon : 0}, function (index){
                        layer.close(index);
                    });
                },
                success: function(result){
                    if(result.code == 0){
                        layer.msg("注册成功", {
                            icon: 1,
                            time: 1000
                        },function (){
                            location.href="/household/login";
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