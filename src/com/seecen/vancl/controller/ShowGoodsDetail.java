package com.seecen.vancl.controller;

import com.seecen.vancl.dao.*;
import com.seecen.vancl.pojo.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2017/7/29.
 */
public class ShowGoodsDetail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        //  编写业务逻辑
        request.setCharacterEncoding("utf-8");
        String gid = request.getParameter("gid");

        GoodsDetailDao gdDao = new GoodsDetailDao();
        VanclDao vd=new VanclDao();
        // 查询商品详情
        if (gid != null) {
            // 获取gid
            GoodsDetail gd = gdDao.findGDById(Integer.valueOf(gid));
            request.setAttribute("goodsdetail",gd);

            // 查询商品详情

            Goods g=vd.findDetaileById(Integer.valueOf(gid));
            request.setAttribute("goods",g);

           // 查看颜色
           List<GoodsDetail> list = gdDao.findGDColorById(Integer.valueOf(gid));
           request.setAttribute("GoodsDetail",list);

          /* // 获取尺寸
            String colors = request.getParameter("color");
            List<String> size = gdDao.findGDSizeById(colors);
            request.setAttribute("size",size);*/

        }

        // 评论内容
        // 获取评论的内容
        /*String comcontent = request.getParameter("comcontent");*/
        CommentDao cd = new CommentDao();
        List<Comment> comment = cd.findCommentById(Integer.valueOf(gid));

        request.setAttribute("comments",comment);
        int count = cd.count(Integer.valueOf(gid));
        request.setAttribute("count",count);



        // 提问内容 显示提问的内容

        String askcontent = request.getParameter("askcontent");
        QuestionDao qd = new QuestionDao();
        List<Question> question = qd.findQuestionById(Integer.valueOf(gid));
        request.setAttribute("questions",question);
        int qcount = qd.count(Integer.valueOf(gid));
        request.setAttribute("qcount",qcount);

        // 显示回复的内容
        AnswerDao ad = new AnswerDao();
        List<Answer> answer = qd.findAnswerByContent(Integer.valueOf(gid));
        request.setAttribute("answer",answer);
       /* List<Answer> answer = null;
        for(int i = 0; i < question.size();i++){
            answer = ad.findAnswerByContent(Integer.valueOf(gid),question.get(i).getQcontent());
        }*/
        /*request.*/
       /* List<Answer> answer = ad.findAnswerByContent(Integer.valueOf(gid),);*/

        // 重定向
        RequestDispatcher rd = request.getRequestDispatcher("pages/goodsPro.jsp");
        rd.forward(request,resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
