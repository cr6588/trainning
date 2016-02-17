<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/mainPage.css">
<script type="text/javascript" src="/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/resources/js/mainPage.js"></script>
<title>管理员主页</title>
<script type="text/javascript">
$(function (){
    $(".dl dt").click(function (){
        if($(this).next("dd").length > 0) {
            $(this).next().slideToggle("slow");
            $(this).next().next().slideToggle("slow");
            var href = $(this).next().next().next().find("a").attr("href");
            if( href == "/admin/courseInfoCount" || href == "/message/allMessage"){
                $(this).next().next().next().slideToggle("slow");
            }
        }
    });
})
</script>
</head>
<body>
    <div style="background-color: #606060; height: 50px;">
        <div style="margin: 0 auto; width: 978px;">
            <div style="color: white; font-size: 20px; padding: 10px 0 0 0;">在线培训登记管理系统<div style="float: right;  font-size: 14px;padding: 5px 0px 0px 0px;">管理员：${loginAdmin.username }</div></div>
        </div>
    </div>
    <div style="height: 700px">
        <div style="height: 100%;width: 15%;float: left;">
            <dl class="dl">
            <c:if test="${loginAdmin.username == 'administrator' }">
                <dt>管理员管理</dt>
                <dd><a class="menu-a" href="/admin/addAdminView" target="detail_frame">添加管理员</a></dd>
                <dd><a class="menu-a" href="/admin/allAdmin" target="detail_frame">管理员列表</a></dd>
            </c:if>
                <dt>课程管理</dt>
                <dd><a class="menu-a" href="/admin/courseScan" target="detail_frame">课程浏览</a></dd>
                <dd><a class="menu-a" href="/admin/allStopCourse" target="detail_frame">已禁止课程</a></dd>
                <dt>教师用户管理</dt>
                <dd><a class="menu-a" href="/admin/teacherExamine" target="detail_frame">教师审核</a></dd>
                <dd><a class="menu-a" href="/admin/allTeacher" target="detail_frame">教师列表</a></dd>
            <c:if test="${loginAdmin.username != 'administrator' }">
                <dt>个人管理</dt>
                <dd><a class="menu-a" href="/admin/adminInfo" target="detail_frame">个人信息</a></dd>
                <dd><a class="menu-a" href="/admin/updatePasswordView" target="detail_frame">修改密码</a></dd>
            </c:if>
                <dt>消息管理<b class="messageNumB"></b></dt>
                <dd><a class="menu-a" href="/message/addMessage" target="detail_frame">发送信息</a></dd>
                <dd><a class="menu-a" href="/message/sentMessage" target="detail_frame">已发送</a></dd>
                <dd><a class="menu-a" href="/message/allMessage" target="detail_frame">消息列表</a><b class="messageNumB"></b></dd>
            <c:if test="${loginAdmin.username == 'administrator' }">
                <dt><a class="menu-a" href="/admin/updatePasswordView" target="detail_frame">修改密码</a></dt>
            </c:if>
                <dt>数据统计</dt>
                <dd><a class="menu-a" href="/admin/teacherUserCount" target="detail_frame">教师用户统计</a></dd>
                <dd><a class="menu-a" href="/admin/householdUserCount" target="detail_frame">家长用户统计</a></dd>
                <dd><a class="menu-a" href="/admin/courseInfoCount" target="detail_frame">课程信息统计</a></dd>
                <dt>公告管理</dt>
                <dd><a class="menu-a" href="/admin/addAnnounceView" target="detail_frame">发布公告</a></dd>
                <dd><a class="menu-a" href="/admin/allAnnounce" target="detail_frame">公告列表</a></dd>
                <dt><a class="menu-a" href="/loginOut?userType=3">退出</a></dt>
            </dl>
        </div>
        <div style="height: 100%;width: 85%;float: left;">
            <iframe name="detail_frame" class="iframe"></iframe>
        </div>
    </div>
<script type="text/javascript">
var getUserId;
if(${loginAdmin.username == 'administrator'}){
    getUserId = 0;
} else {
    getUserId = "${loginAdmin.id }";
}
$.post("/getUnreadMessageNum",{
    getUserId: getUserId,
    getUserType: 3
    }, function (result){
        if(result != null && result != ""){
            $(".messageNumB").text("(" + result + ")");
        }
    })
</script>
</body>
</html>