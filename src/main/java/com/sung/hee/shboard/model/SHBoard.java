package com.sung.hee.shboard.model;

import java.io.Serializable;
import java.util.Date;

//com.sung.hee.shboard.model.SHBoard
public class SHBoard implements Serializable {

    private int seq;
    private String id;
    private String title;
    private int type = 1;

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    private String content;
    private Date wdate;
    private int ref;
    private int step;
    private int depth;
    private int parent;
    private int del;
    private int rnn;
    private int hidden;
    private String temp;
    private int ent = 0;
    private String tempSub;

    public String getTempSub() {
        tempSub = title;
        if (tempSub.length() > 12) {
            tempSub = tempSub.substring(0, 12) + "..";
        }
        tempSub = tempSub.replace("&", "&amp;");
        tempSub = tempSub.replace("<", "&lt;");
        tempSub = tempSub.replace(">", "&gt;");
        return tempSub;
    }

    public void setTempSub(String tempSub) {
        this.tempSub = title;
    }

    public String getTemp() {
        temp = title.replace("&", "&amp;");
        temp = temp.replace("<", "&lt;");
        temp = temp.replace(">", "&gt;");
        return temp;
    }

    public void setTemp(String temp) {

        this.temp = title;
    }

    public SHBoard(int seq, String id, String title, String content, Date wdate, int ref, int step, int depth, int parent, int del, int rnn, int hidden, String temp, int ent, String filename, int readcount) {
        this.seq = seq;
        this.id = id;
        this.title = title;
        this.content = content;
        this.wdate = wdate;
        this.ref = ref;
        this.step = step;
        this.depth = depth;
        this.parent = parent;
        this.del = del;
        this.rnn = rnn;
        this.hidden = hidden;
        this.temp = temp;
        this.ent = ent;
        this.filename = filename;
        this.readcount = readcount;
    }

    public int getRnn() {

        return rnn;
    }

    public void setRnn(int rnn) {
        this.rnn = rnn;
    }


    @Override
    public String toString() {
        return "SHBoard{" +
                "seq=" + seq +
                ", id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", wdate=" + wdate +
                ", ref=" + ref +
                ", step=" + step +
                ", depth=" + depth +
                ", parent=" + parent +
                ", del=" + del +
                ", hidden=" + hidden +
                ", temp='" + temp + '\'' +
                ", ent=" + ent +
                ", filename='" + filename + '\'' +
                ", readcount=" + readcount +
                '}';
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    private String filename;


    public int getEnt() {

        return ent;
    }

    public void setEnt(int ent) {
        this.ent = ent;
    }


    public int getReadcount() {
        return readcount;
    }

    public void setReadcount(int readcount) {
        this.readcount = readcount;
    }

    public SHBoard(int seq, String id, String title, String content, Date wdate, int ref, int step, int depth, int parent, int del, int hidden, int readcount) {

        this.seq = seq;
        this.id = id;
        this.title = title;
        this.content = content;
        this.wdate = wdate;
        this.ref = ref;
        this.step = step;
        this.depth = depth;
        this.parent = parent;
        this.del = del;
        this.hidden = hidden;
        this.readcount = readcount;
    }

    private int readcount;

    public SHBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

    public SHBoard(int seq, String id, String title, String content,
                   Date wdate, int ref, int step, int depth, int parent, int del) {
        super();
        this.seq = seq;
        this.id = id;
        this.title = title;
        this.content = content;
        this.wdate = wdate;
        this.ref = ref;
        this.step = step;
        this.depth = depth;
        this.parent = parent;
        this.del = del;
    }

    public SHBoard(String id, String title, String content, int hidden) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.hidden = hidden;
    }

    public SHBoard(String id, String title, String content) {
        super();
        this.id = id;
        this.title = title;
        this.content = content;
    }

    public SHBoard(int seq, String id, String title, String content, Date wdate) {
        super();
        this.seq = seq;
        this.id = id;
        this.title = title;
        this.content = content;
        this.wdate = wdate;
    }

    public SHBoard(int seq, String id, String title, String content, Date wdate, int ref, int step, int depth, int parent, int del, int hidden) {
        this.seq = seq;
        this.id = id;
        this.title = title;
        this.content = content;
        this.wdate = wdate;
        this.ref = ref;
        this.step = step;
        this.depth = depth;
        this.parent = parent;
        this.del = del;
        this.hidden = hidden;
    }

    public int getHidden() {

        return hidden;
    }

    public void setHidden(int hidden) {
        this.hidden = hidden;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public int getParent() {
        return parent;
    }

    public void setParent(int parent) {
        this.parent = parent;
    }

    public int getDel() {
        return del;
    }

    public void setDel(int del) {
        this.del = del;
    }

}