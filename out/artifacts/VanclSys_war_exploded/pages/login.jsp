<%@ page import="com.seecen.vancl.pojo.User" %>
<%@ page import="com.seecen.vancl.dao.VanclDao" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--

    User u=new User();
    u.setPsw(request.getParameter("password"));
    u.setPhone(request.getParameter("phone"));
    u.setUname(request.getParameter("phone"));
    VanclDao vc=new VanclDao();
    if(request.getParameter("phone")!=null){
        vc.addUser(u);
    }


--%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <!--为了兼容IE浏览器，告诉IE浏览器使用最新版本的引擎显示当前的页面-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--为了兼容移动设备，使当前页面和移动设备比例保持1比1.-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>VANCL登录</title>
    <!-- Bootstrap -->
    <script src="../js/jquery-3.2.1.min.js"></script>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <script src="../js/bootstrap.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="../js/respond.min.js"></script>
    <![endif]-->
</head>
<style>
    body{
        font-family: 微软雅黑;
        text-decoration: none;
    }
    .top {
        border-bottom: 1px solid #666;
        padding-top: 10px;
        padding-bottom: 10px;
    }
    p{
        text-align: center;
        font-size: 12px;
        color: #999;
    }
    h3 {
        color: #999;
        font-size: 20px;
        line-height: 35px;
        margin-bottom: 30px;
    }
    strong{
        font-size: 22px;
        color: #979797;
        text-align: left;
        height: 25px;
        line-height: 25px;
    }
    .login_a{
        width: 50%;
        height: 35px;
        float: left;
        display: block;
        line-height: 35px;
        text-align: center;
        background: #f5f5f5;
        color: #666;
        border-bottom: 1px solid #D1D1D1;

    }
    .login_a:hover{
        text-decoration: none;
        color: #666;
    }
    .login_a_check{
        background: #b42025;
        color: #fff;
        font-weight: bolder;
    }
    .login_a_check:hover{
        color: #fff;
    }
    form{
        clear: both;
        padding:20px 20px ;

    }
    form .input-lg {
        font-size: 14px;
        border-radius: 0px;
    }
    .find_psw{
        color:#b42025 ;
        font-weight: bold;
    }
    .login_btn{
        width: 100%;
        display: block;
        height: 45px;
        line-height: 45px;
        background: #b42025;
        color: #fff;
        text-align: center;
        font-size: 20px;
        border: none;
    }
    form span{
        margin-left: 50px;
        color: #b52024;
        visibility: hidden;
    }
    .warn{
        visibility: visible;
    }
</style>
<body>
<div class="container">
    <div class="row top">
        <div class="col-sm-11">
            <img src="../images/logo_new.jpg" class="img-responsive" style="vertical-align: middle">

        </div>
        <a href="#" class="col-sm-1 text-right hidden-xs" style="color: black;font-size: 12px;padding-right: 0px;line-height: 50px">帮助</a>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-5 col-sm-push-1 " style="padding-top: 100px;">
            <img src="../images/login120412_newlogo.jpg" class="img-responsive" style="margin: auto">
        </div>
        <div class="col-xs-12 col-sm-4 col-sm-push-2 " style="padding-top: 20px;">
            <h3><strong>凡客 Vancl 登录</strong> <span class="pull-right" style="font-size: 14px">没有账户免费 <a href="register.jsp"
                                                                                    style="color: #b52024">注册</a></span>
            </h3>
            <div class="col-sm-12" style="padding: 0px;    border: 1px solid #D1D1D1;">
                <a href="#" class="login_a login_a_check">普通登录</a> <a href="#" class="login_a" >快速登录</a>
                <%--
                    表单
                --%>
                <form>
                    <input type="text" class="form-control input-lg " placeholder="请输入用户名" id="uname" name="uname">
                    <span class="glyphicon glyphicon-exclamation-sign"></span>
                    <input type="password" class="form-control input-lg " placeholder="请输入密码" id="upsw" name="upsw">
                    <span class="glyphicon glyphicon-exclamation-sign"></span>
                    <a href="#" class="find_psw pull-right">找回密码</a>
                    <input type="button" value="登录" id="login_btn" class="login_btn">
                </form>

                <div style=" border-top:1px dotted">
                    <img src="../images/third_login.png"style="margin-left: 15px;margin-bottom: 20px">
                </div>

            </div>
        </div>
    </div>

    <div class="row" style=" border-top: 1px solid #666; margin: 20px 0;padding: 30px;">
        <p>Copyright 2007 - 2016 vancl.com All Rights Reserved 京ICP证100557号 京公网安备11010102000579号 出版物经营许可证新出发京批字第直110138号</p>
        <img src="../images/footer.png" style="margin: auto;display: block">
    </div>

</div>
</body>
</html>
<script type="text/javascript">
    $(function () {
        //聚焦时清空提示
        $("#uname,#upsw").on("focus",function () {
            $(this).next().text("").removeClass("warn");
        })


        $("#login_btn").click(function () {
            //清空
            $("form span").text("").removeClass("warn");

            var uname = $("#uname").val();
            var upsw = $("#upsw").val();
            if (!uname) {
                $("#uname").next().text("账号不能为空").addClass("warn");
                return;
            } else if (!upsw) {
                $("#upsw").next().text("密码不能为空").addClass("warn");
                return;
            } else {
                var formData = {
                    "uname": uname,
                    "upsw": upsw
                };
                var param = {
                    url: "/login",
                    type: "post",
                    data: formData, //data是一个对象
                    success: function (result) {
                        if(result==1){
                            top.location.href="/";
                        }else {
                            $("#upsw").next().text("账号或密码错误").addClass("warn");
                        }
                    },
                    error: function () {
                        alert("请求地址有问题");
                    }
                }
                $.ajax(param);

            }
        })
    })



    
</script>