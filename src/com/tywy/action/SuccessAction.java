package com.tywy.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.caec.db.ConnSQL;
import com.opensymphony.xwork2.ActionSupport;
import com.tywy.bean.config;

public class SuccessAction extends ActionSupport{


	private static final long serialVersionUID = -300735195504723689L;
	public HttpServletRequest request = ServletActionContext.getRequest();
	public HttpServletResponse response = ServletActionContext.getResponse();
    private String content;
    
	public String feedback() throws Exception{
		System.out.println(content);
		
		if(content==null)
			content="";
	
	String sqlString=null;
	sqlString="insert into feedback (openid,content)" + "values ('"+1+"','"+content+"')";
	try{
		Connection con;
		Statement sql;
		con=ConnSQL.getConnection();
		sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
		sql.executeUpdate(sqlString);
		con.close();
		return SUCCESS;
		
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
	public String success(String xml)throws Exception{
		
		String xmlS=xml;
		System.out.println(xmlS);

		if(xmlS !=null && !xmlS.equals("")){

		int fromuser_s = xmlS.indexOf("<FromUserName><![CDATA[");

		int fromuser_e = xmlS.indexOf("]]></FromUserName>");

		String fromuser = xmlS.substring(fromuser_s + 23, fromuser_e);

		System.out.println("fromuser:"+fromuser);

		// 取出目标用户

		int touser_s = xmlS.indexOf("<ToUserName><![CDATA[");

		int touser_e = xmlS.indexOf("]]></ToUserName>");

		String touser = xmlS.substring(touser_s + 21, touser_e);

		System.out.println("touser:"+touser);
		
		int content_s = xmlS.indexOf("<EventKey><![CDATA[");

		int content_e = xmlS.indexOf("]]></EventKey>");

		String eventkey = xmlS.substring(content_s + 19, content_e);
		
//		int msgtype_s = xmlS.indexOf("<MsgType><![CDATA[");
//
//		int msgtype_e = xmlS.indexOf("]]></MsgType>");
//
//		String MsgType = xmlS.substring(content_s + 18, content_e);
		config.openid=fromuser;

		if("V001".equals(eventkey)){
		
			StringBuffer sb=new StringBuffer();
			//请求数据
			String content="";
			String openid="";
			Connection con = ConnSQL.getConnection();
			Statement sm = con.createStatement();
			ResultSet rs = sm.executeQuery("select * from whateat where openid='"+config.openid+"'");
			int rowCount = 0;    
			while(rs.next()) { 
				int	time=0;
				
				content=rs.getString("content");
				openid=rs.getString("openid");
				time=rs.getInt("time");
				if(time<4){
					sb.append("<xml>");
					
					sb.append("    <ToUserName><![CDATA["+fromuser+"]]></ToUserName>");
					
					sb.append("    <FromUserName><![CDATA["+touser+"]]></FromUserName>");
					
					sb.append("    <CreateTime>"+new Date().getTime()+"</CreateTime>");
					
					sb.append("    <MsgType><![CDATA[text]]></MsgType>");
					
					sb.append("    <Content><![CDATA["+content+"]]></Content>");
					
					sb.append("</xml>"); 
					String sqlString=null;
					Statement sql;
					sqlString="update setting set time='"+time+++"'  where openid='"+config.openid+"'";
					sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
					sql.executeUpdate(sqlString);
					con.close();
			
				
				
				
				}else{
					content="八戒累了,明天再来吧！";
	                sb.append("<xml>");
					
					sb.append("    <ToUserName><![CDATA["+fromuser+"]]></ToUserName>");
					
					sb.append("    <FromUserName><![CDATA["+touser+"]]></FromUserName>");
					
					sb.append("    <CreateTime>"+new Date().getTime()+"</CreateTime>");
					
					sb.append("    <MsgType><![CDATA[text]]></MsgType>");
					
					sb.append("    <Content><![CDATA["+content+"]]></Content>");
					
					sb.append("</xml>"); 
				}
				
				
				
				
				
				return sb.toString();
			} 
			content="暂无推荐信息";
			sb.append("<xml>");
			
			sb.append("    <ToUserName><![CDATA["+fromuser+"]]></ToUserName>");
			
			sb.append("    <FromUserName><![CDATA["+touser+"]]></FromUserName>");
			
			sb.append("    <CreateTime>"+new Date().getTime()+"</CreateTime>");
			
			sb.append("    <MsgType><![CDATA[text]]></MsgType>");
			
			sb.append("    <Content><![CDATA["+content+"]]></Content>");
			
			sb.append("</xml>"); 
		
	
      return sb.toString();
		}
//		else if("event".equals(eventkey)){
//			
//			
//		}
		else{
			
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			String sqlString=null;
			
				try{
					Connection con = ConnSQL.getConnection();
					Statement sm = con.createStatement();
					ResultSet rs = sm.executeQuery("select * from user where openid='"+config.openid+"'");
					Statement sql;
					if(rs.next()){
				
						
					}
					else{
						sqlString="insert into user (openid)" + "values ('"+config.openid+"')";
						sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
						sql.executeUpdate(sqlString);
						con.close();
					}
				}catch (Exception ex) {  
					ex.printStackTrace();  
				}  
			
			
			StringBuffer sb=new StringBuffer();
		sb.append("<xml>");

		sb.append("    <ToUserName><![CDATA["+fromuser+"]]></ToUserName>");

		sb.append("    <FromUserName><![CDATA["+touser+"]]></FromUserName>");

		sb.append("    <CreateTime>"+new Date().getTime()+"</CreateTime>");

		sb.append("    <MsgType><![CDATA[text]]></MsgType>");

		sb.append("    <Content><![CDATA[欢迎关注八戒吃什么\n  如果您还没有设置点击下面链接进行设置\n <a href=\"http://qa.51tywy.com/BaJieChiShenMe/jsp/setting.jsp\">快来设置吧~ </a>]]></Content>");

		sb.append("</xml>"); 

		return sb.toString();
		}



		            }
		
		
		return null;
	}

	
}
