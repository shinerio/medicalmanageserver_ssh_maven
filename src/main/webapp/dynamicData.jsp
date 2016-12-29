<%@page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>数据监控</title>
    <link rel="stylesheet" type="text/css" href="css/table.css">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/plugins/ionRangeSlider/ion.rangeSlider.css" rel="stylesheet">
    <link href="css/plugins/ionRangeSlider/ion.rangeSlider.skinHTML5.css" rel="stylesheet">
    <link href="css/plugins/ionRangeSlider/normalize.css" rel="stylesheet">
    <link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <style type="text/css">.jqstooltip {
        position: absolute;
        left: 0px;
        top: 0px;
        visibility: hidden;X
        background: rgb(0, 0, 0) transparent;
        background-color: rgba(0, 0, 0, 0.6);
        filter: progid:DXImagXeTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);
        -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
        color: white;
        font: 10px arial, san serif;
        text-align: left;
        white-space: nowrap;
        padding: 5px;
        border: 1px solid white;
        z-index: 10000;
    }

    .jqsfield {
        color: white;
        font: 10px arial, san serif;
        text-align: left;
    }</style>
</head>
<body class="pace-done" onload="showUser()">
<div class="pace  pace-inactive">
    <div class="pace-progress" data-progress-text="100%" data-progress="99"
         style="transform: translate3d(100%, 0px, 0px);">
        <div class="pace-progress-inner"></div>
    </div>
    <div class="pace-activity"></div>
</div>
<div id="wrapper">
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
<img alt="image" class="img-circle" src="img/profile_small.jpg">
</span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="javascript:void(0)">
<span class="clear"> <span class="block m-t-xs"> <strong class="font-bold" id="doctorName">${sessionScope.doctor.realname}</strong>
</span> <span class="text-muted text-xs block">主治医生 <b class="caret"></b></span> </span> </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="javascript:void(0)">个人信息</a></li>
                            <li><a href="javascript:void(0)">联系方式</a></li>
                            <li class="divider"></li>
                        </ul>
                    </div>
                    <div class="logo-element">
                        HP+
                    </div>
                </li>
                <li class="active">
                    <a href="#"><i class="fa fa-th-large"></i> <span class="nav-label">病人列表</span>
                        <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse in">
                        <li class="active"><a href="dynamicData.jsp">李华</a></li>
                    </ul>
                </li>
                <li>
                    <a href="javascript:void(0)" id="doctorinformation"><i class="fa fa-files-o"></i> <span class="nav-label">信息查询</span><img src="img/lock.png" width="20px" height="20px" class="lock">
                    </a>
                    <%--<ul class="nav nav-second-level collapse">

                    </ul>--%>
                </li>
                <li>
                    <a href="javascript:void(0)" id="hisquery"><i class="fa fa-desktop"></i> <span class="nav-label">历史信息查询</span><img src="img/lock.png" width="20px" height="20px" class="lock">
                    </a>
                    <!-- <ul class="nav nav-second-level collapse ">
                         <li><a href="javascript:void(0)">Contacts</a></li>
                     </ul>-->
                </li>

            </ul>

        </div>
    </nav>
    <div id="page-wrapper" class="gray-bg" style="min-height: 949px;">
        <div class="row border-bottom" >
            <nav class="navbar navbar-static-top white-bg" role="navigation" style="margin-bottom: 0;height: 79px">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="javascript:void(0)"><i
                            class="fa fa-bars"></i> </a>
                </div>


                <!--<div class="col-lg-2"><h3>请滑动选择评估时长</h3></div>-->
                <div class="col-lg-1 col-sm-1 col-xs-1"></div>
                <div class="col-lg-3 col-sm-3 col-xs-3" style="margin-top: 8px;height: 55px !important;">
                    <input type="text" id="range_01" name="example_name" value="" />
                </div>
                <form role="form" class="form-inline col-lg-2 col-sm-2 col-xs-2" style="margin-top: 16px !important;">
                    <button class="btn btn-primary dim" type="button" id="button_evaluate">开始评估！</button>
                </form>
                <p id="status"></p>


                <ul class="nav navbar-top-links navbar-right col-lg-1 col-sm-1 col-xs-1" >


                    <li style="height: 60px;width:72px;display: inline-block">
                        <a id="loginLink" href="doctorLogin.jsp"><i class="fa fa-sign-out"></i> <span id="login">登录</span></a>
                    </li>

                </ul>
            </nav>
        </div>
        <div class="wrapper wrapper-content">
            <div class="row" style="height: 320px">
                <div class="col-lg-12 col-sm-12 col-xs-12">           <!--第一行区域-->

                    <div class="row" style="height: 100%">             <!--显示图-->
                        <div class="ibox float-e-margins col-lg-12 col-sm-12 col-xs-12">
                            <div class="ibox-title">   <!--表格标题-->
                                <h5>实时数据</h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content col-lg-12 col-sm-12 col-xs-12">
                                <div class="col-lg-6 col-sm-6 col-xs-6">     <!--图1-->
                                    <div id="container1" style="margin: 10px 10px;height: 100%"></div>
                                </div>
                                <div class="col-lg-6 col-sm-6 col-xs-6">  <!--图2-->
                                    <div id="container2" style="margin: 10px 10px;height: 100%"></div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div style="height:320px !important;">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">   <!--表格标题-->
                            <h5>原始数据</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content col-lg-12 col-sm-12 col-xs-12">

                            <div class="col-lg-10 col-sm-10 col-xs-10" style="margin-left: 8%">
                                <table class="table table-bordered table-striped table-hover table">
                                    <thead>
                                    <tr class="success">
                                        <th class="col-lg-1 col-sm-1 col-xs-1">节点</th>
                                        <th class="col-lg-1 col-sm-1 col-xs-1">a</th>
                                        <th class="col-lg-1 col-sm-1 col-xs-1">bi</th>
                                        <th class="col-lg-1 col-sm-1 col-xs-1">cj</th>
                                        <th class="col-lg-1 col-sm-1 col-xs-1">dk</th>
                                    </tr>
                                    </thead>
                                    <tbody id="mydatabody">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       <!-- <div class="footer">
            <div class="pull-right">
                &lt;!&ndash;10GB of <strong>250GB</strong> Free.&ndash;&gt;
            </div>
            <div>
                <strong>Copyright</strong>
            </div>
        </div>-->
    </div>

</div>
<script src="js/jquery-2.0.3.js"></script>
<script src="js/jquery-2.0.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="js/plugins/flot/jquery.flot.js"></script>
<script src="js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="js/plugins/flot/jquery.flot.spline.js"></script>
<script src="js/plugins/flot/jquery.flot.resize.js"></script>
<script src="js/plugins/flot/jquery.flot.pie.js"></script>
<script src="js/plugins/flot/jquery.flot.symbol.js"></script>
<script src="js/plugins/flot/curvedLines.js"></script>
<script src="js/plugins/peity/jquery.peity.min.js"></script>
<script src="js/demo/peity-demo.js"></script>
<script src="js/inspinia.js"></script>
<script src="js/plugins/pace/pace.min.js"></script>
<script src="js/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="js/plugins/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
<script src="js/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="js/plugins/chartJs/Chart.min.js"></script>
<script src="js/ion.rangeSlider.js"></script>
<script src="js/ion.rangeSlider.min.js"></script>
<script>
    $(document).ready(function () {


        var d1 = [[1262304000000, 6], [1264982400000, 3057], [1267401600000, 20434], [1270080000000, 31982], [1272672000000, 26602], [1275350400000, 27826], [1277942400000, 24302], [1280620800000, 24237], [1283299200000, 21004], [1285891200000, 12144], [1288569600000, 10577], [1291161600000, 10295]];
        var d2 = [[1262304000000, 5], [1264982400000, 200], [1267401600000, 1605], [1270080000000, 6129], [1272672000000, 11643], [1275350400000, 19055], [1277942400000, 30062], [1280620800000, 39197], [1283299200000, 37000], [1285891200000, 27000], [1288569600000, 21000], [1291161600000, 17000]];

        var data1 = [
            {label: "Data 1", data: d1, color: '#17a084'},
            {label: "Data 2", data: d2, color: '#127e68'}
        ];
        $.plot($("#flot-chart1"), data1, {
            xaxis: {
                tickDecimals: 0
            },
            series: {
                lines: {
                    show: true,
                    fill: true,
                    fillColor: {
                        colors: [{
                            opacity: 1
                        }, {
                            opacity: 1
                        }]
                    },
                },
                points: {
                    width: 0.1,
                    show: false
                },
            },
            grid: {
                show: false,
                borderWidth: 0
            },
            legend: {
                show: false,
            }
        });

        var lineData = {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [
                {
                    label: "Example dataset",
                    fillColor: "rgba(220,220,220,0.5)",
                    strokeColor: "rgba(220,220,220,1)",
                    pointColor: "rgba(220,220,220,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(220,220,220,1)",
                    data: [65, 59, 40, 51, 36, 25, 40]
                },
                {
                    label: "Example dataset",
                    fillColor: "rgba(26,179,148,0.5)",
                    strokeColor: "rgba(26,179,148,0.7)",
                    pointColor: "rgba(26,179,148,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(26,179,148,1)",
                    data: [48, 48, 60, 39, 56, 37, 30]
                }
            ]
        };

        var lineOptions = {
            scaleShowGridLines: true,
            scaleGridLineColor: "rgba(0,0,0,.05)",
            scaleGridLineWidth: 1,
            bezierCurve: true,
            bezierCurveTension: 0.4,
            pointDot: true,
            pointDotRadius: 4,
            pointDotStrokeWidth: 1,
            pointHitDetectionRadius: 20,
            datasetStroke: true,
            datasetStrokeWidth: 2,
            datasetFill: true,
            responsive: true
        };


        var ctx = document.getElementById("lineChart").getContext("2d");
        var myNewChart = new Chart(ctx).Line(lineData, lineOptions);

    });
</script>
<script type="text/javascript" src="echarts/echarts.min.js"></script>
<script type="text/javascript">

    var myChart2;
    var dom2;
    var myChart1;
    var dom1;
    function showUser() {
        $("#range_01").ionRangeSlider({
            hide_min_max: false,
            keyboard: true,
            min: 1,
            max: 5,
            from: 1,
            step: 1,
            postfix: "分钟"
        });
        isAuthorized();
        show_echarts1();
        show_echarts2();
    }

    $("#hisquery").click(function(){
        if("${sessionScope.doctor.realname}"==""||"${sessionScope.doctor.realname}"==null){
            toastr.warning('登录后才可以查看，请登录！');
        }
    });
    $("#doctorinformation").click(function(){
        if("${sessionScope.doctor.realname}"==""||"${sessionScope.doctor.realname}"==null){
            toastr.warning('登录后才可以查看，请登录！');
        }
    });
    function isAuthorized() {
        if("${sessionScope.doctor.realname}"==""||"${sessionScope.doctor.realname}"==null){
            //alert("未认证");
            $(".lock").attr('src','/img/lock.png');
            $("#hisquery").attr('href','javascript:void(0)');
        }else {
            // alert("已认证");
            $(".lock").attr('src','/img/unlock.png');
            $("#hisquery").attr('href','HistoryQuery.jsp');
            $("#doctorinformation").attr('href','doctorInformation.jsp');
            $("#login").html("注销");
            $("#loginLink").attr('href','doctor/logOut');
        }
    }

    function show_table() {
        mydatabody.innerHTML="";
        for (var i = 0; i < 13; i++) {
            var mytr = mydatabody.insertRow();
            var node = mytr.insertCell();
            var atd = mytr.insertCell();
            var btd = mytr.insertCell();
            var ctd = mytr.insertCell();
            var dtd = mytr.insertCell();
            atd.className = "cellNormal";
            dtd.className = "cellNormal";
            btd.className = "cellNormal";
            ctd.className = "cellNormal";
            node.innerHTML = i + 1;
           if(websocketData.toString() != ""){
               atd.innerHTML = websocketData.nodes[i].W;
               btd.innerHTML = websocketData.nodes[i].X;
               ctd.innerHTML = websocketData.nodes[i].Y;
               dtd.innerHTML = websocketData.nodes[i].Z;
            }
        }
    }

    function show_echarts1() {        <!--图1的echarts展示-->
        dom1 = document.getElementById("container1");
        myChart1 = echarts.init(dom1);
        var app = {};
        option = null;
        function randomData() {
            now = new Date();
            var value = Math.random() * 100;
            return {
                name: now.toString(),    //鼠标指上去显示当前时间
                value: [
                    now,
                    number        //websocket接受的值
                ]
            }
        }

        var data = [];
        var now = new Date().getTime();
        //alert(now)
        var oneDay = 24 * 3600 * 1000;

        for (var i = 0; i < 360; i++) {   //横坐标长度
            data.push(randomData());
        }

        option = {
            title: {
                text: '手套标量折线图实时显示',
                left: "10%",
                textStyle: {
                    fontSize: 25
                }
            },
            grid:{
                show:true
            },
            visualMap: [{
                pieces: [
                    {gt: 80,color:'red'},            // (1500, Infinity]
                    {gt: 0, lte: 80,color:'#1AB394'} // (900, 1500]

                ]
            }],
            tooltip: {
                trigger: 'axis',
                formatter: function (params) {     //params为一个object对象,为randomData()返回的对象

                    params = params[0];
                    var date = new Date(params.name);  //params.name即为--->name: now.toString(),
                    return date.getHours() + '/' + (date.getMinutes()) + '/' + date.getSeconds() + ' : ' + params.value[1];
                },
                axisPointer: {
                    animation: false
                }
            },
            xAxis: {
                type: 'time',
                splitLine: {
                    show: false
                }

            },
            yAxis: {
                type: 'value',
                boundaryGap: [0, '100%'],
                max: 100,
                splitLine: {
                    show: false
                },
                splitArea : {show : true}//保留网格区域
            },
            series: [{
                name: '模拟数据',
                type: 'line',
                showSymbol: false,
                hoverAnimation: false
                /*data: data,*/
                /*itemStyle: {
                    normal: {
                        color: '#1AB394',
                        lineStyle: {
                            color: '#1AB394'
                        }
                    }
                }*/

            }]
        };
        app.timeTicket = setInterval(function () {

            for (var i = 0; i < 1; i++) {
                data.shift();
                data.push(randomData());
            }

            myChart1.setOption({
                series: [{
                    data: data
                }]
            });
        }, 100);
        if (option && typeof option === "object") {
            myChart1.setOption(option, true);
        }
    }

    function show_echarts2() {              <!--图2的echarts展示-->
        dom2 = document.getElementById("container2");
        myChart2 = echarts.init(dom2);
        var app = {};


        option = null;
        app.title = '坐标轴刻度与标签对齐';

        option = {
            title: {
                text: '手指开合度数显示',
                left: "10%",
                textStyle: {
                    fontSize: 25
                }
            },
            tooltip: {
                formatter: "{a} <br/>{b} : {c}"
            },
            toolbox: {
                feature: {
                    restore: {},
                    saveAsImage: {}
                }
            },
            series: [
                {
                    name: '业务指标',
                    type: 'gauge',
                    detail: {formatter: '{value}'}
                    /*data: [{value: 50, name: '手套标量'}]*/
                }
            ]
        };
        /* app.timeTicket = setInterval(function () {
         /!*option.series[0].data[0].value = (Math.random() * 100).toFixed(2) - 0;*!/
         myChart2.setOption({
         series: [{
         data: [{value: (Math.random() * 100).toFixed(2) - 0, name: '手套标量'}]
         }]
         });
         }, 100);*/

        if (option && typeof option === "object") {
            myChart2.setOption(option, true);
        }

    }

</script>
<script> /*echarts自适应屏幕*/


$("#container1").resize(function(){ $(myChart1).resize(); });
$("#container2").resize(function(){ $(myChart2).resize(); })


</script>
<script src="js/toastr.js"></script>
<script>

</script>
<script>
    "use strict";
    var number = 0;
    var websocketData = "";
    var flag = true;
    var GloveDataWS = {};
    var CommandDataWS = {};
    var ScoreDataWS = {};  //用来接收手套标量
    var message_send = "";
    var t1;
    var t2;
    var duration;

    var t3;


    show_table();

    GloveDataWS.socket = null;
    GloveDataWS.connect = (function (host) {
        if ('WebSocket' in window) {
            GloveDataWS.socket = new WebSocket(host);
        } else if ('MozWebSocket' in window) {
            GloveDataWS.socket = new MozWebSocket(host);
        } else {
            Console.log('Error: WebSocket is not supported by this browser.');
            return;
        }

        GloveDataWS.socket.onopen = function () {
            clearTimeout(t1);
            GloveDataWS.sendMessage();
        };

        GloveDataWS.socket.onclose = function () {
            /* alert('Info: WebSocket closed.点击确定重新连接！');*/
            t1 = window.setTimeout(GloveDataWS.initialize(), 1000);
        };

        GloveDataWS.socket.onmessage = function (message) {
            websocketData = JSON.parse(message.data);
            show_table();
            if (flag){
                console.log(message.data);
                flag = false;
            }

        };
    });

    GloveDataWS.initialize = function () {
        // if (window.location.protocol == 'http:') {
        //     GloveDataWS.connect('ws://' + window.location.host + '/examples/websocket/chat');
        // } else {
        //     GloveDataWS.connect('wss://' + window.location.host + '/examples/websocket/chat');
        // }
        GloveDataWS.connect('ws://localhost/GloveData');
    };

    GloveDataWS.sendMessage = (function () {

        GloveDataWS.socket.send("start");
    });

    /*接收手套标量的websocket*/
    ScoreDataWS.socket = null;
    ScoreDataWS.connect = (function (host) {
        if ('WebSocket' in window) {
            ScoreDataWS.socket = new WebSocket(host);
        } else if ('MozWebSocket' in window) {
            ScoreDataWS.socket = new MozWebSocket(host);
        } else {
            Console.log('Error: WebSocket is not supported by this browser.');
            return;
        }

        ScoreDataWS.socket.onopen = function () {
            clearTimeout(t3);
            ScoreDataWS.sendMessage();
        };

        ScoreDataWS.socket.onclose = function () {
            /* alert('Info: WebSocket closed.点击确定重新连接！');*/
            t3 = window.setTimeout(ScoreDataWS.initialize(), 1000);
        };

        ScoreDataWS.socket.onmessage = function (message) {

            number = parseInt(message.data);
            myChart2.setOption({
                series: [{
                    data: [{value: number, name: '手套标量'}]
                }]
            });
        };
    });

    ScoreDataWS.initialize = function () {
        // if (window.location.protocol == 'http:') {
        //     ScoreDataWS.connect('ws://' + window.location.host + '/examples/websocket/chat');
        // } else {
        //     ScoreDataWS.connect('wss://' + window.location.host + '/examples/websocket/chat');
        // }
        ScoreDataWS.connect('ws://localhost/ScoreData');
    };

    ScoreDataWS.sendMessage = (function () {

        ScoreDataWS.socket.send("start");
    });

    /*传信令的websocket*/
    CommandDataWS.socket = null;
    CommandDataWS.connect = (function (host) {
        if ('WebSocket' in window) {
            CommandDataWS.socket = new WebSocket(host);
        } else if ('MozWebSocket' in window) {
            CommandDataWS.socket = new MozWebSocket(host);
        } else {
            Console.log2('Error: WebSocket is not supported by this browser.');
            return;
        }

        CommandDataWS.socket.onopen = function () {
            clearTimeout(t2);

                $("#button_evaluate").click(function () {
                    if("${sessionScope.doctor.realname}"==""||"${sessionScope.doctor.realname}"==null){
                         toastr.warning('请登录后再进行评估！');
                    }else {
                        duration = $("#range_01").val();
                        // $("#status").html("等待确认!");
                        toastr.success('等待病人确认......');
                        message_send = "evaluate_request";
                        CommandDataWS.sendMessage();      //发送确认字符
                    }
                });


        };

        CommandDataWS.socket.onclose = function () {
            t2 = window.setTimeout(CommandDataWS.initialize(), 1000);
        };

        CommandDataWS.socket.onmessage = function (message) {

            switch (message.data) {
                case "evaluate_request_refused":
                    toastr.warning('病人拒绝评估！');
                    break;
                case "evaluate_request_accepted":
                    message_send = duration;
                    CommandDataWS.sendMessage();      //发送时长
                    message_send = "evaluate_start";
                    CommandDataWS.sendMessage();      //发送aceept字符
//                    $("#status").html("开始评估!");
                    toastr.success('病人开始评估......');
                    break;
                case "evaluate_stop":
//                    $("#status").html("评估结束!");
                    toastr.success('评估结束！');
                    break;
            }

        };
    });

    CommandDataWS.initialize = function () {
        // if (window.location.protocol == 'http:') {
        //     GloveDataWS.connect('ws://' + window.location.host + '/examples/websocket/chat');
        // } else {
        //     GloveDataWS.connect('wss://' + window.location.host + '/examples/websocket/chat');
        // }
        CommandDataWS.connect('ws://localhost/CommandData');
    };

    CommandDataWS.sendMessage = (function () {
        if (message_send != '') {
            CommandDataWS.socket.send(message_send);

        }
    });


    GloveDataWS.initialize();
    CommandDataWS.initialize();
    ScoreDataWS.initialize();

    /*function evaluate() {
     var duration = $("#range_01").val();
     CommandDataWS.sendMessage();
     }*/

    /*var ws = new WebSocket("ws://localhost:8181/test");
     ws.onopen = function (e) {
     console.log('Connection to server opened');
     };

     ws.onmessage = function (message) {
     number = parseInt(message.data.split("+")[1]);
     myChart2.setOption({
     series: [{
     data: [{value: number, name: '手套标量'}]
     }]
     });
     };*/
</script>

</body>
</html>