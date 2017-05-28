package com.sung.hee.user.model;

import java.io.Serializable;

// com.sung.hee.user.model.SHUser
public class SHUser implements Serializable {
    private static final long serialVersionUID = -5076656664574067436L;

    private String id;
    private String name;
    private String pwd;
    private int del;
    private int auth = 3;
    private int ent;
    private String entname = "";
    private int epoint = 0;
    private int point = 0;
    private int certi = 0;


    @Override
    public String toString() {
        return "SHUser{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", pwd='" + pwd + '\'' +
                ", del=" + del +
                ", auth=" + auth +
                ", ent=" + ent +
                ", entname='" + entname + '\'' +
                ", epoint=" + epoint +
                ", point=" + point +
                ", certi=" + certi +
                ", isent=" + isent +
                '}';
    }

    public int getCerti() {
        return certi;
    }

    public void setCerti(int certi) {
        this.certi = certi;
    }

    public int getEpoint() {

        return epoint;
    }

    public void setEpoint(int epoint) {
        this.epoint = epoint;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    private int isent = 0;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public int getIsent() {
        return isent;
    }

    public void setIsent(int isent) {
        this.isent = isent;
    }


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

    public SHUser() {
        super();
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public int getDel() {
        return del;
    }

    public void setDel(int del) {
        this.del = del;
    }

    public int getAuth() {
        return auth;
    }

    public void setAuth(int auth) {
        this.auth = auth;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }


}