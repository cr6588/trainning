<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/common.css">
<script type="text/javascript" src="/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/resources/js/layer/layer.js"></script>
<title>在线预约</title>
</head>
<body>
    <div>
        <p class="preBook-p1">您当前正在登记预约以下服务：</p>
        <div class="h25"><div class="preBook-p2 fl">${fn:substring(course.teacher.name, 0 ,1) }老师</div><div class="preBook-b1 fl">预约总数:${course.personNum }</div></div>
        <div><span  class="preBook-p3">服务名称：</span><span class="color-15c">${course.title }</span></div>
        <div class="preBook-p3">联系电话：<b class="color-e50">${course.teacher.phone }</b></div>
    </div>
    <div>
        <p  class="preBook-p4">选择人员: 
            <select name="join_person" id="join_person">
                <option value="h${loginHousehold.id }" selected="selected">${loginHousehold.name }</option>
                <c:forEach var="child" items="${childList }">
                    <option value="${child.id }">${child.name }</option>
                </c:forEach>
            </select>
        </p>
    </div>
    <input type="hidden" id="courseId" value="${course.id }">
    <div>
        <input type="button" value="确认并登记>" class="button orange bigrounded preBook-button" onclick="preBook()">
    </div>
<script type="text/javascript">
function preBook() {
    if($("#join_person").val().substr(0, 1) == "h"){
        $.post("/household/addCourseHouseholdChild", {
            courseId:$("#courseId").val(),
            householdId:$("#join_person").val().substr(1, $("#join_person").val().length - 1)
        }
        ,function (result){
            if(result.code == 0){
                layer.msg(result.msg, {
                    icon: 1,
                    time: 1000
                },function (){
                    window.location.href="/household/preBooked";
                });
            }else{
                layer.alert(result.msg, {icon : 0}, function (index){
                    layer.close(index);
                });
            }
        });
    }else{
        $.post("/household/addCourseHouseholdChild", {
            courseId:$("#courseId").val(),
            childId:$("#join_person").val()
        }
        ,function (result){
            if(result.code == 0){
                layer.msg(result.msg, {
                    icon: 1,
                    time: 1000
                },function (){
                    window.location.href="/household/preBooked";
                });
            }else{
                layer.alert(result.msg, {icon : 0}, function (index){
                    layer.close(index);
                });
            }
        });
    }
}
</script>
</body>
</html>