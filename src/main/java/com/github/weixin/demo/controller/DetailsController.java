package com.github.weixin.demo.controller;

import me.chanjar.weixin.mp.api.WxMpService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/wechat/details")
public class DetailsController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private String title;
    private String descb;
    private String movInfoOuter;
    private String detail = "";
    private List<Map<String, Object>> list = new ArrayList<>();

    @Autowired
    private WxMpService wxService;
    private String cost;
    private Object subject;
    private Object class_name;
    private Object time;
    private Object classroom;
    private Object teacher;
    private Object information;
    private int number;
    private int pay_number;
    private int class_type;

    @ResponseBody
    @RequestMapping(method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
//    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView get(@RequestParam(name = "course_id", required = false) String course_id,
                            @RequestParam(name = "openId", required = false) String openId) {
        this.logger.info("\n：[{course_id}]", course_id);
//        searchCourseList();
        String lang = "zh_CN"; //语言
//        WxMpUser user = wxMpService.getUserService().userInfo(openid,lang);
        searchCourse(course_id);
        if (list.size() > 0) {
            Map<String, Object> map = list.get(0);
            cost = (String) map.get("cost");
            subject = map.get("subject");
            class_name = map.get("class_name");
            time = map.get("time");
            classroom = map.get("classroom");
            teacher = map.get("teacher");
            information = map.get("information");
            number = (int) map.get("number");
            pay_number = (int) map.get("pay_number");
            class_type = (int) map.get("class_type");
//            map.get("cost")
        }
        ModelAndView mav = new ModelAndView("details");
        //将参数返回给页面

        mav.addObject("subject", subject);
        mav.addObject("class_name", class_name);
        mav.addObject("time", time);
        mav.addObject("classroom", classroom);
        mav.addObject("teacher", teacher);
        mav.addObject("cost", cost);
        mav.addObject("information", information);
        mav.addObject("number", number);
        mav.addObject("pay_number", pay_number);
        mav.addObject("class_type", class_type);
        boolean isFull = false;
        if (number > pay_number) {
            isFull = false;
        } else {
            isFull = true;
        }

        mav.addObject("course_id", "http://www.fjshhdzx.cn/wechat/order_info?course_id="
            + course_id + "&openId=" + openId + "&body=" + subject.toString() + "|" + class_name.toString() + "|" + "|" + time.toString()
            + "&cost=" + cost + "&class_type=" + class_type

            + "&subject=" + subject);

        mav.addObject("isFull", isFull);
        return mav;
    }

    private void searchCourse(String course_id) {
        list = new ArrayList<>();
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
            sbSql.append("select * from tb_course where course_id = " + course_id);


            ResultSet rs = stmt.executeQuery("select * from tb_course where course_id = " + course_id);// executeQuery会返回结果的集合，否则返回空值
            System.out.println(sbSql.toString());
            ResultSetMetaData md = rs.getMetaData(); //获得结果集结构信息,元数据
            int columnCount = md.getColumnCount();   //获得列数

            while (rs.next()) {
                Map<String, Object> rowData = new HashMap<String, Object>();
                for (int i = 1; i <= columnCount; i++) {
                    String columnName = md.getColumnName(i);
                    Object object = rs.getObject(i);
                    rowData.put(columnName, object);

                }
                list.add(rowData);

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

    }


}
