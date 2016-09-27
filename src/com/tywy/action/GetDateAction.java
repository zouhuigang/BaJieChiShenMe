package com.tywy.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.struts2.interceptor.validation.JSONValidationInterceptor;

import com.caec.db.ConnSQL;
import com.opensymphony.xwork2.ActionSupport;

public class GetDateAction extends ActionSupport{


	private static final long serialVersionUID = -300735195504723689L;

    public String date;
    
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getdate() throws Exception{
		
		
	return null;
	}


	
}
