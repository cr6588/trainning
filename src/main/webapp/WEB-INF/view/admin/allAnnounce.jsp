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
<title>公告列表</title>
<style type="text/css">
.img-w100-h75 {
    width: 100px;
    height: 75px;
}
</style>
</head>
<body>
    <div id="dataDiv"></div>
    <div id="pageDiv"></div>
<script type="text/javascript">
var loadIndex = layer.load(1);
$.get('/admin/getAnnounceByPage', {page: 1 }, function(res){ //从第1页开始请求。
    laypage({
        cont: 'pageDiv', //容器。值支持id名、原生dom对象，jquery对象。
        pages: res.pager.totalPage, //通过后台拿到的总页数
        skip: true, //是否开启跳页
        curr: 1, //初始化当前页
        jump: function(e){ //触发分页后的回调
            $.get('/admin/getAnnounceByPage', {page: e.curr}, function(res){
                var view = $('#dataDiv'); //你也可以直接使用jquery
                var htmlStr = "";
                htmlStr += "<table class='messageTable' cellspacing='0' cellpadding='0'>";
                htmlStr += "<tr>";
                htmlStr += "<th style='width:135px;'>标题</th>";
                htmlStr += "<th>正文</th>";
                htmlStr += "<th style='width:115px;'>发布时间</th>";
                htmlStr += "<th style='width:161px;'>操作</th>";
                htmlStr += "</tr>";
                for(var i = 0; i < res.rows.length; i++) {
                    htmlStr += "<tr>"
                    var item = res.rows[i];
                    htmlStr += "<td>"+ item.title +"</td>";
                    htmlStr += "<td><div class='overTdHidden'>"+ item.content +"</div></td>";
                    htmlStr += "<td>" + item.addTime.substr(0, 16) + "</td>";
                    htmlStr += "<td><input type='button' class='button white small' value='查看' onclick='look(" + item.id + ")' ><input type='button' class='button white small' value='编辑' onclick='editObject(" + item.id + ")' ><input type='button' class='button white small' value='删除' onclick='deleteObject(" + item.id + ")'></td>";
                    htmlStr += "</tr>"
                }
                htmlStr += "</table>";
                layer.close(loadIndex);
                $(view).html(htmlStr);
            });
        }
    });
});
function look(id) {
    window.location.href = "/admin/announceInfo?id=" + id;
}
function editObject(id) {
    window.location.href = "/admin/editAnnounce?id=" + id;
}
function deleteObject(id) {
    layer.confirm('确定删除吗？', {icon: 4}, function(index){
        layer.close(index);
        $.post("/admin/deleteAnnounce", {id:id}, function (result) {
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
    });
}
</script>
</body>
</html>