package com.seecen.vancl.controller;

import com.seecen.vancl.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by lusiwen on 2017/7/28.
 */
public class CheckPhone extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        UserDao ud = new UserDao();
        String msg = "0";
        request.setCharacterEncoding("utf-8");
        String userName = request.getParameter("phone");
        if (ud.findUser(userName)) {
            //找到了用户，用户已经注册过了
            msg = "1";
        }
        PrintWriter pw = resp.getWriter();
        pw.print(msg);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
