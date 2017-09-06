package com.seecen.vancl.controller;

import com.seecen.vancl.dao.UserDao;
import com.seecen.vancl.pojo.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by lusiwen on 2017/7/27.
 */
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        UserDao ud=new UserDao();
        String msg="0";
        request.setCharacterEncoding("utf-8");
        //if(request.getSession().getAttribute("userInfo")==null){
            //是否提交表单
            String userName=request.getParameter("uname");
            String userPsw=request.getParameter("upsw");
            if(userName!=null&&userPsw!=null){
                User u=ud.findUser(userName,userPsw);
                if(u!=null){
                    //找到了用户，登录成功
                    request.getSession().setAttribute("userInfo",u);
                    msg="1";
                }
            //}
        }
        PrintWriter pw=resp.getWriter();
        pw.print(msg);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
