package com.seecen.vancl.dao;

import com.seecen.vancl.pojo.Answer;
import com.seecen.vancl.pojo.Question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/7/28.
 */
public class QuestionDao extends  BaseDao {

    /**
     * 根据商品编号查询提问的问题
     * @param gid
     * @return
     */
    public List<Question> findQuestionById(int gid) {
        List<Question> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = getConn();
            String sql = "select uname,qcontent,qtime from t_question where gid = ? order by qid desc";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,gid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setUname(rs.getString("uname"));
                q.setQcontent(rs.getString("qcontent"));
                q.setReleaseTime(rs.getDate("qtime"));
                list.add(q);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closeAll(conn,ps,rs);
        }
        return list;
    }

    /**
     *
     * 根据gid查出回复内容
     * @param gid     *
     * @return
     */
    public List<Answer> findAnswerByContent(int gid){
        List<Answer> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            conn = getConn();
            String sql = "select ta.gid,ta.qcontent,aid,answer from t_answer ta,t_question tq where ta.gid=tq.gid and ta.qcontent = tq.qcontent and tq.gid=? order by aid desc";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,gid);
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
        }finally {
            closeAll(conn,ps,rs);
        }
        return list;
    }

    /**
     * 插入提问
     * @param q
     * @return
     */
    public boolean addQuestion(Question q){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = getConn();
            String sql = "select max(qid) from t_question";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int gid = rs.getInt(1) + 1;
                sql = "insert into t_question values(?,?,?,sysdate,?,?)";
                ps = conn.prepareStatement(sql);
                ps.setInt(1,gid);
                ps.setString(2,q.getUname());
                ps.setString(3, q.getQcontent());
                ps.setString(4,q.getQtype());
                ps.setInt(5,q.getGid());
                int i = ps.executeUpdate();
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
     * 查出共有几条提问
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
            String sql = "select count(*) count from t_question where gid=?";
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

}
