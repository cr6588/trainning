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
<title>修改密码</title>
</head>
<body>
<form>
    <input type="hidden" value="${loginHousehold.id }" id="id" name="id">
    <table class="table-input">
    <tr>
        <td class="td-right w-100"><label for="oldPassword">原密码：</label></td>
        <td><input type="password" id="oldPassword" name="oldPassword"></td>
    </tr>
    <tr>
        <td class="td-right w-100"><label for="password">新密码：</label></td><td><input type="password" id="password" name="password"></td>
    </tr>
    <tr>
        <td class="td-right w-100"><label for="conPassword">确认密码：</label></td><td><input type="password" id="conPassword" name="conPassword"></td>
    </tr>
    <tr>
        <td></td>
        <td><input type="button" value="确认修改" class="button white medium"></td>
    </tr>
    </table>
</form>
    <script type="text/javascript">
    function checkData(){
        if($("#oldPassword").val() == ""){
            layer.alert("请输入原密码", {icon : 0}, function (index){
                layer.close(index);
            });
            return false;
        }else if($("#password").val() == ""){
            layer.alert("请输入新密码", {icon : 0}, function (index){
                layer.close(index);
            });
            return false;
        }else if($("#conPassword").val() == ""){
            layer.alert("请输入确认密码", {icon : 0}, function (index){
                layer.close(index);
            });
            return false;
        }else if($("#password").val() != $("#conPassword").val()){
            layer.alert("2次密码输入不一致", {icon : 0}, function (index){
                layer.close(index);
            });
            return false;
        }
    return true;
    }
    $(".button").click(function (){
        if(checkData()){
            $("#oldPassword").val($.md5($("#oldPassword").val()));
            $("#password").val($.md5($("#password").val()));
            var option = {
                url: "/household/updatePassword",
                type: "post",
                data:{
                    pd:$("#oldPassword").val()
                },
                success: function(result){
                    if(result.code == 0){
                        layer.msg("修改成功",{ 
                            icon: 1, 
                            time: 1000
                        }, function (){
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
    })
    </script>
</body>
</html>