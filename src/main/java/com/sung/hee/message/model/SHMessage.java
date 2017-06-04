package com.sung.hee.message.model;

import java.io.Serializable;
import java.sql.Date;

public class SHMessage implements Serializable {

    private int seq;
    private String toid;
    private String fromid;
    private String content="";
    private String temp="";
    private Date wdate;
    private int readck;
    private int del;
    private int cnt;


    public String getTemp() {
        temp = content;
        if (temp.length() > 12) {
            temp = temp.substring(0, 12) + "..";
        }
        temp = temp.replace("&", "&amp;");
        temp = temp.replace("<", "&lt;");
        temp = temp.replace(">", "&gt;");
        return temp;
    }

    public void setTemp(String temp) {
        this.temp = content;
    }

    public SHMessage() {
    }

    @Override
    public String toString() {
        return "SHMessage{" +
                "seq=" + seq +
                ", toid='" + toid + '\'' +
                ", fromid='" + fromid + '\'' +
                ", content='" + content + '\'' +
                ", temp='" + temp + '\'' +
                ", wdate=" + wdate +
                ", readck=" + readck +
                ", del=" + del +
                ", cnt=" + cnt +
                '}';
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
        content = content.replace("&", "&amp;");
        content = content.replace("<", "&lt;");
        content = content.replace(">", "&gt;");
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
