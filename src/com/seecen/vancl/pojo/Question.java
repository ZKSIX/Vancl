package com.seecen.vancl.pojo;

import java.sql.Date;

/**
 * 提问表
 * Created by Administrator on 2017/7/28.
 */
public class Question {
    private int gid;
    private int qid;
    private String uname;
    private String qcontent;
    private Date releaseTime;
    private String qtype;

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public int getGid() {

        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public int getQid() {
        return qid;
    }

    public void setQid(int qid) {
        this.qid = qid;
    }

    public String getQcontent() {
        return qcontent;
    }

    public void setQcontent(String qcontent) {
        this.qcontent = qcontent;
    }

    public Date getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(Date releaseTime) {
        this.releaseTime = releaseTime;
    }

    public String getQtype() {
        return qtype;
    }

    public void setQtype(String qtype) {
        this.qtype = qtype;
    }
}

