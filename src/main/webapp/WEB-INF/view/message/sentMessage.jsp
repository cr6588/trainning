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
<title>已发送</title>
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
var data = {};
var sendUserId;
var sendUserType;
if(${loginHousehold != null}){
    sendUserId = "${loginHousehold.id}";
    sendUserType = 2;
}else if(${loginTeacher != null}){
    sendUserId = "${loginTeacher.id}";
    sendUserType = 1;
}else if(${loginAdmin != null}){
    if(${loginAdmin.username == 'administrator'}){
        sendUserId = 0;
    }else{
        sendUserId = "${loginAdmin.id}";
    }
    sendUserType = 3;
}
$.get('/getMessageByPage', {page: 1, sendUserId:sendUserId, sendUserType:sendUserType, sendType: 1 }, function(res){ //从第1页开始请求。
    laypage({
        cont: 'pageDiv', //容器。值支持id名、原生dom对象，jquery对象。
        pages: res.pager.totalPage, //通过后台拿到的总页数
        skip: true, //是否开启跳页
        curr: 1, //初始化当前页
        jump: function(e){ //触发分页后的回调
            $.get('/getMessageByPage', {page: e.curr, sendUserId:sendUserId, sendUserType:sendUserType, sendType: 1}, function(res){
                var view = $('#dataDiv'); //你也可以直接使用jquery
                var htmlStr = "";
                htmlStr += "<table class='messageTable' cellspacing='0' cellpadding='0'>";
                htmlStr += "<tr>";
                htmlStr += '<th style="border-left-width: 0px;width:31px;"><input type="button" class="ico_mailtitle" disabled=""></th>';
                htmlStr += "<th style='width:147px;'>接收人</th>";
                htmlStr += "<th style='width:656px;'>主题</th>";
                htmlStr += "<th style='width:115px;'>时间</th>";
                htmlStr += "<th style='width:110px;'>操作</th>";
                htmlStr += "</tr>";
                for(var i = 0; i < res.rows.length; i++) {
                    htmlStr += "<tr>"
                    var item = res.rows[i];
                    if(item.status == 0){
                        htmlStr += "<td style='padding-left: 7px;'><div class='cir Ru'></div></td>";
                    } else {
                        htmlStr += "<td style='padding-left: 7px;'><div class='cir Rr'></div></td>";
                    }
                    if(sendUserType != 3){
                        if(item.getUserType == 3){
                            htmlStr += "<td><div >系统管理员</div></td>";
                        }else{
                            if(item.getUserType == 1){
                                htmlStr += "<td><div >教师用户：" + item.getUserUsername + "</div></td>";
                            }else{
                                htmlStr += "<td><div >家长用户：" + item.getUserUsername + "</div></td>";
                            }
                        }
                    }else{
                        if(item.getUserType == 3){
                            htmlStr += "<td><div>系统管理员:" + item.getUserUsername + "</div></td>";
                        }else{
                            if(item.getUserType == 1){
                                htmlStr += "<td><div >教师用户：" + item.getUserUsername + "</div></td>";
                            }else{
                                htmlStr += "<td><div >家长用户：" + item.getUserUsername + "</div></td>";
                            }
                        }
                    }
                    htmlStr += "<td><div class='overTdHidden'>"+ item.title +"<span>-" + item.content + "</span></div></td>";
                    htmlStr += "<td>" + item.addTime.substr(0, 16) + "</td>";
                    htmlStr += "<td><input type='button' class='button white small' value='查看' onclick='look(" + item.id + ")' ><input type='button' class='button white small' value='删除' onclick='deleteObject(" + item.id + ")'></td>";
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
    window.location.href = "/message/messageInfoSent?id=" + id;
}
function deleteObject(id) {
    layer.confirm('确定删除吗？', {icon: 4}, function(index){
        layer.close(index);
        $.post("/deleteMessage", {id:id}, function (result) {
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