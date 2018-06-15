package com.github.weixin.demo.controller;

import me.chanjar.weixin.mp.api.WxMpService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/wechat/create_order")
public class CreateOrderController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private String title;
    private String descb;
    private String movInfoOuter;
    private String detail = "";
    private List<Map<String, Object>> list = new ArrayList<>();

    @Autowired
    private WxMpService wxService;
    private String orderId;

    //
    @ResponseBody
    @RequestMapping(method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
//    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView get(@RequestParam(name = "course_id", required = false) String course_id,
                            @RequestParam(name = "cost", required = false) String cost,
                            @RequestParam(name = "name", required = false) String name,
                            @RequestParam(name = "sex", required = false) String sex,
                            @RequestParam(name = "school", required = false) String school,
                            @RequestParam(name = "phone", required = false) String phone,
                            @RequestParam(name = "grade", required = false) String grade,
                            @RequestParam(name = "father_name", required = false) String father_name,
                            @RequestParam(name = "father_phone", required = false) String father_phone,
                            @RequestParam(name = "mother_name", required = false) String mother_name,
                            @RequestParam(name = "mother_phone", required = false) String mother_phone,
                            @RequestParam(name = "hobby", required = false) String hobby,
                            @RequestParam(name = "openId", required = false) String openId
    ) {
        this.logger.info("\n：[{}]");
        String lang = "zh_CN"; //语言
//        WxMpUser user = wxMpService.getUserService().userInfo(openid,lang);

        //存数据库并生成订单id
        writeToDb(course_id, cost, name, sex, school, phone, grade, father_name, father_phone, mother_name, mother_phone, hobby, openId);


        //重定向到支付
        //传给微信后台获取预支付id
        int i = Integer.parseInt(cost) * 100;
        ModelAndView mav = new ModelAndView("redirect:/getJSSDKPayInfo?openId=" + openId+"&out_trade_no="+orderId+"&body=测试一毛钱"+"&total_fee="+i);

//        mav.addObject("pay_order", list);
        return mav;
    }

    private void writeToDb(String course_id, String cost, String name, String sex, String school, String phone, String grade,
                           String father_name, String father_phone, String mother_name, String mother_phone, String hobby, String openId) {
        Connection conn = null;
        String sql;
        // MySQL的JDBC URL编写方式：jdbc:mysql://主机名称：连接端口/数据库的名称?参数=值
        // 避免中文乱码要指定useUnicode和characterEncoding
        // 执行数据库操作之前要在数据库管理系统上创建一个数据库，名字自己定，
        // 下面语句之前就要先创建javademo数据库
        String url = "jdbc:mysql://localhost:3306/weixin_db?"
            + "user=yanglong&password=Willyang4862!&useUnicode=true&characterEncoding=utf8";
        try {
            // 之所以要使用下面这条语句，是因为要使用MySQL的驱动，所以我们要把它驱动起来，
            // 可以通过Class.forName把它加载进去，也可以通过初始化来驱动起来，下面三种形式都可以
            Class.forName("com.mysql.jdbc.Driver");// 动态加载mysql驱动


            System.out.println("成功加载MySQL驱动程序");
            // 一个Connection代表一个数据库连接
            conn = DriverManager.getConnection(url);
            // Statement里面带有很多方法，比如executeUpdate可以实现插入，更新和删除等
            Statement stmt = conn.createStatement();

            sql = "insert into tb_movie_detail2(course_id,cost,name,sex,school,phone,grade,father_name,father_phone,mother_name,mother_phone,hobby,openId)" +
                " values('" + course_id + "','" + cost + "','" + name + "','" + school + "','" + phone + "','" + grade + "','" + father_name + "','" + father_phone + "','" + mother_name
                + "','" + mother_phone + "','" + hobby + "','" + openId
                + "')";
            int result = stmt.executeUpdate(sql);
            if (result > 0) {
                orderId = "od" + System.currentTimeMillis();


            }

        } catch (SQLException e) {
            System.out.println("MySQL操作错误");
            e.printStackTrace();
        } catch (Exception e) {
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
