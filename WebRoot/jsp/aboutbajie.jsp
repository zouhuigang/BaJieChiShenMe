<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>关于八戒</title>
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
//  	window.onload = function makeList(){
//	window.update();
	
// 		var data = "{\"id\":1,\"content\":\"八戒吃什么”提供有趣而且靠谱的个性化工作餐推荐服务。 帮助解决白领们“中午吃什么，去哪里吃”的千年难题。并且同时提供餐厅的优惠信息，让大家吃得更实惠。\"}";
// 		var result = JSON.prase(data);
// 		var resultString = "";
		
// 			resultString +=  "<div class=\"main\">" +
// 								"<span class=\"content\">"+result.content+"</span>" +
// 							"</div>" ;
							
// 		document.getElementById("all").innerHTML = resultString;

// 	}
 function update(){
		 $.ajax({
		       type: 'POST',
		        dataType: 'json',
		        data: {},
		        url:  "about",
		        timeout:this._MAX_TIMEOUT_VALUE,
		        success: function(res) {
		     //  var data = "{\"id\":1,\"content\":\"八戒吃什么”提供有趣而且靠谱的个性化工作餐推荐服务。 帮助解决白领们“中午吃什么，去哪里吃”的千年难题。并且同时提供餐厅的优惠信息，让大家吃得更实惠。\"}";
		   var result = res;
		   var resultString = "";
		
			resultString +=  "<div class=\"main\">" +
			  "<img id=\"u6_img\" class=\"img\" src=\"images/u6.jpg\">" +
             " <div style=\"top: 100px; transform-origin: 98px 0px 0px;\" id=\"u7\" class=\"text\">"+
								"<span class=\"content\">"+result.content+"</span>" +
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


.img{
	width:120px;
	height:120px;
}
.text{
	margin:10px 0 0 10px;
	overflow:hidden;
}

</style>
  </head>
  
  <body>
  <div class="main">
  <div  align="center">
  <img id="u6_img"  class="img" src="images\logo.png">
  </div>
			  
              <div style="top: 100px; transform-origin: 98px 0px 0px;" id="u7" class="text">
								<span class="content">“八戒吃什么”提供有趣而且靠谱的个性化工作餐推荐服务。 帮助解决白领们“中午吃什么，去哪里吃”的千年难题。并且同时提供餐厅的优惠信息，让大家吃得更实惠。</span>
							</div> 
  
  </body>
</html>
