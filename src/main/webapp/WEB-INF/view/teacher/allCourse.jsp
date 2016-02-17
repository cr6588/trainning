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
<title>已提交课程</title>
<style type="text/css">
.img-w100-h75 {
    width: 100px;
    height: 75px;
}
</style>
</head>
<body>
    <input type="hidden" id="teacherId" value="${loginTeacher.id }">
    <div id="dataDiv"></div>
    <div id="pageDiv"></div>
<script type="text/javascript">
var loadIndex = layer.load(1);
$.get('/getCourseByPage', {page: 1,teacherId:$("#teacherId").val(),courseStatus:1 }, function(res){ //从第1页开始请求。
    laypage({
        cont: 'pageDiv', //容器。值支持id名、原生dom对象，jquery对象。
        pages: res.pager.totalPage, //通过后台拿到的总页数
        skip: true, //是否开启跳页
        curr: 1, //初始化当前页
        jump: function(e){ //触发分页后的回调
            $.get('/getCourseByPage', {page: e.curr,teacherId:$("#teacherId").val(),courseStatus:1}, function(res){
                var view = $('#dataDiv'); //你也可以直接使用jquery
                var htmlStr = "";
                htmlStr += "<table class='table-info'>"
                htmlStr += "<tr>";
                htmlStr += "<th style='border-left-width: 0px;width:150px;'>标题</th>";
                htmlStr += "<th style='width:150px;'>类别</th>";
                htmlStr += "<th class='detailExpplain-w'>详细说明</th>";
                htmlStr += "<th class='time-w'>发布时间</th>";
                htmlStr += "<th class='personNum-w'>预约人数</th>";
                htmlStr += "<th class='three-operation-w'>操作</th>";
                htmlStr += "</tr>";
                for(var i = 0; i < res.rows.length; i++) {
                    htmlStr += "<tr>"
                    var item = res.rows[i];
                    htmlStr += "<td ><div class='detailExplainOverflowHidden'>"+ item.title +"</div></td>";
                    htmlStr += "<td ><div class='detailExplainOverflowHidden'>" + item.bigCourseType.bigCourseTypeName + "-" + item.courseType.courseTypeName + "-" + item.smallCourseType.smallCourseTypeName + "</div></td>";
                    htmlStr += "<td ><div class='detailExplainOverflowHidden'>" + item.detailExplain + "</div></td>";
                    htmlStr += "<td class='ta-c'>" + item.addTime.substr(0, 16) + "</td>";
                    if(item.personNum == null){
                        item.personNum = 0;
                    }
                    htmlStr += "<td class='ta-c'>" + item.personNum + "</td>";
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
    window.location.href = "/teacher/courseInfo?id=" + id;
}
function editObject(id) {
    window.location.href = "/teacher/editCourse?id=" + id;
}
function deleteObject(id) {
    layer.confirm('当你的课程有人预订时会自动向对方发送一条信息，确定删除吗？', {icon: 4}, function(index){
        layer.close(index);
        $.post("/deleteCourse", {id:id}, function (result) {
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