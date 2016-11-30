<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page import="com.tywy.bean.*"%>

<html>
<head>
    <meta charset="utf-8">
    <title>八戒吃什么？</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
    <meta name="format-detection" content="telephone=no">
    <link href="<%=basePath%>css/layout.css?v=434324234" rel="stylesheet">
    <link href="<%=basePath%>css/animate.min.css?v=434324234" rel="stylesheet">
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery-ui-1.7.2.custom.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery.flip.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery.carouFredSel.js"></script>
    <style>
        #loading{background-color: rgba(0,0,0,.9);height: 100%;width: 100%;position: fixed;z-index: 99999999999;margin-top: 0px;top: 0px;}
        #loading-center{width: 100%;height: 100%;position: relative;}
        #loading-center-absolute {position: absolute;left: 50%;top: 50%;height: 150px;width: 150px;margin-top: -75px;margin-left: -75px;-moz-border-radius: 50% 50% 50% 50%;-webkit-border-radius: 50% 50% 50% 50%;border-radius: 50% 50% 50% 50%;}
        .object{width: 20px;height: 20px;background-color: #f0c600;position: absolute;-moz-border-radius: 50% 50% 50% 50%;-webkit-border-radius: 50% 50% 50% 50%;border-radius: 50% 50% 50% 50%;-webkit-animation: animate 0.8s infinite;animation: animate 0.8s infinite;}
        #object_one {top: 19px;left: 19px;}
        #object_two {top: 0px;left: 65px;-webkit-animation-delay: 0.1s;animation-delay: 0.1s;}
        #object_three {top: 19px;left: 111px;-webkit-animation-delay: 0.2s;animation-delay: 0.2s;}
        #object_four {top: 65px;left: 130px;-webkit-animation-delay: 0.3s;animation-delay: 0.3s;}
        #object_five {top: 111px;left: 111px;-webkit-animation-delay: 0.4s;animation-delay: 0.4s;}
        #object_six {top: 130px;left: 65px;-webkit-animation-delay: 0.5s;animation-delay: 0.5s;}
        #object_seven {top: 111px;left: 19px;-webkit-animation-delay: 0.6s;animation-delay: 0.6s;}
        #object_eight {top: 65px;left: 0px;-webkit-animation-delay: 0.7s;animation-delay: 0.7s;}
        @-webkit-keyframes animate {25% {-ms-transform: scale(1.5);-webkit-transform: scale(1.5);transform: scale(1.5);}75% {-ms-transform: scale(0);-webkit-transform: scale(0);transform: scale(0);}}
        @keyframes animate {50% {-ms-transform: scale(1.5,1.5);-webkit-transform: scale(1.5,1.5);transform: scale(1.5,1.5);}100% {-ms-transform: scale(1,1);-webkit-transform: scale(1,1);transform: scale(1,1);}}

        html, body {
            background-color: #A71017;
            background: url("<%=basePath%>images/bg_coupon_pop.jpg") no-repeat;
            background-size: 100% 100%;
        }
    </style>

        <script>
        $(document).ready(function(){
            $("#loading").delay(1000).fadeOut(500);
        })
    </script>
    </head>

<body>


    <div id="loading">
      <div id="loading-center">
          <div id="loading-center-absolute">
              <div class="object" id="object_one"></div>
              <div class="object" id="object_two"></div>
              <div class="object" id="object_three"></div>
              <div class="object" id="object_four"></div>
              <div class="object" id="object_five"></div>
              <div class="object" id="object_six"></div>
              <div class="object" id="object_seven"></div>
              <div class="object" id="object_eight"></div>
          </div>
      </div>
  </div>
 

    <div class="swiper-slide box fl pos-rel">
        <div class="wrapper">
            <div class="scroller">
                <div class="pullDown" id="pd1"><span class="pullDownIcon"></span><span class="pullDownLabel"></span></div>
                <div class="sec_idx_productlist sec_idx_productlist2 fl">
                    <div style="width:100%;">
                        <div><a href=""><img src="<%=basePath%>images/bannertop.jpg" width="100%" alt="" /></a></div>
                    </div>
                    <div class='xcjis'>
                      <a style="color:#A71017;" id="gamenum" href="#">还剩<span id="gamespan" class="count">${synum}</span>次机会</a>

                        <br> 朕饿了,八戒快上菜。
                    </div>
                    <div class="demo">
                        <ul id="prize">
                            <li class="red" title="点击抽奖"><img src="<%=basePath%>images/ui_card_col1.png" style="width: 100%;height: 100%;" alt="" /></li>
                            <li class="green" title="点击抽奖"><img src="<%=basePath%>images/ui_card_col2.png" style="width: 100%;height: 100%;" alt="" /></li>
                            <li class="blue" title="点击抽奖"><img src="<%=basePath%>images/ui_card_col3.png" style="width: 100%;height: 100%;" alt="" /></li>
                            <li class="purple" title="点击抽奖"><img src="<%=basePath%>images/ui_card_col4.png" style="width: 100%;height: 100%;" alt="" /></li>
                            <li class="olive" title="点击抽奖"><img src="<%=basePath%>images/ui_card_col5.png" style="width: 100%;height: 100%;" alt="" /></li>
                            <li class="brown" title="点击抽奖"><img src="<%=basePath%>images/ui_card_col6.png" style="width: 100%;height: 100%;" alt="" /></li>
                        </ul>
                        <div style="clear:both; margin-top:20px;">

                        </div>
                        <div id="data"></div>
                    </div>
   
                    
                    <div class="pullUp" id="pp1">
                        <span class="pullUpLabel" style="color:#ffffff"> &copy;体育委员</span>
                    </div>
                </div>
            </div>
        </div>
        <p class="cls"></p>


        <div class="animated zoomin" id="shadow" ></div>

        <div class="result_tip nogift animated zoomin" id="result_tip">
            <div class="share" style="margin-top: 20%;">
            <div id="getimg" class="img"  style="width: 70%;height: auto;"><a href=""><img src="<%=basePath%>images/lose1.png" alt=""></a></div>
        <div id="result" class="r"></div>
        <div id="yes" class="yes">
            <div class="tel"></div>
            <a href="#" class="close back">再来一次</a>
        </div>

        <div id="no" class="yes">
            <div class="tel"></div>
            <a href="#" class="back kq" onclick="jumpCardUrl()">领取卡券</a>
        </div>


        </div>
        </div>

        <div class="phone_tip animated zoomin" id="phone_tip">
            <div class="share" style="width: 90%;margin-left: auto;margin-right: auto;height: 100%;overflow-y: auto;">
                <div class="r" style="margin-top: 30%">
                    <p style="color:#eede04;font-size: 24px;">填写兑奖信息</p>
                    <div class="formitem">
                        <input type="text" name="tel" value="" id="tel" placeholder="填写您的手机号码">
                    </div>
                    <div class="formitem">
                        <input type="text" name="realname" value="" id="realname" placeholder="填写您的昵称">
                    </div>
                    
                </div>
                <div class="yes" id="phoneyes" style="margin-bottom: 30px">
                    <button class="back" onclick="check()"  type="submit">提交信息</button>
                </div>

            </div>
        </div>


        <div class="time_tip" id="time_tip" >
            <div class="share" style="width: 100%;margin-left: auto;margin-right: auto;height: 100%;">
                <div class="rbg" >
                                                        </div>
            </div>
        </div>


        <div class="rules_tip animated zoomin" id="rules_tip" >
            <div class="share" style="width: 90%;height: 100%;overflow-y: auto;margin-left: 5%;margin-right: 5%">
                <div class="r" style="margin-top: 20px;">
                                        <p style="color:#eede04;font-size: 24px;text-align: center;margin-bottom: 20px;">活动规则</p>

                    <p>这个是翻牌抽奖的活动说明，可以文字也可以上传图片的。</p>
                                    </div>
                                <div class="yes" id="phoneyes" style="margin-bottom: 30px">
                    <button class="back" id="rulesclose">关闭</button>
                </div>
                            </div>
        </div>



        <script type="text/javascript">

        $("#rulesimg").bind("click", function() {
            $("#shadow").show();
            $("#rules_tip").show();
        });

        $("#rulesclose").bind("click", function() {
            $("#shadow").hide();
            $("#rules_tip").hide();
        });

        $(".close").on('click touchstart',function() {
            //location.href="./index.php?i=2&c=entry&id=40&ckopenid=1&do=index&m=ruifan_fanpai";
				location.href="fpai";
        });


        $(".kq").on('click touchstart',function() {

               setTimeout(function () {

                   location.href="./index.php?i=2&c=entry&id=40&ckopenid=1&do=index&m=ruifan_fanpai";

               },600);

        });

            $(function() {
                $("#prize li").each(function() {
                    var p = $(this);
                    var c = $(this).attr('class');
                    p.click(function() {
                        $("#prize li").unbind('click');
                        $.ajax({
                         type:'GET',
                         url:'fanpai',
                         dataType:'json',
                         data:{"id":12,"time":12321312},
                         cache:false,
                         success:function(respone){

                           if(respone.data.runcode == 2){
                               alert(data.msg);
                               return false;
                           }

                           if(respone.data.runcode == 5){

                               $("#shadow").show();
                               $("#phone_tip").show();
                               return false;

                           }


                           var imgurl = respone.data.imgurl;
                           var imgurl1 = respone.data.imgurl1;

                           if(imgurl == "" || imgurl == undefined || imgurl == null){
                               var imgurl = "<%=basePath%>images/lose1.png";
                           }




                           if (respone.data.runcode == 1) {
                             
                             p.flip({
                                 direction: 'lr',
                                 content: "<img style='border-radius:10px' class='plimg' src='"+imgurl+"'>",
                                 color: c,
                                 speed: 150,
                                 onEnd: function() {
                                     p.css({
                                         "font-size": "22px",
                                         "line-height": "30px",
                                         "padding-top": "30px"
                                     });
                                     p.attr("id", "r");
                                     $("#prize li").unbind('click').css("cursor", "default").removeAttr("title");
                                 }
                             });

                               setTimeout(function(){
                                       $("#no").hide();
                                       $("#getimg").find("img").attr("src", imgurl);
                                       $("#getimg").find("a").attr("href", data.adurl);
                                       $(".tel").html(respone.data.adtitle);
                                       $("#yes").show();

                                       $("#result").html("今天吃这个么？<span>" + respone.data.name + "</span>");
                                       setTimeout(function () {
                                           $('.result_tip').css({display: 'block', top: '0px', opacity: 1});
                                           $("#shadow").show().addClass("up");
                                       }, 500);
                                  },300);


                           }else if(respone.data.runcode == 11){
                             
                             p.flip({
                                 direction: 'lr',
                                 content: "<img style='border-radius:10px' class='plimg' src='"+imgurl+"'>",
                                 color: c,
                                 speed: 150,
                                 onEnd: function() {
                                     p.css({
                                         "font-size": "22px",
                                         "line-height": "30px",
                                         "padding-top": "30px"
                                     });
                                     p.attr("id", "r");
                                     $("#prize li").unbind('click').css("cursor", "default").removeAttr("title");
                                 }
                             });


                             setTimeout(function(){
                                     $("#yes").hide();
                                     $("#getimg").find("img").attr("src", imgurl);
                                     $("#getimg").find("a").attr("href", data.adurl);
                                     $(".tel").html(data.adtitle);
                                     $("#no").show();

                                     $("#result").html("今天吃这个么？<span>" + data.name + "</span>");
                                     setTimeout(function () {
                                         $('.result_tip').css({display: 'block', top: '0px', opacity: 1});
                                         $("#shadow").show().addClass("up");
                                     }, 500);
                                },300);

                           }else{

                             p.flip({
                                 direction: 'lr',
                                 content: "<img class='plimg' src='"+imgurl+"'>",
                                 color: c,
                                 speed: 150,
                                 onEnd: function() {
                                     p.css({
                                         "font-size": "22px",
                                         "line-height": "30px",
                                         "padding-top": "30px"
                                     });
                                     p.attr("id", "r");
                                     $("#prize li").unbind('click').css("cursor", "default").removeAttr("title");
                                 }
                             });
                             setTimeout(function(){
                                     $("#no").hide();
                                     $("#getimg").find("img").attr("src", imgurl);
                                     $("#getimg").find("a").attr("href", data.adurl);
                                     $(".tel").html(data.adtitle);
                                     $("#yes").show();

                                     $("#result").html("求你别再点啦,<span>再点八戒都累死了！</span>");
                                     setTimeout(function () {
                                         $('.result_tip').css({display: 'block', top: '0px', opacity: 1});
                                         $("#shadow").show().addClass("up");
                                     }, 500);
                                },300);
                           }


                      }

                    });
                  });
                });
            });
        </script>
        <script type="text/javascript" src="<%=basePath%>js/iscroll.js?v=2"></script>
        <script>

        function check() {

            var tel = $("#tel").val();
            var realname = $("#realname").val();
            var addr = $("#addr").val();
            var bValidate = RegExp(/^(0|86|17951)?(13[0-9]|15[012356789]|18[0-9]|17[0-9]|14[57])[0-9]{8}$/);
            if (tel == '' || realname == '') {
                alert("请输入手机号码和姓名");
                return;
            }
            if(!bValidate.test(tel)){
                alert("请输入正确手机格式");;
                return;
            }

            var submitData = {
                tel: tel,
                realname: realname,
                addr: addr,
                ac: "settel"
            };
            $.post('./index.php?i=2&c=entry&id=40&do=phone&m=ruifan_fanpai', submitData, function(idata) {
                if (idata.success == 1) {
                    location.href="./index.php?i=2&c=entry&id=40&ckopenid=1&do=index&m=ruifan_fanpai";
                } else {
                    alert(idata.msg);
                    location.href="./index.php?i=2&c=entry&id=40&ckopenid=1&do=index&m=ruifan_fanpai";
                }
            },"json");
        }

            (function() {
                var h = 0;
                $(".box").css("height", document.documentElement.clientHeight - h);
            }());
        </script>
</body>

<!-- 微信分享设置 -->
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
     wx.config({
        debug:false,
        appId: "wx9581f10e8f170d3c",
        timestamp: '1480474071',
        nonceStr: 'mM4jsUXYzacZAprX',
        signature: '295c9c03253921a09cef4e6175a06569eb937fcd',
        jsApiList: [
            'onMenuShareTimeline','onMenuShareAppMessage','onMenuShareWeibo'
        ]
    });

    var shareMeta  = {
        title: '标题后台可以自定义',
        desc: '描述后台可以自定义',
        link: "http://www.opkjl.cn/app/./index.php?i=2&c=entry&rid=40&from_user=MzBhYmJHdFBva3BxVS80eFhWcXJYbzRPSFZUSzVUMjBXWGxWTDBmMzZKaE9IWkhJSUIxdjBpS0JOam03R21MWFd4dE9yMVlWd1MrZA%3D%3D&do=share&m=ruifan_fanpai",
        imgUrl: "http://www.opkjl.cn/attachment/images/2/2016/06/n050SlLF0NJJsUXNF8YyJc08Mfg0U0.jpg"
    };

    wx.ready(function(){
        wx.onMenuShareTimeline(shareMeta);
        wx.onMenuShareAppMessage(shareMeta);
        wx.onMenuShareWeibo(shareMeta);
    });


    function jumpCardUrl(){
        var temp = 'poEAvwBBDYr8LMtxRUGfPafySEZ8';
        if(temp == null || temp == '' || temp == undefined){
            return;
        }
        wx.addCard({
            cardList: [{
                cardId: 'poEAvwBBDYr8LMtxRUGfPafySEZ8',
                cardExt: '{"code": "", "openid": "ooEAvwEhtsLlYWCZG1uUTUepX5uY", "timestamp": "1480474071","nonce_str":"su9YCb1HrFd3GpOL", "signature":"27dcd56d2e300f110515e5d1ab2183c39fd623ac"}'
            }], // 需要添加的卡券列表
            success: function (res) {
                var cardList = res.cardList; // 添加的卡券列表信息
            }
        });
    }

</script>



</html>

