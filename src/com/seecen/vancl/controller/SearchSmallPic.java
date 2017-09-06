package com.seecen.vancl.controller;

import com.seecen.vancl.dao.GoodSmallProDao;
import com.seecen.vancl.dao.GoodsDetailDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by Administrator on 2017/7/31.
 */
public class SearchSmallPic extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        // 获取小图
        GoodSmallProDao gspDao = new GoodSmallProDao();
        String colors = request.getParameter("color");
        String gid = request.getParameter("gid");
        List<String> url = gspDao.findSUrlByColor(colors,Integer.valueOf(gid));
        // request.setAttribute("size",size);

        PrintWriter pw = resp.getWriter();
        pw.print(url);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doGet(req, resp);
    }
}
