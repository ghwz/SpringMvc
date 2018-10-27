<%--
  Created by IntelliJ IDEA.
  User: superrocye
  Date: 18/10/25
  Time: 上午10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>登录</title>
    <meta name="KeyWords" content="后台登录">
    <meta name="Description" content="后台登录">
    <link rel="stylesheet" type="text/css" href="../plugins/bootstrap3/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-table.css"/>
    <link rel="stylesheet" type="text/css" href="../plugins/font-awesome-4.6/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/animate.css"/>
    <link rel="stylesheet" type="text/css" href="../css/style.css"/>
    <script src="../plugins/jquery-3.1.0.min.js"></script>
    <script src="../plugins/bootstrap3/js/bootstrap.min.js"></script>
    <script src="../js/jquery.validate.min.js"></script>
</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name">RED</h1>
        </div>
        <h3>Welcome to RED</h3>

        <form class="m-t" id="login-form-hooks" onsubmit="return false;">
            <div class="msgerr" style="color: #e15f63;text-align: left;"></div>
            <div class="form-group">
                <input id="mobile" name="mobile" class="form-control" placeholder="Moblie" maxlength="11" value="13330613321" required="">
            </div>
            <div class="form-group">
                <input id="password" name="password" type="password" class="form-control" placeholder="Password" rangelength="[6,16]" value="123456">
            </div>

            <div class="form-group">
                <input id="captcha" name="captcha" type="text" class="form-control" placeholder="Captcha" required="">
            </div>

            <div class="form-group" style="float: left;">
                <img id="captchaimg" src="${pageContext.request.contextPath}/kaptcha" alt="验证码" width="130" height="38" class="verify refcaptcha">
                <span style="width: 100px;padding-left: 10px" class="refcaptcha">看不清，下一张</span>
            </div>

            <button id="sub-login" type="submit" class="btn btn-primary block full-width m-b">登录</button>
        </form>

        <p class="m-t"> <small>Tp-admin framework base on Bootstrap 3 &copy; 2016</small> </p>
        <p class="m-t"> <small>Thank you very much Inspinia's theme.</small> </p>
    </div>
</div>


<script type="text/javascript">
    $
    $(function() {
        $("#login-form-hooks").validate({
            submitHandler: function() {
                doLogin();
            }
        })

        $('.refcaptcha').on('click', function() {
            $('#captchaimg').get(0).src = ($('#captchaimg').get(0).src + '?=r' + Math.random(1, 10000));
        });
    })

    function doLogin() {
        $(function() {
            $.post("${pageContext.request.contextPath}/login/doLogin", $('#login-form-hooks').serialize(), function(o) {
                if (o.code == "ok") {
                    console.log(o.url,o)
                    window.location.href = "${pageContext.request.contextPath}"+o.url;
                } else {
                    $(".msgerr").html(o.msg);
                }
                $('.refcaptcha').click();
            }, 'json');
        })
        return false;
    }
</script>
</body>

</html>
