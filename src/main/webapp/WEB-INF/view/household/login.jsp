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
<title>家长用户登录</title>
</head>
<body>
    <div style="background-color: #606060;height: 50px;">
    <div style="margin: 0 auto;width: 978px;">
        <div style="color: white;font-size: 20px;padding: 10px 0 0 0;">在线培训登记管理系统</div>
    </div>
    </div>
    <div style="margin: 0 auto;width: 978px;"><h2>家长用户</h2></div>
    <div style="margin: 0 auto;width: 978px;height: 479px;border: 1px solid #EAEAEA;box-shadow: 0px 0px 2px 2px #aaaaaa;">
        <div class="left">
            <h3>登录以管理您的帐号</h3>
            <p>要查看和修改您的帐户信息，请登录。如果您还没有帐号，您可以 <a href="/household/register">立即创建一个。</a>
            </p>
        </div>
        <div class="right">
            <h3>登录</h3>
            <form id="form">
            <input class="input" name="username" id="username" placeholder="您的用户名" value="jz"><br>
            <input class="input" type="password" name="password" id="password" placeholder="密码" value="2">
            </form>
            <div class="button-div"><input class="button blue" value="登录" type="button" onclick="login()"></div>
        </div>
    </div>
<script type="text/javascript">
function checkData(){
    if($("#username").val() == ""){
        layer.alert("请输入用户名", {icon : 0}, function (index){
            layer.close(index);
        });
        return false;
    }else if($("#password").val() == ""){
        layer.alert("请输入密码", {icon : 0}, function (index){
            layer.close(index);
        });
        return false;
    }
    return true;
}
function login(){
    if(checkData()){
        $.ajax({
            url: "/loginCheck",
            type: "post",
            data: {
                username: $("#username").val(),
                password: $.md5($("#password").val()),
                userType: 2
                
            },
            error: function (){
                layer.alert("服务器出错", {icon : 0}, function (index){
                    layer.close(index);
                });
            },
            success: function (result){
                if(result.code == 0){
                    layer.msg('登录成功', {
                        icon: 1,
                        time: 1000
                    }, function(){
                        location.href="/household/householdMain";
                    });
                }else{
                    layer.alert(result.msg, {icon : 0}, function (index){
                        layer.close(index);
                    });
                }
            }
        });
    }
}
</script>
</body>
</html>