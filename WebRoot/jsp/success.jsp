<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="UTF-8"%>
<%
               String path = request.getContextPath();
    %>
<%@ page import="com.tywy.action.*"%>
<% 
BufferedReader br = new BufferedReader(new InputStreamReader((ServletInputStream)request.getInputStream()));

String line = null;

StringBuilder sb = new StringBuilder();

while((line = br.readLine())!=null){

   sb.append(line);

}
String xmlS = sb.toString();
SuccessAction sa=new SuccessAction();
String result= sa.success(xmlS);
 %> 
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  
  <body>
    <%=result%>
  </body>
</html>
 
 
 
 
 
