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
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<style type="text/css">
body{
	padding:0px;
	margin:0px;
}
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
	width:250px;
	line-height:50px;
	height:50px;
	text-align:right;
	color:#B1B6BC;
	font-size: 17px;
}
.position select{
	border: 0px;
	background-color:#fff;
	width:250px;
	line-height:50px;
	height:50px;
	float:left;
	text-align:right;
	color:#B1B6BC;
	font-size: 17px;
}
.image{
     width: 10px;
	height: 10px;
	line-hight:50px;
	margin-top:15px;
	float:right;
	padding-right: 10px;
}
.parent{
    background: url('http://ourjs.github.io/static/2015/arrow.png') right center no-repeat; 
   /* the width and the height of your image */
    width: 100px;
    height: 30px;
    overflow: hidden;
    border: solid 1px #ccc;
}

.parent select{
    -webkit-appearance:none;
    -moz-appearance:none;
    appearance:none;
    background:transparent;
    border:none;
    padding-left:10px;
    width: 120px;
    height:100%;    
}
</style>

		<title>设置时间</title>
	</head>

	<body>
		<div align="center" style="width:100%;margin-top:10px;">
			<form method="post" action="savetime">
						<div class="position">
							<span>提醒日期</span>
							<%if(Setting.reminddate.equals("")){ %>
                   	<input id="text_date" type="text"  name="text_date"
								dir="rtl" placeholder="工作日" readonly="readonly"  onclick="location.href='<%=basePath%>jsp/settingaddtime.jsp'" />
                     <%}else{ %>
                       	<input id="text_date" type="text"  name="text_date" maxlength="4"
								dir="rtl" value="<%=Setting.reminddate%>" readonly="readonly"  onclick="location.href='<%=basePath%>jsp/settingaddtime.jsp'" />
                     <%} %>
						
							<img class="image" src="<%=basePath%>images/icon-arrow-right.png">
							
						</div>
				
					<div class="position" style="border-top:none;">
							<span>提醒时间</span>
						
<!-- 							<input id="text_time" type="text" name="text_time" style="width:180px;" -->
<!-- 								style="border: 0px;" dir="rtl" placeholder="9:00" -->
<!-- 								disabled="disabled" /> -->
							<select name="select" id="select_k1" >
                     <option  value="9:00">9:00</option>
<%if(Setting.remindtime.equals("9:30")){ %>
                     <option value="9:30" selected="selected">9:30</option>
                     <%}else{ %>
                      <option value="9:30">9:30</option>
                     <%} %>
                     <% if(Setting.remindtime.equals("10:00")){%>
                  <option value="10:00" selected="selected">10:00</option>
                  <%}else{ %>
                       <option value="10:00">10:00</option>
                     <%} %>
                         <% if(Setting.remindtime.equals("10:30")){%>
                  <option value="10:30" selected="selected">10:30</option>
                  <%}else{ %>
                     <option value="10:30">10:30</option>
                     <%} %>
                         <% if(Setting.remindtime.equals("11:00")){%>
                  <option value="11:00" selected="selected">11:00</option>
                  <%}else{ %>
                      <option value="11:00" >11:00</option>
                     <%} %>
                         <% if(Setting.remindtime.equals("11:30")){%>
                  <option value="11:30" selected="selected" >11:30</option>
                  <%}else{ %>
                      <option value="11:30">11:30</option>
                     <%} %>
                         <% if(Setting.remindtime.equals("12:00")){%>
                  <option value="12:00" selected="selected">12:00</option>
                  <%}else{ %>
                      <option value="12:00" >12:00</option>
                     <%} %>
                         <% if(Setting.remindtime.equals("12:30")){%>
                  <option value="12:00" selected="selected">12:00</option>
                  <%}else{ %>
                      <option value="12:00" >12:00</option>
                     <%} %>
                         <% if(Setting.remindtime.equals("13:00")){%>
                  <option value="13:00" selected="selected">13:00</option>
                  <%}else{ %>
                     <option value="13:00" >13:00</option>
                     <%} %>
                      <% if(Setting.remindtime.equals("13:30")){%>
                  <option value="13:30" selected="selected">13:30</option>
                  <%}else{ %>
                     <option value="13:30" >13:30</option>
                     <%} %>
                      <% if(Setting.remindtime.equals("14:00")){%>
                  <option value="14:00" selected="selected">14:00</option>
                  <%}else{ %>
                     <option value="14:00" >14:00</option>
                     <%} %>
                      <% if(Setting.remindtime.equals("14:30")){%>
                  <option value="14:30" selected="selected">14:30</option>
                  <%}else{ %>
                     <option value="14:30" >14:30</option>
                     <%} %>
                      <% if(Setting.remindtime.equals("15:00")){%>
                  <option value="15:00" selected="selected">15:00</option>
                  <%}else{ %>
                     <option value="15:00" >15:00</option>
                     <%}%>
               
             </select>
             
							<img class="image" src="<%=basePath%>images/icon-arrow-right.png">	
					</div>
							<input class="submit_btn" type="submit" value="保存" />
			</form>
		</div>
	</body>
</html>