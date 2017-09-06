package com.seecen.vancl.dao;


import com.seecen.vancl.pojo.Comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 评论的dao
 * Created by Administrator on 2017/7/28.
 */
public class CommentDao extends BaseDao {

    public boolean addComment(Comment c) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = getConn();
            String sql = "select max(cid) from t_comment";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int cid = rs.getInt(1) + 1;
                sql = "insert into t_comment values(?,?,?,?,sysdate)";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, cid);
                ps.setInt(2,c.getGid());
                ps.setString(3,c.getUname());
                ps.setString(4,c.getContent());
                int row = ps.executeUpdate();
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closeAll(conn,ps,rs);
        }
        return false;
    }

    /**
     * 根据gid找出评论
     * @param gid
     * @return
     */
    public List<Comment> findCommentById(int gid){
        List<Comment> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = getConn();
            String sql = "select uname,content,ctime from t_comment where gid = ? order by cid desc";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,gid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Comment c = new Comment();
                c.setUname(rs.getString("uname"));
                c.setContent(rs.getString("content"));
                c.setReleaseTime(rs.getDate("ctime"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closeAll(conn,ps,rs);
        }
        return list;
    }

    /**
     * 根据编号查询共有几条评论
     * @param gid
     * @return
     */
    public int count(int gid){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int count = 0;
        try{
            conn = getConn();
            String sql = "select count(*) count from t_comment where gid=?";
            ps=conn.prepareStatement(sql);
            ps.setInt(1,gid);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count");
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            closeAll(conn,ps,rs);
        }
        return count;
    }

    /**
     * 分页查询
     * @param start
     * @param end
     * @return
     */
    public List<Comment> findCommentByPage(int start,int end,int gid){
        List<Comment> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = getConn();
            String sql = "select uname,content,ctime from " +
                    "(select t.*,rownum rn from (select * from t_comment order by ctime desc) t where rownum <=?) a " +
                    "where rn >= ? and gid = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, end);
            ps.setInt(2, start);
            ps.setInt(3,gid);

            rs = ps.executeQuery();
            while (rs.next()) {
                Comment c = new Comment();
                c.setUname(rs.getString("uname"));
                c.setContent(rs.getString("content"));
                c.setReleaseTime(rs.getDate("ctime"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeAll(conn, ps, rs);
        }

        return list;
    }
}
