package com.github.weixin.demo.controller;

import com.github.weixin.demo.service.CoreService;
import com.github.weixin.demo.util.ReturnModel;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpOAuth2AccessToken;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.util.TextUtils;
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
@RequestMapping("/wechat/course_list")
public class CourseSoResultController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private String title;
    private String descb;
    private String movInfoOuter;
    private String detail = "";
    private List<Map<String, Object>> list = new ArrayList<>();
//    private String openId;

    @Autowired
    protected WxMpConfigStorage configStorage;
    @Autowired
    protected WxMpService wxMpService;
    @Autowired
    protected CoreService coreService;
    private ModelAndView mav;

    @ResponseBody
    @RequestMapping(method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
    public ModelAndView get(@RequestParam(name = "openId", required = false) String openId,
                            @RequestParam(name = "class_type", required = false) String class_type,
                            @RequestParam(name = "code", required = false) String code) {
        this.logger.info("\n课程列表：[{}]");
        mav = new ModelAndView("so_course_list");
        if (!TextUtils.isEmpty(openId)) {
//            this.openId =openId;
            searchCourseList(openId,class_type);
            mav.addObject("list", list);

            mav.addObject("openId", openId);
            mav.addObject("urlWithOpenId", "http://www.fjshhdzx.cn/wechat/my?openId=" + openId);
            mav.addObject("homeUrl", "http://www.fjshhdzx.cn/wechat/course_list?openId=" + openId);
            mav.addObject("myUrl", "http://www.fjshhdzx.cn/wechat/my?openId=" + openId);
            return mav;
        }

        if (!TextUtils.isEmpty(code)) {
            ReturnModel returnModel = new ReturnModel();
            WxMpOAuth2AccessToken accessToken;
            WxMpUser wxMpUser;
            try {
                accessToken = this.wxMpService.oauth2getAccessToken(code);
                wxMpUser = this.wxMpService.getUserService()
                    .userInfo(accessToken.getOpenId(), "zh_CN");
                returnModel.setResult(true);
                returnModel.setDatum(wxMpUser);
                //保存wxMpUser到数据库
                openId = wxMpUser.getOpenId();
                writeToDb(wxMpUser);
                //重定向到课程列表
                searchCourseList(openId, class_type);


                //将参数返回给页面


            } catch (WxErrorException e) {
                returnModel.setResult(false);
                returnModel.setReason(e.getError().toString());
//                renderString(response, returnModel);
                this.logger.error(e.getError().toString());
            }
            mav.addObject("list", list);

            mav.addObject("openId", openId);
            mav.addObject("urlWithOpenId", "http://www.fjshhdzx.cn/wechat/my?openId=" + openId);
            return mav;
        }


        return null;
    }

    private void writeToDb(WxMpUser bean) {
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

            sql = "insert into wxmpuser(openId,nickname,headImgUrl,unionId,sex,city) values" +
                "('" + bean.getOpenId() + "','" + bean.getNickname() + "','" + bean.getHeadImgUrl() + "','"
                + bean.getUnionId() + "','" + bean.getSex() + "','" + bean.getCity() + "')";
            int result = stmt.executeUpdate(sql);

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

    private void searchCourseList(String openId, String class_type) {
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
            sbSql.append("select * from tb_course ");
            if (StringUtils.isNotEmpty(class_type)) {
                sbSql .append(" where class_type = "+class_type);
            }



            ResultSet rs = stmt.executeQuery(sbSql.toString());// executeQuery会返回结果的集合，否则返回空值
            System.out.println(sbSql.toString());
            ResultSetMetaData md = rs.getMetaData(); //获得结果集结构信息,元数据
            int columnCount = md.getColumnCount();   //获得列数

            while (rs.next()) {
                Map<String, Object> rowData = new HashMap<String, Object>();
                for (int i = 1; i <= columnCount; i++) {
                    String columnName = md.getColumnName(i);
                    Object object = rs.getObject(i);
                    if ("course_id".equals(columnName)) {
                        String s = object.toString();
                        rowData.put(columnName, "http://www.fjshhdzx.cn/wechat/details?course_id=" + s + "&openId=" + openId);
                    } else {

                        rowData.put(columnName, object);
                    }
                }
                int number = (int) rowData.get("number");
                int pay_number = (int) rowData.get("pay_number");
                int remain_number = number - pay_number;
                rowData.put("remain_number", remain_number);
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
