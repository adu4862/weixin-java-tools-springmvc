package com.github.weixin.demo.dao.impl;

import com.github.weixin.demo.dao.UserInfoDao;
import com.github.weixin.demo.domain.Register;
import com.github.weixin.demo.util.ResultSetToFormat;
import com.google.gson.Gson;
import me.chanjar.weixin.mp.bean.result.WxMpUser;

import java.sql.*;
import java.util.List;

public class UserInfoDaoImpl implements UserInfoDao {
    @Override
    public WxMpUser getUserInfo(String openId) {
        Connection conn = null;
        String sql;

        String url = "jdbc:mysql://localhost:3306/weixin_db?"
            + "user=yanglong&password=Willyang4862!&useUnicode=true&characterEncoding=utf8";

        try {
            // 之所以要使用下面这条语句，是因为要使用MySQL的驱动，所以我们要把它驱动起来，
            // 可以通过Class.forName把它加载进去，也可以通过初始化来驱动起来，下面三种形式都可以
            Class.forName("com.mysql.jdbc.Driver");// 动态加载mysql驱动


            // 一个Connection代表一个数据库连接
            conn = DriverManager.getConnection(url);
            // Statement里面带有很多方法，比如executeUpdate可以实现插入，更新和删除等
            Statement stmt = conn.createStatement();
            StringBuilder sbSql = new StringBuilder();
            sbSql.append("select nickname,headImgUrl from wxmpuser where openId = \'").append(openId).append("\'");


            System.out.println(sbSql.toString());
            ResultSet rs = stmt.executeQuery(sbSql.toString());// executeQuery会返回结果的集合，否则返回空值
            ResultSetMetaData md = rs.getMetaData(); //获得结果集结构信息,元数据
            int columnCount = md.getColumnCount();   //获得列数

            if (columnCount > 0) {
                List<Object> objects = ResultSetToFormat.RsToJson(rs);
                String s = objects.get(0).toString();

                return new Gson().fromJson(s, WxMpUser.class);
            }



        } catch (Exception e) {
            System.out.println("MySQL操作错误");
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
