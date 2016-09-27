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

		<meta name="viewport"
			content="initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.css">
		<style type="text/css">
body {
	padding: 0px;
	margin: 0px;
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
.main {
	padding: 3px;
}

.position {
	width: 100%;
	height: 50px;
	border-top: 1px solid #CFCFCF;
	border-bottom: 1px solid #CFCFCF;
}

.position span {
	margin-left: 10px;
	line-height: 50px;
	display: block;
	float: left;
}

.position input {
	border: 0px;
	background-color: #fff;
	width: 150px;
	line-height: 50px;
	height: 40px;
	padding-right: 10px;
	float:right;
	margin-left: 10px;
	
}
</style>

		<title>设置日期</title>
	</head>

	<body>
		<div align="center" style="width:100%;margin-top:10px;" >
			<form method="post" action="saveaddtime">
				<div class="position">
					<span>周一</span>
					<% String sub1="周一";
					int a1=Setting.reminddate.indexOf(sub1); 
					 if(a1>=0){
					%>
					<input id="one" type="checkbox" name="check" checked="checked" value="周一" />
					<%}else{ %>
					<input id="one" type="checkbox" name="check"  value="周一" />
					<%} %>
				</div>
				<div class="position">
					<span>周二</span>
					<% String sub2="周二";
					int a2=Setting.reminddate.indexOf(sub2); 
					 if(a2>=0){
					%>
					<input id="two" type="checkbox" name="check" checked="checked" value="周二" />
					<%}else{ %>
				<input id="two" type="checkbox" name="check" value="周二" />
					<%} %>
					
				</div>
				<div class="position">
					<span>周三</span>
					
						<% String sub3="周三";
					int a3=Setting.reminddate.indexOf(sub3); 
					 if(a3>=0){
					%>
					<input id="three" type="checkbox" name="check" checked="checked" value="周三" />
					<%}else{ %>
				<input id="three" type="checkbox" name="check"  value="周三" />
					<%} %>
					
				</div>
				<div class="position">
					<span>周四</span>
						<% String sub4="周四";
					int a4=Setting.reminddate.indexOf(sub4); 
					 if(a4>=0){
					%>
					<input id="four" type="checkbox" name="check" checked="checked" value="周四" />
					<%}else{ %>
					<input id="four" type="checkbox" name="check"  value="周四" />
					<%} %>
					

				</div>
				<div class="position">
					<span>周五</span>
					
						<% String sub5="周五";
					int a5=Setting.reminddate.indexOf(sub5); 
					 if(a5>=0){
					%>
					<input id="five" type="checkbox" name="check" checked="checked" value="周五" />
					<%}else{ %>
					<input id="five" type="checkbox" name="check"  value="周五" />
					<%} %>
					

				</div>
				<div class="position">
					<span>周六</span>
					
						<% String sub6="周六";
					int a6=Setting.reminddate.indexOf(sub6); 
					 if(a6>=0){
					%>
				     <input id="saturday" type="checkbox" name="check" checked="checked"  value="周六" />
					<%}else{ %>
					<input id="saturday" type="checkbox" name="check" value="周六" />
					<%} %>
					
					

				</div>
				<div class="position">
					<span>周日</span>
					
					<% String sub7="周日";
					int a7=Setting.reminddate.indexOf(sub7); 
					 if(a7>=0){
					%>
				    
					<input id="sunday" type="checkbox" name="check" checked="checked"  value="周日" />
					<%}else{ %>
					<input id="sunday" type="checkbox" name="check" value="周日" />
					<%} %>
					

				</div>
          <input  class="submit_btn" type="submit" value="保存" />
			</form>
		</div>
	</body>
</html>
