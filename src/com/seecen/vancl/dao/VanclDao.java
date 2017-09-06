package com.seecen.vancl.dao;
import com.seecen.vancl.pojo.Goods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class VanclDao extends BaseDao {
    /**
     * 根据图片id.显示商品图片
     */
    public List<Goods> showGoods(){
        List<Goods> list=new ArrayList<>();
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
            conn=getConn();
            String sql="select gid,gurl from t_goods ORDER by gurl";
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Goods g=new Goods();
                g.setGurl(rs.getString("gurl"));
                g.setGid(rs.getInt("gid"));
                list.add(g);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeAll(conn,ps,rs);
        }
        return list;
    }

    /**
     * 查询goods信息
     * @param gid
     * @return
     */
    public Goods findDetaileById(int gid){
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        Goods g=new Goods();
        try {
            conn=getConn();
            String sql="select * from t_goods  where gid=? ORDER by gid";
            ps=conn.prepareStatement(sql);
            ps.setInt(1,gid);
            rs=ps.executeQuery();
            if(rs.next()){
                g.setGname(rs.getString("gname"));
                g.setGprice(rs.getInt("gprice"));
                g.setGdetail(rs.getString("gdetail"));
                g.setGtype(rs.getString("gtype"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeAll(conn,ps,rs);
        }
        return g;
    }
}

