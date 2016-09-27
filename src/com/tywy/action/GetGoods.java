package com.tywy.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.caec.db.ConnSQL;
import com.opensymphony.xwork2.ActionSupport;
import com.tywy.bean.goodlist;

public class GetGoods extends ActionSupport{

	public String execute() throws Exception {
		String sqlString=null;
		sqlString="select * from goods where 1=1 order by goodsid DESC ";
		try{
			Connection con;
			Statement sql;
			con=ConnSQL.getConnection();
			sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			ResultSet rs =sql.executeQuery(sqlString); //查询语句
			List<goodlist> list=new ArrayList<goodlist>();////先定义一个bean，再定义一个数组
			while(rs.next()){
				goodlist gl=new goodlist();
				gl.setGoodsid(rs.getInt("goodsid"));
				gl.setGoodname(rs.getString("goodsname"));
				list.add(gl);
			}
			con.close();
			
			HttpServletRequest request = ServletActionContext.getRequest();
			ServletContext servletContext = ServletActionContext.getServletContext();
			request.setAttribute("req", "请求范围属性");
			request.getSession().setAttribute("ses", "会话范围属性");
			servletContext.setAttribute("app", "应用范围属性");
			request.setAttribute("list1",list);
			return "message";
			
			}catch (SQLException e) {
				e.printStackTrace();
			}
			return "message";
		}
	
		
	

}
