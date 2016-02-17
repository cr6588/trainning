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
<title>教师注册</title>
<style type="text/css">
.xueliselect {
  height: 29px;
  border-radius: 4px;
  border: 1px solid #c0c0c0;
  margin-left: 10px;
}
.otherXueliSelect {
  margin-left: 0px;
  width: 257px;
  height: 29px;
  border-radius: 4px;
  border: 1px solid #c0c0c0;
}
</style>
</head>
<body>
    <div style="background-color: #606060;height: 50px;">
    <div style="margin: 0 auto;width: 978px;">
        <div style="color: white;font-size: 20px;padding: 10px 0 0 0;">在线培训登记管理系统</div>
    </div>
    </div>
    <div style="margin: 0 auto;width: 978px;"><h2>教师用户注册</h2></div>
    <div style="margin: 0 auto 50px auto;width: 978px;height: 1010px;border: 1px solid #EAEAEA;box-shadow: 0px 0px 2px 2px #aaaaaa;">
        <div class="left" style="height: 982px;">
            <h3>创建一个教师用户</h3>
            <p>教师用户能够发布更改删除查询课程信息等 。已有帐号？<a href="/teacher/login">立即登录。</a>
            </p>
        </div>
        <div class="right" style="height: 982px;">
            <h3>注册</h3>
            <form id="form" enctype="multipart/form-data">
                <table class="table-input">
                <tr>
                    <td style="width: 70px">用户名:</td>
                    <td><input id="username" class="input" name="username"></td>
                </tr>
                <tr>
                    <td>密码:</td>
                    <td><input type="password" class="input"  id="password" name="password"></td>
                </tr>
                <tr>
                    <td>确认密码:</td>
                    <td><input type="password" class="input"  id="conPassword" name="conPassword"></td>
                </tr>
                <tr>
                    <td>真实姓名:</td>
                    <td><input id="name" class="input" name="name"></td>
                </tr>
                <tr>
                    <td>性别:</td>
                    <td>
                        <input type="radio" name="sex" value="男">男
                        <input type="radio" name="sex" value="女">女
                    </td>
                </tr>
                <tr>
                    <td>身份:</td>
                    <td>
                        <input type="radio" name="shenfen" value="大学生">大学生
                        <input type="radio" name="shenfen" value="专业教师">专业教师
                        <input type="radio" name="shenfen" value="外教">外教
                        <input type="radio" name="shenfen" value="其他">其他
                    </td>
                </tr>
                <tr>
                <td>出生年月:</td>
                    <td><input id="birthday" name="birthday" onclick="laydate({istime: true, format: 'YYYY-MM-DD'})" class="input"></td>
                </tr>
                <tr>
                    <td>手机号码:</td>
                    <td><input id="phone" class="input"  name="phone">
                </tr>
                <tr>
                    <td>身份证号码:</td>
                    <td><input id="idCardNo" class="input"  name="idCardNo">
                </tr>
                <tr>
                    <td>上传头像:</td>
                    <td><input type="button" value="浏览" class="button white small" onclick="javascript:$('#uploadPictureFile').click()"></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="file" hidden="hidden" id="uploadPictureFile" name="uploadPictureFile" onchange="view(this,'uploadPictureImg');">
                        <div><img style="width: 182px;height: 182px;" id="uploadPictureImg" alt="" src=""></div>
                    </td>
                </tr>
                <tr>
                    <td>身份证附件:</td>
                    <td><input type="button" value="浏览" class="button white small" onclick="javascript:$('#idCardAttacheFile').click()"></td>
                    
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
                    <td><input type="button" value="提交" onclick="addObject();" class="button white medium"></td>
                </tr>
                </table>
            </form>
            </div>
        </div>
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
        htmlStr += "<td>院校名称:</td>";
        htmlStr += "<td><input class='input' name='shenfenAboutInfo' id='shenfenAboutInfo'>";
        htmlStr += "<select class='xueliselect' name='xueli'><option value='大专'>大专</option><option value='本科'>本科</option><option value='硕士'>硕士</option><option value='博士'>博士</option></select></td>";
        htmlStr += "</tr>";
    } else if(shenfenVal == "专业教师") {
        htmlStr += "<tr name='flag'>"
        htmlStr += "<td>任教学校:</td>";
        htmlStr += "<td><input class='input' name='shenfenAboutInfo' id='shenfenAboutInfo'><td>";
        htmlStr += "</tr>";
        htmlStr += "<tr name='flag'>"
        htmlStr += "<td>教龄:</td>";
        htmlStr += "<td><input class='input' name='eduAge' id='eduAge'>年<td>";
        htmlStr += "</tr>";
    } else if(shenfenVal == "外教") {
        htmlStr += "<tr name='flag'>"
            htmlStr += "<td>国家:</td>";
            htmlStr += "<td><input class='input' name='shenfenAboutInfo' id='shenfenAboutInfo'><td>";
            htmlStr += "</tr>";
    } else {
        htmlStr += "<tr name='flag'>"
        htmlStr += "<td>学历:</td>";
        htmlStr += "<td><select class='otherXueliSelect' name='xueli'><option value='大专'>大专</option><option value='本科'>本科</option><option value='硕士'>硕士</option><option value='博士'>博士</option></select></td>";
        htmlStr += "</tr>";
    }
    $(shenfenDiv).after(htmlStr);
})
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
    }else if($("input[name='shenfen']:checked").length == 0){
        layer.alert("请选择身份", {icon : 0}, function (index){
            layer.close(index);
        });
        return false;
    }else if($("#shenfenAboutInfo").length > 0 && $("#shenfenAboutInfo").val() == ""){
        layer.alert("请输入" + $("#shenfenAboutInfo").parent().prev().text(), {icon : 0}, function (index){
            layer.close(index);
        });
        return false;
    }else if($("#eduAge").length > 0 && $("#eduAge").val() == ""){
        layer.alert("请输入" + $("#eduAge").parent().prev().text(), {icon : 0}, function (index){
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
    }else if($("#uploadPictureFile").val() == ""){
        layer.alert("请上传头像", {icon : 0}, function (index){
            layer.close(index);
        });
        return false;
    }else if($("#idCardAttacheFile").val() == ""){
        layer.alert("请选择身份证附件", {icon : 0}, function (index){
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
        url: "/teacher/getTeacherByUsername",
        type: "post",
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
                url: "/teacher/addTeacher",
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
                            location.href="/teacher/login";
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