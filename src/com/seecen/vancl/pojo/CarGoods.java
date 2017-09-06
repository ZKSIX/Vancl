package com.seecen.vancl.pojo;

import java.sql.Date;

/**
 * Created by Yuan on 2017/7/28.
 */
public class CarGoods {
    private int gid;
    private String gname;
    private String gsize;
    private String gprice;
    private String gprefer;
    private String gurl;
    private int gcount;

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public String getGsize() {
        return gsize;
    }

    public void setGsize(String gsize) {
        this.gsize = gsize;
    }

    public String getGprice() {
        return gprice;
    }

    public void setGprice(String gprice) {
        this.gprice = gprice;
    }

    public String getGprefer() {
        return gprefer;
    }

    public void setGprefer(String gprefer) {
        this.gprefer = gprefer;
    }

    public String getGurl() {
        return gurl;
    }

    public void setGurl(String gurl) {
        this.gurl = gurl;
    }

    public int getGcount() {
        return gcount;
    }

    public void setGcount(int gcount) {
        this.gcount = gcount;
    }
}
