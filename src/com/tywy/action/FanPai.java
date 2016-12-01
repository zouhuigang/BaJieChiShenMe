package com.tywy.action;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.caec.db.ConnSQL;
import com.opensymphony.xwork2.ActionSupport;
import com.tywy.bean.FanpaiBean;
import com.tywy.bean.config;
import com.tywy.bean.goodlist;
public class FanPai extends ActionSupport{
	Statement sm=null;
	Connection con=null;
	Statement sql=null;
	//页面请求，传参数过去
	public String execute() throws Exception {
		String openid =config.openid; //取bean中存储的openid，即用户信息
		//request.getPrameters("属性名"）;获取get中的openid
		
		HttpServletRequest request = ServletActionContext.getRequest();//传参数出去
		ServletContext servletContext = ServletActionContext.getServletContext();//传参数出去
		Map map=getUserCount();
		request.setAttribute("synum", map.get("number"));
		con.close();
		return "message";
	}
	
	
	
	//下面是发送json格式的数据到前台
	public HttpServletRequest request = ServletActionContext.getRequest();
	public HttpServletResponse response = ServletActionContext.getResponse();
	
	public String FanPaiSubmit() throws Exception{
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		JSONObject jo = new JSONObject();
		JSONObject jo1 = new JSONObject();
		Map map=getUserCount();
		int sysnum =(Integer) map.get("number");
		if(sysnum<=0){
			jo.put("status","500");
			jo.put("info","机会已用完");
			jo.put("data", jo1);
			String json= jo.toJSONString();
			PrintWriter out = response.getWriter();
			out.write(json);
			return null;
			
		}
		jo.put("status","200");
		jo.put("info","成功");
		
		String[] si =(String[]) map.get("saveid"); //得到已经保存在数据库中的goodsid
		
		//从4个商品取出排除自己已推荐的商品
		int listg=0;
		List<FanpaiBean> list =randm_goods();//取出4个随机商品
		for (int i = 0; i < list.size(); i++) {
			//System.out.println(list.get(i));
			boolean b=false;
			int goodid=list.get(i).getGoodsid();
			
			for(int a=0;a<si.length;a++){
				int ss=Integer.parseInt(si[a]);
				if(goodid!=ss){
					b=true;
					listg=i;
					break;
				}
				
			}
			
			if(b){
				break;
			}
			
			
		}

		String saveID =getsetting(list.get(listg).getGoodsid());//保存最新的id当前用户的设置
		UpateSetting(saveID);
		
		
		//入json中
		
		jo1.put("name",list.get(listg).getGoodsname());
		jo1.put("runcode",1);
		jo1.put("imgurl",list.get(listg).getImageurl());
		jo1.put("price",list.get(listg).getPrice());
		jo1.put("location",list.get(listg).getLocation());
		jo1.put("imgurl1","");
		jo1.put("adtitle","");
		jo1.put("adurl","");
		
		
		jo.put("data", jo1);
		String json=JSONObject.toJSONString(jo,SerializerFeature.SortField);
		        // String json= jo.toJSONString();
				//System.out.println(jo);
		PrintWriter out = response.getWriter();
				out.write(json);
				
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//list随机商品
	private List<FanpaiBean> randm_goods(){
	
		List<FanpaiBean> list = new ArrayList<FanpaiBean>();
		try{
			 con = ConnSQL.getConnection();
			 sm = con.createStatement();
			ResultSet rs = sm.executeQuery("select * from goods where 1=1  ORDER BY rand() LIMIT 4");			
			
			if(rs.next()){	
				FanpaiBean bean=new FanpaiBean();
				try{ 
					bean.setGoodsid(rs.getInt("goodsid"));
					bean.setGoodsname(rs.getString("goodsname"));
					bean.setContent(rs.getString("content"));
					bean.setImageurl(rs.getString("imageurl"));
					bean.setLocation(rs.getString("location"));
					bean.setPrice(rs.getString("price"));
					bean.setUrl(rs.getString("url"));
					
					list.add(bean);
					
					

				} catch(SQLException e1) {
					System.out.print(e1);
				}
			}
			
		}catch (Exception ex) {  
			ex.printStackTrace();  
			
		} 
		
		
		return list;
	}
	
//查询用户设置
	private String getsetting(int goodsid){
		String saveid ="";
		String sqlString1="";
		sqlString1="select * from setting where openid ='"+config.openid+"'";
		ResultSet rs1;
		String SavedID="";
		try {
			rs1 = sm.executeQuery(sqlString1);
			if(rs1.next()){	
				saveid=rs1.getString("SavedID");
			}
		
			if(saveid==null||"".equals(saveid)){
				SavedID=goodsid+"";						
			}else{
				SavedID=saveid+","+goodsid;
			}
			return SavedID;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
	
		
		return null;
	}
	private String UpateSetting(String SavedID){
		String sqlString="";
		sqlString ="update setting set SavedID='"+SavedID+"' where openid='"+config.openid+"'";
		try {
			sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			sql.executeUpdate(sqlString);	
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return null;
	}
	
	//核对用户次数
	private Map getUserCount(){
		
		Map map=new HashMap<Object, Object>();
		int number=0;
		//查询当前用户信息
		String sqlString=null;
		String[] si = {};
		sqlString="select * from setting where openid ='"+config.openid+"'";
		try{
			con=ConnSQL.getConnection();
			sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			ResultSet rs =sql.executeQuery(sqlString); //查询语句
			
			while(rs.next()){
					String saveid=	rs.getString("SavedID");
					int total=	rs.getInt("u_click_count");
					
					if(saveid==null||"".equals(saveid)){
						//si="";
					}else{
						si=saveid.split(",");						
					}
					int s=si.length;
					int synum=total-s;
					if(synum<=0){
						synum=0;
					}
					number=synum;
					//request.setAttribute("synum", synum);
					//System.out.println(si.toString());
			}
			//con.close();
			map.put("number", number);
			map.put("saveid", si);
			
			//request.getSession().setAttribute("ses", "会话范围属性");
			//servletContext.setAttribute("app", "应用范围属性");
			//request.setAttribute("list1",list);
			return map;
			
			}catch (SQLException e) {
				e.printStackTrace();
			}
		return null;
	}
	
	
}
