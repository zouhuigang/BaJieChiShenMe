<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>反馈意见</title>
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
	.submit_btn{
		width:300px;
		height:50px;
		border:1px solid #81A8cc;
		-moz-border-radius: 5px;
	    -webkit-border-radius: 5px;
	    border-radius:5px;
	    background-color:#fff;
	    font-size:15px;
	    color:#81A8cc;
	}
	
	.text_main{
		resize:none; 
		width:300px; 
		height:200px;
		border:1px solid #81A8cc;
		-moz-border-radius: 5px;
	    -webkit-border-radius: 5px;
	    border-radius:5px;
	    margin-top:10px;
	    padding-left: 10px;
	 padding-right: 10px;
	}
	.main{
		padding:3px;
	}
	.submit{
	padding-left: 10px;
	padding-right: 10px;
	
	}
</style>
 <script language="javascript" type="text/javascript" src="http://www.51tywy.com/static/wxwap/js/jquery-1.10.1.min.js"></script>
 <script type="text/javascript">

 function update(){
 var content=$("#text1").val();
		 $.ajax({
		       type: "post",
	            url: "feedback",
	             dataType: "text",
		        data: {content:content},
		        timeout:this._MAX_TIMEOUT_VALUE,
		        success: function(res) {
		            if(res.status == 200){
		              alert("意见反馈成功!");
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
	
	function s(e,a)
{
	 if ( e && e.preventDefault )
            e.preventDefault();
	else 
	window.event.returnValue=false;
		a.focus();
		
}
 </script>
 
  </head>
  
  <body>
 <div class="main">
		
			<form method="post"  >
					<tr>
						<td colspan="2" width="100%" >
							<font>八戒有哪些需要更完善的地方，希望听到您的声音。</font>
						</td>
					</tr>
					<tr>
					<br/>
					<br/>
						<td colspan="2" width="100%" align="left" >
							<font style="text-align:left;">我想对八戒说:</font>
						</td>
					</tr>
					<tr>
						<td>
						 <div  class="submit" >
						<textarea class="text_main" id="text1" cols="30"  maxlength="500" onmousedown="s(event,this)" name="content" >
							</textarea>
							</div>
						</td>
					</tr>
			         <br/>
			         <br/>
						<div  class="submit" >
							<input class="submit_btn" type="button" value="提交反馈"  onclick="update();"/>
						</div>
			<form>
		</div>
  </body>
</html>
