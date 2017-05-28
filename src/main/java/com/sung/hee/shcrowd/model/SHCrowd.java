package com.sung.hee.shcrowd.model;

/**
 * Created by SungHere on 2017-05-24.
 */
public class SHCrowd {


    private int rnn;
    private int seq;
    private String title;
    private String content;

    private String id;
    private int goalMoney;
    private int likenum;

    private int curMoney;
    private String tag;
    private String sdate;
    private String edate;


    private String catagory;
    private String address;


    private int type = 2;/*기본형 = 2,보상형=3 등등..*/


    private int req = 0;
    private String wdate;
    private String search_type = "search";
    private String endflag = "0";


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

    private String reward = "0";

    public String getSearch_type() {
        return search_type;
    }

    public void setSearch_type(String search_type) {
        this.search_type = search_type;
    }

    @Override
    public String toString() {
        return "SHCrowd{" +
                "rnn=" + rnn +
                ", seq=" + seq +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", id='" + id + '\'' +
                ", goalMoney=" + goalMoney +
                ", likenum=" + likenum +
                ", curMoney=" + curMoney +
                ", tag='" + tag + '\'' +
                ", sdate='" + sdate + '\'' +
                ", edate='" + edate + '\'' +
                ", catagory='" + catagory + '\'' +
                ", address='" + address + '\'' +
                ", type=" + type +
                ", req=" + req +
                ", wdate='" + wdate + '\'' +
                ", search_type='" + search_type + '\'' +
                ", endflag='" + endflag + '\'' +
                ", reward='" + reward + '\'' +
                '}';
    }

    public SHCrowd() {
    }


    public int getReq() {
        return req;
    }

    public void setReq(int req) {
        this.req = req;
    }

    public String getWdate() {
        return wdate;
    }

    public void setWdate(String wdate) {
        this.wdate = wdate;
    }

    public int getRnn() {

        return rnn;
    }

    public void setRnn(int rnn) {
        this.rnn = rnn;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
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

    public int getGoalMoney() {
        return goalMoney;
    }

    public void setGoalMoney(int goalMoney) {
        this.goalMoney = goalMoney;
    }

    public int getLikenum() {
        return likenum;
    }

    public void setLikenum(int likenum) {
        this.likenum = likenum;
    }

    public int getCurMoney() {
        return curMoney;
    }

    public void setCurMoney(int curMoney) {
        this.curMoney = curMoney;
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

    public String getCatagory() {
        return catagory;
    }

    public void setCatagory(String catagory) {
        this.catagory = catagory;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
