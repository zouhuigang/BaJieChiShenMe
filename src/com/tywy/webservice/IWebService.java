package com.tywy.webservice;

import javax.jws.WebMethod;

public interface IWebService {
	  //使用@WebMethod注解标注WebServiceI接口中的方法
	@WebMethod
    String sayHello(String name);
   
	@WebMethod
    String save(String name,String pwd);
    
}
