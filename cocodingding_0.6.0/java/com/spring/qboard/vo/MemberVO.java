package com.spring.qboard.vo;

public class MemberVO {
	
	private String id;
	private String password;
	private String passcheck;
	private String nickname;
	private int admin;
	private String email;
	private int java;
	private int web;
	private int database;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPasscheck() {
		return passcheck;
	}
	public void setPasscheck(String passcheck) {
		this.passcheck = passcheck;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getJava() {
		return java;
	}
	public void setJava(int java) {
		this.java = java;
	}
	public int getWeb() {
		return web;
	}
	public void setWeb(int web) {
		this.web = web;
	}
	public int getDatabase() {
		return database;
	}
	public void setDatabase(int database) {
		this.database = database;
	}
}
