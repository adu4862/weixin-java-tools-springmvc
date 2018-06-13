package com.github.weixin.demo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.io.UnsupportedEncodingException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/wechat/course_list")
public class CourseSoResultController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private String title;
    private String descb;
    private String movInfoOuter;
    private String detail ="";
    private List<Map<String, Object>> list = new ArrayList<>();

    //

    @ResponseBody
//    @GetMapping(produces = "text/plain;charset=UTF-8")
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView get() throws UnsupportedEncodingException {
        this.logger.info("\n课程列表：[{}]");
        searchCourseList();

        ModelAndView mav = new ModelAndView("so_course_list");
        //将参数返回给页面
        mav.addObject("list", list);
        return mav;
    }
    private void searchCourseList() {
        list = new ArrayList<>();
        Connection conn = null;
        String sql;

        String url = "jdbc:mysql://localhost:3306/Movie_db?"
                + "user=yanglong&password=123456&useUnicode=true&characterEncoding=gbk";

        try {
            // 之所以要使用下面这条语句，是因为要使用MySQL的驱动，所以我们要把它驱动起来，
            // 可以通过Class.forName把它加载进去，也可以通过初始化来驱动起来，下面三种形式都可以
            Class.forName("com.mysql.jdbc.Driver");// 动态加载mysql驱动


            // 一个Connection代表一个数据库连接
            conn = DriverManager.getConnection(url);
            // Statement里面带有很多方法，比如executeUpdate可以实现插入，更新和删除等
            Statement stmt = conn.createStatement();
            StringBuilder sbSql = new StringBuilder();
            sbSql.append("select * from tb_course ");


            ResultSet rs = stmt.executeQuery(sbSql.toString());// executeQuery会返回结果的集合，否则返回空值
            System.out.println(sbSql.toString());
            ResultSetMetaData md = rs.getMetaData(); //获得结果集结构信息,元数据
            int columnCount = md.getColumnCount();   //获得列数

            while (rs.next()) {
                Map<String,Object> rowData = new HashMap<String,Object>();
                for (int i = 1; i <= columnCount; i++) {
                    String columnName = md.getColumnName(i);
                    Object object = rs.getObject(i);
                    if ("course_id".equals(columnName)) {
                        String s = object.toString();
                        rowData.put(columnName, "http://www.changs1992.cn/wechat/web?code=" + s);
                    }
//                    else if ("status".equals(columnName)) {
//                        String s = object.toString();
//                        rowData.put(columnName, "http://www.changs1992.cn/wechat/web?code=" + s);
//                    }
                    else {

                        rowData.put(columnName, object);
                    }
                }
                list.add(rowData);

            }

        } catch (Exception e) {
            System.out.println("MySQL操作错误");
            e.printStackTrace();
        }  finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    public static void dbSearch(String movieName, StringBuffer sbSql, int length) {
        for (int i = 0; i < length; i++) {
            char c = movieName.charAt(i);
            if (i != 0) {

                sbSql.append("and title like '%" + c + "%'");
            } else {

                sbSql.append("title like '%" + c + "%'");
            }
        }
    }

}
