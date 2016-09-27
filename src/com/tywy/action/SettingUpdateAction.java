package com.tywy.action;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.caec.db.ConnSQL;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;
import com.tywy.bean.Setting;
import com.tywy.bean.config;
import com.tywy.bean.historical;

public class SettingUpdateAction extends ActionSupport {

	private static final long serialVersionUID = 5196352614226262438L;
	

	
	private String result;

	public HttpServletRequest request = ServletActionContext.getRequest();
	public HttpServletResponse response = ServletActionContext.getResponse();
	
	public String settingupdate() throws Exception {
		
		
		try{
			Connection con = ConnSQL.getConnection();
			Statement sm = con.createStatement();
			ResultSet rs = sm.executeQuery("select * from setting where openid='"+config.openid+"'");
			Statement sql;
			if(rs.next()){
				
				Setting.expectprice=rs.getString("expectprice");
				Setting.reminddate=rs.getString("reminddate");
				Setting.remindtime=rs.getString("remindtime");
              if(Setting.expectprice==null){
					
					Setting.expectprice="";
				}
				if(Setting.reminddate==null){
					
					Setting.reminddate="";
				}
             if(Setting.remindtime==null){
            		Setting.remindtime="";
				}
				

				
			}
			else{
				
				return null;
			}
		}catch (Exception ex) {  
			ex.printStackTrace();  
		} 
	
		
			return null;
		
//		result="success";//���ɹ�
//		//result="wrong";
//		
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html;charset=UTF-8");
//		
//			try {
//				PrintWriter out = response.getWriter();
//				out.write(result);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
		
	}

	


	
}
