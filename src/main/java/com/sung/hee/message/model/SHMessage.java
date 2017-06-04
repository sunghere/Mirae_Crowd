package com.sung.hee.message.model;

import java.io.Serializable;
import java.sql.Date;

public class SHMessage implements Serializable {

    private int seq;
    private String toid;
    private String fromid;
    private String content;
    private String temp;
    private Date wdate;
    private int readck;
    private int del;
    private int cnt;

    public SHMessage() {
    }

    public String getTemp() {
        temp = content;

        temp = temp.replace("&", "&amp;");
        temp = temp.replace("<", "&lt;");
        temp = temp.replace(">", "&gt;");
        return temp;
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
