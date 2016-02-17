<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/common.css">
<script type="text/javascript" src="/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/resources/js/jquery/jquery.form.js"></script>
<script type="text/javascript" src="/resources/js/laypage/laypage.js"></script>
<script type="text/javascript" src="/resources/js/layer/layer.js"></script>
<title>发送信息</title>
</head>
<body>
<form>
<c:if test="${loginAdmin != null}">
    <input type="hidden" name="sendUserId" <c:if test="${loginAdmin.username == 'administrator' }">value="0"</c:if> <c:if test="${loginAdmin.username != 'administrator' }">value="${loginAdmin.id }"</c:if> >
    <input type="hidden" name="sendUserUsername" value="${loginAdmin.username }">
    <input type="hidden" name="sendUserType" id="sendUserType" value="3">
</c:if>
<c:if test="${loginTeacher != null}">
    <input type="hidden" name="sendUserId" value="${loginTeacher.id }" >
    <input type="hidden" name="sendUserUsername" value="${loginTeacher.username }">
    <input type="hidden" name="sendUserType" id="sendUserType" value="1">
</c:if>
<c:if test="${loginHousehold != null}">
    <input type="hidden" name="sendUserId" value="${loginHousehold.id }" >
    <input type="hidden" name="sendUserUsername" value="${loginHousehold.username }">
    <input type="hidden" name="sendUserType" id="sendUserType" value="2">
</c:if>
<table class="table-input">
    <tr>
        <td class="w-50 td-right">收件人：</td>
        <td>
            <input id="getUserUsername" name="getUserUsername">
            <select id="getUserType" name="getUserType">
                <option selected="selected" value="1">教师用户</option>
                <option value="2">家长用户</option>
                <option value="3">管理员</option>
            </select>
        </td>
    </tr>
    <tr>
        <td class="w-50 td-right">主题：</td>
        <td><input name="title" id="title"></td>
    </tr>
    <tr>
        <td class="w-50 td-right">正文：</td>
        <td><div id="content" contenteditable="true" class="textarea-div" ></div></td>
    </tr>
    <tr>
        <td colspan="2"><input type="button" value="发送" id="send" class="button white small"></td>
    </tr>
</table>
</form>
<script type="text/javascript">
$("#getUserType").change(function (){
    if($("#getUserType").val() == 3 && $("#sendUserType").val() != 3){
        $("#getUserUsername").hide();
    } else {
        $("#getUserUsername").show();
    }
});
function checkData(){
    if($("#getUserUsername").val() == "" && !$("#getUserUsername").is(":hidden")){
        layer.alert("请填写收件人", {icon : 0}, function (index){
            layer.close(index);
        });
        return false;
    }else if($("#title").val() == ""){
        layer.alert("请填写主题", {icon : 0}, function (index){
            layer.close(index);
        });
        return false;
    }else if($("#content").text() == ""){
        layer.alert("请填写正文", {icon : 0}, function (index){
            layer.close(index);
        });
        return false;
    }
    return true;
}
$("#send").click( function () {
    if(checkData()){
        var option = {
                url: "/addMessage",
                type: "post",
                data:{content:$("#content").text()},
                success:function (result) {
                    if(result.code == 0){
                        layer.msg(result.msg, {
                            icon: 1,
                            time: 1000
                        },function (){
                            location.href="/message/allMessage";
                        });
                    } else {
                        layer.alert(result.msg, {icon : 0}, function (index){
                            layer.close(index);
                        });
                    }
                }
        }
        $("form").ajaxSubmit(option);
    }
});
</script>
</body>
</html>