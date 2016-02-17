<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
.home-page-table {
    margin: 0 auto;
}
.th {
  width: 208px;
  background-color: #606060;
  font-size: 13px;
  color: white;
  text-align: left;
  height: 36px;
  padding-left: 6px;
}
.td-div {
  width: 736px;
  padding-left: 20px;
}
.td-div a {
    display: block;
    font-size: 12px;
    color: rgb(102, 102, 102);
    padding-left: 17px;
    line-height: 22px;
    border-bottom: 1px dashed #cecece;
}
.td-div a:link {
    color:rgb(102, 102, 102);
    text-decoration:none;
}
.td-div a:visited {
    color:rgb(102, 102, 102);
    text-decoration:none;
}
.td-div a:hover {
    color: #08c;
    text-decoration:none;
}
.td-div a:active {
    color:black;
    text-decoration:none;
}
.user-entrance {
    border: 1px solid #cecece;
    border-collapse:collapse;
}
.user-entrance td{
    font-size: 12px;
    color: rgb(102, 102, 102);
    height: 30px;
}
.user-entrance a {
    font-size: 12px;
    color: rgb(102, 102, 102);
    padding-left: 17px;
}
.user-entrance a:link {
    color:rgb(102, 102, 102);
    text-decoration:none;
}
.user-entrance a:visited {
    color:rgb(102, 102, 102);
    text-decoration:none;
}
.user-entrance a:hover {
    color: #08c;
    text-decoration:none;
}
.user-entrance a:active {
    color:black;
    text-decoration:none;
}
.border-1 {
    border-bottom: 1px solid #cecece;
}
.border-2{
    border-bottom: 1px dashed #cecece;
}
.qqspan {
    background: url("/resources/images/pa45.gif");
    width: 21px;
    height: 21px;
    display: inline-block;
    margin-right: 8px;
}
.timespan{
    margin-left: 8px;
    margin-top: 8px;
    background: url("/resources/images/time.png");
    width: 27px;
    height: 27px;
    display: inline-block;
    margin-right: 8px;
}
.
.l-h{
    line-height: 21px;
}
.b {
    font-size: 15px;
}
.lianxispan{
    margin-left: 8px;
    margin-top: 8px;
    background: url("/resources/images/lianxifangshi.png");
    width: 27px;
    height: 27px;
    display: inline-block;
    margin-right: 8px;
}
.customer-pl{
    padding-left: 22px;
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
    <div style="margin: 0 auto;width: 978px;"><img src="/resources/images/ABUIABACGAAg0rvXpgUo_PWyqAUwwAc4wgM.jpg"style="width: 978px;"></div>
    <table class="home-page-table">
        <tr>
            <td>
                <table class="user-entrance">
                    <tr><th class="th">用户入口</th></tr>
                    <tr><td class="border-1"><a href="/teacher/login">教师用户入口</a></td></tr>
                    <tr><td class="border-1"><a href="/household/login">家长用户入口</a></td></tr>
                    <tr><td class="border-1"><a href="/admin/login">管理员用户入口</a></td></tr>
                </table>
            </td>
            <td rowspan="2" class="td-div" id="announceTd">
                <div class="border-1" style="color: #666;font-size: 14px;line-height: 40px;margin-bottom: 10px;  font-family: 宋体, 新宋体, sans-serif;"><b>系统简介</b></div>
                <div>
                    <span style="width: 420px;display: inline-block;font-size: 15px;line-height: 31px;font-family: 宋体, 新宋体, sans-serif;">&nbsp;&nbsp;本系统创办于2015年，以XX地区丰富的教育培训资源背景为强大的依托，以“一切为了求知者”为经营理念，致力于为XX地区广大的求知者提供全面、权威、有效、便捷的服务系统，力图为求知者排除求知路上的点滴困难，明确求知方向，让目标用户面对培训不再盲目，为求知者的美好未来保驾护航，成为求知者心目中的导航明灯，在教师与家长之间架起一座便捷之桥。<br>&nbsp;&nbsp;系统根据XX地区的教育培训行业市场……</span>
                    <span style=" width: 299px;display: inline-block;height: 200px;"><img alt="" src="/resources/images/3.jpg" style="width: 299px;height: 200px;"></span>
                </div>
                <div class="border-1" style="color: #666;font-size: 14px;line-height: 40px;margin-bottom: 10px;margin-top: 20px;font-family: 宋体, 新宋体, sans-serif;"><b>公告</b></div>
<!--                 <a href="">《新快报》：“一对一”补习是营养品？<span style="float: right;">2011-07-01</span></a> -->
<!--                 <a href="">《新快报》：“一对一”补习是营养品？<span style="float: right;">2011-07-01</span></a> -->
<!--                 <a href="">《新快报》：“一对一”补习是营养品？<span style="float: right;">2011-07-01</span></a> -->
<!--                 <a href="">《新快报》：“一对一”补习是营养品？<span style="float: right;">2011-07-01</span></a> -->
<!--                 <a href="" style="border-bottom-width: 0px">《新快报》：“一对一”补习是营养品？</a> -->

            </td>
        </tr>
        <tr>
            <td>
                <table class="user-entrance">
                    <tr><th class="th">在线客服</th></tr>
                    <tr><td><a class="l-h" href='http://wpa.qq.com/msgrd?v=3&uin=10000&site=qq&menu=yes' target='_blank'><span class="qqspan">&nbsp;</span>客服一</a></td></tr>
                    <tr><td class="border-2"><a class="l-h" href='http://wpa.qq.com/msgrd?v=3&uin=10000&site=qq&menu=yes' target='_blank'><span class="qqspan">&nbsp;</span>客服二</a></td></tr>
                    <tr><td style="line-height: 29px;"><span class="timespan">&nbsp;</span><b class="b">工作时间</b></td></tr>
                    <tr><td class="customer-pl">周一至周五：9:00-18:00</td></tr>
                    <tr><td class="border-2 customer-pl">周六至周日：9:00-17:00</td></tr>
                    <tr><td style="line-height: 29px;"><span class="lianxispan">&nbsp;</span><b class="b">联系方式</b></td></tr>
                    <tr><td class="customer-pl">陈先生：18200000000</td></tr>
                    <tr><td class="customer-pl">邮箱：aaaa@qq.com</td></tr>
                </table>
            </td>
        </tr>
    </table>
    <div style="height: 50px;text-align: center; padding-top: 10px;font-size: 12px">©2015 cheny 版权所有<br>E-mail:397838227@qq.com
    </div>
<script type="text/javascript">
$(function (){
    $.get("/admin/getAnnounceByPage", {page:1}, function (res){
        for(var i = 0; i < res.rows.length && i < 5; i++){
            var item = res.rows[i];
            $("#announceTd").append('<a href="/admin/announceInfoToAll?id=' + item.id + '">《' + item.title + '》：' + item.content + '<span style="float: right;">' + item.addTime.substr(0, 10) + '</span></a>');
        }
        $("#announceTd a:last").css("border-bottom-width", "0px");
    });
});
</script>
</body>
</html>
