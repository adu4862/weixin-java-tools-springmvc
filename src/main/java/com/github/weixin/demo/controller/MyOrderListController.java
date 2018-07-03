package com.github.weixin.demo.controller;

import com.github.weixin.demo.dao.impl.OrderDaoImpl;
import com.github.weixin.demo.domain.PayDetails;
import com.github.weixin.demo.service.CoreService;
import com.github.weixin.demo.util.ResultSetToFormat;
import com.google.gson.Gson;
import me.chanjar.weixin.mp.api.WxMpConfigStorage;
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
@RequestMapping("/wechat/my_order_list")
public class MyOrderListController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private String title;
    private String descb;
    private String movInfoOuter;
    private String detail = "";
    private List<Map<String, Object>> list = new ArrayList<>();

    @Autowired
    protected WxMpConfigStorage configStorage;
    @Autowired
    protected WxMpService wxMpService;
    @Autowired
    protected CoreService coreService;
    private ArrayList<PayDetails> detailList;

    @ResponseBody
    @RequestMapping(method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
    public ModelAndView get(@RequestParam(name = "openId", required = false) String openId
                            ) {
        this.logger.info("\n课程列表：[{}]");



//        searchMyOrder(openId);
//        searchMyOrderList(openId);
        OrderDaoImpl orderDao = new OrderDaoImpl();
        String sql = " where openId = \'" + openId +"\' and payed = 1";
        List<Map<String, Object>> orderList = orderDao.getOrderList(sql);

        ModelAndView mav = new ModelAndView("my_order_list");
        //将参数返回给页面
        mav.addObject("list", orderList);

        mav.addObject("openId", openId);
        mav.addObject("urlWithOpenId", "http://www.fjshhdzx.cn/wechat/my?openId=" + openId);
        mav.addObject("urlWithOpenId1", "http://www.fjshhdzx.cn/wechat/course_list?openId=" + openId);
        return mav;
    }

    private void searchMyOrder(String openId) {
        list = new ArrayList<>();
        detailList = new ArrayList<>();
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
            sbSql.append("select out_trade_no,result_code,return_code from tb_pay_details where openid=\'").append(openId).append("\'");


            ResultSet rs = stmt.executeQuery(sbSql.toString());// executeQuery会返回结果的集合，否则返回空值
            System.out.println(sbSql.toString());
            ResultSetMetaData md = rs.getMetaData(); //获得结果集结构信息,元数据
            int columnCount = md.getColumnCount();   //获得列数
            if (columnCount > 0) {
                List<Object> objects = ResultSetToFormat.RsToJson(rs);
                for (Object o:
                    objects) {
                    String s = o.toString();

                    PayDetails details = new Gson().fromJson(s, PayDetails.class);
//                    detailList.add(details);
                    String out_trade_no = details.getOut_trade_no();
                    String course_id = out_trade_no.split("_")[0];
                    searchCourseList(course_id,details.getResult_code());


                }




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

    private void searchCourseList(String course_id, String result_code) {
//        list = new ArrayList<>();
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
            sbSql.append("select * from tb_course where course_id=").append(course_id);


            ResultSet rs = stmt.executeQuery(sbSql.toString());// executeQuery会返回结果的集合，否则返回空值
            System.out.println(sbSql.toString());
            ResultSetMetaData md = rs.getMetaData(); //获得结果集结构信息,元数据
            int columnCount = md.getColumnCount();   //获得列数

            while (rs.next()) {
                Map<String, Object> rowData = new HashMap<String, Object>();
                if ("SUCCESS".equals(result_code)) {
                    rowData.put("pay_status", "支付完成");
                } else {
                    rowData.put("pay_status", "支付失败");
                }
                rowData.put("pay_code", result_code);
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
