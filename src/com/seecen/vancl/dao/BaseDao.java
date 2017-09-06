package com.seecen.vancl.dao;

import com.alibaba.druid.pool.DruidDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by Administrator on 2017/7/27.
 */
public class BaseDao {
    private static DruidDataSource dds=null;
    static{
        try {
            String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
            String user = "vancl";
            String pwd = "vancl";
            String driver = "oracle.jdbc.driver.OracleDriver";

            dds = new DruidDataSource();
            //设置驱动类
            dds.setDriverClassName(driver);
            //设置数据库连接字符串
            dds.setUrl(url);
            //设置数据库用户名
            dds.setUsername(user);
            //设置数据库密码
            dds.setPassword(pwd);
            // 设置初始化大小
            dds.setInitialSize(5);
            //设置最小连接数
            dds.setMinIdle(1);
            //设置最大连接数
            dds.setMaxActive(10);
            //设置是否缓存语句声明
            dds.setPoolPreparedStatements(false);
        }catch(Exception e){
            e.printStackTrace();
        }
    }


    /**
     * 获取数据库连接
     * @return
     */
    public Connection getConn(){
        try {
            return dds.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    protected void closeAll(Connection conn, PreparedStatement ps, ResultSet rs){

        try {
            if(conn!=null) {
                conn.close();
            }
            if(ps!=null){
                ps.close();
            }
            if(rs!=null){
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
