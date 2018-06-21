package com.github.weixin.demo.controller;

import com.github.binarywang.wxpay.config.WxPayConfig;
import com.github.binarywang.wxpay.service.WxPayService;
import com.github.binarywang.wxpay.util.SignUtils;
import com.github.weixin.demo.dao.impl.PayDetailsDaoImpl;
import com.github.weixin.demo.util.XMLUtil;
import me.chanjar.weixin.mp.api.WxMpService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/weixin_pay_notify")
public class PayNotifyController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private String title;
    private String descb;
    private String movInfoOuter;
    private String detail = "";
    private List<Map<String, Object>> list = new ArrayList<>();

    @Autowired
    private WxPayConfig payConfig;
    @Autowired
    private WxPayService payService;

    @Autowired
    private WxMpService wxService;


    @ResponseBody
    @RequestMapping(method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
//    @RequestMapping(method = RequestMethod.GET)
    public String get(HttpServletRequest request,
                      HttpServletResponse response) {
        try {
            synchronized (this) {
                Map<String, String> kvm = XMLUtil.parseRequestXmlToMap(request);
                boolean exist = new PayDetailsDaoImpl().hasExitOrder(kvm.get("transaction_id"));
                if (!exist) {
                    writeTODb(kvm);
                }
                if (SignUtils.checkSign(kvm, null, this.payConfig.getMchKey())) {
                    if (kvm.get("result_code").equals("SUCCESS")) {
                        //TODO(user) 微信服务器通知此回调接口支付成功后，通知给业务系统做处理
                        logger.info("out_trade_no: " + kvm.get("out_trade_no") + " pay SUCCESS!");
                        response.getWriter().write("<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[ok]]></return_msg></xml>");
                        return "redirect:/wechat/my_order_list";


                    } else {
                        this.logger.error("out_trade_no: "
                            + kvm.get("out_trade_no") + " result_code is FAIL");
                        response.getWriter().write(
                            "<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[result_code is FAIL]]></return_msg></xml>");
                    }
                } else {
                    response.getWriter().write(
                        "<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[check signature FAIL]]></return_msg></xml>");
                    this.logger.error("out_trade_no: " + kvm.get("out_trade_no")
                        + " check signature FAIL");
                }


            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/wechat/my_order_list";
    }

    private void writeTODb(Map<String, String> kvm) {

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

            sql = "insert into tb_pay_details(is_subscribe,fee_type,nonce_str,out_trade_no,transaction_id,result_code,total_fee,mch_id,time_end,openid,return_code,cash_fee)" +
                " values('" + kvm.get("is_subscribe") + "','" + kvm.get("fee_type") + "','" + kvm.get("nonce_str") + "','" + kvm.get("out_trade_no")
                + "','" + kvm.get("transaction_id") + "','" + kvm.get("result_code") + "','" + kvm.get("total_fee")
                + "','" + kvm.get("mch_id") + "','" + kvm.get("time_end") + "','" + kvm.get("openid")
                + "','" + kvm.get("return_code") + "','" + kvm.get("cash_fee")
                + "')";
            System.out.println(sql);
            int result = stmt.executeUpdate(sql);


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
