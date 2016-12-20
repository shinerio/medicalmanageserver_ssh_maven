<%--
  Created by IntelliJ IDEA.
  User: jstxzhangrui
  Date: 2016/12/16
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HistoryQuery</title>
    <link rel="stylesheet" type="text/css" href="css/table.css">

    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="../css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
    <link href="../css/animate.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
    <link href="../css/plugins/ionRangeSlider/ion.rangeSlider.css" rel="stylesheet">
    <link href="../css/plugins/ionRangeSlider/ion.rangeSlider.skinHTML5.css" rel="stylesheet">
    <link href="../css/plugins/ionRangeSlider/normalize.css" rel="stylesheet">
    <link href="../css/plugins/toastr/toastr.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/style_time.css" media="screen" type="text/css" />
    <style type="text/css">
        .mess[readonly]{        /*只读时的颜色控制*/
            background-color: #ffffff;
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
<img alt="image" class="img-circle" src="../img/profile_small.jpg">
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
                        <li><a href="../dynamicData.jsp">李华</a></li>
                    </ul>
                </li>
                <li class="active">
                    <a href="javascript:void(0)"><i class="fa fa-files-o"></i> <span
                            class="nav-label">医生信息</span></a>
                    <!--<ul class="nav nav-second-level collapse">

                    </ul>-->
                </li>
                <li >
                    <a href="../HistoryQuery.jsp"><i class="fa fa-desktop"></i> <span class="nav-label">历史信息查询</span></a>
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
            <form class="well form-horizontal" action=" " method="post"  id="contact_form">
                <fieldset>

                    <!-- Form Name -->
                    <legend>医生信息简介</legend>

                    <!-- Text input-->

                    <div class="form-group">
                        <label class="col-md-4 col-lg-4 col-sm-4 col-xs-4 control-label">姓名</label>
                        <div class="col-md-5 col-lg-5 col-sm-5 col-xs-5 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input  placeholder="姓名" class="form-control mess" value="${sessionScope.doctor.realname}" type="text">
                            </div>
                        </div>
                    </div>

                    <!-- Text input-->

                    <div class="form-group">
                        <label class="col-md-4 col-lg-4 col-sm-4 col-xs-4 control-label" >年龄</label>
                        <div class="col-md-5 col-lg-5 col-sm-5 col-xs-5 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input  placeholder="年龄" class="form-control mess" value="${requestScope.doctor_info.age}" type="text">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 col-lg-4 col-sm-4 col-xs-4 control-label" >主治方向</label>
                        <div class="col-md-5 col-lg-5 col-sm-5 col-xs-5 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input  placeholder="主治方向" class="form-control mess" value="${requestScope.doctor_info.major}" type="text">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 col-lg-4 col-sm-4 col-xs-4 control-label" >参加工作时长</label>
                        <div class="col-md-5 col-lg-5 col-sm-5 col-xs-5 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input  placeholder="参加工作时长" class="form-control mess" value="${requestScope.doctor_info.workingHours}" type="text">
                            </div>
                        </div>
                    </div>


                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 col-lg-4 col-sm-4 col-xs-4 control-label">邮箱</label>
                        <div class="col-md-5 col-lg-5 col-sm-5 col-xs-5 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                <input  placeholder="邮箱" class="form-control mess" value="${requestScope.doctor_info.emailAddress}" type="text">
                            </div>
                        </div>
                    </div>


                    <!-- Text input-->

                    <div class="form-group">
                        <label class="col-md-4 col-lg-4 col-sm-4 col-xs-4 control-label">电话</label>
                        <div class="col-md-5 col-lg-5 col-sm-5 col-xs-5 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                <input  placeholder="电话" class="form-control mess" value="${requestScope.doctor_info.phoneNum}" type="text">
                            </div>
                        </div>
                    </div>

                    <!-- Text input-->

                    <div class="form-group">
                        <label class="col-md-4 col-lg-4 col-sm-4 col-xs-4 control-label">通信地址</label>
                        <div class="col-md-5 col-lg-5 col-sm-5 col-xs-5 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                <input  placeholder="地址" class="form-control mess" value="${requestScope.doctor_info.address}" type="text">
                            </div>
                        </div>
                    </div>


                    <!-- Select Basic -->

                    <div class="form-group">
                        <label class="col-md-4 col-lg-4 col-sm-4 col-xs-4 control-label">所在科室</label>
                        <div class="col-md-5 col-lg-5 col-sm-5 col-xs-5 selectContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                <input  placeholder="科室" class="form-control mess" value="${requestScope.doctor_info.department}" type="text">
                                <!--<select name="state" class="form-control selectpicker" >
                                    <option value=" " >请选择科室</option>
                                    <option>骨科</option>
                                    <option>牙科</option>
                                    <option >神经科</option>
                                </select>-->
                            </div>
                        </div>
                    </div>



                    <!--&lt;!&ndash; radio checks &ndash;&gt;
                    <div class="form-group">
                        <label class="col-md-4 control-label">Do you have hosting?</label>
                        <div class="col-md-4">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="hosting" value="yes" /> Yes
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="hosting" value="no" /> No
                                </label>
                            </div>
                        </div>
                    </div>-->

                    <!-- Text area -->

                    <div class="form-group">
                        <label class="col-md-4 col-lg-4 col-sm-4 col-xs-4 control-label">工作经历</label>
                        <div class="col-md-5 col-lg-5 col-sm-5 col-xs-5 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                <textarea class="form-control mess" name="comment"  placeholder="工作经历">${requestScope.doctor_info.workExperience}</textarea>
                            </div>
                        </div>
                    </div>

                    <!-- Success message -->
                    <div class="alert alert-success" role="alert" id="success_message"><i class="glyphicon glyphicon-thumbs-up"></i>可以联系我，我会以最快速度回复您！</div>

                    <!-- Button -->
                    <%--<div class="form-group">
                        <label class="col-md-4 col-lg-4 col-sm-4 col-xs-4 control-label"></label>
                        <div class="col-md-4">
                            <button type="submit" class="btn btn-warning" >确认信息 <span class="glyphicon glyphicon-send"></span></button>
                        </div>
                    </div>--%>

                </fieldset>
            </form>
        </div>
        <div class="footer">
            <div class="pull-right">
                <!--4GB of <strong>250GB</strong> Free.-->
            </div>
            <div>
                <strong>Copyright</strong>
            </div>
        </div>
    </div>

</div>
<script src='../js/jquery.js'></script>
<script src="../js/jquery-2.0.3.js"></script>
<script src="../js/jquery-2.0.3.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="../js/plugins/flot/jquery.flot.js"></script>
<script src="../js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="../js/plugins/flot/jquery.flot.spline.js"></script>
<script src="../js/plugins/flot/jquery.flot.resize.js"></script>
<script src="../js/plugins/flot/jquery.flot.pie.js"></script>
<script src="../js/plugins/flot/jquery.flot.symbol.js"></script>
<script src="../js/plugins/flot/curvedLines.js"></script>
<script src="../js/plugins/peity/jquery.peity.min.js"></script>
<script src="../js/demo/peity-demo.js"></script>
<script src="../js/inspinia.js"></script>
<script src="../js/plugins/pace/pace.min.js"></script>
<script src="../js/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="../js/plugins/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
<script src="../js/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="../js/plugins/chartJs/Chart.min.js"></script>
<script src="../js/ion.rangeSlider.js"></script>
<script src="../js/ion.rangeSlider.min.js"></script>
<script src="../js/index.js"></script>
<script src="../js/toastr.min.js"></script>
<script type="text/javascript" src="../echarts/echarts.min.js"></script>

<script src="../css/plugins/ionRangeSlider/toastr.js"></script>

<script>
    $(document).ready(function(){
        $(".mess").attr("readOnly","readonly");
    });
</script>


</body>
</html>
