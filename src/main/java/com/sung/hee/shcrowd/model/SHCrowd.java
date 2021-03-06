package com.sung.hee.shcrowd.model;

/**
 * Created by SungHere on 2017-05-24.
 */
public class SHCrowd {


    private String rnn="";
    private int seq;


    private int pnum;
    private String title = "";

    public String getTitleTemp() {
        titleTemp = title;
        titleTemp = titleTemp.replace("&", "&amp;");
        titleTemp = titleTemp.replace("<", "&lt;");
        titleTemp = titleTemp.replace(">", "&gt;");
        return titleTemp;
    }

    public void setTitleTemp(String titleTemp) {
        this.titleTemp = titleTemp;
    }

    private String titleTemp = "";
    private String titleSub = "";
    private String content;

    private String id;
    private int goalMoney;
    private int likenum;

    private int curMoney;
    private String tag;
    private String sdate;
    private String edate;


    private String category;
    private String address;

    public String getTitleSub() {
        titleSub = title;
        if (titleSub.length() > 15) {
            titleSub = titleSub.substring(0, 15) + "..";

        }
        titleSub = titleSub.replace("&", "&amp;");
        titleSub = titleSub.replace("<", "&lt;");
        titleSub = titleSub.replace(">", "&gt;");
        return titleSub;
    }

    public void setTitleSub(String titleSub) {
        this.titleSub = title;
    }

    private int type = 2;/*기본형 = 2,보상형=3 등등..*/


    private int req = 0;
    private int del = 0;
    private String wdate;
    private String search_type = "search";
    private String search = "";
    private int cnt;

    public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    private String endflag = "0";
    private String reward = "0";
    private String latlng = "";

    @Override
	public String toString() {
		return "SHCrowd [rnn=" + rnn + ", seq=" + seq + ", pnum=" + pnum + ", title=" + title + ", titleTemp="
				+ titleTemp + ", titleSub=" + titleSub + ", content=" + content + ", id=" + id + ", goalmoney="
				+ goalMoney + ", likenum=" + likenum + ", curmoney=" + curMoney + ", tag=" + tag + ", sdate=" + sdate
				+ ", edate=" + edate + ", category=" + category + ", address=" + address + ", type=" + type + ", req="
				+ req + ", del=" + del + ", wdate=" + wdate + ", search_type=" + search_type + ", search=" + search
				+ ", cnt=" + cnt + ", endflag=" + endflag + ", reward=" + reward + ", latlng=" + latlng + "]";
	}

    public int getPnum() {
        return pnum;
    }

    public void setPnum(int pnum) {
        this.pnum = pnum;
    }


    public String getLatlng() {
        return latlng;
    }

    public void setLatlng(String latlng) {
        this.latlng = latlng;
    }

    public String getRnn() {
        return rnn;
    }

    public void setRnn(String rnn) {
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
