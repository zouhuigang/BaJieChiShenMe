package com.tywy.action;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	public String username;
	public String password;

	public String execute() {
		if (!username.equals("admin")) {
			super.addFieldError("username", "用户名错误！");
			return ERROR;
		}
		if (!password.equals("001")) {
			super.addFieldError("password", "密码错误！");
			return ERROR;
		}
		return SUCCESS;
	}

	public void validate() {
		if (username == null || username.length() == 0) {
			super.addActionError("用户名不能为空");
		}
		if (password == null || password.length() == 0) {
			super.addActionError("密码不能为空");
		}
	}
}