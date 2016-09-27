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
import com.tywy.bean.Setting;
import com.tywy.bean.config;

public class SettingAction extends ActionSupport{

	private static final long serialVersionUID = -300735195504723689L;
	public HttpServletRequest request = ServletActionContext.getRequest();
	public HttpServletResponse response = ServletActionContext.getResponse();
	private String s1="光大会展中心";
	private String select;
	private String text_time;
	public String savedate() throws Exception{
		
		System.out.println(select);
				
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=UTF-8");
				String sqlString=null;
				

				if(select==null)
					return null;
				
				Setting.expectprice=select;
					try{
						Connection con = ConnSQL.getConnection();
						Statement sm = con.createStatement();
						ResultSet rs = sm.executeQuery("select * from setting where openid='"+config.openid+"'");
						Statement sql;
						if(rs.next()){
					
							sqlString="update setting set expectprice='"+select+"' ,location='"+s1+"' where openid='"+config.openid+"'";

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
							sqlString="insert into setting (openid,expectprice,location)" + "values ('"+config.openid+"','"+select+"','"+s1+"')";
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
	public String getS1() {
		return s1;
	}
	public void setS1(String s1) {
		this.s1 = s1;
	}
	public String getSelect() {
		return select;
	}
	public void setSelect(String select) {
		this.select = select;
	}
	public String getText_time() {
		return text_time;
	}
	public void setText_time(String text_time) {
		this.text_time = text_time;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	
}
