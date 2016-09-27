package com.tywy.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.opensymphony.xwork2.ActionSupport;
import com.tywy.wechat.Weixin;

public class WeChatServlet extends ActionSupport {

	private static final long serialVersionUID = 5196352614226262438L;
	
	public void likee() throws Exception {
		System.out.println("333333");
	}
	
	
	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("1111111111");
//		
////        Weixin weixin = new Weixin(request);
////        String result = weixin.execute();
////        response.getOutputStream().write(result.getBytes());
//    }
	public void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("1111111111");
			response.setContentType("text/html");
//			PrintWriter out = response.getWriter();
//			String uri = request.getRequestURI();
			
	}//out.println(ServletUtilities.headWithTitle("Test Servlet") +"<BODY BGCOLOR=\"#FDF5E6\">\n" +"<H2>URI: " + uri "</H2>\n" +"</BODY></HTML>");
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception{
    	System.out.println("222222222");
    	Weixin weixin = new Weixin(request);
        String result = weixin.execute();
        response.getOutputStream().write(result.getBytes());

    }


}
