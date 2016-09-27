<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page import="com.tywy.bean.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<base href="<%=basePath%>">

		<meta name="viewport" content="initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="<%=basePath%>css/reset.css" rel="stylesheet">


<style type="text/css">

.submit_btn {
	width: 300px;
	height: 50px;
	
	font-size: 17px;
	color: #fff;
	margin-top: 50px;
	background:url(<%=basePath%>images/bg-button-blue.png) no-repeat ;
	background-size:contain;
	border:none;
}

.text_main {
	resize: none;
	width: 300px;
	height: 200px;
	border: 1px solid #81A8cc;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
	margin-top: 10px;
}

.text_time {
	background-color: #3284F0;
}

.main {
	padding: 3px;
}

.position{
	width:100%;
	height:50px;
	border-top:1px solid #CFCFCF;
	border-bottom:1px solid #CFCFCF;
	font-size: 17px;
}
.position span{
	margin-left:10px;
	line-height:50px;
	display:block;
	float:left;
	font-size: 17px;
}
.position input{
	border: 0px;
	background-color:#fff;
	width:230px;
	line-height:50px;
	height:50px;
	float:left;
	text-align:right;
	color:#B1B6BC;
	font-size: 17px;
}

.image{
width: 20px;
	height: 20px;
	line-hight:50px;
	margin-top:15px;
	float:right;
	padding-right: 10px;
}
.pcont{
	width:230px;
	float:left;
}
.priceselect{
	float:right;
	height:50px;
	line-height:50px;
	border:none;
	background-color:#fff;
	-webkit-appearance:none; /*去除系统默认的样式*/
	text-align:right;
}
</style>

		<title>设置</title>
	<script language="javascript" type="text/javascript" src="http://www.51tywy.com/static/wxwap/js/jquery-1.10.1.min.js"></script>
 <script type="text/javascript">	
		window.onload = function makeList(){
		window.update();

	}
		function update(){
		 $.ajax({
		        type: "post",
	            url: "settingupdate",
	            dataType: "json",
		        data: {},
		        timeout:this._MAX_TIMEOUT_VALUE,
		        success: function(res) {
		       
		        },
		        complete: function(XMLHttpRequest, textStatus){
		           // hideLoading();
		        },
		        error: function(){
		            //请求出错处理
		        }
		    });
		
		}
		
			function savedate(){
			 var select=$("#select_k1").val();
		 $.ajax({
		        type: "post",
	            url: "savedate",
	            dataType: "json",
		        data: {select:select},
		        timeout:this._MAX_TIMEOUT_VALUE,
		        success: function(res) {
		          if(res.status == 200){
		               alert("设置成功");
		               window.location.reload();
		            }else{
		             
		            }
		       
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
		
	</head>

	<body>
		<div align="center" style="width:100%;margin-top:10px;">
			<form method="post" >
						<div class="position">
							<span>我的位置</span>
							<input id="text1_time" type="text" name="s1"
								dir="rtl" placeholder="光大会展中心" disabled="disabled" />
						
							<img class="image" src="<%=basePath%>images/icon-location-blue.png">
						</div>
				<div class="position" style="border-top:none;">
<span>期望价位</span>
<div class="pcont">
		<select name="select" id="select_k1" class="priceselect"  >
		<%  if(Setting.expectprice.equals("")) {  %>
		<option  value=""  selected="selected" >选择价位</option>
		<%}else{ %>
		<option  value="" >选择价位</option>
		<%} %>
		<%  if(Setting.expectprice.equals("50以下")) {  %>
		<option value="50以下" selected="selected">50以下</option>
		<%}else{ %>
		<option value="50以下" >50以下</option>
		<%} %>
		<%  if(Setting.expectprice.equals("50-100")) {  %>
		<option value="50-100" selected="selected">50-100</option>
		<%}else{ %>
		<option value="50-100" >50-100</option>
		<%} %>
		<%  if(Setting.expectprice.equals("100-200")) {  %>
		<option value="100-200" selected="selected">100-200</option>
		<%}else{ %>
		<option value="100-200" >100-200</option>
		<%} %>
		<%  if(Setting.expectprice.equals("200以上")) {  %>
		<option value="200以上" selected="selected">200以上</option>
		<%}else{ %>
		<option value="200以上" >200以上</option>
		<%} %>

    </select>
</div>								
					<img class="image" src="<%=basePath%>images/icon-price-blue.png">		
					</div>	
					<div class="position" style="border-top:none;" >
							<span>提醒时间</span>
						<%if((Setting.remindtime.equals(""))){ %>
							<input id="text1_time" type="text" name="text_time"
								 dir="rtl" placeholder="设置时间"   readonly="readonly"  onclick="location.href='<%=basePath%>jsp/settingtime.jsp'" />
								 <%}else{ %>
								 <input id="text1_time" type="text" name="text_time"
								 dir="rtl" value=<%=Setting.remindtime %> readonly="readonly"  onclick="location.href='<%=basePath%>jsp/settingtime.jsp'" />
								 
								 <%} %>
								<img class="image" src="<%=basePath%>images/icon-timmer-blue.png">
					</div>
							<input class="submit_btn" type="button" value="保存设置"  onclick="savedate()"/>
			</form>
		</div>
	</body>
</html>