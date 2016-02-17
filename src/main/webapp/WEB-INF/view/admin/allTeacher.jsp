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
<title>教师列表</title>
</head>
<body>
    <div id="dataDiv"></div>
    <div id="pageDiv"></div>
<script type="text/javascript">
var loadIndex = layer.load(1);
$.post('/admin/getTeacherByPage', {page: 1 }, function(res){ //从第1页开始请求。
    laypage({
        cont: 'pageDiv', //容器。值支持id名、原生dom对象，jquery对象。
        pages: res.pager.totalPage, //通过后台拿到的总页数
        skip: true, //是否开启跳页
        curr: 1, //初始化当前页
        jump: function(e){ //触发分页后的回调
            $.post('/admin/getTeacherByPage', {page: e.curr}, function(res){
                var view = $('#dataDiv'); //你也可以直接使用jquery
                var htmlStr = "";
                htmlStr += "<table class='table-info'>"
                htmlStr += "<tr>";
                htmlStr += "<th style='border-left-width:0px' class='no-w'>编号</th>";
                htmlStr += "<th class='id-w'>用户ID</th>";
                htmlStr += "<th>用户名</th>";
                htmlStr += "<th>真实姓名</th>";
                htmlStr += "<th>性别</th>";
                htmlStr += "<th>身份</th>";
                htmlStr += "<th>出生日期</th>";
                htmlStr += "<th class='phone-w'>电话号码</th>";
                htmlStr += "<th class='time-w'>添加时间</th>";
                htmlStr += "<th class='time-w'>修改时间</th>";
                htmlStr += "<th>修改者</th>";
                htmlStr += "<th>状态</th>";
                htmlStr += "<th style='width: 131px;'>操作</th>";
                htmlStr += "</tr>";
                for(var i = 0; i < res.rows.length; i++) {
                    htmlStr += "<tr>"
                    var item = res.rows[i];
                    htmlStr += "<td class='ta-c'>"+ (i+1) +"</td>";
                    htmlStr += "<td class='ta-c'>"+ item.id +"</td>";
                    htmlStr += "<td class='ta-c'>"+ item.username +"</td>";
                    htmlStr += "<td class='ta-c'>" + item.name + "</td>";
                    htmlStr += "<td class='ta-c'>" + item.sex + "</td>";
                    htmlStr += "<td class='ta-c'>" + item.shenfen + "</td>";
                    htmlStr += "<td>" + item.birthday + "</td>";
                    htmlStr += "<td>" + item.phone + "</td>";
                    htmlStr += "<td>" + item.addTime.substr(0, 16) + "</td>";
                    if(item.updateTime != "" && item.updateTime != null) {
                        htmlStr += "<td>" + item.updateTime.substr(0, 16) + "</td>";
                    } else {
                        htmlStr += "<td></td>";
                    }
                    if(item.updateUser != "" && item.updateUser != null) {
                        htmlStr += "<td>" + item.updateUser + "</td>";
                    } else {
                        htmlStr += "<td></td>";
                    }
                    switch (item.status) {
                        case 0:
                            htmlStr += "<td>未审核</td>";
                            break;
                        case 1:
                            htmlStr += "<td>审核通过</td>";
                            break;
                        case 2:
                            htmlStr += "<td>审核未通过</td>";
                            break;
                        case 3:
                            htmlStr += "<td>被禁用</td>";
                            break;
                        default:
                            htmlStr += "<td></td>";
                            break;
                    }
                    htmlStr += "<td>";
                    if(item.status != 3) {
                        htmlStr += "<input type='button' class='button white small' value='禁止使用' onclick='stopUse(" + item.id + ")' >";
                    } else {
                    htmlStr += "<input type='button' class='button white small' value='恢复使用' onclick='recoverUse(" + item.id + ")' >";
                    }
                    htmlStr += "<input type='button' class='button white small' value='删除' onclick='deleteObject(" + item.id + ")'></td>";
                    htmlStr += "</tr>"
                }
                htmlStr += "</table>";
                layer.close(loadIndex);
                $(view).html(htmlStr);
            });
        }
    });
});
function stopUse(id) {
    layer.confirm('确定禁止该用户使用吗？', {icon: 4}, function(index){
        layer.close(index);
        $.post("/admin/updateTeacherStatus", {id: id, status: 3}, function (result) {
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
function recoverUse(id) {
    layer.confirm('确定恢复该用户使用吗？', {icon: 4}, function(index){
        layer.close(index);
        $.post("/admin/updateTeacherStatus", {id: id, status: 0}, function (result) {
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
    layer.confirm('确定删除该用户吗？', {icon: 4}, function(index){
        layer.close(index);
        $.post("/admin/deleteTeacher", {id:id}, function (result) {
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