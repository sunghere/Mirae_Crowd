package com.sung.hee.ent.model;

import java.io.Serializable;

/**
 * Created by SungHere on 2017-04-27.
 */
//com.sung.hee.ent.model.SHEnt
public class SHEnt implements Serializable {

    private int ent;
    private String entname;
    private int del = 0;

    public int getEnt() {
        return ent;
    }

    public void setEnt(int ent) {
        this.ent = ent;
    }

    public String getEntname() {
        return entname;
    }

    public void setEntname(String entname) {
        this.entname = entname;
    }


    public int getDel() {
        return del;
    }

    public void setDel(int del) {
        this.del = del;
    }

    public SHEnt() {
    }

    @Override
    public String toString() {
        return "SHEnt{" +
                "ent=" + ent +
                ", entname='" + entname + '\'' +
                ", del=" + del +
                '}';
    }

    public SHEnt(int ent, String entname, int del) {

        this.ent = ent;
        this.entname = entname;
        this.del = del;
    }
}
