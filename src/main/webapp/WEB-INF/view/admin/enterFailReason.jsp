<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/resources/js/layer/layer.js"></script>
<title>输入打回原因</title>
</head>
<body>
输入原因<input id="failReason" name="failReason">&nbsp;<input type="button" value="提交" onclick="reject()">
<script type="text/javascript">
var index = parent.layer.getFrameIndex(window.name);
var id = parent.rejectId;
var currentObject = parent.rejectObject;
function reject() {
    $.post("/admin/updateTeacherStatus", {id: id, status: 2, failReason: $("#failReason").val()}, function (result) {
        if(result.code == 0){
            layer.msg(result.msg, {
                icon: 1,
                time: 1000
            },function (){
                $(currentObject).parents("li").remove();
                parent.layer.close(index);
            });
        } else {
            layer.alert(result.msg, {icon: 0}, function (index){
                layer.close(index);
         });
        }
    });
}
</script>
</body>
</html>