package com.sung.hee.user.model;

import java.io.Serializable;

// com.sung.hee.user.model.SHUser
public class SHUser implements Serializable {
    private static final long serialVersionUID = -5076656664574067436L;

    private String id;
    private String name;
    private String email;
    private String pwd;
    private int del;
    private int auth = 3;
    private int ent;
    private String entname = "";
    private int epoint = 0;
    private int point = 0;

    public SHUser(String id, String name, String email, String pwd, int del, int auth, int ent, String entname, int epoint, int point, int isent) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.pwd = pwd;
        this.del = del;
        this.auth = auth;
        this.ent = ent;
        this.entname = entname;
        this.epoint = epoint;
        this.point = point;
        this.isent = isent;
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

    @Override
    public String toString() {
        return "SHUser{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", pwd='" + pwd + '\'' +
                ", del=" + del +
                ", auth=" + auth +
                ", ent=" + ent +
                ", entname='" + entname + '\'' +
                ", isent=" + isent +
                '}';
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

    public SHUser(String id, String name, String email, String pwd, int del, int auth, int ent, String entname, int isent) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.pwd = pwd;
        this.del = del;
        this.auth = auth;
        this.ent = ent;
        this.entname = entname;
        this.isent = isent;
    }

    public SHUser(String id, String name, String email, String pwd, int del, int auth, int ent, String entname) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.pwd = pwd;
        this.del = del;
        this.auth = auth;
        this.ent = ent;
        this.entname = entname;
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

    public SHUser(String id, String name, String email, String pwd,
                  int del, int auth) {
        super();
        this.id = id;
        this.name = name;
        this.email = email;
        this.pwd = pwd;
        this.del = del;
        this.auth = auth;
    }

    public SHUser(String id, String name, String email, String pwd) {
        super();
        this.id = id;
        this.name = name;
        this.email = email;
        this.pwd = pwd;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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