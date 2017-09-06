<%@ page import="java.util.List" %>
<%@ page import="com.seecen.vancl.dao.GoodsDao" %>
<%@ page import="com.seecen.vancl.pojo.Goods" %>
<%@ page import="com.seecen.vancl.pojo.CarGoods" %><%--
  Created by IntelliJ IDEA.
  User: Yuan
  Date: 2017/7/27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    List<CarGoods> CartContent = new GoodsDao().getShoppingCart();
    request.setAttribute("CartItem", CartContent);

%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="shortcut icon" type="image/x-icon" href="../images/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="../css/ShoppingCartCss.css">
    <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>

    <title>购物车 - VANCL 凡客诚品</title>

</head>
<body>
<div class="top">
    <div class="topContent">
        <a href="###"><img src="../images/shoppingCar/vancl-logo.png" alt=""></a>
        <p class="topC-R">
            <%-- <span>您好，欢迎光临凡客诚品。</span>
             <a href="###" >登录</a><b>|</b><a href="###">注册</a>--%>
            <c:if test="${sessionScope.userInfo!=null}">
                ${userInfo.uname},欢迎光临凡客诚品！
            </c:if>
            <c:if test="${sessionScope.userInfo==null}">
                您好,欢迎光临凡客诚品！ <a class="LoginReg" href="pages/login.jsp">登录 </a> | <a class="LoginReg"
                                                                                     href="pages/register.jsp">注册</a>
            </c:if>
            <a href="###">帮助中心</a>
        </p>
    </div>
</div>

<div class="nav">
    <div class="navContent">
        <div class="navFir">
            <span>1.我的购物车</span>
            <span>2.填写核对信息单</span>
            <span>3.成功提交订单</span>
        </div>

        <div class="tips">
            <img src="../images/shoppingCar/9.png" alt="">
            <h3>我的购物车</h3>
        </div>
        <div class="tipsFir">
            <span>温馨提示：</span>1.选购清单中的商品无法保留库存，请您及时结算。2.商品的价格和库存将以订单提交时为准。3.促销活动满减优惠将均摊至商品小计中。
        </div>
    </div>

    <div class="content">
        <div class="contentC">
            <table cellspacing="0" class="CartTable">
                <thead>
                <tr class="CThead">

                    <th>
                        <input type="checkbox" class="all" id="all-1">&nbsp;&nbsp;全选
                    </th>
                    <th>商品名称</th>
                    <th>尺寸</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>优惠</th>
                    <th>小计</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody class="CTcontent">


                <c:forEach items="${CartItem}" var="Citem">
                    <tr class="CTcontent-son">

                        <td>
                            <input type="checkbox" class="cbBug">&nbsp;&nbsp;
                        </td>
                        <td>
                            <i><img src="${Citem.gurl}" alt="" width="40"></i>
                            <a href="###">${Citem.gname}</a>
                        </td>
                        <td>${Citem.gsize}</td>
                        <td>￥<span class="unit">${Citem.gprice}</span></td>
                        <td class="">
  				  <span class="">
  				    <button class="jian">-</button>
 				  </span>
                            <input type="text" class="CTnum small" value="${Citem.gcount}">
                            <span class="">
					   <button class="jia">+</button>
  					</span>
                        </td>
                        <td>-</td>
                        <td style="position: relative;width: 133px">￥<span class="price"></span></td>
                        <td><a class="del" style="cursor: pointer">删除</a>
                            <input type="hidden" value="${Citem.gid}" name="GoodsId" id="Gid">
                        </td>
                    </tr>

                </c:forEach>


                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="buy">
    <div class="buyContent">
        <div class="buyLeft">
            <p class="buyLeft-fir">
                <input type="checkbox" class="all" id="all-2"><label for="all-2">全选</label>&nbsp;&nbsp;<a style="cursor: pointer"
                                                                                                          class="del-all">删除全部</a>&nbsp;&nbsp;&nbsp;&nbsp;<span>数量总计：<b
                    style="color: #c00b0b" class="number">0</b>&nbsp;&nbsp;件</span></p>
            <p class="buyLeft-sec">
                产品金额总计(不含运费)：<b class="money-icon">￥</b><span class="money"></span>
            </p>
        </div>
        <div class="buyRight">
            <button class="KeepShopping" href="index.jsp"><
                <继续购物
            </button>
            <button class="Pay">￥&nbsp;去结算>></button>
        </div>

    </div>
</div>

<div class="footer">
    <div class="footerContent">
        <p>Copyright 2007 - 2017 vancl.com All Rights Reserved 京ICP证100557号 京公网安备11010102000579号
            出版物经营许可证新出发京批字第直110138号</p>
        <p>
            <a href="###"><img src="../images/shoppingCar/4.png" alt=""></a>
            <a href="###"><img src="../images/shoppingCar/5.png" alt=""></a>
            <a href="###"><img src="../images/shoppingCar/6.png" alt=""></a>

        </p>
    </div>
</div>
</div>


</body>
</html>
<script>
    $(".all").click(function () {
        $(".cbBug").prop("checked", this.checked);
        $(".all").prop("checked", this.checked);
        num();
        money();
    });
    $(".cbBug").click(function () {
        if ($("input:checked").length == $(".cbBug").length) {
            $(".all").prop("checked", true);
            $(".cbBug").prop("checked", this.checked);
        } else {
            $(".all").prop("checked", false);
        }
        num();
        money();
    });

    //加减操作
    $(".jia").click(function () {
        var m = $(this).parent().parent().find("input").val();
        var prise = $(this).parent().parent().parent().find(".unit").text();
        console.log(prise);
        $(this).parent().parent().find("input").val(parseInt(m) + 1);
        if (parseInt(m) > 0) {
            $(".jian").removeClass("disabled");
        }
//	console.log($(this).parent().parent().find("input").val())
        $(this).parent().parent().parent().find(".price").text(parseInt(prise) * (parseInt(m) + 1) + ".00");
        num();
        money();
    });


    $(".jian").click(function () {
        var m = $(this).parent().parent().find("input").val();
        var prise = $(this).parent().parent().parent().find(".unit").text();
        if (parseInt(m) <= 1) {
            $(this).addClass("disabled");
            m == 1;
        } else {
            $(this).parent().parent().find("input").val(parseInt(m) - 1);
//	    console.log($(this).parent().parent().find("input").val());
            $(this).removeClass("disabled");
        }
        if (parseInt(m) == 1) {
            $(this).parent().parent().parent().find(".price").text(prise)
        } else {
            $(this).parent().parent().parent().find(".price").text(parseInt(prise) * (parseInt(m) - 1) + ".00");
        }
        num();
        money();
    });

    //数量计算操作
    function num() {
        var x = 0;
        $(".small").each(function () {
            if ($(this).parent().prevAll().find("input").prop("checked")) {
                x = x + parseInt($(this).val());
                $(".number").text(x);
            }
        })
        $(".number").text(x);
//console.log(x);
    }

    function money() {
        var y = 0;
        $(".price").each(function () {
            if ($(this).parent().prevAll().find("input").prop("checked")) {
                y = y + parseInt($(this).text());
                $(".money").text(y);
            }
        })
        $(".money").text(y);
//console.log(y);
    }

    //删除操作

    //	num();
    //inputBUG修改
    $(".small").change(function () {
        if(parseInt($(this).val())<=0){
            $(this).val(1);
        }
        var m = $(this).val();
        var prise = $(this).parent().parent().parent().find(".unit").text();
        $(this).parent().parent().find(".price").text(parseInt(prise)*(parseInt(m))+".00");
        num();
        money();
    });
    $(function () {
        $(".small").each(function () {
            var m = $(this).val();
            var prise = $(this).parent().parent().find(".unit").text();
            $(this).parent().parent().find(".price").text(parseInt(prise)*(parseInt(m))+".00");
            num();
            money();
        })
    });
    $(".del-all").click(function(){
        $(".number").text(0);
        $(".money").text(0);

        $(".cbBug").parent().parent().remove();
        $(".all").prop("checked",false);
        $.ajax({
            url:"/delAllCart",
            type:"post",
            data:{},
            success:function (date) {

            },
            error:function () {

            }
        });


    });
    //	num();
    //Ajax

    $(".del").click(function () {
        var m = 0;
        $(this).parent().parent().find(".small").val(0);
        var prise = 0;
        $(this).parent().parent().find(".price").text(parseInt(prise)*(parseInt(m)));

        num();
        money();
        $(this).parent().parent().remove();

        $.ajax({
            url:"/delShoppingCart",
            type:"post",
            data:{"GoodsId":$(this).parent().find("#Gid").val()},
            success:function (date) {

            },
            error:function () {
            alert(1);
            }
        });
    });

</script>