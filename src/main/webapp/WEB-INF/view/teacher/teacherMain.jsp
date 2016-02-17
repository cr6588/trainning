<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/mainPage.css">
<script type="text/javascript" src="/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/resources/js/mainPage.js"></script>
<title>教师主页</title>
<script type="text/javascript">
$(function (){
    $(".dl dt").click(function (){
        $(this).next().slideToggle("slow");
        $(this).next().next().slideToggle("slow");
        var href = $(this).next().next().next().find("a").attr("href");
        if(href == "/message/allMessage"){
            $(this).next().next().next().slideToggle("slow");
        }
    });
})
</script>
</head>
<body>
    <div style="background-color: #606060; height: 50px;">
        <div style="margin: 0 auto;width: 960px;">
            <div style="color: white; font-size: 20px; padding: 10px 0 0 0;">在线培训登记管理系统<div style="float: right;  font-size: 14px;padding: 5px 0px 0px 0px;">欢迎你：${loginTeacher.username }</div></div>
        </div>
    </div>
    <div style="height: 700px">
        <div style="height: 100%;width: 15%;float: left;">
            <dl class="dl">
                <dt>课程管理</dt>
                <dd><a class="menu-a" href="/teacher/chooseBigCourseType" target="detail_frame">提交课程</a></dd>
                <dd><a class="menu-a" href="/teacher/allCourse" target="detail_frame">已提交课程</a></dd>
                <dt>个人管理</dt>
                <dd><a class="menu-a" href="/teacher/teacherInfo" target="detail_frame">个人信息</a></dd>
                <dd><a class="menu-a" href="/teacher/updatePasswordView" target="detail_frame">修改密码</a></dd>
                <dt>消息管理<b class="messageNumB"></b></dt>
                <dd><a class="menu-a" href="/message/addMessage" target="detail_frame">发送信息</a></dd>
                <dd><a class="menu-a" href="/message/sentMessage" target="detail_frame">已发送</a></dd>
                <dd><a class="menu-a" href="/message/allMessage" target="detail_frame">消息列表</a><b class="messageNumB"></b></dd>
                <dt><a class="menu-a" href="/loginOut?userType=1">退出</a></dt>
            </dl>
        </div>
        <div style="height: 100%;width: 85%;float: left;">
            <iframe name="detail_frame" class="iframe"></iframe>
        </div>
    </div>
<script type="text/javascript">
$.post("/getUnreadMessageNum",{
    getUserId: ${loginTeacher.id },
    getUserType: 1
    }, function (result){
        if(result != null && result != ""){
            $(".messageNumB").text("(" + result + ")");
        }
    })
</script>
</body>
</html>