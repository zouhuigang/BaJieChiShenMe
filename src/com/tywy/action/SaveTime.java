package com.tywy.action;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.caec.db.ConnSQL;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;
import com.tywy.bean.Setting;
import com.tywy.bean.config;
import com.tywy.bean.historical;

public class SaveTime extends ActionSupport {

	private static final long serialVersionUID = 5196352614226262438L;
	
	private String text_date;
	private String select;
	

	public HttpServletRequest request = ServletActionContext.getRequest();
	public HttpServletResponse response = ServletActionContext.getResponse();

public String getText_date() {
		return text_date;
	}

	public void setText_date(String text_date) {
		this.text_date = text_date;
	}

	public String getSelect() {
		return select;
	}

	public void setSelect(String select) {
		this.select = select;
	}

	//获取历史评价列表
	public String savetime() throws Exception {
		
System.out.println(select);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String sqlString=null;
		

		if(select==null)
			return null;
		Setting.remindtime=select;
			try{
				Connection con = ConnSQL.getConnection();
				Statement sm = con.createStatement();
				ResultSet rs = sm.executeQuery("select * from setting where openid='"+config.openid+"'");
				Statement sql;
				if(rs.next()){
			
					sqlString="update setting set remindtime='"+select+"' where openid='"+config.openid+"'";

					try{ 
						sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
						sql.executeUpdate(sqlString);
						con.close();
						
						return SUCCESS;
					} catch(SQLException e1) {
						System.out.print(e1);
					}
					
				}
				else{
					sqlString="insert into setting (openid,remindtime)" + "values ('"+config.openid+"','"+select+"')";
					sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
					sql.executeUpdate(sqlString);
					con.close();
					return SUCCESS;
				}
			}catch (Exception ex) {  
				ex.printStackTrace();  
			}  
			return null;
		
		}
		


		
	
}
