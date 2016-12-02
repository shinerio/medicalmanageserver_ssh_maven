<%--
  Created by IntelliJ IDEA.
  User: jstxzhangrui
  Date: 2016/12/2
  Time: 23:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>实时数据</title>
    <link rel="stylesheet" type="text/css" href="css/table.css">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <style type="text/css">.jqstooltip {
        position: absolute;
        left: 0px;
        top: 0px;
        visibility: hidden;
        background: rgb(0, 0, 0) transparent;
        background-color: rgba(0, 0, 0, 0.6);
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);
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
                        <a data-toggle="dropdown" class="dropdown-toggle" href="dynamicData.html#">
<span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">${sessionScope.doctor.realname}</strong>
</span> <span class="text-muted text-xs block">主治医生 <b class="caret"></b></span> </span> </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="javascript:void(0)">个人信息</a></li>
                            <li><a href="javascript:void(0)">联系方式</a></li>
                            <li class="divider"></li>
                            <li><a href="login.html">退出登录</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">
                        HP+
                    </div>
                </li>
                <li class="active">
                    <a href="javascript:void(0)"><i class="fa fa-th-large"></i> <span class="nav-label">病人列表</span>
                        <span
                                class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse in">
                        <li><a href="javascript:void(0)">李华</a></li>
                        <!--<li><a href="dashboard_2.html">Dashboard v.2</a></li>-->
                        <!--<li><a href="dashboard_3.html">Dashboard v.3</a></li>-->
                        <!--<li class="active"><a href="dynamicData.html">Dashboard v.4</a></li>-->
                        <!--<li><a href="dashboard_5.html">Dashboard v.5 <span-->
                        <!--class="label label-primary pull-right">NEW</span></a></li>-->
                    </ul>
                </li>
                <li>
                    <a href="dynamicData.html#"><i class="fa fa-files-o"></i> <span
                            class="nav-label">信息查询</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">

                        <!--<li><a href="lockscreen.html">Lockscreen</a></li>-->
                        <!--<li><a href="invoice.html">Invoice</a></li>-->
                        <!--<li><a href="login.html">Login</a></li>-->
                        <!--<li><a href="forgot_password.html">Forget password</a></li>-->
                        <!--<li><a href="register.html">Register</a></li>-->
                        <!--<li><a href="404.html">404 Page</a></li>-->
                        <!--<li><a href="500.html">500 Page</a></li>-->
                        <!--<li><a href="empty_page.html">Empty page</a></li>-->
                    </ul>
                </li>
            </ul>

        </div>
    </nav>
    <div id="page-wrapper" class="gray-bg" style="min-height: 949px;">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top white-bg" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="dynamicData.html#"><i
                            class="fa fa-bars"></i> </a>
                    <!--<form role="search" class="navbar-form-custom" action="search_results.html">-->
                    <!--<div class="form-group">-->
                    <!--<input type="text" placeholder="" class="form-control" name="top-search" id="top-search">-->
                    <!--</div>-->
                    <!--</form>-->
                </div>
                <ul class="nav navbar-top-links navbar-right">


                    <li>
                        <a href="login.html">
                            <i class="fa fa-sign-out"></i> 登录
                        </a>
                    </li>
                    <!--<li>-->
                    <!--<a class="right-sidebar-toggle">-->
                    <!--<i class="fa fa-tasks"></i>-->
                    <!--</a>-->
                    <!--</li>-->
                </ul>
            </nav>
        </div>
        <div class="wrapper wrapper-content">
            <div class="row">
                <div class="col-lg-12">           <!--第一行区域-->
                    <div class="row">              <!--显示统计信息-->
                        <div class="ibox float-e-margins col-lg-12">
                            <div class="ibox-title">
                                <h5>评估</h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                    <!--<a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">-->
                                    <!--<i class="fa fa-wrench"></i>-->
                                    <!--</a>-->
                                    <!--<ul class="dropdown-menu dropdown-user">-->
                                    <!--<li><a href="form_basic.html#">Config option 1</a>-->
                                    <!--</li>-->
                                    <!--<li><a href="form_basic.html#">Config option 2</a>-->
                                    <!--</li>-->
                                    <!--</ul>-->
                                    <!--<a class="close-link">-->
                                    <!--<i class="fa fa-times"></i>-->
                                    <!--</a>-->
                                </div>
                            </div>
                            <div class="ibox-content">
                                <form role="form" class="form-inline">
                                    <div class="form-group">
                                        <label for="exampleInputEmail2" class="sr-only">请输入医生编号</label>
                                        <input type="email" placeholder="请输入医生编号" id="exampleInputEmail2"
                                               class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword2" class="sr-only">请输入评估时长</label>
                                        <input type="password" placeholder="请输入评估时长" id="exampleInputPassword2"
                                               class="form-control">
                                    </div>
                                    <!--<button class="btn btn-white" type="submit">开始评估！</button>-->
                                    <button class="btn btn-primary dim" style="margin-bottom: 5px !important;"
                                            type="button">开始评估！
                                    </button>
                                </form>
                            </div>
                            <!--</div>-->
                            <!--<div class="col-lg-4">-->
                            <!--<div class="ibox float-e-margins">-->
                            <!--<div class="ibox-title">-->
                            <!--<span class="label label-success pull-right">Monthly</span>-->
                            <!--<h5>Views</h5>-->
                            <!--</div>-->
                            <!--<div class="ibox-content">-->
                            <!--<h1 class="no-margins">386,200</h1>-->
                            <!--<div class="stat-percent font-bold text-success">98% <i class="fa fa-bolt"></i>-->
                            <!--</div>-->
                            <!--<small>Total views</small>-->
                            <!--</div>-->
                            <!--</div>-->
                            <!--</div>-->
                            <!--<div class="col-lg-4">-->
                            <!--<div class="ibox float-e-margins">-->
                            <!--<div class="ibox-title">-->
                            <!--<span class="label label-info pull-right">Annual</span>-->
                            <!--<h5>Orders</h5>-->
                            <!--</div>-->
                            <!--<div class="ibox-content">-->
                            <!--<h1 class="no-margins">80,800</h1>-->
                            <!--<div class="stat-percent font-bold text-info">20% <i class="fa fa-level-up"></i>-->
                            <!--</div>-->
                            <!--<small>New orders</small>-->
                            <!--</div>-->
                            <!--</div>-->
                            <!--</div>-->
                            <!--<div class="col-lg-4">-->
                            <!--<div class="ibox float-e-margins">-->
                            <!--<div class="ibox-title">-->
                            <!--<span class="label label-primary pull-right">Today</span>-->
                            <!--<h5>Vistits</h5>-->
                            <!--</div>-->
                            <!--<div class="ibox-content">-->
                            <!--<div class="row">-->
                            <!--<div class="col-md-6">-->
                            <!--<h1 class="no-margins">406,42</h1>-->
                            <!--<div class="font-bold text-navy">44% <i class="fa fa-level-up"></i>-->
                            <!--<small>Rapid pace</small>-->
                            <!--</div>-->
                            <!--</div>-->
                            <!--<div class="col-md-6">-->
                            <!--<h1 class="no-margins">206,12</h1>-->
                            <!--<div class="font-bold text-navy">22% <i class="fa fa-level-up"></i>-->
                            <!--<small>Slow pace</small>-->
                            <!--</div>-->
                            <!--</div>-->
                            <!--</div>-->
                            <!--</div>-->
                            <!--</div>-->
                        </div>
                    </div>
                    <div class="row">             <!--显示图-->
                        <div class="ibox float-e-margins col-lg-12">
                            <div class="ibox-title">   <!--表格标题-->
                                <h5>实时数据</h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content col-lg-12">
                                <div class="col-lg-6" style="height: 500px">     <!--图1-->
                                    <div id="container1" style="margin: 10px 10px;height: 100%"></div>
                                </div>
                                <div class="col-lg-6" style="height: 500px;">  <!--图2-->
                                    <div id="container2" style="margin: 10px 10px;height: 100%"></div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!--<div class="col-lg-4">
                <div class="ibox float-e-margins">
                <div class="ibox-title">
                <h5>Monthly income</h5>
                <div class="ibox-tools">
                <span class="label label-primary">Updated 12.2015</span>
                </div>
                </div>
                <div class="ibox-content no-padding">
                <div class="flot-chart m-t-lg" style="height: 55px;">
                <div class="flot-chart-content" id="flot-chart1" style="padding: 0px; position: relative;"><canvas class="flot-base" width="338" height="55" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 338px; height: 55px;"></canvas><canvas class="flot-overlay" width="338" height="55" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 338px; height: 55px;"></canvas></div>
                </div>
                </div>
                </div>
                </div>-->
            </div>
            <!--<div class="row">
            <div class="col-lg-8" style="height: 500px;background-color: #0d8ddb">
            &lt;!&ndash;<div class="ibox float-e-margins">
            <div class="ibox-content">
            <div>
            <span class="pull-right text-right">
            <small>Average value of sales in the past month in: <strong>United states</strong></small>
            <br>
            All sales: 162,862
            </span>
            <h3 class="font-bold no-margins">
            Half-year revenue margin
            </h3>
            <small>Sales marketing.</small>
            </div>
            <div class="m-t-sm">
            <div class="row">
            <div class="col-md-8">
            <div>
            <canvas id="lineChart" height="164" width="434" style="width: 434px; height: 164px;"></canvas>
            </div>
            </div>
            <div class="col-md-4">
            <ul class="stat-list m-t-lg">
            <li>
            <h2 class="no-margins">2,346</h2>
            <small>Total orders in period</small>
            <div class="progress progress-mini">
            <div class="progress-bar" style="width: 48%;"></div>
            </div>
            </li>
            <li>
            <h2 class="no-margins ">4,422</h2>
            <small>Orders in last month</small>
            <div class="progress progress-mini">
            <div class="progress-bar" style="width: 60%;"></div>
            </div>
            </li>
            </ul>
            </div>
            </div>
            </div>
            <div class="m-t-md">
            <small class="pull-right">
            <i class="fa fa-clock-o"> </i>
            Update on 16.07.2015
            </small>
            <small>
            <strong>Analysis of sales:</strong> The value has been changed over time, and last month reached a level over $50,000.
            </small>
            </div>
            </div>
            </div>&ndash;&gt;
            </div>
            &lt;!&ndash;<div class="col-lg-4">
            <div class="ibox float-e-margins">
            <div class="ibox-title">
            <span class="label label-warning pull-right">Data has changed</span>
            <h5>User activity</h5>
            </div>
            <div class="ibox-content">
            <div class="row">
            <div class="col-xs-4">
            <small class="stats-label">Pages / Visit</small>
            <h4>236 321.80</h4>
            </div>
            <div class="col-xs-4">
            <small class="stats-label">% New Visits</small>
            <h4>46.11%</h4>
            </div>
            <div class="col-xs-4">
            <small class="stats-label">Last week</small>
            <h4>432.021</h4>
            </div>
            </div>
            </div>
            <div class="ibox-content">
            <div class="row">
            <div class="col-xs-4">
            <small class="stats-label">Pages / Visit</small>
            <h4>643 321.10</h4>
            </div>
            <div class="col-xs-4">
            <small class="stats-label">% New Visits</small>
            <h4>92.43%</h4>
            </div>
            <div class="col-xs-4">
            <small class="stats-label">Last week</small>
            <h4>564.554</h4>
            </div>
            </div>
            </div>
            <div class="ibox-content">
            <div class="row">
            <div class="col-xs-4">
            <small class="stats-label">Pages / Visit</small>
            <h4>436 547.20</h4>
            </div>
            <div class="col-xs-4">
            <small class="stats-label">% New Visits</small>
            <h4>150.23%</h4>
            </div>
            <div class="col-xs-4">
            <small class="stats-label">Last week</small>
            <h4>124.990</h4>
            </div>
            </div>
            </div>
            </div>
            </div>&ndash;&gt;
            </div>-->
            <!--<div class="row">
            <div class="col-lg-12">
            <div class="ibox float-e-margins">
            <div class="ibox-title">
            <h5>Custom responsive table </h5>
            <div class="ibox-tools">
            <a class="collapse-link">
            <i class="fa fa-chevron-up"></i>
            </a>
            <a class="dropdown-toggle" data-toggle="dropdown" href="dynamicData.html#">
            <i class="fa fa-wrench"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
            <li><a href="dynamicData.html#">Config option 1</a>
            </li>
            <li><a href="dynamicData.html#">Config option 2</a>
            </li>
            </ul>
            <a class="close-link">
            <i class="fa fa-times"></i>
            </a>
            </div>
            </div>
            <div class="ibox-content">
            <div class="row">
            <div class="col-sm-9 m-b-xs">
            <div data-toggle="buttons" class="btn-group">
            <label class="btn btn-sm btn-white"> <input type="radio" id="option1" name="options"> Day </label>
            <label class="btn btn-sm btn-white active"> <input type="radio" id="option2" name="options"> Week </label>
            <label class="btn btn-sm btn-white"> <input type="radio" id="option3" name="options"> Month </label>
            </div>
            </div>
            <div class="col-sm-3">
            <div class="input-group"><input type="text" placeholder="Search" class="input-sm form-control"> <span class="input-group-btn">
            <button type="button" class="btn btn-sm btn-primary"> Go!</button> </span></div>
            </div>
            </div>
            <div class="table-responsive">
            <table class="table table-striped">
            <thead>
            <tr>
            <th>#</th>
            <th>Project </th>
            <th>Name </th>
            <th>Phone </th>
            <th>Company </th>
            <th>Completed </th>
            <th>Task</th>
            <th>Date</th>
            <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <tr>
            <td>1</td>
            <td>Project <small>This is example of project</small></td>
            <td>Patrick Smith</td>
            <td>0800 051213</td>
            <td>Inceptos Hymenaeos Ltd</td>
            <td><span class="pie" style="display: none;">0.52/1.561</span><svg class="peity" height="16" width="16"><path d="M 8 8 L 8 0 A 8 8 0 0 1 14.933563796318165 11.990700825968545 Z" fill="#1ab394"></path><path d="M 8 8 L 14.933563796318165 11.990700825968545 A 8 8 0 1 1 7.999999999999998 0 Z" fill="#d7d7d7"></path></svg></td>
            <td>20%</td>
            <td>Jul 14, 2013</td>
            <td><a href="dynamicData.html#"><i class="fa fa-check text-navy"></i></a></td>
            </tr>
            <tr>
            <td>2</td>
            <td>Alpha project</td>
            <td>Alice Jackson</td>
            <td>0500 780909</td>
            <td>Nec Euismod In Company</td>
            <td><span class="pie" style="display: none;">6,9</span><svg class="peity" height="16" width="16"><path d="M 8 8 L 8 0 A 8 8 0 0 1 12.702282018339785 14.47213595499958 Z" fill="#1ab394"></path><path d="M 8 8 L 12.702282018339785 14.47213595499958 A 8 8 0 1 1 7.999999999999998 0 Z" fill="#d7d7d7"></path></svg></td>
            <td>40%</td>
            <td>Jul 16, 2013</td>
            <td><a href="dynamicData.html#"><i class="fa fa-check text-navy"></i></a></td>
            </tr>
            <tr>
            <td>3</td>
            <td>Betha project</td>
            <td>John Smith</td>
            <td>0800 1111</td>
            <td>Erat Volutpat</td>
            <td><span class="pie" style="display: none;">3,1</span><svg class="peity" height="16" width="16"><path d="M 8 8 L 8 0 A 8 8 0 1 1 0 8.000000000000002 Z" fill="#1ab394"></path><path d="M 8 8 L 0 8.000000000000002 A 8 8 0 0 1 7.999999999999998 0 Z" fill="#d7d7d7"></path></svg></td>
            <td>75%</td>
            <td>Jul 18, 2013</td>
            <td><a href="dynamicData.html#"><i class="fa fa-check text-navy"></i></a></td>
            </tr>
            <tr>
            <td>4</td>
            <td>Gamma project</td>
            <td>Anna Jordan</td>
            <td>(016977) 0648</td>
            <td>Tellus Ltd</td>
            <td><span class="pie" style="display: none;">4,9</span><svg class="peity" height="16" width="16"><path d="M 8 8 L 8 0 A 8 8 0 0 1 15.48012994148332 10.836839096340286 Z" fill="#1ab394"></path><path d="M 8 8 L 15.48012994148332 10.836839096340286 A 8 8 0 1 1 7.999999999999998 0 Z" fill="#d7d7d7"></path></svg></td>
            <td>18%</td>
            <td>Jul 22, 2013</td>
            <td><a href="dynamicData.html#"><i class="fa fa-check text-navy"></i></a></td>
            </tr>
            <tr>
            <td>2</td>
            <td>Alpha project</td>
            <td>Alice Jackson</td>
            <td>0500 780909</td>
            <td>Nec Euismod In Company</td>
            <td><span class="pie" style="display: none;">6,9</span><svg class="peity" height="16" width="16"><path d="M 8 8 L 8 0 A 8 8 0 0 1 12.702282018339785 14.47213595499958 Z" fill="#1ab394"></path><path d="M 8 8 L 12.702282018339785 14.47213595499958 A 8 8 0 1 1 7.999999999999998 0 Z" fill="#d7d7d7"></path></svg></td>
            <td>40%</td>
            <td>Jul 16, 2013</td>
            <td><a href="dynamicData.html#"><i class="fa fa-check text-navy"></i></a></td>
            </tr>
            <tr>
            <td>1</td>
            <td>Project <small>This is example of project</small></td>
            <td>Patrick Smith</td>
            <td>0800 051213</td>
            <td>Inceptos Hymenaeos Ltd</td>
            <td><span class="pie" style="display: none;">0.52/1.561</span><svg class="peity" height="16" width="16"><path d="M 8 8 L 8 0 A 8 8 0 0 1 14.933563796318165 11.990700825968545 Z" fill="#1ab394"></path><path d="M 8 8 L 14.933563796318165 11.990700825968545 A 8 8 0 1 1 7.999999999999998 0 Z" fill="#d7d7d7"></path></svg></td>
            <td>20%</td>
            <td>Jul 14, 2013</td>
            <td><a href="dynamicData.html#"><i class="fa fa-check text-navy"></i></a></td>
            </tr>
            <tr>
            <td>4</td>
            <td>Gamma project</td>
            <td>Anna Jordan</td>
            <td>(016977) 0648</td>
            <td>Tellus Ltd</td>
            <td><span class="pie" style="display: none;">4,9</span><svg class="peity" height="16" width="16"><path d="M 8 8 L 8 0 A 8 8 0 0 1 15.48012994148332 10.836839096340286 Z" fill="#1ab394"></path><path d="M 8 8 L 15.48012994148332 10.836839096340286 A 8 8 0 1 1 7.999999999999998 0 Z" fill="#d7d7d7"></path></svg></td>
            <td>18%</td>
            <td>Jul 22, 2013</td>
            <td><a href="dynamicData.html#"><i class="fa fa-check text-navy"></i></a></td>
            </tr>
            <tr>
            <td>1</td>
            <td>Project <small>This is example of project</small></td>
            <td>Patrick Smith</td>
            <td>0800 051213</td>
            <td>Inceptos Hymenaeos Ltd</td>
            <td><span class="pie" style="display: none;">0.52/1.561</span><svg class="peity" height="16" width="16"><path d="M 8 8 L 8 0 A 8 8 0 0 1 14.933563796318165 11.990700825968545 Z" fill="#1ab394"></path><path d="M 8 8 L 14.933563796318165 11.990700825968545 A 8 8 0 1 1 7.999999999999998 0 Z" fill="#d7d7d7"></path></svg></td>
            <td>20%</td>
            <td>Jul 14, 2013</td>
            <td><a href="dynamicData.html#"><i class="fa fa-check text-navy"></i></a></td>
            </tr>
            <tr>
            <td>2</td>
            <td>Alpha project</td>
            <td>Alice Jackson</td>
            <td>0500 780909</td>
            <td>Nec Euismod In Company</td>
            <td><span class="pie" style="display: none;">6,9</span><svg class="peity" height="16" width="16"><path d="M 8 8 L 8 0 A 8 8 0 0 1 12.702282018339785 14.47213595499958 Z" fill="#1ab394"></path><path d="M 8 8 L 12.702282018339785 14.47213595499958 A 8 8 0 1 1 7.999999999999998 0 Z" fill="#d7d7d7"></path></svg></td>
            <td>40%</td>
            <td>Jul 16, 2013</td>
            <td><a href="dynamicData.html#"><i class="fa fa-check text-navy"></i></a></td>
            </tr>
            <tr>
            <td>3</td>
            <td>Betha project</td>
            <td>John Smith</td>
            <td>0800 1111</td>
            <td>Erat Volutpat</td>
            <td><span class="pie" style="display: none;">3,1</span><svg class="peity" height="16" width="16"><path d="M 8 8 L 8 0 A 8 8 0 1 1 0 8.000000000000002 Z" fill="#1ab394"></path><path d="M 8 8 L 0 8.000000000000002 A 8 8 0 0 1 7.999999999999998 0 Z" fill="#d7d7d7"></path></svg></td>
            <td>75%</td>
            <td>Jul 18, 2013</td>
            <td><a href="dynamicData.html#"><i class="fa fa-check text-navy"></i></a></td>
            </tr>
            <tr>
            <td>4</td>
            <td>Gamma project</td>
            <td>Anna Jordan</td>
            <td>(016977) 0648</td>
            <td>Tellus Ltd</td>
            <td><span class="pie" style="display: none;">4,9</span><svg class="peity" height="16" width="16"><path d="M 8 8 L 8 0 A 8 8 0 0 1 15.48012994148332 10.836839096340286 Z" fill="#1ab394"></path><path d="M 8 8 L 15.48012994148332 10.836839096340286 A 8 8 0 1 1 7.999999999999998 0 Z" fill="#d7d7d7"></path></svg></td>
            <td>18%</td>
            <td>Jul 22, 2013</td>
            <td><a href="dynamicData.html#"><i class="fa fa-check text-navy"></i></a></td>
            </tr>
            <tr>
            <td>2</td>
            <td>Alpha project</td>
            <td>Alice Jackson</td>
            <td>0500 780909</td>
            <td>Nec Euismod In Company</td>
            <td><span class="pie" style="display: none;">6,9</span><svg class="peity" height="16" width="16"><path d="M 8 8 L 8 0 A 8 8 0 0 1 12.702282018339785 14.47213595499958 Z" fill="#1ab394"></path><path d="M 8 8 L 12.702282018339785 14.47213595499958 A 8 8 0 1 1 7.999999999999998 0 Z" fill="#d7d7d7"></path></svg></td>
            <td>40%</td>
            <td>Jul 16, 2013</td>
            <td><a href="dynamicData.html#"><i class="fa fa-check text-navy"></i></a></td>
            </tr>
            <tr>
            <td>1</td>
            <td>Project <small>This is example of project</small></td>
            <td>Patrick Smith</td>
            <td>0800 051213</td>
            <td>Inceptos Hymenaeos Ltd</td>
            <td><span class="pie" style="display: none;">0.52/1.561</span><svg class="peity" height="16" width="16"><path d="M 8 8 L 8 0 A 8 8 0 0 1 14.933563796318165 11.990700825968545 Z" fill="#1ab394"></path><path d="M 8 8 L 14.933563796318165 11.990700825968545 A 8 8 0 1 1 7.999999999999998 0 Z" fill="#d7d7d7"></path></svg></td>
            <td>20%</td>
            <td>Jul 14, 2013</td>
            <td><a href="dynamicData.html#"><i class="fa fa-check text-navy"></i></a></td>
            </tr>
            <tr>
            <td>4</td>
            <td>Gamma project</td>
            <td>Anna Jordan</td>
            <td>(016977) 0648</td>
            <td>Tellus Ltd</td>
            <td><span class="pie" style="display: none;">4,9</span><svg class="peity" height="16" width="16"><path d="M 8 8 L 8 0 A 8 8 0 0 1 15.48012994148332 10.836839096340286 Z" fill="#1ab394"></path><path d="M 8 8 L 15.48012994148332 10.836839096340286 A 8 8 0 1 1 7.999999999999998 0 Z" fill="#d7d7d7"></path></svg></td>
            <td>18%</td>
            <td>Jul 22, 2013</td>
            <td><a href="dynamicData.html#"><i class="fa fa-check text-navy"></i></a></td>
            </tr>
            </tbody>
            </table>
            </div>
            </div>
            </div>
            </div>
            </div>-->                    <!--第二行，显示表格区域-->
            <div class="row">
                <div  style="height:auto">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">   <!--表格标题-->
                            <h5>原始数据</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content col-lg-12">

                            <div class="col-lg-10" style="margin-left: 8%">
                                <table class="table table-bordered table-striped table-hover table">
                                    <thead>
                                    <tr class="success">
                                        <th class="col-lg-1">节点</th>
                                        <th class="col-lg-1">a</th>
                                        <th class="col-lg-1">bi</th>
                                        <th class="col-lg-1">cj</th>
                                        <th class="col-lg-1">dk</th>
                                    </tr>
                                    </thead>
                                    <tbody id="mydatabody">
                                    <!--<tr>
                                        <td>Tanmay</td>
                                        <td>Bangalore</td>
                                        <td>560001</td>
                                    </tr>
                                    <tr>
                                        <td>Sachin</td>
                                        <td>Mumbai</td>
                                        <td>400003</td>
                                    </tr>
                                    <tr>
                                        <td>Uma</td>
                                        <td>Pune</td>
                                        <td>411027</td>
                                    </tr>-->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="pull-right">
                <!--10GB of <strong>250GB</strong> Free.-->
            </div>
            <div>
                <strong>Copyright</strong>
            </div>
        </div>
    </div>

</div>
</div>
<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
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
<script src="js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="js/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="js/demo/sparkline-demo.js"></script>
<script src="js/plugins/chartJs/Chart.min.js"></script>
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
            responsive: true,
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
        show_echarts1();
        show_echarts2();
        show_table();
    }

    function show_table() {
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
                text: '手套标量折线图实时显示',
                left: "10%",
                textStyle: {
                    fontSize: 25
                }
            },
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
                }
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
        var app = {};


        option = null;
        app.title = '坐标轴刻度与标签对齐';
        /*
         option = {
         title : {
         text: '某站点用户访问来源',
         subtext: '纯属虚构',
         x:'center'
         },
         tooltip : {
         trigger: 'item',
         formatter: "{a} <br/>{b} : {c} ({d}%)"
         },
         legend: {
         orient: 'vertical',
         left: 'left',
         /!*data: ['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']*!/
         data:['手套标量','灰色部分']
         },
         series : [
         {
         name: '访问来源',
         type: 'pie',
         radius : '55%',
         center: ['50%', '60%'],
         /!*data:[
         {value:335, name:'直接访问'},
         {value:310, name:'邮件营销'},
         {value:234, name:'联盟广告'},
         {value:135, name:'视频广告'},
         {value:1548, name:'搜索引擎'}
         ],*!/
         /!*data:[
         {value:300,name:'手套标量'},
         {value:200,name:'灰色部分'}


         ],*!/
         data:[],
         itemStyle: {
         emphasis: {
         shadowBlur: 10,
         shadowOffsetX: 0,
         shadowColor: 'rgba(0, 0, 0, 0.5)'
         }
         }
         }
         ]
         };

         app.timeTicket = setInterval(function () {
         var value1 = Math.random() * 100;
         myChart.setOption({
         series: [{
         data: [
         {value:value1,name:'手套标量'},
         {value:100-value1,name:'灰色部分'}

         ]
         }]
         });
         }, 100);*/

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
<script>
    "use strict";
    var number;

    var Chat = {};
    Chat.socket = null;
    Chat.connect = (function(host) {
        if ('WebSocket' in window) {
            Chat.socket = new WebSocket(host);
        } else if ('MozWebSocket' in window) {
            Chat.socket = new MozWebSocket(host);
        } else {
            Console.log('Error: WebSocket is not supported by this browser.');
            return;
        }

        Chat.socket.onopen = function () {

        };

        Chat.socket.onclose = function () {
            /* alert('Info: WebSocket closed.点击确定重新连接！');*/
            var t1 = window.setTimeout(Chat.initialize(),1000);
        };

        Chat.socket.onmessage = function (message) {
            number = parseInt(message.data.split("+")[1]);
            myChart2.setOption({
                series: [{
                    data: [{value: number, name: '手套标量'}]
                }]
            });
        };
    });

    Chat.initialize = function() {
        // if (window.location.protocol == 'http:') {
        //     Chat.connect('ws://' + window.location.host + '/examples/websocket/chat');
        // } else {
        //     Chat.connect('wss://' + window.location.host + '/examples/websocket/chat');
        // }
        Chat.connect('ws://localhost:8181/test');
    };

    Chat.sendMessage = (function() {

    });
    Chat.initialize();

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
