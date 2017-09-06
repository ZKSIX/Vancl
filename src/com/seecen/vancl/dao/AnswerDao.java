package com.seecen.vancl.dao;

import com.seecen.vancl.pojo.Answer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 九十 on 2017/8/1 0001.
 */
public class AnswerDao extends  BaseDao{

    /**
     * 添加回复
     * @param a
     * @return
     */
    public boolean addAnswer(Answer a) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = getConn();
            String sql = "select max(aid) from t_answer";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int aid = rs.getInt(1) + 1;
                sql = "insert into t_answer values(?,?,?,?)";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, aid);
                ps.setInt(2,a.getGid());
                ps.setString(3,a.getQcontent());
                ps.setString(4,a.getAnswer());
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
     * 通过Gid 和 提问内容查询 回复
     * @return
     */
    public List<Answer> findAnswerByContent(int gid,String content){
        List<Answer> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            conn = getConn();
            String sql = "select * from t_answer where gid=? and qcontent=? order by aid desc";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,gid);
            ps.setString(2,content);
            rs = ps.executeQuery();
            while(rs.next()){
                Answer a = new Answer();
                a.setAid(rs.getInt("aid"));
                a.setGid(rs.getInt("gid"));
                a.setQcontent(rs.getString("qcontent"));
                a.setAnswer(rs.getString("answer"));
                list.add(a);
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
}
