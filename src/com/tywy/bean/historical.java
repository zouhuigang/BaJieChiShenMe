package com.tywy.bean;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

import org.sword.wechat4j.WechatSupport;

public class historical implements Serializable{
   
	private int  id;
	private String name;
	private String date;
	private int like;
	private int hate;
	private String imageurl;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public int getHate() {
		return hate;
	}
	public void setHate(int hate) {
		this.hate = hate;
	}
	public String getImageurl() {
		return imageurl;
	}
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}

	
}