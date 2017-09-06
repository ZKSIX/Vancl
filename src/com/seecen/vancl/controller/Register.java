package com.seecen.vancl.controller;
import com.seecen.vancl.dao.UserDao;
import com.seecen.vancl.pojo.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by lusiwen on 2017/7/28.
 */
public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String phone=request.getParameter("phone");
        String psw=request.getParameter("psw");
        if(phone!=null&&psw!=null){
            UserDao ud=new UserDao();
            User u=new User();
            u.setUname(phone);
            u.setUphone(Long.valueOf(phone));
            u.setUpsw(psw);
            ud.addUser(u);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
