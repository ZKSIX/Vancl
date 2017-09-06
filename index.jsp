<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.seecen.vancl.dao.VanclDao" %>
<%@ page import="com.seecen.vancl.pojo.Goods" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/27
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>凡客半成品首页</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/index.css">
    <%
        VanclDao vdao = new VanclDao();
        List<Goods> pic1 = vdao.showGoods();
        request.setAttribute("Pic1", pic1);
    %>
</head>
<body>

<div id="header" class="hidden-xs">
    <div class="header-wrap">
        <div id="header-bar" class="container">
            <div class="top-right">
                <div class="notice-bar"><a href="#">网站公告</a></div>
                <a href="javascript:;" class="wechat">
                    <b class="weixinTip"></b>
                </a>
                <a href="javascript:;" class="weibo"></a>
            </div>
            <div class="top-left"><%--您好，欢迎光临凡客诚品！&nbsp;<a href="pages/login.jsp">登录</a>&nbsp;|&nbsp;<a
                    href="pages/register.jsp">注册</a>--%>
                <c:if test="${sessionScope.userInfo!=null}">
                    ${userInfo.uname},欢迎光临凡客诚品！
                </c:if>
                <c:if test="${sessionScope.userInfo==null}">
                    您好,欢迎光临凡客诚品！ <a href="pages/login.jsp">登录 </a> | <a href="pages/register.jsp">注册</a>
                </c:if>
                &nbsp;<a href="#" class="track">我的订单</a>
            </div>

        </div>
    </div>
    <div class="search container">
        <div class="search-bar">
            <div class="search-tab">
                <input class="search-text fl" type="text">
                <input class="search-btn" type="button">
                <div class="active" id="shoppingCar">
                    <p><a id="shoppingCar-link" class="car-tab" href="#">购物车(<span class="car-number">0</span>)</a>
                    </p>
                    <div class="bottomline"></div>
                    <div class="car-list">
                        <p>您的购物车没有任何商品</p>
                    </div>
                </div>
            </div>
            <div class="hotwords">
                热门搜索：
                <a href="#">T恤</a>
                <a href="#">免烫寸衫</a>
                <a href="#">c9</a>
                <a href="#">熊本熊</a>
                <a href="#">POLD</a>
                <a href="#">牛津纺</a>
                <a href="#">针织衫</a>
                <a href="#">袜品</a>
            </div>
        </div>
    </div>
    <div class="nav-list container" style="padding: 0px" >
        <div class="row">
        <ul>
            <li class="logo"><a href=""><img src="images/logo18546.png"> </a></li>
            <li><a href="#">首页</a><span class="navLine"></span></li>
            <li>
                <a href="#">T恤<em class="new"></em></a>
                <span class="navLine"></span>
                <div class="subNav">
                    <span></span>
                    <ul>
                        <li><a href="#">熊本熊</a></li>
                        <li><a href="#">光变色</a></li>
                        <li><a href="#"> CALM</a></li>
                        <li><a href="#"> 海悦</a></li>
                        <li><a href="#"> 复刻</a></li>
                        <li><a href="#"> 十二星座</a></li>
                        <li><a href="#"> 好小猫</a></li>
                        <li><a href="#"> 独角仙</a></li>
                        <li><a href="#"> 薛继业</a></li>
                        <li><a href="#"> 字</a></li>
                        <li><a href="#"> 好小猪</a></li>
                        <li><a href="#"> 义系列</a></li>
                        <li><a href="#"> 药系列</a></li>
                        <li><a href="#"> 简鱼</a></li>
                        <li><a href="#"> 十二生肖</a></li>
                    </ul>
                </div>
            </li>
            <li>
                <a href="#">寸衫<em class="hot"></em></a>
                <span class="navLine"></span>
                <div class="subNav">
                    <span></span>
                    <ul>
                        <li><a href="#">定制</a></li>
                        <li><a href="#"> 免烫</a></li>
                        <li><a href="#">高支</a></li>
                        <li><a href="#">休闲</a></li>
                        <li><a href="#">短袖衬衫</a></li>
                        <li><a href="#">法兰绒</a></li>
                        <li><a href="#">牛津纺</a></li>
                        <li><a href="#">青年布</a></li>
                        <li><a href="#">牛仔</a></li>
                        <li><a href="#">麻</a></li>
                        <li><a href="#">水洗棉</a></li>
                        <li><a href="#">泡泡纱</a></li>
                    </ul>
                </div>
            </li>
            <li>
                <a href="#">C9</a>
                <span class="navLine"></span>
                <div class="subNav">
                    <span></span>
                    <ul>
                        <li><a href="#">衬衫</a></li>
                        <li><a href="#">裤装</a></li>
                        <li><a href="#">T恤</a></li>
                    </ul>
                </div>
            </li>
            <li>
                <a href="#">鞋</a>
                <span class="navLine"></span>
                <div class="subNav">
                    <span></span>
                    <ul>
                        <li><a href="#">复古跑鞋</a></li>
                        <li><a href="#">户外鞋</a></li>
                        <li><a href="#">帆布鞋</a></li>
                        <li><a href="#">皮鞋</a></li>
                        <li><a href="#">休闲鞋</a></li>
                    </ul>
                </div>
            </li>
            <li>
                <a href="#">麻</a>
                <span class="navLine"></span>
                <div class="subNav">
                    <span></span>
                    <ul>
                        <li><a href="#">麻衬衫短袖</a></li>
                        <li><a href="#">麻衬衫长袖</a></li>
                        <li><a href="#">麻衬衫裙</a></li>
                    </ul>
                </div>
            </li>
            <li>
                <a href="#">水柔棉</a>
                <span class="navLine"></span>
                <div class="subNav">
                    <span></span>
                    <ul>
                        <li><a href="#">短袖</a></li>
                    </ul>
                </div>
            </li>
            <li>
                <a href="#">裤装</a>
                <span class="navLine"></span>
                <div class="subNav">
                    <span></span>
                    <ul>
                        <li><a href="#">商务</a></li>
                        <li><a href="#">休闲裤</a></li>
                        <li><a href="#">牛仔裤</a></li>
                        <li><a href="#">麻裤子</a></li>
                        <li><a href="#">针织裤</a></li>
                        <li><a href="#">沙滩裤</a></li>
                    </ul>
                </div>
            </li>
            <li>
                <a href="#">家具配饰</a>
                <span class="navLine"></span>
                <div class="subNav">
                    <span></span>
                    <ul>
                        <li><a href="#">袜品</a></li>
                        <li><a href="#">床品套件</a></li>
                        <li><a href="#">被子</a></li>
                        <li><a href="#">枕</a></li>
                        <li><a href="#">背心</a></li>
                        <li><a href="#">珊瑚绒睡袍</a></li>
                        <li><a href="#">家居毯</a></li>
                        <li><a href="#">旅行箱</a></li>
                        <li><a href="#">童装</a></li>
                        <li><a href="#">空调衫</a></li>
                    </ul>
                </div>
            </li>
            <li>
                <a href="#">私人订制</a>
                <div class="subNav">
                    <span></span>
                    <ul>
                        <li><a href="#">衬衫</a></li>
                        <li><a href="#">西服上衣</a></li>
                        <li><a href="#">西服套装</a></li>
                        <li><a href="#">西裤</a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
    </div>

</div>
<!--/头部区域结束-->

<%--<div class="header hidden-xs" name="top">
    <div class="welcome">
        <span>您好，欢迎光临凡客诚品</span>
        <a href="login.jsp">登录</a><span> |</span> <a href="##">注册</a><a href="##"> 我的订单</a>
        <span class="glyphicon glyphicon-volume-up" style="color: #B71C20"></span>
        <a href="##">网站公告</a>
        <a href="##"><img src="images/w1.jpg" alt=""></a>
        <a href="##"><img src="images/w2.jpg" alt=""></a>
    </div>
</div>--%>
<%--移动搜索--%>
<div class="mobile-search visible-xs">
    <div class="search-li">
        <div class="input-group">
            <div class="input-group-addon">
                <a href="##"><span class="glyphicon glyphicon-search"></span></a>
            </div>
            <input type="text" class="form-control">
        </div>
        <a href="" class="glyphicon glyphicon-comment ask-btn"></a>
    </div>
</div>
<div class="mobile-space visible-xs"></div>
<div class="container runimg">
    <div class="row">
        <div class="col-lg-12 col-xs-12" style="padding: 0 0;">
            <div id="mycar" class="carousel" style="width: 100%;max-height:535px;margin:auto">
                <ol class="carousel-indicators">
                    <li class="active" data-slide-to="0" data-target="#mycar"></li>
                    <li data-slide-to="1" data-target="#mycar"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active"><img src="images/sj535.jpg" alt=""></div>
                    <div class="item"><img src="images/1200x535.jpg" alt=""></div>
                </div>
                <a class="carousel-control left" data-slide="prev" href="#mycar"><span
                        class="glyphicon glyphicon-chevron-left"></span></a>
                <a class="carousel-control right" data-slide="next" href="#mycar"><span
                        class="glyphicon glyphicon-chevron-right"></span></a>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <%--图片--%>
    <div class="row" style="margin-top: 20px">
        <div class="col-md-12 hidden-xs banner">
            <a href="##"><img src="images/czt.jpg" alt=""></a>
            <h2>夏季新品</h2>
        </div>
        <c:forEach items="${Pic1}" var="item">
            <div class="col-md-3 col-xs-6 goods-pic"><a href="/showGoodsDetail?gid=${item.gid}"><img src="images/${item.gurl}" alt="${item.gtype}"></a>
            </div>
        </c:forEach>
    </div>
    <div class="row">
        <div class="col-md-6 col-xs-12" >
            <div class="one">
                <img src="images/dfj.jpg" alt="">
                <h3>暑期大放价 <span>充值购买更优惠</span></h3>
            </div>
        </div>
        <div class="col-md-3 col-xs-12">
            <div class="tw">
                <div>
                    <img src="images/polog.jpg" alt="">
                    <h3>POLO特惠直降 <span>充值购买更优惠</span></h3>
                </div>
                <div>
                    <img src="images/srm.jpg" alt="">
                    <h3>凡客水柔棉 <span>充值购买更优惠</span></h3>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-xs-12">
            <div class="thr">
                <img src="images/dz.jpg" alt="">
                <h3>指定定制衬衫 <span>充值购买更优惠</span></h3>
            </div>
        </div>
        <div class="col-md-6 col-xs-12">
            <div class="one">
                <img src="images/jgw.jpg" alt="">
                <h3>吉國武衬衫 <span>充值购买更优惠</span></h3>
            </div>
        </div>
        <div class="col-md-3 col-xs-12">
            <div class="tw">
                <div>
                    <img src="images/kts.jpg" alt="">
                    <h3>凡客空调衫 <span>充值购买更优惠</span></h3>
                </div>
                <div>
                    <img src="images/xh.jpg" alt="">
                    <h3>T恤现货专区 <span>充值购买更优惠</span></h3>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-xs-12">
            <div class="thr">
                <img src="images/njf.jpg" alt="">
                <h3>凡客牛津纺衬衫 <span>充值购买更优惠</span></h3>
            </div>
        </div>
        <div class="col-md-6 col-xs-12">
            <div class="one">
                <img src="images/c9.jpg" alt="">
                <h3>C9 <span>充值购买更优惠</span></h3>
            </div>
        </div>
        <div class="col-md-3 col-xs-12">
            <div class="tw">
                <div>
                    <img src="images/sxm.jpg" alt="">
                    <h3>衬衫水洗棉 <span>充值购买更优惠</span></h3>
                </div>
                <div>
                    <img src="images/12.jpg" alt="">
                    <h3>凡客配饰 <span>充值购买更优惠</span></h3>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-xs-12">
            <div class="thr">
                <img src="images/pps.jpg" alt="">
                <h3>凡客泡泡纱 <span>充值购买更优惠</span></h3>
            </div>
        </div>
    </div>
    <div class="row hidden-xs ">
        <div class="col-md-12 service">
            <ul class="service-customer">
                <li>
                    <div class="service-block">
                        <img src="images/seven.png" alt="">
                        <a href="##"><p class="online-service" style="color: white">72小时在线服务</p></a>
                    </div>

                </li>
                <li>
                    <div class="service-block">
                        <img src="images/seven.png" alt="">
                        <p>7天内退换货</p>
                        <p>购物满199免运费</p>
                    </div>
                </li>
                <li>
                    <div class="service-block2">
                        <img src="images/2014_8_29_16_39_33_7709.jpg" width="104" height="104" alt="">
                        <p>扫描下载 <a href="##">凡客</a>客户端</p>
                    </div>
                </li>
            </ul>
            <ul class="service-link">
                <li><a href="##">关于凡客</a></li>
                <li><a href="##">新手指南</a></li>
                <li class="send-field"><a href="##">配送范围及时间</a></li>
                <li><a href="##">支付方式</a></li>
                <li><a href="##">售后服务</a></li>
                <li><a href="##">帮助中心</a></li>
            </ul>
        </div>
        <%--脚部--%>
        <div class="col-md-12 col-xs-12">
            <footer>
                <p>Copyright 2007 - 2016 vancl.com All Rights Reserved 京ICP证100557号 京公网安备11011502002400号
                    出版物经营许可证新出发京批字第直110138号</p>
                <p style="margin-bottom: 30px">凡客诚品（北京）科技有限公司</p>
                <div class="legal-area">
                    <a href="" class="leg1"></a>
                    <a href="" class="leg2"></a>
                    <a href="" class="leg3"></a>
                    <a href="" class="leg4"></a>
                    <a href="" class="leg5"></a>
                    <a href="" class="leg6"><img src="images/kexin_brand_for_others.png" alt=""></a>
                </div>
            </footer>
        </div>
    </div>
    <%--移动的脚部--%>
    <div class="mobile-footer visible-xs">
        <img src="images/kts.jpg" width="100%" alt="">
        <ul class="return-menu">
            <li><a href="##">查看更多 <span class="glyphicon glyphicon-menu-down"></span></a></li>
            <li><a href="#top">返回顶部 <span class="glyphicon glyphicon-menu-up"></span></a></li>
        </ul>
        <div class="btn-area">
            <a href="pages/login.jsp" class="m-loginbtn btn btn-primary">登录</a>
            <a href="pages/reister.jsp" class="m-regbtn btn btn-primary">注册</a>
        </div>
        <p>京ICP证100557号</p>
    </div>
    <div class="float-menu hidden-xs">
        <a href="###" class="dwl"></a>
        <a href="##" class="play-call"></a>
        <a href="#top" class="totop"></a>
    </div>
</div>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
<script>
    $(function () {
// 鼠标移上实现子菜单的显现隐藏
        $(".subNav").parent().mouseenter(function () {
            $(this).find(".subNav").stop(false, true).slideDown();
        });
        $(".subNav").parent().mouseleave(function () {
            $(this).find(".subNav").stop(false, true).slideUp();
        });

    });
</script>