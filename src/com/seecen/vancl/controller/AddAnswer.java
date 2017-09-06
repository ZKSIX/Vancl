package com.seecen.vancl.controller;

import com.seecen.vancl.dao.AnswerDao;
import com.seecen.vancl.dao.CommentDao;
import com.seecen.vancl.pojo.Answer;
import com.seecen.vancl.pojo.Comment;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by 九十 on 2017/8/1 0001.
 */
public class AddAnswer extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String answer =request.getParameter("answer");
        String gid = request.getParameter("gid");
        String qcontent =request.getParameter("qcontent");
        String msg = "error";
        if(answer!=null){
            AnswerDao ad = new AnswerDao();
            Answer a= new Answer();
            a.setAnswer(answer);
            a.setGid(Integer.parseInt(gid));
            a.setQcontent(qcontent);
            ad.addAnswer(a);
            msg = "success";
        }
        PrintWriter pw = response.getWriter();
        pw.print(msg);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
