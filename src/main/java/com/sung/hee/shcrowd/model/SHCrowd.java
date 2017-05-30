package com.sung.hee.shcrowd.model;

/**
 * Created by SungHere on 2017-05-24.
 */
/*com.sung.hee.shcrowd.model.SHCrowd*/
public class SHCrowd {


    private int rnn;
    private int seq;
    private String title;
    private String content;

    private String id;
    private int goalmoney;
    private int likenum;

    private int curmoney;
    private String tag;
    private String sdate;
    private String edate;


    private String category;
    private String address;


    private int type = 2;/*기본형 = 2,보상형=3 등등..*/


    private int req = 0;
    private int del = 0;
    private String wdate;
    private String search_type = "search";
    private String endflag = "0";
    private String reward ="0";

    @Override
    public String toString() {
        return "SHCrowd{" +
                "rnn=" + rnn +
                ", seq=" + seq +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", id='" + id + '\'' +
                ", goalmoney=" + goalmoney +
                ", likenum=" + likenum +
                ", curmoney=" + curmoney +
                ", tag='" + tag + '\'' +
                ", sdate='" + sdate + '\'' +
                ", edate='" + edate + '\'' +
                ", category='" + category + '\'' +
                ", address='" + address + '\'' +
                ", type=" + type +
                ", req=" + req +
                ", del=" + del +
                ", wdate='" + wdate + '\'' +
                ", search_type='" + search_type + '\'' +
                ", endflag='" + endflag + '\'' +
                ", reward='" + reward + '\'' +
                '}';
    }

    public int getRnn() {
        return rnn;
    }

    public void setRnn(int rnn) {
        this.rnn = rnn;
    }

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getGoalmoney() {
        return goalmoney;
    }

    public void setGoalmoney(int goalmoney) {
        this.goalmoney = goalmoney;
    }

    public int getLikenum() {
        return likenum;
    }

    public void setLikenum(int likenum) {
        this.likenum = likenum;
    }

    public int getCurmoney() {
        return curmoney;
    }

    public void setCurmoney(int curmoney) {
        this.curmoney = curmoney;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getSdate() {
        return sdate;
    }

    public void setSdate(String sdate) {
        this.sdate = sdate;
    }

    public String getEdate() {
        return edate;
    }

    public void setEdate(String edate) {
        this.edate = edate;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getReq() {
        return req;
    }

    public void setReq(int req) {
        this.req = req;
    }

    public int getDel() {
        return del;
    }

    public void setDel(int del) {
        this.del = del;
    }

    public String getWdate() {
        return wdate;
    }

    public void setWdate(String wdate) {
        this.wdate = wdate;
    }

    public String getSearch_type() {
        return search_type;
    }

    public void setSearch_type(String search_type) {
        this.search_type = search_type;
    }

    public String getEndflag() {
        return endflag;
    }

    public void setEndflag(String endflag) {
        this.endflag = endflag;
    }

    public String getReward() {
        return reward;
    }

    public void setReward(String reward) {
        this.reward = reward;
    }
}
