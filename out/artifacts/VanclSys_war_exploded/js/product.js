/**
 * Created by Administrator on 2017/7/27.
 */

$(function () {

    /**
     * 固定区域
     */
    $(window).scroll(function () {
        $body = (window.opera) ? (document.compatMode == "CSS1Compat" ? $('html') : $('body')) : $('html,body');
        // 当滚动条大于600的时候
        if ($(document).scrollTop()> 600) {
            $("#prodfixed").show();
        } else {
            $("#prodfixed").hide();
        }
    });

    /**
     * 左边小图的鼠标移上效果
     */
    $("#imageMenu").on("mouseover", "li", function () {
        $(this).addClass("hover")
            .siblings().removeClass("hover");

        $src = $(this).children("img").attr("src");
        $(".bigImg img").attr("src", $src);
        $(".big img").attr("src", $src);
    });

    // 默认第一个


    // 颜色点击事件
    $(".danpinColor").on("click", "li", function () {
        $(".size").text("");
        $(this).addClass("on").append("<span class='hoverOk'></span>")
            .siblings().removeClass("on").children(".hoverOk").remove();
        $src = $(this).find("img").attr("src");
        $(".bigImg img").attr("src", $src);
        $(".big img").attr("src", $src);

        // 颜色添加进去
        $(".color").text($(this).find("p").text());

        var $color = $(this).find("p").attr("data");
        // 清除
        $(".selSize").empty();
        var count = 0;

        $("#imageMenu").empty();
        // 传颜色值
        var formData ={
            "color": $color,
            "gid": $("#gid").val()
        }
        var parm = {
            url: "/searchSize",
            type: "post",
            data: formData,
            success:function (data) {
               console.log(typeof  data);
               var arr = data.split("--");


               var arrSize =arr[0].replace("[","").replace("]","").replace(/ /g,"").split(",");
               for(var i = 0 ; i < arrSize.length;i++){
                    $(".selSize").append("<li><div>"+arrSize[i]+"</div></li>");
                }

                var arrUrl =arr[1].replace("[","").replace("]","").replace(/ /g,"").split(",");
                for(var i = 0 ; i < arrUrl.length;i++){
                    $("#imageMenu").append("<li><img src='../images/pro/"+arrUrl[i]+"'alt=''></li>");
                }

                $("#imageMenu li:first").trigger("mouseover");
            },
            error: function(){
                alert("请求地址失败！");
            }
        }
        $.ajax(parm);


    });


    $(".danpinColor ul li:first").trigger("click");


    // 尺寸点击事件

    $(".danpinSize").on("click", "li", function () {
        $(this).addClass("on").append("<span class='hoverOk'></span>")
            .siblings().removeClass("on").children(".hoverOk").remove();
        $(".size").text($(this).children("div").text());
    });



    //放大镜效果 鼠标在small上移动 计算坐标
    $(".mask").hide();
    $(".small").mouseover(function () {
        $(".big").show();
        $(".mask").show();
    });
    $(".small").mouseout(function () {
        $(".big").hide();
        $(".mask").hide();
    });

    var x = 0;
    var y = 0;
    $(".small").mousemove(function (e) {
        var box_left = $(".imgbox").offset().left;
        var box_top = $(".imgbox").offset().top;
        x = e.pageX - box_left - $(".mask").width() / 2;
        y = e.pageY - box_top - $(".mask").height() / 2;
        console.log(box_left, box_top);
        // console.log(x,y);
        x = x < 0 ? 0 : x;
        y = y < 0 ? 0 : y;
        x = x > $(".small").width() - $(".mask").width() ? $(".small").width() - $(".mask").width() : x;
        y = y > $(".small").height() - $(".mask").height() ? $(".small").height() - $(".mask").height() : y;

        $(".mask").css({
            "left": x,
            "top": y
        });

        //console.log($(".small").width());
        //按比例进行放大 根据 小的移动的距离
        $(".big img").css({
            "left": -x * $(".big").width() / $(".small").width(),
            "top": -y * $(".big").height() / $(".small").height()
        });

    });

    //打分

    var oStar = document.getElementById("star");
    var aLi = oStar.getElementsByTagName("li");
    var oUl = oStar.getElementsByTagName("ul")[0];
    var oSpan = oStar.getElementsByTagName("span")[1];
    var oP = oStar.getElementsByTagName("p")[0];
    var i = iScore = iStar = 0;
    var aMsg = [
        "很不满意|差得太离谱，与卖家描述的严重不符，非常不满",
        "不满意|部分有破损，与卖家描述的不符，不满意",
        "一般|质量一般，没有卖家描述的那么好",
        "满意|质量不错，与卖家描述的基本一致，挺满意的",
        "非常满意|质量非常好，与卖家描述的完全一致，非常满意"
    ]

    for (i = 1; i <= aLi.length; i++){
        aLi[i - 1].index = i;

        //鼠标移过显示分数
        aLi[i - 1].onmouseover = function (){
            fnPoint(this.index);
            //浮动层显示
            oP.style.display = "block";
            //计算浮动层位置
            oP.style.left = oUl.offsetLeft + this.index * this.offsetWidth - 104 + "px";
            //匹配浮动层文字内容
            oP.innerHTML = "<em><b>" + this.index + "</b> 分 " + aMsg[this.index - 1].match(/(.+)\|/)[1] + "</em>" + aMsg[this.index - 1].match(/\|(.+)/)[1]
        };

        //鼠标离开后恢复上次评分
        aLi[i - 1].onmouseout = function (){
            fnPoint();
            //关闭浮动层
            oP.style.display = "none"
        };

        //点击后进行评分处理
        aLi[i - 1].onclick = function (){
            iStar = this.index;
            oP.style.display = "none";
            oSpan.innerHTML = "<strong>" + (this.index) + " 分</strong> (" + aMsg[this.index - 1].match(/\|(.+)/)[1] + ")"
        }
    }

    //评分处理
    function fnPoint(iArg){
        //分数赋值
        iScore = iArg || iStar;
        for (i = 0; i < aLi.length; i++) aLi[i].className = i < iScore ? "on" : "";
    }

    //我要回复
    //显示隐藏
    $(".myAnswer").click(function(){
        $(this).parents(".questionListItems").find(".notesNewpl").slideToggle();
        $(this).parents(".questionListItems").find(".publish").slideToggle();
    });

    /*// 获取时间
    function getDate() {
        var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth();
        var day = date.getDate();


    }*/






})


