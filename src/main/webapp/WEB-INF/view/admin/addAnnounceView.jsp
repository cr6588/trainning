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
<title>发布公告</title>
</head>
<body>
<form>
<c:if test="${loginAdmin != null}">
    <input type="hidden" name="addUser" id="addUser" value="${loginAdmin.username }">
</c:if>
<table class="table-input">
    <tr>
        <td class="w-50 td-right">标题：</td>
        <td><input name="title" id="title"></td>
    </tr>
    <tr>
        <td class="w-50 td-right">正文：</td>
        <td><div id="content" contenteditable="true" class="textarea-div" ></div></td>
    </tr>
    <tr>
        <td></td>
        <td><input type="button" value="发布" id="send" class="button white small"></td>
    </tr>
</table>
</form>
<script type="text/javascript">
function checkData(){
    if($("#title").val() == ""){
        layer.alert("请填写标题", {icon : 0}, function (index){
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
                url: "/admin/addAnnounce",
                type: "post",
                data:{content:$("#content").text()},
                success:function (result) {
                    if(result.code == 0){
                        layer.msg(result.msg, {
                            icon: 1,
                            time: 1000
                        },function (){
                            location.href="/admin/allAnnounce";
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