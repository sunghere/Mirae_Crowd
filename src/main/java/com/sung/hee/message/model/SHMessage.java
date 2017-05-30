package com.sung.hee.message.model;

import java.io.Serializable;
import java.sql.Date;

public class SHMessage implements Serializable {
	
	private int seq;
	private String toid;
	private String fromid;
	private String content;
	private Date wdate;
	private int readck;
	private int del;
	private int cnt;
	public SHMessage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SHMessage(int seq, String toid, String fromid, String content, Date wdate, int readck, int del) {
		super();
		this.seq = seq;
		this.toid = toid;
		this.fromid = fromid;
		this.content = content;
		this.wdate = wdate;
		this.readck = readck;
		this.del = del;
	}
	@Override
	public String toString() {
		return "Message [seq=" + seq + ", toid=" + toid + ", fromid=" + fromid + ", content=" + content + ", wdate="
				+ wdate + ", readck=" + readck + ", del=" + del + "]";
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getToid() {
		return toid;
	}
	public void setToid(String toid) {
		this.toid = toid;
	}
	public String getFromid() {
		return fromid;
	}
	public void setFromid(String fromid) {
		this.fromid = fromid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	public int getReadck() {
		return readck;
	}
	public void setReadck(int readck) {
		this.readck = readck;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

}
