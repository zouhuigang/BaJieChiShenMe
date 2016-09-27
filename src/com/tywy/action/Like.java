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
import com.tywy.bean.config;
import com.tywy.bean.historical;

public class Like extends ActionSupport {

	private static final long serialVersionUID = 5196352614226262438L;
	
	private String id;
	private String like;
	private String hate;
	
	private String result;

	public HttpServletRequest request = ServletActionContext.getRequest();
	public HttpServletResponse response = ServletActionContext.getResponse();
	
	public String like() throws Exception {
		
		System.out.println("id:"+id+"   "+"like:"+like+"   "+"hate:"+hate);
		
		String sqlString=null;
		sqlString=	"update historical set islike="+like+", hate="+hate+" where openid='"+config.openid+ "' and goodsid='"+id+"'";
	    System.out.println(sqlString);
		try{
			Connection con;
			Statement sql;
			con=ConnSQL.getConnection();
			sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			sql.executeUpdate(sqlString);
			con.close();
		String s="{\"status\": 200}";	
		PrintWriter out = response.getWriter();
		out.write(s);
		return null;
		
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
			return null;
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}



public String getLike() {
		return like;
	}

	public void setLike(String like) {
		this.like = like;
	}

	public String getHate() {
		return hate;
	}

	public void setHate(String hate) {
		this.hate = hate;
	}

	//获取历史评价列表
	public String GetHistorical() throws Exception {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		ArrayList<historical> listh=new ArrayList<historical>();
		try{
			Connection con = ConnSQL.getConnection();
			Statement sm = con.createStatement();
			ResultSet rs = sm.executeQuery("select * from historical where openid='"+config.openid+"'");
			int rowCount = 0;    
			while(rs.next()) {  
				historical h=new historical();
				h.setId(rs.getInt("goodsid"));
				h.setName(rs.getString("name"));
				h.setDate(rs.getString("date"));
				h.setImageurl(rs.getString("imageurl"));
				h.setLike(rs.getInt("islike"));
				h.setHate(rs.getInt("hate"));
				listh.add(h);
			  rowCount++;    
			} 
			Gson gson = new Gson();
			String listString = gson.toJson(listh);
			System.out.println(listString);
			PrintWriter out = response.getWriter();
			out.write(listString);
			
			return null;
		
		}catch (SQLException e) {
			e.printStackTrace();
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
