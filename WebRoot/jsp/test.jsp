<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<base href="<%=basePath%>">
         <meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="viewport" content="initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.css">

		<title>设置</title>
	</head>

	<body>
	

</form>
	<div align="center" style="width:100%;margin-top:10px;">
			<form class="form-horizontal" role="form">
			
						<div class="form-group ">
						<label  class="col-xs-4 control-label">提醒日期</label>
							<input   id="text_date" type="text"  name="text_date"
								dir="rtl" placeholder="工作日" readonly="readonly"  onclick="location.href='<%=basePath%>jsp/settingaddtime.jsp'" />
							<img class="image" src="<%=basePath%>images/icon-arrow-right.png">
						</div>
				
					<div class="form-group " >
					 <label  class="col-xs-4 control-label">提醒时间</label>
                <div class="col-xs-6">
					<select name="select" id="select_k1" class="form-control"  >
                     <option  value="9:00">9:00</option>
                     <option value="9:30">9:30</option>
                  <option value="10:00">10:00</option>
                 <option value="10:30">10:30</option>
                <option value="11:00">11:00</option>
                <option value="11:30">11:30</option>
              <option value="12:00">12:00</option>
                    <option value="12:30">12:30</option>
                <option value="13:00">13:00</option>
                 <option value="13:30">13:30</option>
                <option value="14:00">14:00</option>
              <option value="14:30">14:30</option>
                   <option value="15:00">15:00</option>
                 <option value="15:30">15:30</option>
             </select>
              </div>
                                <div class="col-xs-2">
								<img class="image " src="<%=basePath%>images/icon-arrow-right.png">
								</div>
					</div>
							<input class="submit_btn" type="submit" value="保存" />
			</form>
		</div>
	</body>
</html>