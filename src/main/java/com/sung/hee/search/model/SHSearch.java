package com.sung.hee.search.model;

import java.io.Serializable;

/**
 * Created by SungHere on 2017-07-02.
 */
public class SHSearch implements Serializable {

   private int seq;
   private String wdate="";
   private String search="";
   private String id="";
   private int del;

    public SHSearch(int seq, String wdate, String search, String id, int del) {
        this.seq = seq;
        this.wdate = wdate;
        this.search = search;
        this.id = id;
        this.del = del;
    }

    public SHSearch() {

    }

    public int getSeq() {

        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public String getWdate() {
        return wdate;
    }

    public void setWdate(String wdate) {
        this.wdate = wdate;
    }

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getDel() {
        return del;
    }

    public void setDel(int del) {
        this.del = del;
    }
}
