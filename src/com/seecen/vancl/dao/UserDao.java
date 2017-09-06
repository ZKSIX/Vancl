package com.seecen.vancl.dao;

import com.seecen.vancl.pojo.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by lusiwen on 2017/7/27.
 */
public class UserDao extends BaseDao {
    /**
     * 添加用户
     */
    public void addUser(User u){
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
            conn=getConn();
            String sql="select max(u_id) from t_user";
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            if(rs.next()){
                int userid=rs.getInt(1)+1;
                sql="insert into t_user values(?,?,?,?,?)";
                ps=conn.prepareStatement(sql);
                ps.setInt(1,userid);
                ps.setString(2,u.getUname());
                ps.setString(3,u.getUpsw());
                ps.setLong(4,u.getUphone());
                ps.setInt(5,u.getRole_id());
                int row=ps.executeUpdate();
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeAll(conn,ps,rs);
        }
    }

    /**
     * 根据用户账号，密码查询用户，登录用
     * @param
     */
    public User findUser(String userName, String userPsw){

        User u=null;
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
            conn=getConn();
            String sql="select * from t_user where uname=? and upwd=?";
            ps=conn.prepareStatement(sql);
            ps.setString(1,userName);
            ps.setString(2,userPsw);
            rs=ps.executeQuery();
            if(rs.next()){
                u=new User();
                u.setUname(rs.getString("uname"));
                u.setUpsw(rs.getString("psw"));
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeAll(conn,ps,rs);
        }
        return u;
    }
    /**
     * 根据用户账号查询用户是否存在 ，注册用
     * @param
     */
    public boolean findUser(String userName){

        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
            conn=getConn();
            String sql="select * from t_user where uname=? ";
            ps=conn.prepareStatement(sql);
            ps.setString(1,userName);
            rs=ps.executeQuery();
            if(rs.next()){
                return true;
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeAll(conn,ps,rs);
        }
        return false;
    }
}
