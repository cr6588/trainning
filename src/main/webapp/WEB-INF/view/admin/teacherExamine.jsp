<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/common.css">
<script type="text/javascript" src="/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/resources/js/laypage/laypage.js"></script>
<script type="text/javascript" src="/resources/js/layer/layer.js"></script>
<script type="text/javascript" src="/resources/js/h-ui/js/H-ui.js"></script>
<title>教师审核</title>
<style type="text/css">
.Huifold .item{ position:relative; list-style: none;}
.Huifold .item h4{margin:0;font-weight:bold;position:relative;border-top: 1px solid #fff;font-size:15px;line-height:22px;padding:7px 10px;background-color:#eee;cursor:pointer;padding-right:30px}
.Huifold .item h4 b{position:absolute;display: block; cursor:pointer;right:10px;top:7px;width:16px;height:16px; text-align:center; color:#666;}
.Huifold .item .info{display:none;padding:10px;}
.img-idCardAttache {
    width: 255px;
    height: 156px;
}
</style>
</head>
<body>
    <div id="dataDiv"></div>
    <div id="pageDiv"></div>
<script type="text/javascript">
var loadIndex = layer.load(1);
$.post('/admin/getTeacherByPage', {page: 1,status: 0}, function(res){ //从第1页开始请求。
    laypage({
        cont: 'pageDiv', //容器。值支持id名、原生dom对象，jquery对象。
        pages: res.pager.totalPage, //通过后台拿到的总页数
        skip: true, //是否开启跳页
        curr: 1, //初始化当前页
        jump: function(e){ //触发分页后的回调
            $.post('/admin/getTeacherByPage', {page: e.curr, status: 0}, function(res){
                var view = $('#dataDiv'); //你也可以直接使用jquery
                var htmlStr = "";
                htmlStr += '<ul id="Huifold1" class="Huifold" style="padding-left: 0px;">';
                for(var i = 0; i < res.rows.length; i++) {
                    var item = res.rows[i];
                    htmlStr += '<li class="item">';
                    htmlStr += '<h4><table><tr><td>' + item.addTime.substr(0, 16) +'</td>';
                    htmlStr += '<td>教师用户' + item.username + '需要审核</td>';
                    htmlStr += '<td><b>+</b></td>'
                    htmlStr += '</tr></table></h4>'
                    htmlStr += '<div class="info">';
                    htmlStr += '<table class="table-input">';
                    htmlStr += '<tr><td class="w-100">编号:</td><td>' + item.id + '<td></tr>';
                    htmlStr += '<tr><td class="w-100">姓名:</td><td>' + item.name + '<td></tr>';
                    htmlStr += '<tr><td class="w-100">性别:</td><td>' + item.sex + '<td></tr>';
                    htmlStr += '<tr><td class="w-100">身份:</td><td>' + item.shenfen + '<td></tr>';
                    if(item.shenfen == "大学生"){
                        htmlStr += '<tr><td class="w-100">学校:</td><td>' + item.shenfenAboutInfo + '<td></tr>';
                        htmlStr += '<tr><td class="w-100">学历:</td><td>' + item.xueli + '<td></tr>';
                    } else if(item.shenfen == "专业教师"){
                        htmlStr += '<tr><td class="w-100">任教学校:</td><td>' + item.shenfenAboutInfo + '<td></tr>';
                        htmlStr += '<tr><td class="w-100">教龄:</td><td>' + item.eduAge + '年<td></tr>';
                    } else if(item.shenfen == "外教"){
                        htmlStr += '<tr><td class="w-100">国家:</td><td>' + item.shenfenAboutInfo + '<td></tr>';
                    }else if(item.shenfen == "其他"){
                        htmlStr += '<tr><td class="w-100">学历:</td><td>' + item.xueli + '<td></tr>';
                    }
                    htmlStr += '<tr><td class="w-100">出生年月:</td><td>' + item.birthday + '<td></tr>';
                    htmlStr += '<tr><td class="w-100">手机号码:</td><td>' + item.phone + '<td></tr>';
                    htmlStr += '<tr><td class="w-100">身份证号码:</td><td>' + item.idCardNo + '<td></tr>';
                    htmlStr += '<tr><td class="w-100">身份证附件:</td><td><img class="img-idCardAttache" src="' + item.idCardAttache + '?&RAND_ID=' + Math.random() + '"><td></tr>';
                    htmlStr += '<tr><td class="w-100"></td><td><input class="button white small" type="button" value="通过" onclick="pass(this,' + item.id + ')"><input class="button white small" type="button" value="打回" onclick="reject(this,' + item.id + ')"><td></tr>';
                    htmlStr += '</table>';
                    htmlStr += '</div>';
                    htmlStr += '</li>';
                }
                htmlStr += '</ul>';
                layer.close(loadIndex);
                $(view).html(htmlStr);
                $.Huifold("#Huifold1 .item h4","#Huifold1 .item .info","fast",1,"click");
            });
        }
    });
});
function pass(obj, id) {
    var currentObject = obj;
    $.post("/admin/updateTeacherStatus", {id: id, status: 1}, function (result) {
        if(result.code == 0){
            layer.msg(result.msg, {
                icon: 1,
                time: 1000
            },function (){
                $(currentObject).parents("li").remove();
            });
        }else{
            layer.alert(result.msg, {icon: 0}, function (index){
                layer.close(index);
            });
        }
    });
}
var rejectObject;
var rejectId;
function reject(obj, id) {
    rejectObject = obj;
    rejectId = id;
    layer.confirm('确定打回该用户吗？', {icon: 4}, function(index){
        layer.close(index);
        layer.open({
            type: 2,
            area: ['335px', '91px'],
            fix: false, //不固定
            maxmin: true,
            content: '/admin/enterFailReason'
        });
    })
}
</script>
</body>
</html>