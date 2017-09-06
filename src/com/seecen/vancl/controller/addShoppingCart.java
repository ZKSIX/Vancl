package com.seecen.vancl.controller;

import com.seecen.vancl.dao.GoodsDao;
import com.seecen.vancl.pojo.CarGoods;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Yuan on 2017/7/28.
 */
public class addShoppingCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String gid=request.getParameter("gid");
        String gcount=request.getParameter("number");
        String gcolor=request.getParameter("color");
        String gname=request.getParameter("gname");
        String gsize=request.getParameter("size");
        String gprice=request.getParameter("gprice");
        String gurl=request.getParameter("imgurl");

        if(gsize!=null){
            CarGoods cg=new CarGoods();
            cg.setGcount(Integer.valueOf(gcount));
            cg.setGid(Integer.valueOf(gid));
            cg.setGname(gcolor+" "+gname);
            cg.setGprice(gprice);
            cg.setGsize(gsize);
            cg.setGurl(gurl);
            GoodsDao gd=new GoodsDao();
            gd.addtoShoppingCart(cg);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
