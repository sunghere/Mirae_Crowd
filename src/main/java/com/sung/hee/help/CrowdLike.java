package com.sung.hee.help;

/**
 * Created by SungHere on 2017-05-28.
 */
public class CrowdLike {

    private int seq;

    private String id;

    private int like;

    @Override
    public String toString() {
        return "CrowdLike{" +
                "seq=" + seq +
                ", id='" + id + '\'' +
                ", like=" + like +
                '}';
    }

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
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
}
