package com.hq.bean;



public class Admin implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2456289997862952514L;
	private int id;
	private String email;
	private String  upwd;
	
	private String  upur;//10000000
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public String getUpur() {
		return upur;
	}
	public void setUpur(String upur) {
		this.upur = upur;
	}
	
}
