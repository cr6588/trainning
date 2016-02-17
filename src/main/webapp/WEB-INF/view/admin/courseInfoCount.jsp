<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/resources/js/highcharts/highcharts.js"></script>
<script type="text/javascript" src="/resources/js/laydate/laydate.js"></script>
<!-- <script type="text/javascript" src="/resources/js/highcharts/themes/dark-unica.js"></script> -->
<title>课程信息统计</title>
</head>
<body onload="display()">
<div style='width: 100%; padding-left: 67%;'>请选择月份：<input id="date" name="date" onclick="laydate({istime: true, format: 'YYYY-MM'})" class="laydate-icon"><input type='button' value='提交' onclick='display()'></div>
<div id='container'></div>
<script type="text/javascript">
Highcharts.setOptions({
    global: {
        useUTC: false //关闭UTC，不采用国际标准时间
    }
});
function display(){
    var dataNum;
    var date = null;
    if($("#date").val() != '' ){
        date = $("#date").val();
    }
    $.post("/admin/getNewAddNum",{table: 'course', date:date}, function (result) {
        dataNum = result;
        var x = new Array(),y = new Array();
        var dataArray = new Array;
        var month = result[0].date.substr(5,2);
        for(var i = 0;i < result.length; i++){
            x.push(result[i].date.substr(8,2));
            y.push(result[i].num);
        }
        if(result.length > 0){
            $('#container').highcharts({
                chart: {
                    type: 'line'
                },
                title: {
                    text: result[0].date.substr(0,4) + "年" + result[0].date.substr(5,2) + '月每天新增课程'
                },
                subtitle: {
                    text: '来源: trainning.aliapp.com'
                },
                xAxis: {
                    categories: x,
                        title: {
                            text: '日期'
                        },
                        type:'datetime',
                        labels: {
                            align: 'right',
                            style: {fontWeight: 'common',"font-size" : "10px"},
                            rotation: 315
                        }
                },
                yAxis: {
                    title: {
                        text: '课程数量 (条)'
                    }
                },
                tooltip: {
                    formatter: function() {
                        return  month + '月' + this.x +'日<br>'+this.y+"条";
                    },
                    crosshairs: [false,true],
                    valueSuffix: '次'
                },
//                 plotOptions: {
//                     line: {
//                         dataLabels: {
//                             enabled: true
//                         },
//                         enableMouseTracking: false
//                     }
//                 },
                series: [{
                    name: '课程信息新增',
                    data: y
                }]
            });
        }
    });
}
</script>
</body>
</html>