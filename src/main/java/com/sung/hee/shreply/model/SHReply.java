package com.sung.hee.shreply.model;

import java.io.Serializable;

/**
 * Created by SungHere on 2017-05-08.
 */
public class SHReply implements Serializable {
    private int seq;
    private String id;
    private String name;
    private String tempSub;
    private String temp;
    private int rnn;

    public int getRnn() {
        return rnn;
    }

    public void setRnn(int rnn) {
        this.rnn = rnn;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public SHReply() {
    }

    public String getTempSub() {
        tempSub = content;
        if (tempSub.length() > 12) {
            tempSub = tempSub.substring(0, 12) + "..";
        }
        tempSub = tempSub.replace("&", "&amp;");
        tempSub = tempSub.replace("<", "&lt;");
        tempSub = tempSub.replace(">", "&gt;");
        return tempSub;
    }

    public void setTempSub(String tempSub) {
        this.tempSub = content;
    }

    @Override
    public String toString() {
        return "SHReply{" +
                "seq=" + seq +
                ", id='" + id + '\'' +
                ", ref=" + ref +
                ", step=" + step +
                ", depth=" + depth +
                ", btype=" + btype +
                ", wdate='" + wdate + '\'' +
                ", parent=" + parent +
                ", bparent=" + bparent +
                ", del=" + del +
                ", content='" + content + '\'' +
                ", temp='" + temp + '\'' +
                '}';
    }

    private int ref;
    private int step;
    private int depth;
    private int btype;
    private String wdate;
    private int parent;
    private int bparent;
    private int del = 0;

    public SHReply(int seq, String id, int ref, int step, int depth, int btype, String wdate, int parent, int bparent, String content, String temp, int del) {
        this.seq = seq;
        this.id = id;
        this.ref = ref;
        this.step = step;
        this.depth = depth;
        this.btype = btype;
        this.wdate = wdate;
        this.parent = parent;
        this.bparent = bparent;
        this.content = content;
        this.temp = temp;
        this.del = del;
    }

    private String content="";

    public String getTemp() {
        temp = content;
        temp = temp.replace("&", "&amp;");
        temp = temp.replace("<", "&lt;");
        temp = temp.replace(">", "&gt;");
        return temp;
    }

    public void setTemp(String temp) {
        this.temp = temp;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getRef() {
        return ref;
    }

    public void setRef(int ref) {
        this.ref = ref;
    }

    public int getStep() {
        return step;
    }

    public void setStep(int step) {
        this.step = step;
    }

    public int getDepth() {
        return depth;
    }

    public void setDepth(int depth) {
        this.depth = depth;
    }

    public int getBtype() {
        return btype;
    }

    public void setBtype(int btype) {
        this.btype = btype;
    }

    public String getWdate() {
        return wdate;
    }

    public void setWdate(String wdate) {
        this.wdate = wdate;
    }

    public int getParent() {
        return parent;
    }

    public void setParent(int parent) {
        this.parent = parent;
    }

    public int getBparent() {
        return bparent;
    }

    public void setBparent(int bparent) {
        this.bparent = bparent;
    }

    public int getDel() {
        return del;
    }

    public void setDel(int del) {
        this.del = del;
    }


}
