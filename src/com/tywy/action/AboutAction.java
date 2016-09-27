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
import com.tywy.bean.historical;

public class AboutAction extends ActionSupport {

	private static final long serialVersionUID = 5196352614226262438L;
	
	private String id;
	private String type;
	
	private String result;

	public HttpServletRequest request = ServletActionContext.getRequest();
	public HttpServletResponse response = ServletActionContext.getResponse();



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

//获取历史评价列表
	public String about() throws Exception {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		try{
			String content="";
			Connection con = ConnSQL.getConnection();
			Statement sm = con.createStatement();
			ResultSet rs = sm.executeQuery("select * from aboutbajie");
			int rowCount = 0;    
			while(rs.next()) {  
			
				content=rs.getString("content");
			  rowCount++;    
			} 
			String s="{\"id\": 1,\"content\":\""+content+"\"}";	
			System.out.println(s);
			PrintWriter out = response.getWriter();
			out.write(s);
			
			return null;
		
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
			return null;
		
	}
	
}
