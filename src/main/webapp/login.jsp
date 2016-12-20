<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="../css/animate.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
</head>
<body class="gray-bg" onload="init()">
<div class="middle-box text-center loginscreen animated fadeInDown" style="width: 30%">
    <div>
        <div>
            <h1 class="logo-name">HP+</h1>
        </div>
        <h3>欢迎来到HP+</h3>
        <form class="m-t" id="loginForm" role="form" action="${pageContext.request.contextPath}/doctor/login.action" method="post">
            <div class="form-group">
                <input type="text" name="username" class="form-control input-lg" placeholder="请输入用户名" required="">
            </div>
            <div class="form-group">
                <input type="password" name="password" class="form-control input-lg" placeholder="请输入密码" required="">
            </div>
            <div id="login_false">${requestScope.error_message}</div>
            <button type="submit" class="btn btn-primary block full-width m-b btn-lg" id="logining">登录</button>
        </form>
        <p class="m-t"> <small>写上版权相关内容</small> </p>
    </div>
</div>
<script src="../js/jquery-2.0.3.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script>
    function init() {
        if("${requestScope.error_message}"==null||"${requestScope.error_message}"==""){

            $("#login_false").remove();
        }else {

            $("#login_false").addClass("alert");

            $("#login_false").addClass("alert-danger");

            $("#login_false").html("用户名或密码错误！");
        }
    }
</script>
</body>
</html>
