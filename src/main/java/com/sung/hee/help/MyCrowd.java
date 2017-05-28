package com.sung.hee.help;
/*com.sung.hee.help.MyCrowd*/

/**
 * Created by SungHere on 2017-05-28.
 */
public class MyCrowd {
    private int seq;
    private int myseq;
    private String title;

    private int goalMoney;
    private int curMoney;

    private String tag;
    private String sdate;
    private String edate;
    private String category;

    private int type;
    private int money;


    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public int getMyseq() {
        return myseq;
    }

    public void setMyseq(int myseq) {
        this.myseq = myseq;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
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

    @Override
    public String toString() {
        return "MyCrowd{" +
                "seq=" + seq +
                ", myseq=" + myseq +
                ", title='" + title + '\'' +
                ", goalMoney=" + goalMoney +
                ", curMoney=" + curMoney +
                ", tag='" + tag + '\'' +
                ", sdate='" + sdate + '\'' +
                ", edate='" + edate + '\'' +
                ", category='" + category + '\'' +
                ", type=" + type +
                ", money=" + money +
                '}';
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getGoalMoney() {
        return goalMoney;
    }

    public void setGoalMoney(int goalMoney) {
        this.goalMoney = goalMoney;
    }

    public int getCurMoney() {
        return curMoney;
    }

    public void setCurMoney(int curMoney) {
        this.curMoney = curMoney;
    }
}
