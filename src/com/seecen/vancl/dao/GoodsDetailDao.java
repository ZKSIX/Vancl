package com.seecen.vancl.dao;

import com.seecen.vancl.pojo.GoodSmallPro;
import com.seecen.vancl.pojo.GoodsDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/** 商品详情dao
 * Created by Administrator on 2017/7/28.
 */
public class GoodsDetailDao extends BaseDao {

    /**
     * 通过商品的编号 查询商品详情里的内容
     * @param gid
     * @return
     */
    public GoodsDetail findGDById(int gid){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = getConn();
            String sql = "select gid from t_goodsdetail where gid = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, gid);
            rs = ps.executeQuery();
            while (rs.next()) {
                GoodsDetail gd = new GoodsDetail();
                gd.setGid(rs.getInt("gid"));
                return gd;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closeAll(conn,ps,rs);
        }
        return null;
    }

    /**
     * 通过gid来查询相应的颜色
     * @param gid
     * @return
     */
    public List<GoodsDetail> findGDColorById(int gid){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<GoodsDetail> list = null;
        try {
            conn = getConn();
            list = new ArrayList<>();

            String sql = "select distinct gdcolor,gdurl from t_GoodsDetail where gid = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, gid);
            rs = ps.executeQuery();
            while (rs.next()) {
                GoodsDetail gd=new GoodsDetail();
               gd.setGdcolor(rs.getString("gdcolor"));
               gd.setGdurl(rs.getString("gdurl"));
               list.add(gd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closeAll(conn,ps,rs);
        }
        return list;
    }

    /**
     * 根据颜色差尺码
     * @param color
     * @return
     */
    public List<String> findGDSizeById(String color,int gid){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<String> size = null;
        try {
            conn = getConn();
            size = new ArrayList<>();
            String sql = "select gdsize from t_goodsdetail where gdcolor = ? and gid =?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,color);
            ps.setInt(2,gid);
            rs = ps.executeQuery();
            while (rs.next()) {
                size.add(rs.getString("gdsize"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closeAll(conn,ps,rs);
        }
        return size;
    }



}
