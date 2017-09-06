package com.seecen.vancl.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by Yuan on 2017/8/1.
 */
public class DelDao extends BaseDao {
    public void DelByGid(int gid){
        Connection conn = getConn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String del = "delete from t_ShoppingCart where gid =?";
        try {
            ps = conn.prepareStatement(del);
            ps.setInt(1,gid);
            int row = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeAll(conn,ps,rs);
        }
    }

    public void delAll(){
        Connection conn = getConn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String del = "truncate table t_ShoppingCart";
        try {
            ps = conn.prepareStatement(del);
            int row = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeAll(conn,ps,rs);
        }
    }
}
