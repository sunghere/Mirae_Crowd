package com.sung.hee.shcrowd.model;

/**
 * Created by SungHere on 2017-05-28.
 */
public class SHFund {

    private int seq;

    private int pseq;

    private String id;
    private String wdate;

    @Override
    public String toString() {
        return "SHFund{" +
                "seq=" + seq +
                ", pseq=" + pseq +
                ", id='" + id + '\'' +
                ", wdate='" + wdate + '\'' +
                ", money=" + money +
                '}';
    }

    public String getWdate() {
        return wdate;
    }

    public void setWdate(String wdate) {
        this.wdate = wdate;
    }

    private int money;

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public int getPseq() {
        return pseq;
    }

    public void setPseq(int pseq) {
        this.pseq = pseq;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }
}
