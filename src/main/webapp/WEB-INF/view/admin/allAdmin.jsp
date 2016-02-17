<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/common.css">
<script type="text/javascript" src="/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/resources/js/laypage/laypage.js"></script>
<script type="text/javascript" src="/resources/js/layer/layer.js"></script>
<title>所有管理员</title>
</head>
<body>
    <div id="dataDiv"></div>
    <div id="pageDiv"></div>
<script type="text/javascript">
var loadIndex = layer.load(1);
$.get('/admin/getAdminByPage', {page: 1 }, function(res){ //从第1页开始请求。
    laypage({
        cont: 'pageDiv', //容器。值支持id名、原生dom对象，jquery对象。
        pages: res.pager.totalPage, //通过后台拿到的总页数
        skip: true, //是否开启跳页
        curr: 1, //初始化当前页
        jump: function(e){ //触发分页后的回调
            $.get('/admin/getAdminByPage', {page: e.curr}, function(res){
                var view = $('#dataDiv'); //你也可以直接使用jquery
                var htmlStr = "";
                htmlStr += "<table class='table-info'>"
                htmlStr += "<tr>";
                htmlStr += "<th style='border-left-width: 0px;'>用户名</th>";
                htmlStr += "<th>真实姓名</th>";
                htmlStr += "<th>电话号码</th>";
                htmlStr += "<th>添加时间</th>";
                htmlStr += "<th style='width: 131px;'>操作</th>";
                htmlStr += "</tr>";
                for(var i = 0; i < res.rows.length; i++) {
                    htmlStr += "<tr>"
                    var item = res.rows[i];
                    htmlStr += "<td class='ta-c'>"+ item.username +"</td>";
                    htmlStr += "<td class='ta-c'>" + item.name + "</td>";
                    htmlStr += "<td class='ta-c'>" + item.phone + "</td>";
                    htmlStr += "<td class='ta-c'>" + item.addTime.substr(0, 16) + "</td>";
                    htmlStr += "<td class='ta-c'><input type='button' class='button white small' value='重置密码' onclick='resetPassword(" + item.id + ")' ><input type='button' class='button white small' value='删除' onclick='deleteObject(" + item.id + ")'></td>";
                    htmlStr += "</tr>"
                }
                htmlStr += "</table>";
                layer.close(loadIndex);
                $(view).html(htmlStr);
            });
        }
    });
});
function resetPassword(id) {
    layer.confirm('确定重置吗？', {icon: 4}, function(index){
        layer.close(index);
        $.post("/admin/resetAdminPassword", {id:id}, function (result) {
            if(result.code == 0){
                layer.msg(result.msg, {
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
function deleteObject(id) {
    layer.confirm('确定删除吗？', {icon: 4}, function(index){
        layer.close(index);
        $.post("/admin/deleteAdmin", {id:id}, function (result) {
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