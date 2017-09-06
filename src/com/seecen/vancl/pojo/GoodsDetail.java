package com.seecen.vancl.pojo;

/**
 * 商品详情表
 * Created by Administrator on 2017/7/28.
 */
public class GoodsDetail {
    private int gid;
    private String gdsize;
    private String gdcolor;
    private String gdurl;
    private double gdprice;
    private int gdcount;

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public String getGdsize() {
        return gdsize;
    }

    public void setGdsize(String gdsize) {
        this.gdsize = gdsize;
    }

    public String getGdcolor() {
        return gdcolor;
    }

    public void setGdcolor(String gdcolor) {
        this.gdcolor = gdcolor;
    }

    public String getGdurl() {
        return gdurl;
    }

    public void setGdurl(String gdurl) {
        this.gdurl = gdurl;
    }

    public double getGdprice() {
        return gdprice;
    }

    public void setGdprice(double gdprice) {
        this.gdprice = gdprice;
    }

    public int getGdcount() {
        return gdcount;
    }

    public void setGdcount(int gdcount) {
        this.gdcount = gdcount;
    }
}
