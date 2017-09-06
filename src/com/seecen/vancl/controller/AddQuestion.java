package com.seecen.vancl.controller;

import com.seecen.vancl.dao.QuestionDao;
import com.seecen.vancl.pojo.Question;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Administrator on 2017/7/29.
 */
public class AddQuestion extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        String askcontent = request.getParameter("askcontent");
        String gid = request.getParameter("gid");
        String uname = request.getParameter("uname");
        String qtype = request.getParameter("qtype");
        String msg = "error";
        if (askcontent != null) {
            QuestionDao qd = new QuestionDao();
            Question q = new Question();
            q.setGid(Integer.valueOf(gid));
            q.setQcontent(askcontent);
            q.setQtype(qtype);
            q.setUname(uname);
            qd.addQuestion(q);
            msg = "success";
        }
        PrintWriter pw = resp.getWriter();
        pw.print(msg);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
