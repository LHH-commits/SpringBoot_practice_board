package com.lcomputerstudy.example.domain;

public class Comment {

	private int cId;			//c_id
	private String cContent;	//c_content
	private String cWriter;		//c_writer
	private String cDatetime;	//c_datetime
	private int bId;			//b_id
	private String username;	//u_id
	
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public String getcWriter() {
		return cWriter;
	}
	public void setcWriter(String cWriter) {
		this.cWriter = cWriter;
	}
	public String getcDatetime() {
		return cDatetime;
	}
	public void setcDatetime(String cDatetime) {
		this.cDatetime = cDatetime;
	}
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	
}