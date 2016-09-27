<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>推荐给朋友</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<script src="http://lib.sinaapp.com/js/jquery/1.9.1/jquery-1.9.1.min.js"></script>
 <script type="text/javascript">
//   	window.onload = function makeList(){
//   		window.update();
// 		var data = "{\"id\":1,\"content\":\"我的好朋友，每天还在犹豫中午不知道吃什么么？快来订阅八戒吃什么吧。<\/br>“八戒吃什么”提供有趣而且靠谱的个性化工作餐推荐服务。 帮助解决白领们“中午吃什么，去哪里吃”的千年难题。并且同时提供餐厅的优惠信息，让大家吃得更实惠。长按下方二维码，立即关注吧！\"}";
// 		var result = JSON.parse(data);
// 		var resultString = "";
// 			resultString +=  "<div class=\"main\">" +
// 								"<span class=\"content\">"+result.content+"</span>" +
// 								"<div id=\"u6\" class=\"ax_image\">" +
//            "<img id=\"u6_img\" class=\"img\" src=\"images/u6.jpg\" height=\"60%\" width=\"100%\">" +
//         " <div style=\"top: 100px; transform-origin: 98px 0px 0px;\" id=\"u7\" class=\"text\">"+
//          " <p><span></span></p>"  +
//        " </div>"+
//       "</div>"+
// 							"</div>" ;
// 		document.getElementById("all").innerHTML = resultString;
		
// 	}
	
 function update(){
		 $.ajax({
		        type: 'POST',
		        dataType: 'json',
		        data: {},
		        url:  "a.json",
		        timeout:this._MAX_TIMEOUT_VALUE,
		        success: function(res) {
		            var result = res;
					var resultString = "";
					resultString +=  "<div class=\"main\">" +
								"<span class=\"content\">"+result.content+"</span>" +
								"<div id=\"u6\" class=\"ax_image\">" +
						           "<img id=\"u6_img\" class=\"img\" src=\"images/u6.jpg\"  width=\"200\" height=\"200\">" +
						        " <div style=\"top: 100px; transform-origin: 98px 0px 0px;\" id=\"u7\" class=\"text\">"+
						         " <p><span></span></p>"  +
						       " </div>"+
						      "</div>"+
													"</div>" ;
													
					document.getElementById("all").innerHTML = resultString;
		        },
		        complete: function(XMLHttpRequest, textStatus){
		           // hideLoading();
		        },
		        error: function(){
		            //请求出错处理
		        }
		    });
	}
 </script>
  	<style type="text/css">
.main{
	margin-top:5px;
}

.img{
	width:120px;
	height:120px;
	
}
.imglogo{
	width:120px;
	height:120px;
	float: left;
	margin-right: 10px;
}
.imgtouch{
	width:80px;
	height:80px;
}
.text{
	margin:10px 0 0 10px;
	overflow:hidden;
}
.content{
	
	margin-top:20px;
	color:#6BB7EA;

	
}
.span1{
margin-top:80px;
}

</style>
  </head>
  
  <body>
  <div class="main">
								
 <div align="center" >
  <img id="u6_img"  class="imglogo" src="images\logo.png">
  	<span class="content">我的好朋友，每天还在犹豫中午不知道吃什么么？快来订阅八戒吃什么吧。</span>
  </div>
	<div class="span1" >				
		<span>“八戒吃什么”提供有趣而且靠谱的个性化工作餐推荐服务。 帮助解决白领们“中午吃什么，去哪里吃”的千年难题。并且同时提供餐厅的优惠信息，让大家吃得更实惠。长按下方二维码，立即关注吧！</span>
	</div>
		<div align="center">
		
			  <img id="u6_img"  class="imgtouch" src="images\touch.png">					
           <img id="u6_img" class="img" src="images\qrcode_for_430.jpg" >
      </div>
      <div align="center" >				
		<span>长按下方二维码，立即关注吧！</span>
	</div>
							</div>
  </body>
</html>
