package com.seecen.vancl.controller;

import com.seecen.vancl.dao.CommentDao;
import com.seecen.vancl.pojo.Comment;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Administrator on 2017/7/28.
 */
public class AddComment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        String content =request.getParameter("content");
        String gid = request.getParameter("gid");
        String uname = request.getParameter("uname");
        String msg = "error";
        if(content!=null){
            CommentDao cd = new CommentDao();
            Comment c = new Comment();
            c.setContent(content);
            c.setGid(Integer.valueOf(gid));
            c.setUname(uname);
            cd.addComment(c);
            msg = "success";
        }
        PrintWriter pw = resp.getWriter();
        pw.print(msg);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
