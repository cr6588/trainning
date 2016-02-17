<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/teacher/login.css">
<script type="text/javascript" src="/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/resources/js/jquery/jquery.form.js"></script>
<script type="text/javascript" src="/resources/js/jquery/jquery.md5.js"></script>
<script type="text/javascript" src="/resources/js/layer/layer.js"></script>
<script type="text/javascript" src="/resources/js/laydate/laydate.js"></script>
<style type="text/css">
body {
    background-color: white;
}
</style>
<title>首页</title>
</head>
<body>
    <div style="background-color: #606060;height: 50px;">
    <div style="margin: 0 auto;width: 978px;">
        <div style="color: white;font-size: 20px;padding: 10px 0 0 0;">在线培训登记管理系统</div>
    </div>
    </div>
    <div style="margin: 0 auto;width: 978px;text-align: center;" class="table">
        <h2>${announce.title }</h2>
        <span>${fn:substring(announce.addTime, 0 ,16) }</span>
    </div>
    <div style="margin: 0 auto;width: 978px;text-align: center" id="contentDiv">
        <p>${announce.content }</p>
    </div>
    <div style="height: 50px;text-align: center; padding-top: 10px;font-size: 12px">©2015 cheny 版权所有<br>E-mail:397838227@qq.com
    </div>
</body>
</html>
