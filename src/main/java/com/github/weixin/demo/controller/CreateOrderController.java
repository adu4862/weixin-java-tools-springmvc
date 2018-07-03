package com.github.weixin.demo.controller;

import com.github.binarywang.wxpay.bean.request.WxPayUnifiedOrderRequest;
import com.github.binarywang.wxpay.config.WxPayConfig;
import com.github.binarywang.wxpay.exception.WxPayException;
import com.github.binarywang.wxpay.service.WxPayService;
import com.github.weixin.demo.domain.Register;
import com.github.weixin.demo.util.MD5Util;
import com.github.weixin.demo.util.ResultSetToFormat;
import com.github.weixin.demo.util.ReturnModel;
import com.google.gson.Gson;
import me.chanjar.weixin.mp.api.WxMpService;
import org.apache.http.util.TextUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@RestController
@RequestMapping("/weixin_pay/create_order")
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
    private String cost;

    @Autowired
    private WxPayConfig payConfig;
    @Autowired
    private WxPayService payService;

//    @Autowired
//    private WxMpService wxService;

    //
    @ResponseBody
    @RequestMapping(method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
//    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView get(HttpServletResponse response, HttpServletRequest request,
                            @RequestParam(name = "course_id", required = false) String course_id,
                            @RequestParam(name = "cost", required = false) String cost,
                            @RequestParam(name = "member[realname]", required = false) String name,
                            @RequestParam(name = "form_item_val_0", required = false) String sex,
                            @RequestParam(name = "form_item_val_1", required = false) String school,
                            @RequestParam(name = "member[mobile]", required = false) String phone,
                            @RequestParam(name = "form_item_val_2", required = false) String grade,
                            @RequestParam(name = "form_item_val_3", required = false) String father_name,
                            @RequestParam(name = "form_item_val_4", required = false) String father_phone,
                            @RequestParam(name = "form_item_val_5", required = false) String mother_name,
                            @RequestParam(name = "form_item_val_6", required = false) String mother_phone,
                            @RequestParam(name = "form_item_val_7", required = false) String hobby,
                            @RequestParam(name = "openId", required = false) String openId,
                            @RequestParam(name = "form_item_val_8", required = false) String address,
                            @RequestParam(name = "form_item_val_9", required = false) String age,
                            @RequestParam(name = "subject", required = false) String subject,
                            @RequestParam(name = "msg", required = false) String msg,
                            @RequestParam(name = "class_type", required = false) int class_type,
                            @RequestParam(name = "body", required = false) String body
    ) {
        ModelAndView modelAndView = new ModelAndView("wxPay");
        ReturnModel returnModel = new ReturnModel();
        String ip2 = MD5Util.getIp2(request);
        this.logger.info("\n：[{course_id},{cost},{name},{sex},{school}]", course_id, cost, name, sex, school, phone, grade);
        String lang = "zh_CN"; //语言
//        WxMpUser user = wxMpService.getUserService().userInfo(openid,lang);
//        course_id =
        String s = searchCourseList(course_id);

        //存数据库并生成订单id
        writeToDb(course_id, cost, name, sex, school, phone, grade, father_name, father_phone, mother_name, mother_phone, hobby, openId,address,subject,msg,age,class_type);


        //重定向到支付
        //传给微信后台获取预支付id

        Double aDouble = Double.valueOf(s);
        int i = (int) (aDouble * 100);
        //生成预支付订单
        WxPayUnifiedOrderRequest prepayInfo = WxPayUnifiedOrderRequest.newBuilder()
            .openid(openId)//公众号支付），此参数必传，此参数为微信用户在商户对应appid下的唯一标识
            .outTradeNo(orderId)//	商户系统内部订单号，要求32个字符内，只能是数字、大小写字母_-|* 且在同一个商户号下唯一
            .totalFee(i)//	订单总金额，单位为分，详见支付金额
            .body(body)//商品描述
            //2、交易类型trade_type
            //JSAPI--公众号支付、NATIVE--原生扫码支付、APP--app支付，统一下单接口trade_type的传参可参考这里
            //
            //MICROPAY--刷卡支付，刷卡支付有单独的支付接口，不调用统一下单接口
            .tradeType("JSAPI")
            .spbillCreateIp(ip2)//用户终端ip
            .notifyUrl("http://www.fjshhdzx.cn/weixin_pay_notify/")//异步接收微信支付结果通知的回调地址，通知url必须为外网可访问的url，不能携带参数。
            .build();
        String url = "";

        try {
            Map<String, String> payInfo = this.payService.getPayInfo(prepayInfo);
            returnModel.setResult(true);
            returnModel.setDatum(payInfo);
            renderString(response, returnModel);

            String timeStamp = payInfo.get("timeStamp");
            String sign = payInfo.get("paySign");
            String aPackage = payInfo.get("package");
            String nonceStr = payInfo.get("nonceStr");
            if (!TextUtils.isEmpty(aPackage)) {
                modelAndView.addObject("timeStamp", timeStamp);
                modelAndView.addObject("nonceStr", nonceStr);
                modelAndView.addObject("wxPackage", aPackage);
                modelAndView.addObject("signType", "MD5");
                modelAndView.addObject("paySign", sign);
                modelAndView.addObject("appid", payConfig.getAppId());
                modelAndView.addObject("money", s);
                modelAndView.addObject("openId", openId);
                modelAndView.addObject("body", body);
                modelAndView.addObject("orderId", orderId);
            }else {
                this.logger.info("订单号:" + orderId + "错误信息:" );
            }


        } catch (WxPayException e) {
            e.printStackTrace();
            returnModel.setResult(false);
            returnModel.setReason(e.getErrCodeDes());
            renderString(response, returnModel);
            this.logger.error(e.getErrCodeDes());
        }
        return modelAndView;

    }

    private String searchCourseList(String course_id) {
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
            sbSql.append("select cost from tb_course where course_id=" + course_id);


            ResultSet rs = stmt.executeQuery(sbSql.toString());// executeQuery会返回结果的集合，否则返回空值
            System.out.println(sbSql.toString());
            ResultSetMetaData md = rs.getMetaData(); //获得结果集结构信息,元数据
            int columnCount = md.getColumnCount();   //获得列数
            if (columnCount > 0) {
                List<Object> objects = ResultSetToFormat.RsToJson(rs);
                String s = objects.get(0).toString();

                Register register = new Gson().fromJson(s, Register.class);
                return register.getCost();
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
        return "";

    }


    private void writeToDb(String course_id, String cost, String name, String sex, String school, String phone, String grade,
                           String father_name, String father_phone, String mother_name, String mother_phone, String hobby, String openId, String address, String subject, String msg, String age, int class_type) {
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
            long order_time = System.currentTimeMillis();
            orderId =course_id+ "_" + order_time;

            sql = "insert into tb_register(course_id,cost,name,sex,school,phone,grade,father_name,father_phone,mother_name,mother_phone,hobby,openId,orderId,address,payed,subject,msg,age,order_time,class_type)" +
                " values('" + course_id + "','" + cost + "','" + name + "','" + sex + "','" + school + "','" + phone + "','" + grade + "','" + father_name + "','" + father_phone + "','" + mother_name
                + "','" + mother_phone + "','" + hobby + "','" + openId+ "','" + orderId+ "','" + address+ "','" + 0+ "','" + subject+ "','" + msg+ "','" + age+ "','" + order_time+ "','" + class_type
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


    /**
     * 客户端返回JSON字符串
     *
     * @param response
     * @param object
     * @return
     */
    protected String renderString(HttpServletResponse response, Object object) {
        return renderString(response, new Gson().toJson(object), "application/json");
    }

    /**
     * 客户端返回字符串
     *
     * @param response
     * @param string
     * @return
     */
    protected String renderString(HttpServletResponse response, String string, String type) {
        try {
            response.reset();
            response.setContentType(type);
            response.setCharacterEncoding("utf-8");
            //解决跨域问题
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.getWriter().print(string);
            return null;
        } catch (IOException e) {
            return null;
        }
    }


}
