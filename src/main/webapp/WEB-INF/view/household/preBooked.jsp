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
<title>已预约课程</title>
<style type="text/css">
.img-w100-h75 {
    width: 100px;
    height: 75px;
}
</style>
</head>
<body>
    <input type="hidden" id="householdId" value="${loginHousehold.id }">
    <div id="dataDiv"></div>
    <div id="pageDiv"></div>
<script type="text/javascript">
var loadIndex = layer.load(1);
$.post('/getCourseHouseholdChildByPage', {page: 1, householdId:$("#householdId").val() }, function(res){ //从第1页开始请求。
    laypage({
        cont: 'pageDiv', //容器。值支持id名、原生dom对象，jquery对象。
        pages: res.pager.totalPage, //通过后台拿到的总页数
        skip: true, //是否开启跳页
        curr: 1, //初始化当前页
        jump: function(e){ //触发分页后的回调
            $.post('/getCourseHouseholdChildByPage', {page: e.curr, householdId:$("#householdId").val()}, function(res){
                var view = $('#dataDiv'); //你也可以直接使用jquery
                var htmlStr = "";
                htmlStr += "<table class='table-info'>"
                htmlStr += "<tr>";
                htmlStr += "<th style='border-left-width:0px' class='title-w'>标题</th>";
//                 htmlStr += "<th>类别</th>";
                htmlStr += "<th class='teacher-w'>老师</th>";
                htmlStr += "<th class='phone-w'>老师电话</th>";
                htmlStr += "<th class='detailExpplain-w'>详细说明</th>";
                htmlStr += "<th class='time-w'>预约时间</th>";
                htmlStr += "<th class='joinPerson-w'>参加人</th>";
                htmlStr += "<th class='phone-w'>参加人电话</th>";
                htmlStr += "<th class='three-operation-w'>操作</th>";
                htmlStr += "</tr>";
                for(var i = 0; i < res.rows.length; i++) {
                    htmlStr += "<tr>"
                    var item = res.rows[i];
                    htmlStr += "<td>"+ item.course.title +"</td>";
//                     htmlStr += "<td>" + item.course.bigCourseType.bigCourseTypeName + "-" + item.course.courseType.courseTypeName + "-" + item.course.smallCourseType.smallCourseTypeName + "</td>";
                    htmlStr += "<td class='ta-c'>" + item.course.teacher.name.substr(0, 1) + "老师</td>";
                    htmlStr += "<td>" + item.course.teacher.phone + "</td>";
                    htmlStr += "<td>" + item.course.detailExplain + "</td>";
                    htmlStr += "<td>" + item.addTime.substr(0, 16) + "</td>";
                    if(item.household != null){
                        htmlStr += "<td class='ta-c'>" + item.household.name + "</td>";
                        htmlStr += "<td>" + item.household.phone + "</td>";
                    }else{
                        htmlStr += "<td class='ta-c'>" + item.child.name + "</td>";
                        htmlStr += "<td>" + item.child.phone + "</td>";
                    }
                    htmlStr += "<td><input type='button' class='button white small' value='查看' onclick='look(" + item.id + ")' ><input type='button' class='button white small' value='编辑' onclick='editObject(" + item.id + ")' ><input type='button' class='button white small' value='退订' onclick='deleteObject(" + item.id + ")'></td>";
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
    window.location.href = "/household/preBookedCourseInfo?id=" + id;
}
function editObject(id) {
    window.location.href = "/household/editPreBooked?id=" + id;
}
function deleteObject(id) {
    layer.confirm('确定退订吗？', {icon: 4}, function(index){
        layer.close(index);
        $.post("/household/deleteCourseHouseholdChild", {id:id}, function (result) {
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