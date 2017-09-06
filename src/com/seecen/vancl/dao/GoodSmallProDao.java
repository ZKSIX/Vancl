package com.seecen.vancl.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/7/30.
 */
public class GoodSmallProDao extends  BaseDao {

    /**
     * 根据颜色 和 gid 查出相应的小图
     * @param color
     * @param gid
     * @return
     */
    public List<String> findSUrlByColor(String color,int gid){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<String> url = null;
        try {
            conn = getConn();
            url = new ArrayList<>();
            String sql = "select gurl from t_prospic where gcolor = ? and gid =?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,color);
            ps.setInt(2,gid);
            rs = ps.executeQuery();
            while (rs.next()) {
                url.add(rs.getString("gurl"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closeAll(conn,ps,rs);
        }
        return url;
    }
 }
