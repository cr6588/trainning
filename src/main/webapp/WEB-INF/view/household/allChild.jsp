<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/common.css">
<script type="text/javascript" src="/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/resources/js/layer/layer.js"></script>
<title>子女列表</title>
<script type="text/javascript">
var loadIndex = layer.load(1);
</script>
</head>
<body>
    <input type="hidden" id="teacherId" value="${loginHousehold.id }">
    <table class='table-info'>
        <tr>
            <th style="border-left-width:0px">姓名</th>
            <th>性别</th>
            <th>出生年月</th>
            <th>手机号码</th>
            <th class='two-operation-w'>操作</th>
        </tr>
        <c:forEach var="child" items="${childList }">
            <tr>
                <td class='ta-c'>${child.name }</td>
                <td class='ta-c'>${child.sex }</td>
                <td class='ta-c'>${child.birthday }</td>
                <td class='ta-c'>${child.phone }</td>
                <td class='ta-c'>
                    <input type="button" class="button white small" value="编辑" onclick="editObject(${child.id })" >
                    <input type="button" class="button white small" value="删除" onclick="deleteObject(${child.id })">
                </td>
            </tr>
        </c:forEach>
    </table>
<script type="text/javascript">
layer.close(loadIndex);
function editObject(id) {
    window.location.href = "/household/editChild?id=" + id;
}
function deleteObject(id) {
    layer.confirm('确定删除吗？', {icon: 4}, function(index){
        layer.close(index);
        $.post("/household/deleteChild", {id:id}, function (result) {
            if(result.code == 0){
                layer.msg("删除成功", {
                    icon: 1,
                    time: 1000
                },function (){
                    location.reload();
                });
            }else{
                layer.alert(result.msg, {icon: 0}, function (index){
                    layer.close(index);
                });
            }
        });
    })
}
</script>
</body>
</html>