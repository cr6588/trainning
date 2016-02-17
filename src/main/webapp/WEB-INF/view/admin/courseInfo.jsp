<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/common.css">
<script type="text/javascript" src="/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<title>课程信息</title>
</head>
<body>
    <div style="height: 280px;">
        <div class="fl">
            <img class='img-w182h182' src="${course.teacher.uploadPicture }">
        </div>
        <div class="fl">
            <table class="table">
                <tr>
                    <td colspan="2" class="td-title">${course.title }</td>
                </tr>
                <tr class="tr-teacher">
                    <td>${fn:substring(course.teacher.name, 0 ,1) }老师</td>
                    <td>(${course.teacher.sex })</td>
                </tr>
                <tr>
                    <td colspan="2" class="shenfenTdCol2">
                        <c:if test="${course.teacher.shenfen == '大学生' }">
                            ${course.teacher.shenfenAboutInfo }/${course.teacher.xueli }
                        </c:if>
                        <c:if test="${course.teacher.shenfen == '专业教师' }">
                            ${course.teacher.shenfenAboutInfo }/${course.teacher.eduAge }年教龄
                        </c:if>
                        <c:if test="${course.teacher.shenfen == '外教' }">
                            ${course.teacher.shenfenAboutInfo }老师
                        </c:if>
                        <c:if test="${course.teacher.shenfen == '其他' }">
                            ${course.teacher.xueli }
                        </c:if>
                    </td>
                </tr>
                <c:if test="${course.bigCourseTypeId == 1 || course.bigCourseTypeId == 2}">
                    <tr>
                        <td class="td-right">&nbsp;辅导阶段：</td>
                        <td class="courseTypeTd">${course.courseType.courseTypeName }</td>
                    </tr>
                    <tr>
                        <td class="td-right">&nbsp;辅导科目：</td>
                        <td>${course.smallCourseType.smallCourseTypeName }</td>
                    </tr>
                </c:if>
                <c:if test="${course.bigCourseTypeId == 1 }">
                    <tr>
                        <td class="td-right">&nbsp;家教经验：</td>
                        <td>${course.familyEducationExperience }</td>
                    </tr>
                </c:if>
                <c:if test="${course.bigCourseTypeId == 1 || course.bigCourseTypeId == 2}">
                <tr>
                    <td class="td-right">&nbsp;期望时薪：</td>
                    <td>${course.hourlyRateStart }—${course.hourlyRateEnd }元/时</td>
                </tr>
                </c:if>
                <c:if test="${course.bigCourseTypeId == 2  || course.bigCourseTypeId == 3 || course.bigCourseTypeId == 4 || course.bigCourseTypeId == 5 || course.bigCourseTypeId == 6 || course.bigCourseTypeId == 7 || course.bigCourseTypeId == 8}">
                    <tr>
                        <td class="td-right">&nbsp;授课人数：</td>
                        <td>${course.peopleNumStart }—${course.peopleNumEnd }人/班</td>
                    </tr>
                </c:if>
                <c:if test="${course.bigCourseTypeId == 3 || course.bigCourseTypeId == 4 || course.bigCourseTypeId == 5 || course.bigCourseTypeId == 6 || course.bigCourseTypeId == 7 }">
                    <tr>
                        <td class="td-right">&nbsp;类别：</td>
                        <td class="courseTypeTd">${course.courseType.courseTypeName }</td>
                    </tr>
        <!--                 小类有可能为空比如游泳中的小类 -->
                    <c:if test="${course.smallCourseType != null }">
                        <tr >
                            <td class="td-right">&nbsp;小类：</td>
                            <td>${course.smallCourseType.smallCourseTypeName }</td>
                        </tr>
                    </c:if>
                </c:if>
                <c:if test="${course.bigCourseTypeId == 8}">
                    <tr>
                        <td class="td-right">&nbsp;国家：</td>
                        <td class="courseTypeTd">${course.courseType.courseTypeName }</td>
                    </tr>
        <!--                 小类有可能为空比如游泳中的小类 -->
                    <c:if test="${course.smallCourseType != null }">
                        <tr >
                            <td class="td-right">&nbsp;小类：</td>
                            <td>${course.smallCourseType.smallCourseTypeName }</td>
                        </tr>
                    </c:if>
                </c:if>
                <c:if test="${course.bigCourseTypeId == 3 || course.bigCourseTypeId == 4}">
                    <tr>
                        <td class="td-right">&nbsp;对象：</td>
                        <td>${course.object }</td>
                    </tr>
                </c:if>
                <c:if test="${course.bigCourseTypeId == 5}">
                    <tr>
                        <td class="td-right">&nbsp;专项：</td>
                        <td>${course.special }</td>
                    </tr>
                </c:if>
                <c:if test="${course.bigCourseTypeId == 6 || course.bigCourseTypeId == 7}">
                    <tr>
                        <td class="td-right">&nbsp;形式：</td>
                        <td>${course.classType }</td>
                    </tr>
                </c:if>
                <c:if test="${course.bigCourseTypeId == 2 || course.bigCourseTypeId == 3 || course.bigCourseTypeId == 4 || course.bigCourseTypeId == 5 || course.bigCourseTypeId == 6 || course.bigCourseTypeId == 7 || course.bigCourseTypeId == 8}">
                    <tr>
                        <td class="td-right">&nbsp;详细地址：</td>
                        <td class="normal-area">
                            
                            <select name="sheng" id="sheng"></select>
                            <select name="shi" id="shi"></select>
                            <select name="xian" id="xian"></select>
                            ${course.detailAddress }<input id="detailAddress" name="detailAddress">
                        </td>
                    </tr>
                </c:if>
                <c:if test="${course.bigCourseTypeId == 2 || course.bigCourseTypeId == 3 || course.bigCourseTypeId == 4 || course.bigCourseTypeId == 5 || course.bigCourseTypeId == 6 || course.bigCourseTypeId == 7 || course.bigCourseTypeId == 8}">
                    <c:if test="${course.courseEnvirment != null && course.courseEnvirment != ''}">
                    <tr>
                        <td class="td-right">&nbsp;课程环境：</td>
                        <td><img style="width: 255px; height: 156px;" id="courseEnvirmentImg" alt="" src="${course.courseEnvirment }"></td>
                    </tr>
                    </c:if>
                </c:if>
                <c:if test="${course.bigCourseTypeId == 1 }">
                    <tr>
                        <td class="td-right">&nbsp;辅导区域：</td>
                        <td class="area"></td>
                    </tr>
                </c:if>
            </table>
            <c:if test="${fn:length(courseHouseholdChildList) > 0 }">
                <table>
                    <tr>
                        <th>参加人</th>
                        <th>电话</th>
                        <th>预约时间</th>
                    </tr>
                    <c:forEach items="${courseHouseholdChildList }" var="courseHouseholdChild">
                        <tr>
                            <td>${courseHouseholdChild.household.name }${courseHouseholdChild.child.name }</td>
                            <td>${courseHouseholdChild.household.phone }${courseHouseholdChild.child.phone }</td>
                            <td>${fn:substring(courseHouseholdChild.addTime, 0 ,16) }</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div>
    </div>
    <table class="table detailExplatinTable">
        <tr>
            <th class="intr_title">详细说明</th>
        </tr>
        <tr>
            <td><div id="detailExplain" class="" contenteditable="true">${course.detailExplain }</div></td>
        </tr>
    </table>
<script type="text/javascript">
if(!isUndefined($(".area")[0])) {
    htmlStr = "";
    for(var i = 0;i < shengArray.length; i++){
        if(shengArray[i].split(",")[1] == "${course.sheng }") {
            htmlStr += shengArray[i].split(",")[0] + "-";
            break;
        }
    }
    for(var i = 0;i < shiArray.length; i++){
        if(shiArray[i].split(",")[1] == "${course.shi }") {
            htmlStr += shiArray[i].split(",")[0] + " ";
            break;
        }
    }
    var xianStrArray = "${course.xian }".split(",");
    var count = 0;
    for(var i = 0;i < xianArray.length; i++){
        for(var j = 0; j < xianStrArray.length; j++){
            if(xianArray[i].split(",")[1] == xianStrArray[j]) {
                htmlStr += xianArray[i].split(",")[0] + " ";
                count++;
                break;
            }
        }
        if(count == xianStrArray.length){
            break;
        }
    }
    $(".area").html(htmlStr);
} else if (!isUndefined($(".normal-area")[0])) {
    htmlStr = "";
    for(var i = 0;i < shengArray.length; i++){
        if(shengArray[i].split(",")[1] == "${course.sheng }") {
            htmlStr += shengArray[i].split(",")[0] + "-";
            break;
        }
    }
    for(var i = 0;i < shiArray.length; i++){
        if(shiArray[i].split(",")[1] == "${course.shi }") {
            htmlStr += shiArray[i].split(",")[0] + "-";
            break;
        }
    }
    for(var i = 0;i < xian.length; i++){
        if(xianArray[i].split(",")[1] == "${course.xian }") {
            htmlStr += xian[i].split(",")[0] + " ";
            break;
        }
    }
    htmlStr += "${course.detailAddress}";
    $(".normal-area").html(htmlStr);
}
$("#preBook").click(function () {
    window.location.href="/household/preBook?id=${course.id}";
})
</script>
</body>
</html>