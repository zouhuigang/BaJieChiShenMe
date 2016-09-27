<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<!-- ArrayList list = new ArrayList(); 
	list = ...
	Gson gson = new Gson();
	String listString = gson.toJson(list);
-->
  <head>
    <base href="<%=basePath%>">
    
    <title>历史评价</title>
  
 <meta name="viewport" content="initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<style type="text/css">
.main{
	width:100%;
	height:120px;
	border:1px solid #CFCFCF;
	-moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    border-radius:5px;
	background-color:#EDEDED;
	margin-top:5px;
	padding-left: 10dp;
	padding-right: 10dp
}
.title{
	display:block;
	width:200px;
	height:20px;
	margin:10px 0 0 10px;
	overflow:hidden;
}
.date{
	display:block;
	width:200px;
	height:20px;
	color:#8F8F8F;
	font-size:14px;
	margin:10px 0 0 10px;
	overflow:hidden;
}
.select{
	display:block;
	width:280px;
	height:50px;
	padding:10px 0 0 30px;
	float:right
}
.select .like{
	width:70px;
	height:40px;
	margin-right:20px;
	background:url(<%=basePath%>images/icon-like-unselected.png) no-repeat ;
	background-size:contain;
	border:none;
}
.select .nolike{
	width:70px;
	height:40px;
	margin-right:20px;
	background:url(<%=basePath%>images/icon-like-selected.png) no-repeat ;
	background-size:contain;
	border:none;
}
.select .hate{
	width:70px;
	height:40px;
	margin-right:20px;
	background:url(<%=basePath%>images/icon-blacklist-unselected.png) no-repeat ;
	background-size:contain;
	border:none;
}
.select .nohate{
	width:70px;
	height:40px;
	margin-right:20px;
	background:url(<%=basePath%>images/icon-blacklist-selected.png) no-repeat ;
	background-size:contain;
	border:none;
}
.select input{
	width:90px;
	height:25px;
	margin-right:20px;
	background-color:#DEDEDE;
	border:1px solid #CCCCCC;
}
.item_pic{
	margin:5px;
	width:70px;
	height:50px;
	float:left;
}

</style>
 <script language="javascript" type="text/javascript" src="http://www.51tywy.com/static/wxwap/js/jquery-1.10.1.min.js"></script>
 <script type="text/javascript">

	window.onload = function makeList(){
		window.update();

		
	}
	 function update(){
		 $.ajax({
		       type: "post",
		        dataType: "text",
		        url:  "GetHistorical",
		        timeout:this._MAX_TIMEOUT_VALUE,
		        success: function(res) {
		       
			var result = eval(res);
		    var resultString = "";
		   
		   for(var i=0; i<result.length; i++){
      if(1==result[i].like&&1!=result[i].hate){
     //"一喜欢"
     	resultString +=  "<div class=\"main\">" +
								"<img class=\"item_pic\" src="+result[i].imageurl+">" +
								"<span class=\"title\">"+result[i].name+"</span>" +
								"<span class=\"date\">最后造访日期:"+result[i].date+"</span>" +
								"<div class=\"select\">" +
									"<input type=\"button\"  class=\"nolike\" name=\"like\"  onclick=\"comment("+result[i].id+",0,1);\" >" +
									"<input class=\"hate\" type=\"button\" onclick=\"comment("+result[i].id+",1,1);\"  name=\"no\">" +
								"</div>" +
							"</div>" ;
      }
      if(1==result[i].hate&&1!=result[i].like){
     // "已拉黑"
      	resultString +=  "<div class=\"main\">" +
										"<img class=\"item_pic\" src="+result[i].imageurl+">" +
								"<span class=\"title\">"+result[i].name+"</span>" +
								"<span class=\"date\">最后造访日期:"+result[i].date+"</span>" +
								"<div class=\"select\">" +
								"<input  class=\"like\" type=\"button\" onclick=\"comment("+result[i].id+",1,1);\"  name=\"like\">" +
									"<input class=\"nohate\" type=\"button\"  name=\"no\" onclick=\"comment("+result[i].id+",1,0);\">" +
								"</div>" +
							"</div>" ;
      }
     if(0==result[i].hate&&0==result[i].like){
      	resultString +=  "<div class=\"main\">" +
								"<img class=\"item_pic\" src="+result[i].imageurl+">" +
								"<span class=\"title\">"+result[i].name+"</span>" +
								"<span class=\"date\">最后造访日期:"+result[i].date+"</span>" +
								"<div class=\"select\" >" +
									"<input  class=\"like\" type=\"button\" onclick=\"comment("+result[i].id+",1,0);\"  name=\"like\">" +
									"<input class=\"hate\" type=\"button\" onclick=\"comment("+result[i].id+",0,1);\"  name=\"no\">" +
								"</div>" +
							"</div>" ;
      }
      if(1==result[i].hate&&1==result[i].like){
      	resultString +=  "<div class=\"main\">" +
									"<img class=\"item_pic\" src="+result[i].imageurl+">" +
								"<span class=\"title\">"+result[i].name+"</span>" +
								"<span class=\"date\">最后造访日期:"+result[i].date+"</span>" +
								"<div class=\"select\" >" +
									"<input type=\"button\"  class=\"nolike\" name=\"like\" onclick=\"comment("+result[i].id+",0,1);\">" +
									"<input class=\"nohate\" type=\"button\"  name=\"no\" onclick=\"comment("+result[i].id+",1,0);\">" +
								"</div>" +
							"</div>" ;
      
      
      }
      /**
			resultString +=  "<div class=\"main\">" +
								"<span class=\"title\">"+result[i].name+"</span>" +
								"<span class=\"date\">最后造访日期:"+result[i].date+"</span>" +
								"<div class=\"select\">" +
									"<input type=\"button\" onclick=\"comment("+result[i].id+",0);\" value=\"喜欢\" name=\"like\">" +
									"<input type=\"button\" onclick=\"comment("+result[i].id+",1);\" value=\"拉黑\" name=\"no\">" +
								"</div>" +
							"</div>" ;
**/
		}
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
	function comment(id,like,hate){
		 $.ajax({
		        type: "post",
	          url: "Like",
	          dataType: "json",
		        data: {id:id,like:like,hate:hate},
		        timeout:this._MAX_TIMEOUT_VALUE,
		        success: function(res) {
		        
		            if(res.status == 200){
		               alert("评论成功");
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
	function likeorhate(id,type){
	              
	                	
	}

</script>

  </head>
  <body>
<div id="all"></div>
  </body>
</html>
