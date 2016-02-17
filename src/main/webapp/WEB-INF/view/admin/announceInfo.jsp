<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/js/jquery/jquery-1.10.2.js"></script>
<title>信息详情</title>
<style type="text/css">
.table {
    background-color: #F2F4F6;
    border-collapse:collapse;
    width: 1063px;
}
.table th {
    padding: 14px 8px 5px 14px;
    font-size: 14px;
    border-bottom:1px solid #c1c8d2;
}
.table td {
    font-size: 12px;
    color: #7a8f99;
      padding-top: 10px;
}
.tl {
    text-align: left;
}
.tr {
    text-align: right;
}
.pl-13 {
    padding-left: 13px;
}
.pb-13{
    padding-bottom: 13px;
}
.w48 {
    width: 48px;
}
#contentDiv {
    padding: 15px 15px 10px 15px;
    font-size: 14px;
}
</style>
</head>
<body>
    <table class="table">
        <tr>
            <th colspan="2" class="tl">${announce.title }</th>
        </tr>
        <tr>
            <td class="tr pl-13 w48">发布人：</td>
            <td class="tl">
                ${announce.addUser }
            </td>
        </tr>
        <tr>
            <td class="tr pl-13 pb-13 w48">时&nbsp;间：</td>
            <td class="tl pb-13">${fn:substring(announce.addTime, 0 ,16) }</td>
        </tr>
    </table>
    <div id="contentDiv">${announce.content }</div>
</body>
</html>