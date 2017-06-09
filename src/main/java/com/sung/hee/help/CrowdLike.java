package com.sung.hee.help;

/**
 * Created by SungHere on 2017-05-28.
 */
public class CrowdLike {

    private int seq;
    private int pseq;

    public int getPseq() {
		return pseq;
	}

	public void setPseq(int pseq) {
		this.pseq = pseq;
	}

	private String id;

    private int like;

    @Override
	public String toString() {
		return "CrowdLike [seq=" + seq + ", pseq=" + pseq + ", id=" + id + ", like=" + like + "]";
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
