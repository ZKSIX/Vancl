<%@ page import="com.seecen.vancl.pojo.Comment" %>
<%@ page import="java.util.List" %>
<%@ page import="com.seecen.vancl.dao.CommentDao" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/28
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String start = request.getParameter("start");
    String end = request.getParameter("end");
    String gid = request.getParameter("gid");
    if (start == null) {
        // 第一页的时候
        start = "1";
        end = "2";
    }

    request.setAttribute("start", start);

    CommentDao cd = new CommentDao();
    List<Comment> comment = cd.findCommentByPage(Integer.valueOf(start), Integer.valueOf(end), Integer.valueOf(gid));
    request.setAttribute("comments", comment);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商品详情页面</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/danpin.css">
    <link rel="stylesheet" href="../css/vanclfoot.css">
    <script src="../js/jquery-3.2.1.js"></script>
</head>
<body>
<input type="text" class="start" value="${start}">
<!--头部区域开始-->
<div id="header">
    <div class="header-wrap">
        <div id="header-bar">
            <div class="top-right">
                <div class="notice-bar"><a href="#" class="notice">网站公告</a></div>
                <a href="javascript:;" class="wechat">
                    <b class="weixinTip"></b>
                </a>
                <a href="javascript:;" class="weibo"></a>
            </div>
            <div class="top-left">
                <input type="hidden" id="userName" value="${userInfo.uname}">
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
    <div class="search">
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
    <div class="nav-list clear">
        <ul>
            <li class="logo"><a href=""></a></li>
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
<!--/头部区域结束-->

<!-- 固定区域开始-->
<div id="prodfixed">
    <h2><span class="gname">${goods.gname} </span><span class="color">白色</span></h2>
    <ul class="pronav">
        <li><a href="#produce">产品描述</a>|</li>
        <li><a href="#comment">评论</a>|</li>
        <li><a href="#question">提问</a></li>
    </ul>

</div>
<!-- /固定区域结束-->
<!--商品信息开始-->
<div id="danpinBox">
    <div class="breadNav">
        <a href="#">首页</a>
        <span>></span>
        <%--<a href="#">男装</a>
        <span>></span>--%>
        <a href="#">${goods.gtype}</a>
        <span>></span>
        <%--<a href="#">短袖T恤</a>--%>
        <%-- <span>></span>--%>
        ${goods.gname}
    </div>
    <div class="productInfo">
        <div class="productTitle">
            <h2>${goods.gname} <span class="color">白色</span></h2>
            <ul>
                <li><a href="#produce">产品描述</a>|</li>
                <li><a href="#comment">评论</a>|</li>
                <li><a href="#question">提问</a></li>
            </ul>
        </div>
        <div class="productContent clearfix">
            <div class="danpin_collef">
                <div class="danpinLeft">
                    <div class="smallImg">
                        <ul id="imageMenu">

                        </ul>
                    </div>
                </div>
                <div class="danpinCenter">
                    <div class="imgbox">
                        <div class="bigImg small">
                            <img src="../images/pro/1.jpg" alt="">
                            <div class="mask"></div>
                        </div>
                        <div class="big">
                            <img src="../images/pro/1.jpg" alt="">
                        </div>
                    </div>

                </div>
            </div>
            <div class="danpinRight">
                <div class="cuxiaoPrice">
                    <span>售价：</span>
                    <span>￥<strong>${goods.gprice}0</strong></span>
                    <a href="#">充100返100，点击充值</a>
                </div>
                <div class="danpinColor">
                    <p class="info">颜色：</p>
                    <ul>
                        <c:forEach items="${GoodsDetail}" var="item">
                            <li>
                                <div class="colorBlock">
                                    <a href="javascript:;">
                                        <span>
                                            <img src="../images/pro/${item.gdurl}" alt="">
                                        </span>
                                        <p data="${item.gdcolor}">${item.gdcolor}</p>
                                    </a>
                                </div>
                                    <%--<span></span>--%>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="danpinSize clearfix">
                    <p class="info">尺码：</p>
                    <ul class="selSize clearfix" style="height: 31px;">
                        <c:forEach items="${size}" var="item">
                            <li>
                                <div>${item}</div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="danpinNum clearfix">
                    <p class="info">数量：</p>
                    <select name="number" id="" style="width: 50px;">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select>
                    <%--<span style="color: #a10000;">余量有限</span>--%>
                </div>
                <div class="danpinChose clearfix">
                    <span class="info">已选：</span>
                    <span class="color">白色</span>
                    <span class="size"></span>
                    <span class="countInfo">现在有货</span>
                </div>
                <div class="shoppingNews clearfix">
                    <a href="#" class="buyNow">立即购买</a>
                    <a class="addToCar"></a>
                </div>
                <div class="promotion">
                    <h4>
                        <span>优惠提示</span>
                    </h4>
                    <ul>
                        <li>全场购物满199元免运费</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="productDetail" id="produce">
        <div class="attr">
            <%--<h3>产品属性：（点击可查看同类商品）</h3>
            <div class="keyword">
                关键词：<a href="#">朴树好好的</a>
            </div>--%>
            <h3 style="margin-top: 20px;">详情图片：</h3>
            <h3 style="font-weight: normal; margin-top: 10px;">注：商品实际颜色以静物图为准</h3>
            <div class="imgdetail">
                <img src="../images/imgdetail/mt.jpg" alt="">
                <%--动态插入详情图片--%>
                <img src="../images/imgdetail/${goods.gdetail}" alt="">
                <img src="../images/imgdetail/cm.jpg" alt="">
                <img src="../images/imgdetail/size.jpg" alt="">
                <img src="../images/imgdetail/xd.jpg" alt="">
                <img src="../images/imgdetail/wash.jpg" alt="">
                <%--<img src="../images/pro/63770210426_01.jpg" alt="">
                    <img src="../images/pro/63770210426_02.jpg" alt="">
                    <img src="../images/pro/63770210426_03.jpg" alt="">
                    <img src="../images/pro/63770210426_04.jpg" alt="">
                    <img src="../images/pro/63770210426_05.jpg" alt="">
                    <img src="../images/pro/63770210426_06.jpg" alt="">
                    <img src="../images/pro/63770210426_07.jpg" alt="">--%>
            </div>
        </div>
    </div>
    <div class="dicussDiv">
        <div id="star">
            <span>宝贝与描述相符(打分匿名)</span>
            <ul>
                <li><a href="javascript:;">1</a></li>
                <li><a href="javascript:;">2</a></li>
                <li><a href="javascript:;">3</a></li>
                <li><a href="javascript:;">4</a></li>
                <li><a href="javascript:;">5</a></li>
            </ul>
            <span></span>
            <p></p>
        </div><!--star end-->
        <div class="textarea-container">
            <textarea cols="80" rows="5" name="comcontent" placeholder="请输入评论" class="dicussText" id="dicussArea"
                      autofocus></textarea>
        </div>
        <button class="comment-submit">发表评论</button>
    </div>
    <div class="productComment clearfix">
        <div class="tjpro fl">
            <h4>推荐产品</h4>
            <ul>
                <li>
                    <img src="../images/pro/6375110-1j201609091537311327.jpg" alt="">
                    <h3><a href="#">凡客衬衫 吉国武 免烫 领尖扣 3.0 蓝色</a></h3>
                    <p class="price">售价￥398</p>
                </li>
                <li>
                    <img src="../images/pro/6377427-1j201705021034274711.jpg" alt="">
                    <h3><a href="#">凡客T恤 字 乐 2 黑色</a></h3>
                    <p class="price">售价￥78</p>
                </li>
                <li>
                    <img src="../images/pro/6364213-1j201602031645295558.jpg" alt="">
                    <h3><a href="#">凡客帆布鞋 女款 黑色</a></h3>
                    <p class="price">售价￥198</p>
                </li>
                <li>
                    <img src="../images/pro/6373619-1j201602031645294621.jpg" alt="">
                    <h3><a href="#">凡客帆布鞋 高帮 男款 黑色</a></h3>
                    <p class="price">售价￥198</p>
                </li>
            </ul>
        </div>
        <div class="productCommentRight fr">
            <a id="comment"></a>
            <div class="newComment">
                <h4>
                    <span style="font-weight: bolder">最新评论（<span id="count" data="${count}">${count}</span>）</span>
                    <input type="radio" checked id="allComment" name="choseComment"><label for="allComment">全部评论</label>
                    <input type="radio" id="picComment" name="choseComment"><label for="picComment">图片（0）</label>
                    <a class="addComment">我要评论</a>
                </h4>
                <input type="hidden" value="${goodsdetail.gid}" id="gid">
                <div class="commentContent clearfix">
                    <c:if test="${requestScope.comments.size() ==0}">
                        <p style="line-height: 30px;">暂无评论！</p>
                    </c:if>
                    <c:if test="${requestScope.comments.size() > 0}">
                        <c:forEach items="${comments}" var="item">
                            <div class="commentTab clearfix">
                                <div class="commentLeft fl">

                                    <div class="commentCon fl">
                                        <p>${item.content}</p>
                                        <span class="time">${item.releaseTime}</span>
                                    </div>
                                    <div class="productCon fr">
                                            <%--<p>颜色：白色</p>
                                            <p>尺码：XL</p>
                                            <p>身高：0cm</p>
                                            <p>体重：0.0kg</p>--%>
                                            <%-- <p class="plSize">
                                                 <尺码偏大>
                                             </p>--%>
                                    </div>
                                </div>
                                <div class="commentRight fl">
                                    <p><a href="#">${item.uname}</a></p>
                                    <span class="uselevel"></span>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="page">
                                <%--<a>1</a>--%>
                            <a id="prevBtn">首页</a>
                            <span>

                            </span>
                            <a id="nextBtn">末页</a>
                        </div>
                    </c:if>
                    <script>

                        var start = (parseInt($(".start").val()) + 1) / 2;

                        var len = $("#count").attr("data");
                        len = len % 2 == 0 ? len : parseInt(len) + 1;
                        for (var i = 0; i < len / 2; i++) {
                            $(".page span").append("<a style='padding: 0 8px;'>" + (i + 1) + "</a>");
                        }
                        $(".page span a:eq(" + (start - 1) + ")").addClass("click");
                        if(start == 1){
                            $("#prevBtn").addClass("click");
                        }

                        if(start == $(".page span a:last").text()){
                            $("#nextBtn").addClass("click");
                        }

                        $(".page span").on("click", "a", function () {

                            location.href = "/showGoodsDetail?gid=" + $("#gid").val() + "&start=" + (($(this).index() + 1) * 2 - 1) + "&end=" + (($(this).index() + 1) * 2) + "#comment";
                        });

                        $("#prevBtn").click(function () {
                            location.href = "/showGoodsDetail?gid=" + $("#gid").val() + "&start=1&end=2#comment";
                        });
                        $("#nextBtn").click(function () {
                            var end = $("#count").attr("data") % 2 == 0 ? $("#count").attr("data") : ($("#count").attr("data") * 1 + 1);

                            location.href = "/showGoodsDetail?gid=" + $("#gid").val() + "&start=" + (end - 1) + "&end=" + end + "#comment";
                        });

                    </script>
                </div>
            </div>
            <div class="newQuestion">
                <a id="question"></a>
                <h4>最新提问（共<span id="qcount" data="${qcount}" style="color:red;">${qcount}</span>条）<a class="addQuestion"
                                                                                                     href="#qqqq">我要提问</a>
                </h4>
                <div class="questionList">
                    <c:if test="${requestScope.questions.size() ==0}">
                        <p style="line-height: 30px;">暂无提问！</p>
                    </c:if>
                    <c:if test="${requestScope.questions.size() > 0}">
                        <c:forEach items="${questions}" var="item">
                            <div class="questionListItems clearfix">
                                <div class="question clearfix">
                                    <p>
                                        <span class="Q fl">Q</span>
                                        <span>${item.uname}：</span>
                                        <span class="qcontent">${item.qcontent}</span>
                                    </p>
                                    <h5>${item.releaseTime} <a class="myAnswer" style="cursor: pointer;">我要回复（）</a></h5>
                                </div>
                                <c:forEach items="${answer}" var="item">
                                    <p class="adminAsk">
                                        <span class="A fl">A</span>
                                            <%--亲爱的客户您好，此商品是预售商品，预计下单之日起10-30天发货，感谢您的支持！--%>
                                            ${item.answer}
                                    </p>
                                </c:forEach>

                                    <%--回复框--%>

                                <div class="notesNewpl">
                                    <div class="refrshreply">
                                        <span class="blank5"></span>
                                        <div class="new-page">
                                    <span class="agray">
                                    <a><img src="../images/s.gif"> </a>
                                    <a class="new-mr">上一页</a>
                                    </span>
                                            <span class="agray">
                                    <a class="new-mr">下一页</a>
                                    <a><img src="../images/x.gif"> </a>
                                    </span>
                                        </div>
                                        <span class="blank10"></span>
                                    </div>
                                </div>
                                <div class="publish publish20130114 ">
                                    <p class="lineh">
                                        <span class="pl0727Ht">发表回复</span>
                                    </p>
                                    <form>
                                        <p class="textcontent">
                                    <textarea onKeyUp="javascript:checkWord(this);"
                                              onMouseDown="javascript:checkWord(this);" name="content"
                                              class="new-color999"
                                              placeholder="请勿发表代购或敏感类信息，多次发表违规信息的用户将被禁止回复操作"></textarea>


                                            <span class="new-color999">
    还可以输入<span style="color: #b81c22;font-size: 14px;font-weight: bold;" id="wordCheck">100</span>个字
    </span>
                                        </p>

                                        <p class="two-btn">
    <span class="publishreply">
    <input type="button" value="回复" class="answer">
    </span>
                                            <span class="publisha">
    <input type="reset" value="取消" class="cancle">
    </span>
                                        </p>
                                    </form>
                                    <span class="blank10"></span>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="page">1</div>
                    </c:if>


                </div>
            </div>
            <span class="blank10" id="qqqq" style="height: 60px;"></span>
            <div class="Askquestion" id="askQestion">
                <h3>
                    <span></span>
                    提问：${goods.gtype} ${goods.gname}
                </h3>
                <dl class="questionStyle">
                    <dt>提问类型：</dt>
                    <dd>
                        <ul class="quiztype">
                            <li><input type="radio" name="questionType" value="商品提问"><span>商品提问</span></li>
                            <li><input type="radio" name="questionType" value="促销活动提问"><span>促销活动提问</span></li>
                            <li><input type="radio" name="questionType" value="库存及物流提问"><span>库存及物流提问</span></li>
                            <li><input type="radio" name="questionType" value="售后提问"><span>售后提问</span></li>
                        </ul>
                    </dd>
                </dl>
                <span class="blank0"></span>
                <dl>
                    <dt>提问内容：</dt>
                    <dd>
                        <textarea class="Askcontent" name="askcontent"></textarea>
                        <input type="button" class="askSubBtn">
                    </dd>
                </dl>
                <span class="blank0"></span>
            </div>
        </div>

    </div>
    <%-- <span class="blank10"></span>--%>
    <%--<div class="Askquestion" id="askQestion">
        <h3>
            <span></span>
            提问：${goods.gtype} ${goods.gname}
        </h3>
        <dl class="questionStyle">
            <dt>提问类型：</dt>
            <dd>
                <ul class="quiztype">
                    <li><input type="radio" name="questionType" value="商品提问"><span>商品提问</span></li>
                    <li><input type="radio" name="questionType" value="促销活动提问"><span>促销活动提问</span></li>
                    <li><input type="radio" name="questionType" value="库存及物流提问"><span>库存及物流提问</span></li>
                    <li><input type="radio" name="questionType" value="售后提问"><span>售后提问</span></li>
                </ul>
            </dd>
        </dl>
        <span class="blank0"></span>
        <dl>
            <dt>提问内容：</dt>
            <dd>
                <textarea class="Askcontent" name="askcontent"></textarea>
                <input type="button" class="askSubBtn">
            </dd>
        </dl>
        <span class="blank0"></span>
    </div>--%>
</div>
</div>
</div>
<!--/商品信息结束-->

<!--底部区域开始-->
<div class="vanclfoot">
    <div class="vanclCustomer publicfooterclear">
        <ul>
            <li>
                <a>
                    <p class="onlineCustomer">
                        <img src="../images/pro/onlinecustomer.png" alt="">
                    </p>
                    <p class="onlineTime"> 7X9小时在线客服</p>
                </a>
            </li>
            <li>
                <a>
                    <p class="seven">
                        <img src="../images/pro/seven.png" class="seven-img">
                    </p>
                    <p> 7天内退换货</p>
                    <p> 购物满199元免运费</p>
                </a>
            </li>
            <li class="twocode">
                <p>
                    <img src="../images/pro/2014_8_29_16_39_33_7709.jpg" style="width: 104px; height:104px;" alt="">
                </p>
                <p>
                    扫描下载<a>凡客</a>客户端
                </p>
            </li>
        </ul>
    </div>
    <div class="vanclOthers">
        <ul>
            <li><a>关于凡客</a></li>
            <li><a>新手指南</a></li>
            <li><a>配送范围及时间</a></li>
            <li><a>支付方式</a></li>
            <li><a>售后服务</a></li>
            <li class="last-one"><a>帮助中心</a></li>
        </ul>
    </div>
</div>
<div class="footerArea">
    <div class="footTop">
        <div class="footTopTab">
            <p>
                Copyright 2007 - 2016 vancl.com All Rights Reserved 京ICP证100557号 京公网安备11011502002400号
                出版物经营许可证新出发京批字第直110138号
            </p>
            <p>
                凡客诚品（北京）科技有限公司
            </p>
        </div>
    </div>
    <span class="blank20"></span>
    <div class="subFooter">
        <a class="redLogo"></a>
        <span class="costumeOrg"></span>
        <a class="wsjyBzzx"></a>
        <a class="vanclMsg"></a>
        <a class="vanclqingNian"></a>
        <a><img src="../images/pro/footlast-tab.PNG" style="width: 120px; height: 39px;"></a>
    </div>
</div>
<!-- /底部区域结束-->
</body>
<script src="../js/common.js"></script>
<script src="../js/product.js"></script>
<script>
    //剩余字数统计
    var maxstrlen = 100;
    function Q(s) {
        return document.getElementById(s);
    }
    function checkWord(c) {
        len = maxstrlen;
        var str = c.value;
        myLen = getStrleng(str);
        var wck = Q("wordCheck");
        if (myLen > len * 2) {
            c.value = str.substring(0, i + 1);
        }
        else {
            wck.innerHTML = Math.floor((len * 2 - myLen) / 2);
        }
    }

    function getStrleng(str) {
        myLen = 0;
        i = 0;
        for (; (i < str.length) && (myLen <= maxstrlen * 2); i++) {
            if (str.charCodeAt(i) > 0 && str.charCodeAt(i) < 128)
                myLen++;
            else
                myLen += 2;
        }
        return myLen;
    }


    //评论隐藏显现
    $(".addComment").click(function () {
        $(".dicussDiv").show();
    });

    // 添加评论
    $(".comment-submit").click(function () {
        if ($("#userName").val()) {
            if ($(".dicussText").val()) {
                var formData = {
                    "content": $(".dicussText").val(),
                    "gid": $("#gid").val(),
                    "uname": $("#userName").val()
                }
                var parm = {
                    url: "/addComment",
                    type: "post",
                    data: formData,
                    success: function (data) {
                        var date = new Date();
                        var year = date.getFullYear();
                        var month = date.getMonth();
                        var day = date.getDate();
                        month = month + 1 > 10 ? month + 1 : "0" + (month + 1);
                        day = day > 10 ? day : "0" + day;
                        var time = year + "-" + month + "-" + day;
                        var str = "";
                        str += "<div class='commentTab clearfix'>";
                        str += "<div class='commentLeft fl'>";
                        str += "<div class='commentCon fl'>";
                        str += "<p>" + $(".dicussText").val() + "</p>";
                        str += "<span class='time'>" + time + "</span>";
                        str += "</div>";
                        /* str += "<div class='productCon fr'>";
                         str += "<p>颜色：白色</p>";
                         str += "<p>尺码：XL</p>";
                         str += "<p>身高：0cm</p>";
                         str += "<p>体重：0.0kg</p>";
                         str += "<p class='plSize'><尺码偏大></p>";
                         str += "</div>";*/
                        str += "</div>";
                        str += "<div class='commentRight fl'>";
                        str += "<p><a href='#'>" + $("#userName").val() + "</a></p>";
                        str += "<span class='uselevel'></span>";
                        str += "</div>";
                        str += "</div>";
                        $(".commentContent").prepend(str);
                        $(".dicussDiv").hide();
                        var count = $("#count").attr("data");
                        $("#count").text(parseInt(count) + 1);
                        $("#count").attr("data", $("#count").text());
                        alert("评论成功！");
                    },
                    error: function () {
                        alert("请求地址失败！");
                    }
                };
                $.ajax(parm);
            } else {
                alert("请输入评论内容！");
            }
        } else {
            if (confirm("您还没有登录！登录后才能评论,去登录?")) {
                location.href = "pages/login.jsp";
            } else {
                $(".dicussDiv").hide();
            }
            // alert("您还没有登录！登录后才能评论");

        }
    });

    //提问隐藏显现
    $(".addQuestion").click(function () {
        $(".Askquestion").show();
    });

    // 添加提问
    $(".askSubBtn").click(function () {
        if ($("#userName").val()) {
            if ($("input[name='questionType']:checked").val()) {
                if ($(".Askcontent").val()) {
                    var dataForm = {
                        "qtype": $("input[name='questionType']:checked").val(),
                        "gid": $("#gid").val(),
                        "askcontent": $(".Askcontent").val(),
                        "uname": $("#userName").val()
                    };

                    var parm = {
                        url: "/addQuestion",
                        type: "post",
                        data: dataForm,
                        success: function (data) {
                            var str = "";
                            var date = new Date();
                            var year = date.getFullYear();
                            var month = date.getMonth();
                            var day = date.getDate();
                            month = month + 1 > 10 ? month + 1 : "0" + (month + 1);
                            day = day > 10 ? day : "0" + day;
                            var time = year + "-" + month + "-" + day;
                            str += "<div class='questionListItems clearfix'>";
                            str += "<div class='question clearfix'>";
                            str += "<p>";
                            str += "<span class='Q fl'>Q</span>";
                            str += "<span>用户名：</span>";
                            str += "<span>" + $('.Askcontent').val() + "</span>";
                            str += "</p>";
                            str += "<h5>" + time + " <a class='myAnswer' style='cursor: pointer;'>我要回复（）</a></h5>";
                            str += "</div>";
                            str += "<p class='adminAsk'>";
                            str += "<span class='A fl'>A</span>";
                            str += " 亲爱的客户您好，此商品是预售商品，预计下单之日起10-30天发货，感谢您的支持！";
                            str += "</p>";

                            str += "</div>";
                            $(".questionList").prepend(str);
                            $("#askQestion").hide();
                            var count = $("#qcount").attr("data");
                            $("#qcount").text(parseInt(count) + 1);
                            $("#qcount").attr("data", $("#qcount").text());
                            alert("提问成功！");

                        },
                        error: function () {
                            alert("请求地址有问题！")
                        }
                    }
                    $.ajax(parm);
                } else {
                    alert("请输入提问内容！");
                }
            } else {
                alert("请输入提问类型!");
            }
        } else {
            if (confirm("您还没有登录！登录后才能提问,去登录?")) {
                location.href = "pages/login.jsp";
            } else {
                $("#askQestion").hide();
            }
            // alert("您还没有登录！登录后才能提问");

        }

    });

    // 加入购物车
    $(".addToCar").click(function () {
        if ($(".size").text()) {
            var dataForm = {
                "imgurl": $(".danpinColor li.on img").attr("src"),
                "color": $(".danpinColor li.on p").text(),
                "gid": $("#gid").val(),
                "size": $(".danpinSize li.on div").text(),
                "number": $(".danpinNum select").val(),
                "gname": $("#prodfixed .gname").text(),
                "gprice": $(".cuxiaoPrice strong").text()
            }

            var parm = {
                url: "/addShoppingCart",
                type: "post",
                data: dataForm,
                success: function (data) {
                    //alert("加入购物车成功！");
                    if (confirm("加入购物车成功！是否就进入购物车？")) {
                        location.href = "pages/shoppingCart.jsp";
                    }

                },
                error: function () {
                    alert("请求地址失败！");
                }
            }
            $.ajax(parm);
        } else {
            alert("请选择尺寸！！");
        }
    });

    // 添加回复
    $(".answer").click(function () {
        if ($("#userName").val()) {
            if ($(".textcontent textarea").val()) {
                var formData = {
                    "gid": $("#gid").val(),
                    "qcontent": $(this).parents(".questionListItems").find(".qcontent").text(),
                    "answer": $(".textcontent textarea").val()
                }

                var parm = {
                    url: "/addAnswer",
                    type: "post",
                    data: formData,
                    success: function (data) {
                        $(".notesNewpl").hide();
                        $(".publish").hide();
                        $(".new-color999").val($(this).defaultValue);
                        $("#wordCheck").text("100");
                        var str = "";
                        str += "<p class='adminAsk'>";
                        str += "<span class='A fl'>A</span>";
                        str += $(".textcontent textarea").val();
                        str += "</p>";
                        $(".question").prepend(str);
                        alert("回复成功！")
                    },
                    error: function () {
                        alert("请求地址失败！");
                    }
                }
                $.ajax(parm);
            } else {
                alert("请输入回复内容！")
            }
        } else {
            location.href = "pages/login.jsp";
        }
    })


</script>

</html>