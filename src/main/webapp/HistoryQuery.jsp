<%--<!--<%&#45;&#45;
  Created by IntelliJ IDEA.
  User: yuanbaby
  Date: 2016/12/19
  Time: 17:25
  To change this template use File | Settings | File Templates.
&#45;&#45;%>-->--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>历史信息查询</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/plugins/ionRangeSlider/ion.rangeSlider.css" rel="stylesheet">
    <link href="css/plugins/ionRangeSlider/ion.rangeSlider.skinHTML5.css" rel="stylesheet">
    <link href="css/plugins/ionRangeSlider/normalize.css" rel="stylesheet">
    <link href="css/plugins/toastr/toastr.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style_time.css" media="screen" type="text/css"/>

    <!--日历-->
    <link type="text/css" rel="stylesheet" href="css/admin.css" />
    <link rel="stylesheet" type="text/css" href="css/jquery-ui.css" />
    <style>
        #date ul li{
            display: inline-block;
        }
    </style>
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
<span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">${sessionScope.doctor.realname}</strong>
</span> <span class="text-muted text-xs block">主治医生 <b class="caret"></b></span> </span> </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="javascript:void(0)">个人信息</a></li>
                            <li><a href="javascript:void(0)">联系方式</a></li>
                            <li class="divider"></li>
                            <li><a href="login.jsp">退出登录</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">
                        HP+
                    </div>
                </li>
                <li class>
                    <a href="#"><i class="fa fa-th-large"></i> <span class="nav-label">病人列表</span>
                        <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="dynamicData.jsp">李华</a></li>
                    </ul>
                </li>
                <li class>
                    <a href="doctor/checkDoctorInfo"><i class="fa fa-files-o"></i> <span
                            class="nav-label">信息查询</span></a>
                    <!--<ul class="nav nav-second-level collapse">

                    </ul>-->
                </li>
                <li class="active">
                    <a href="javascript:void(0)"><i class="fa fa-desktop"></i> <span class="nav-label">历史信息查询</span></a>
                    <!--<ul class="nav nav-second-level collapse">-->
                    <!--<li><a href="javascript:void(0)">Basic form</a></li>-->
                    <!--<li><a href="javascript:void(0)">Advanced Plugins</a></li>-->
                    <!--<li><a href="javascript:void(0)">Wizard</a></li>-->
                    <!--<li><a href="javascript:void(0)">File Upload</a></li>-->
                    <!--<li><a href="javascript:void(0)">Text Editor</a></li>-->
                    <!--<li><a href="javascript:void(0)">Markdown</a></li>-->
                    <!--</ul>-->
                </li>

            </ul>

        </div>
    </nav>
    <div id="page-wrapper" class="gray-bg" style="min-height: 949px;">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top white-bg" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="javascript:void(0)"><i
                            class="fa fa-bars"></i> </a>

                </div>
                <ul class="nav navbar-top-links navbar-right">


                    <li>
                        <a href="login.jsp">
                            <i class="fa fa-sign-out"></i> 注销
                        </a>
                    </li>

                </ul>
            </nav>
        </div>
        <div class="wrapper wrapper-content">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">           <!--第一行区域-->
                    <div class="row">             <!--显示图-->
                        <div class="ibox float-e-margins col-lg-12 col-md-12 col-sm-12 col-xs-12">

                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="height: 40%">     <!--图1-->
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class=" col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                                <div class="row">
                                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                        <div class="ibox float-e-margins">
                                                            <div class="ibox-title">
                                                                <span class="label label-success">姓名</span>
                                                            </div>
                                                            <div class="ibox-content">
                                                                <h1 class="no-margins">张三</h1>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                        <div class="ibox float-e-margins">
                                                            <div class="ibox-title">
                                                                <span class="label label-info ">年龄</span>
                                                            </div>
                                                            <div class="ibox-content">
                                                                <h1 class="no-margins">59</h1>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                        <div class="ibox float-e-margins">
                                                            <div class="ibox-title">
                                                                <span class="label label-primary ">性别</span>
                                                            </div>
                                                            <div class="ibox-content">
                                                                <h1 class="no-margins">男</h1>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="ibox float-e-margins">
                                                            <div class="ibox-title">
                                                                <span class="label label-success">病症</span>
                                                            </div>
                                                            <div class="ibox-content" style="height: 30%">
                                                                <h1 class="no-margins">中风后上肢功能障碍</h1>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                                <img src="img/a1.jpg">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="height: 40%">     <!--图1-->
                                <div class="ibox-title">   <!--表格标题-->
                                    <h5>历史成功率</h5>
                                    <div class="ibox-tools">
                                        <a class="collapse-link">
                                            <i class="fa fa-chevron-up"></i>
                                        </a>
                                    </div>
                                </div>


                                <div class="ibox-content col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <!--<div style="padding:0;margin:0;">
                                        <form class="bs-example bs-example-form" role="form" id="date">
                                            <ul>
                                            <li><div >
                                                <div class="input-group input-group-sm">
                                                        <span class="input-group-btn">
                                                            <button class="btn btn-default btn-group-lg btn-group-sm btn-group-xs" type="button">开始时间:</button>
                                                        </span>
                                                    <input type="datetime-local" class="form-control" id="time_start" />
                                                </div>&lt;!&ndash; /input-group &ndash;&gt;
                                            </div>
                                            </li>
                                            &lt;!&ndash;<li><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                            </div>
                                            </li>&ndash;&gt;
                                            <li><div >
                                                <div class="input-group input-group-sm">
                                                    <span class="input-group-btn">
                                                            <button class="btn btn-default btn-group-lg btn-group-sm btn-group-xs" type="button">截止时间:</button>
                                                    </span>
                                                    <input type="datetime-local" class="form-control" id="time_last">
                                                        <span class="input-group-btn">
                                                               <button class="btn btn-default btn-group-lg btn-group-sm btn-group-xs" type="button" onclick="getAllTime()">确认</button>
                                                        </span>
                                                </div>&lt;!&ndash; /input-group &ndash;&gt;
                                            </div>&lt;!&ndash; /.col-lg-3 &ndash;&gt;
                                            </li>
                                            </ul>
                                        </form>
                                        &lt;!&ndash;<div class="col-lg-10">
                                            <form>
                                                <select class='custom-date' name='select'>
                                                    <option value='7'>7 天</option>
                                                    <option value='30'>30 天</option>
                                                    <option selected='selected' value='90'>90 天</option>
                                                    <option value='180'>180 天</option>
                                                    <option value='365'>365 天</option>
                                                    <option value='custom'>Custom</option>
                                                </select>
                                                <div class="input-group input-group-sm">
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" type="button" onclick="close_time()">Go!</button>
                                                </span>
                                                </div>
                                            </form>

                                        </div>&ndash;&gt;
                                    </div>-->
                                    <div>
                                        <form class="bs-example bs-example-form" role="form">
                                            <div class="row">
                                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                    <div class="input-group input-group-sm">
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-default" type="button">选择时间:</button>
                                                    </span>
                                                        <input name="act_start_time" type="text" class="form-control" id="start_time" value="" placeholder="开始时间≥当前时间" title="开始时间≥当前时间" readonly="readonly" style="cursor:pointer;"/>

                                                    </div><!-- /input-group -->
                                                </div><!-- /.col-lg-6 -->
                                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                    <div class="input-group input-group-sm">

                                                        <input name="act_stop_time" type="text" class="form-control" id="stop_time" value="" placeholder="结束时间>开始时间" title="结束时间>开始时间" readonly="readonly" style="cursor:pointer;"/>
                                                        <span class="input-group-btn">
                                                        <button class="btn btn-default" type="button" onclick="getTime()">确认</button>
                                                    </span>
                                                     </div><!-- /input-group -->
                                                </div><!-- /.col-lg-6 --><br>
                                            </div><!-- /.row -->
                                        </form>


                                    <!--<ul class="doc-set">
                                        <li>
                                            <div class="doc-dt">
                                                <p>活动时间</p>
                                            </div>
                                            <div class="doc-dd">
                                                <input name="act_start_time" type="text" class="text-box" value="" placeholder="开始时间≥当前时间" title="开始时间≥当前时间" readonly="readonly" style="cursor:pointer;"/>
                                                <input name="act_stop_time" type="text" class="text-box" value="" placeholder="结束时间>开始时间" title="结束时间>开始时间" readonly="readonly" style="cursor:pointer;"/>
                                            </div>
                                        </li>
                                    </ul>-->
                                    </div>
                                    <div id="container2" style="margin: 10px 10px;height: 80%"></div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <div style="height:40%">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">   <!--表格标题-->
                                <h5>历史评估记录</h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">

                                    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10"
                                         style="margin-left: 8%;height: 100%;overflow-y: scroll">
                                        <table class="table table-bordered table-striped table-hover table">
                                            <thead>
                                            <tr class="success">
                                                <th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">评估时间</th>
                                                <th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">评估时长</th>
                                                <th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">成功率</th>
                                            </tr>
                                            </thead>
                                            <tbody id="mydatabody">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">     <!--图1-->
                                    <div id="container1" style="margin: 10px 10px;height: 100%"></div>
                                </div>
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
<script src='js/jquery.js'></script>
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
<script src="js/index.js"></script>
<script src="js/toastr.min.js"></script>
<!--日历ui-->
<script type="text/javascript" src="js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.ui.datepicker-zh-CN.js"></script>
<script type="text/javascript" src="js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="js/jquery-ui-timepicker-zh-CN.js"></script>

<%--日历选择触发动作--%>
<script type="text/javascript">
    $( "input[name='act_start_time'],input[name='act_stop_time']" ).datetimepicker();
    function getTime() {
        var start_time = $("#start_time").val();
        var stop_time = $("#stop_time").val();
        if(start_time!=""&&stop_time!=""&&(new Date(start_time)<new Date(stop_time))){
             alert("输入了正确的时间！")
        }
        else if(new Date(start_time)>=new Date(stop_time)){
            toastr.warning('结束时间应该大于开始时间！');
        }
        else{
            toastr.warning('请选择时间！');
        }

    }

</script>

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
    var date;
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
        show_echarts1();
        show_echarts2();
        show_table();
    }

    function show_table() {
        for (var i = 0; i < 23; i++) {
            var mytr = mydatabody.insertRow();
            var node = mytr.insertCell();
            var atd = mytr.insertCell();
            var btd = mytr.insertCell();
            atd.className = "cellNormal";
            btd.className = "cellNormal";
            node.innerHTML = '<a onclick="getEvaluateTime(this)">' + new Date().toLocaleString() + '</a>';
        }
    }

    function getEvaluateTime(s) {    //取得评估时间，用于搜索重演
        //alert(s.innerHTML)
    }
    function getAllTime() {
        var time_start = document.getElementById("time_start").value;
        var time_last = document.getElementById("time_last").value;
        if (time_start == "" || time_last == "") {
            toastr.warning('请选择查询日期！');
        }
        else {
            setdata();
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

        for (var i = 0; i < 60; i++) {   //横坐标长度
            data.push(randomData());
        }

        option = {
            title: {
                text: '手套标量折线图历史显示',
                left: "10%",
                textStyle: {
                    fontSize: 25
                }
            },
            grid: {
                show: true
            },
            visualMap: [{
                pieces: [
                    {gt: 80, color: 'red'},            // (1500, Infinity]
                    {gt: 0, lte: 20, color: 'green'} // (900, 1500]

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
                splitArea: {show: true}//保留网格区域
            },
            series: [{
                name: '模拟数据',
                type: 'line',
                showSymbol: false,
                hoverAnimation: false,
                /*data: data,*/
                itemStyle: {
                    normal: {
                        color: '#1AB394',
                        lineStyle: {
                            color: '#1AB394'
                        }
                    }
                }
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
        option = {
            color: ['#3398DB'],
            tooltip: {
                trigger: 'axis',
                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true,
                show: true

            },
            xAxis: [
                {
                    type: 'category',
                    data: [],
                    axisTick: {
                        alignWithLabel: true
                    }
                }
            ],
            yAxis: [
                {
                    type: 'value'
                }
            ],
            series: [
                {
                    name: '直接访问',
                    type: 'bar',
                    barWidth: '60%',
                    data: []
                }
            ]
        };

        if (option && typeof option === "object") {
            myChart2.setOption(option, true);

        }

    }

</script>
<script>    /*echarts自适应屏幕*/
$("#container1").resize(function () {
    $(myChart1).resize();
});
$("#container2").resize(function () {
    $(myChart2).resize();
})
</script>
<script>
    var data1 = {
        categories: ["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子", "呵呵", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子", "呵呵"],
        data: [5, 20, 36, 10, 10, 20, 30, 20, 36, 10, 10, 20, 30]
    };

    function setdata() {
        myChart2.setOption({
            xAxis: {
                data: data1.categories
            },
            series: [{
                // 根据名字对应到相应的系列
                name: '销量',
                data: data1.data
            }]
        });
    }
</script>

<script src="css/plugins/ionRangeSlider/toastr.js"></script>
<script>
    "use strict";
    var number;

    var GloveDataWS = {};
    var CommandDataWS = {};
    var message_send = "";
    var t1;
    var t2;
    var duration;

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
            number = parseInt(message.data);
            myChart2.setOption({
                series: [{
                    data: [{value: number, name: '手套标量'}]
                }]
            });
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
                duration = $("#range_01").val();
//                $("#status").html("等待确认!");
                toastr.success('等待病人确认......');
                message_send = "evaluate_request";
                CommandDataWS.sendMessage();      //发送确认字符
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
