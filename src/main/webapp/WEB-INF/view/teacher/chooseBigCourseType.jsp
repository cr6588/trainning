<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>选择类别</title>
<style type="text/css">
a {
    color: #15c;
    cursor: pointer;
    text-decoration: none;
    font-size: 14px;
}
a:hover {
    color: #f00;
}
span {
    color: #585858;
    font-size: 12px;
}
cite {
    color: #ddd;
    padding: 0 5px 0 8px;
    font-style: normal;
}
</style>
</head>
<body>
    <c:forEach varStatus="status" items="${bigCourseTypeList }" var="bigCourseType">
        <c:if test="${status.count % 4 == 1 }">
            <div style="float: left; margin: 20px 0px 0px 60px;">
        </c:if>
        <h2><a href="/teacher/addCourse?bigCourseTypeId=${bigCourseType.id }">${bigCourseType.bigCourseTypeName }</a></h2>
        <c:if test="${bigCourseType.id == 1 || bigCourseType.id == 2 }">
            <span>
                <c:forEach items="${bigCourseType.courseTypeList[0].smallCourseTypeList }" var="smallCourseType">
                    ${smallCourseType.smallCourseTypeName }<cite>|</cite>
                </c:forEach>
            </span>
        </c:if>
        <c:if test="${bigCourseType.id != 1 && bigCourseType.id != 2 }">
            <span>
                <c:forEach items="${bigCourseType.courseTypeList }" var="courseType">
                    ${courseType.courseTypeName }<cite>|</cite>
                </c:forEach>
            </span>
        </c:if>
        <c:if test="${status.count % 4 == 0 }">
            </div>
        </c:if>
    </c:forEach>
</body>
</html>