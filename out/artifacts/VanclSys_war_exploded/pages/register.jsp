<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <!--为了兼容IE浏览器，告诉IE浏览器使用最新版本的引擎显示当前的页面-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--为了兼容移动设备，使当前页面和移动设备比例保持1比1.-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>VANCL注册</title>
    <!-- Bootstrap -->
    <script src="../js/jquery-3.2.1.min.js"></script>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <script src="../js/bootstrap.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<style>
    .top {
        border-bottom: 1px solid #666;
        padding-top: 10px;
        padding-bottom: 10px;
    }

    h3 {
        color: #999;
        font-size: 20px;
        line-height: 35px;
        border-bottom: solid 2px #b52024;
        margin-bottom: 30px;
    }

    .a1 {
        border: 1px solid #ccc;
        border-radius: 0;
        font-size: 12px;
        line-height: 44px;
        text-align: center;
        padding:0 0px;
        background-color: #f5f5f5;
        color: #b52024;
        cursor: pointer;
    }

    .a1:hover,.a2:hover  {
        text-decoration: underline;
        color: #b52024;
    }

    .input-lg {
        font-size: 14px;
        border-radius: 0;
    }
    .a2{
        color: #b52024;
    }
    .lab1{
        font-size: 14px;
        color: #999;
    }
    .a3:hover{
        text-decoration: underline;
        color: white;
    }
    p{
        text-align: left;
        font-size: 12px;
        color: #999;
        margin: 0 0;
        display: block;
        height: 17px;
    }
    .form-group{
        margin-bottom: 0px;
    }
    .warn{
        color: #b52024;
    }
    .psw_bg1{
        display: inline-block;
        width: 140px;
        height: 12px;
        overflow: hidden;
        background: url(../images/sprite_a.png) no-repeat 0 -1097px;
        margin: 0px 5px;
        vertical-align: text-bottom;
    }
    .psw_bg2{
        display: inline-block;
        width: 140px;
        height: 12px;
        overflow: hidden;
        background: url(../images/sprite_a.png) no-repeat 0 -1117px;
        margin: 0px 5px;
        vertical-align: text-bottom;
    }
    .psw_bg3{
        display: inline-block;
        width: 140px;
        height: 12px;
        overflow: hidden;
        background: url(../images/sprite_a.png) no-repeat 0 -1139px;
        margin: 0px 5px;
        vertical-align: text-bottom;
    }
    .register{
        background-color: #9a9a9a;
        color: white
    }
    .reg_checked{
        background-color: #b52024;
    }
</style>
<body>
<div class="container">
    <div class="row top">
        <div class="col-12-xs">
            <img src="../images/logo_new.jpg" class="img-responsive" style="vertical-align: middle">
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-5 col-sm-push-1 " style="padding-top: 100px;">
            <img src="../images/login120412_newlogo.jpg" class="img-responsive" style="margin: auto">
        </div>
        <div class="col-xs-12 col-sm-4 col-sm-push-2 " style="margin-top: 50px;">
            <h3>注册新用户 <span class="pull-right" style="font-size: 14px">我已经注册，现在就 <a href="login.jsp"
                                                                                    style="color: #b52024">登录</a></span>
            </h3>
            <form>
                <div class="form-group" style="height: 46px">
                    <div class="col-xs-8" style="padding-left: 0">
                        <input type="text" class="form-control input-lg " placeholder="请输入手机号" id="phone" name="phone" >
                        <p></p>
                    </div>
                    <a class="a1 col-xs-4">获取短信验证码</a>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control input-lg" placeholder="填写手机验证码"><p></p>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control input-lg " placeholder="设定登入密码" id="psw1" name="psw1"><p></p>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control input-lg " placeholder="再次输入密码" id="psw2" name="psw2"><p></p>
                </div>
                <div class="checkbox">
                    <label class="lab1"><input type="checkbox" class="cb">请阅读</label> <a class="a2" href="#">《VANCL凡客诚品服务条款》</a>
                </div>
                <div class="form-group">
                    <input type="button" id="register_btn" class="form-control input-lg register a3" value="立即注册">
                </div>
            </form>
        </div>
    </div>
    <div class="row" style="margin-top: 100px">
        <p style="text-align: center">Copyright 2007 - 2016 vancl.com All Rights Reserved 京ICP证100557号 京公网安备11010102000579号 出版物经营许可证新出发京批字第直110138号</p>
        <img src="../images/footer.png" style="margin: auto;display: block">
    </div>

</div>
</body>
</html>
<script type="text/javascript">

    $(function () {
        //表单验证
        var reg;
        //手机验证
        $("#phone").focus(function () {
            $(this).next().text("请输入正确的手机号，并进行验证").removeClass("warn");
        }).blur(function () {
            var text=$(this).val();
            if(!text){//空时
                $(this).next().text("");
            }else {//非空时
                //正则验证格式
                reg = /^1\d{10}$/;
                if (!reg.test(text)) {
                    $(this).next().text( "请输入有效的手机号").addClass("warn");
                    return;
                }else {
                    //ajax 验证手机号是否已经注册
                    $.ajax({
                        url:"/checkPhone",
                        type:"post",
                        data:{"phone":text},
                        success:function (data) {
                            if(data==1){
                                $("#phone").next().text( "手机号码已经注册，请直接登录").addClass("warn");
                            }else {
                                $("#phone").next().text( "手机号码验证成功").removeClass("warn");
                            }
                        },
                        error:function () {
                            alert("请求地址有问题");
                        }

                    })
                }

            }
        })
        //密码验证
        $("#psw1").focus(function () {
            $(this).next().text("6-16位字符，可使用字母、数字或符号的组合").removeClass("warn");
        }).blur(function () {
            text=$(this).val();
            if(!text){//空时
                $(this).next().text("");
            }else {//非空时
                //正则验证格式
                reg = /^.{6,16}$/;
                if (!reg.test(text)) {
                    $(this).next().text("密码必须大于6位且小于16位,请重新输入").addClass("warn");
                } else if(text.indexOf(" ")>=0){
                    $(this).next().text("密码中不允许输入空格,请重新输入").addClass("warn");
                }else {
                     //检验密码强度d
                    var strong=0;
                    reg=/\d+/;
                    if(reg.test(text)) strong++;
                    reg=/[a-zA-Z]+/;
                    if(reg.test(text)) strong++;
                    reg=reg = /^.*[`~!@#\$%\^&\*\(\)_+\-=\[\]\{\}\\\|\'\";:,\<\.\>\/\?].*$/;
                    if(reg.test(text)) strong++;
                    if(strong>2)
                        $(this).next().text("密码强度:").append("<span class='psw_bg3'></span>").append("强");
                    else if (strong>1){
                        $(this).next().text("密码强度:").append("<span class='psw_bg2'></span>").append("中");
                    }else {
                        $(this).next().text("密码强度:").append("<span class='psw_bg1'></span>").append("弱");
                    }
                }
            }
        })
        //二次密码验证
        $("#psw2").focus(function () {
            $(this).next().text("请再次输入登录密码，两次输入必须一致").removeClass("warn");
        }).blur(function () {
            var psw2=$(this).val();
            var psw1=$("#psw1").val();
            if(!psw2){//空时
                $(this).next().text("");
            }else {//非空时
                //两次密码是否相等
                if (psw1!=psw2) {
                    $(this).next().text("两次输入密码不一致，请重新输入").addClass("warn");
                } else {
                    $(this).next().text("").removeClass("warn");
                }
            }
        })
        //勾选服务条款 开启注册功能
        $(".lab1").change(function () {
            $("#register_btn").toggleClass("reg_checked");
            if($(".cb").prop("checked")){
                $("#register_btn").click(
                    function () {
                        //点击时验证表单，确保数据正确
                        if($("#phone").next().text()!="手机号码验证成功"){
                            $("#phone").next().text( "请输入有效的手机号").addClass("warn");

                            return;
                        }else if(!$("#psw1").val()){
                            $("#psw1").next().text( "密码不能为空").addClass("warn");
                            return;
                        }else if($("#psw1").next().text().indexOf("密码强度")==-1){
                            $("#psw1").blur();
                            return;
                        }else if($("#psw1").val()!=$("#psw2").val()){
                            $("#psw2").next().text("两次输入密码不一致，请重新输入").addClass("warn");
                        }else{
                            //传入后台创建用户
                            var phone=$("#phone").val();
                            var psw=$("#psw1").val();
                            $.ajax({
                                url:"/register",
                                type:"post",
                                data:{"phone":phone,"psw":psw},
                                success:function (data) {
                                    alert("注册成功，请登录");
                                    top.location.href="login.jsp";
                                },
                                error:function () {
                                    alert("请求地址有问题");
                                }
                            })
                        }
                    }
                )
            }else {//失效
                $("#register_btn").off();
           }



        })















    })

</script>