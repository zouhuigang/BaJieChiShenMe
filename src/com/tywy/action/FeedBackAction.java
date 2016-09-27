package com.tywy.action;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.validation.JSONValidationInterceptor;

import com.caec.db.ConnSQL;
import com.opensymphony.xwork2.ActionSupport;
import com.tywy.bean.config;

public class FeedBackAction extends ActionSupport{

	private static final long serialVersionUID = -300735195504723689L;

    private String content;
    public HttpServletRequest request = ServletActionContext.getRequest();
	public HttpServletResponse response = ServletActionContext.getResponse();
	public String feedback() throws Exception{
		System.out.println("content="+content);
		
		if(content==null)
			return null;
		
			try{
				Connection con = ConnSQL.getConnection();
				Statement sm = con.createStatement();
				ResultSet rs = sm.executeQuery("select * from feedback where openid='"+config.openid+"'");
				Statement sql;
				if(rs.next()){
			
					String sqlString=null;
					sqlString="update feedback set content='"+content+"' where openid='"+config.openid+"'";

					try{ 
						sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
						sql.executeUpdate(sqlString);
						con.close();
						String s="{\"status\": 200}";	
						PrintWriter out = response.getWriter();
						out.write(s);
						return null;
					} catch(SQLException e1) {
						System.out.print(e1);
					}
					
				
					
				}
				else{
					String sqlString=null;
					sqlString="insert into feedback (openid,content)" + "values ('"+config.openid+"','"+content+"')";
					sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
					sql.executeUpdate(sqlString);
					con.close();
					String s="{\"status\": 200}";	
					PrintWriter out = response.getWriter();
					out.write(s);
					return null;
				}
			}catch (Exception ex) {  
				ex.printStackTrace();  
			}  
		
	
	
	
		return null;
	}
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
    

	
}
