package com.seecen.vancl.dao;

import com.seecen.vancl.pojo.CarGoods;
import com.seecen.vancl.pojo.Goods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/7/27.
 */
public class GoodsDao extends BaseDao {
    public List<CarGoods> getShoppingCart(){
        List<CarGoods> list = new ArrayList<CarGoods>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        conn = getConn();
        String sql = "select * from t_ShoppingCart order by gtime";
        try {

            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                CarGoods n = new CarGoods();
                n.setGid(rs.getInt("gid"));
                n.setGname(rs.getString("gname"));
                n.setGprice(rs.getString("gprice"));
                n.setGsize(rs.getString("gsize"));
                n.setGprefer(rs.getString("gprefer"));
                n.setGurl(rs.getString("gurl"));
                n.setGcount(rs.getInt("gcount"));
                list.add(n);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeAll(conn,ps,rs);
        }

        return list;
    }
//未使用，sql有错
   /* public void  addtoShoppingCart(int gid){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = getConn();
            String all = "select * from t_Goods where gid = "+gid+"";
            ps = conn.prepareStatement(all);
            rs = ps.executeQuery();
            if(rs.next()){
                String sert = "insert into t_ShoppingCart values(?,?,?,?,?,?,sysdate)";
                ps = conn.prepareStatement(sert);
                ps.setInt(1,gid);
                ps.setString(2,rs.getString("gname"));
                ps.setString(3,rs.getString("gsize"));
                ps.setString(4,rs.getString("gprise"));
                ps.setString(5,rs.getString("gprefer"));
                ps.setString(6,rs.getString("gurl"));
//                ps.setString(6,String.valueOf(c.getRelease_time()));

                int row = ps.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeAll(conn,ps,rs);
        }
    }*/

    /**
     * 改
     * @param cg
     */
    public void  addtoShoppingCart(CarGoods cg){
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
        conn = getConn();
        String sql = "insert into t_ShoppingCart values(?,?,?,?,?,?,sysdate,?)";
        ps = conn.prepareStatement(sql);
        ps.setInt(1,cg.getGid());
        ps.setString(2,cg.getGname());
        ps.setString(3,cg.getGsize());
        ps.setString(4,cg.getGprice());
        ps.setString(5,cg.getGprefer());
        ps.setString(6,cg.getGurl());
        ps.setInt(7,cg.getGcount());
//            ps.setString(6,String.valueOf(c.getRelease_time()));
        int row = ps.executeUpdate();


    } catch (SQLException e) {
        e.printStackTrace();
    }finally {
        closeAll(conn,ps,rs);
    }
}
    //根据商品种类算首页购物车数量
    public int findCartNum(){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        conn = getConn();
        try {
            String num = "select count(gid) from t_ShoppingCart";
            ps = conn.prepareStatement(num);
            rs = ps.executeQuery();
            if(rs.next()){
               return rs.getInt("count(gid)");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeAll(conn,ps,rs);
        }

   return 0;
    }



}
