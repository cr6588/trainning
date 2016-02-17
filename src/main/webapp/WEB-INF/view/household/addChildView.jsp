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
<title>添加子女</title>
</head>
<body>
    <form>
        <input type="hidden" name="householdId" id="householdId" value="${loginHousehold.id }">
        <input type="hidden" name="addUser" id="addUser" value="${loginHousehold.username }">
        <table class="table-input">
            <tr>
                <td class="td-right w-100">姓名:</td>
                <td><input id="name" name="name"></td>
            </tr>
            <tr>
                <td class="td-right w-100">性别:</td>
                <td>
                    <input type="radio" name="sex" id="man" value="男">男
                    <input type="radio" name="sex" id="woman" value="女">女
                </td>
            </tr>
            <tr>
                <td class="td-right w-100">出生年月:</td>
                <td><input id="birthday" name="birthday" class="laydate-icon" onclick="laydate({istime: true, format: 'YYYY-MM-DD'})"></td>
            </tr>
            <tr>
                <td class="td-right w-100">手机号码:</td>
                <td><input id="phone" name="phone"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="button" value="提交" onclick="addObject();" class="button small white"></td>
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
    if($("#name").val() == ""){
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
    }
    return true;
}
function addObject(){
    if(checkData()){
        var option ={
                url: "/household/addChild",
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
                            location.href="/household/allChild";
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