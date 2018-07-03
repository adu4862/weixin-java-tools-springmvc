package com.github.weixin.demo.config;

import com.github.weixin.demo.domain.Register;
import com.github.weixin.demo.util.ResultSetToFormat;
import com.google.gson.Gson;
import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.common.bean.menu.WxMenu;
import me.chanjar.weixin.common.bean.menu.WxMenuButton;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpInMemoryConfigStorage;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.api.impl.WxMpServiceImpl;

import java.sql.*;
import java.util.List;

import static me.chanjar.weixin.common.api.WxConsts.MenuButtonType;

/**
 * Created by FirenzesEagle on 2016/6/1 0001.
 * Email:liumingbo2008@gmail.com
 */
public class MenuConfig {

    private static String cost;

    /**
     * 定义菜单结构
     *
     * @return
     */
    protected static WxMenu getMenu() {

        MainConfig mainConfig = new MainConfig("wxfd04fee4b7f7a651", "0027e67ffa9aee90b7b8004ce41369db", "shanghang", "yifYc0u9H77tw15SnC7sQBzs4RSfKwrDb1F24OLLKse");
        WxMpService wxMpService = mainConfig.wxMpService();

        WxMenu menu = new WxMenu();
        WxMenuButton button1 = new WxMenuButton();
        button1.setType(MenuButtonType.VIEW);
        button1.setName("微官网");
//		button1.setUrl(wxMpService.oauth2buildAuthorizationUrl("", "snsapi_base", ""));
        button1.setUrl("http://www.fjshhdzx.cn/weisite/cmsController.do?goPage&page=index");
        WxMenuButton button3 = new WxMenuButton();
        button3.setType(MenuButtonType.VIEW);
        button3.setName("在线报名");

//        WxMpService wxMpService = ...;
        String url = "http://www.fjshhdzx.cn/wechat/index";
//        wxMpService.oauth2buildAuthorizationUrl(url, WxConsts.OAuth2Scope.SNSAPI_USERINFO, null);
//		button1.setUrl(wxMpService.oauth2buildAuthorizationUrl("", "snsapi_base", ""));
        button3.setUrl(wxMpService.oauth2buildAuthorizationUrl(url, WxConsts.OAuth2Scope.SNSAPI_BASE, ""));
        System.out.println(wxMpService.oauth2buildAuthorizationUrl(url, WxConsts.OAuth2Scope.SNSAPI_BASE, ""));
//		WxMenuButton button2 = new WxMenuButton();
//		button2.setName("我是卖家");
//
//		WxMenuButton button21 = new WxMenuButton();
//		button21.setType(MenuButtonType.VIEW);
//		button21.setName("我的订单");
//		button21.setUrl(wxMpService.oauth2buildAuthorizationUrl("", "snsapi_base", ""));
//
//		WxMenuButton button22 = new WxMenuButton();
//		button22.setType(MenuButtonType.VIEW);
//		button22.setName("收入统计");
//		button22.setUrl(wxMpService.oauth2buildAuthorizationUrl("", "snsapi_base", ""));
//
//		WxMenuButton button23 = new WxMenuButton();
//		button23.setType(MenuButtonType.VIEW);
//		button23.setName("发布商品");
//		button23.setUrl(wxMpService.oauth2buildAuthorizationUrl("", "snsapi_base", ""));
//
//		WxMenuButton button24 = new WxMenuButton();
//		button24.setType(MenuButtonType.VIEW);
//		button24.setName("商品管理");
//		button24.setUrl(wxMpService.oauth2buildAuthorizationUrl("", "snsapi_base", ""));
//
//		button2.getSubButtons().add(button21);
//		button2.getSubButtons().add(button22);
//		button2.getSubButtons().add(button23);
//		button2.getSubButtons().add(button24);
//
//		WxMenuButton button3 = new WxMenuButton();
//		button3.setType(MenuButtonType.CLICK);
//		button3.setName("在线报名");
//		button3.setKey("help");

        menu.getButtons().add(button1);
//		menu.getButtons().add(button2);
        menu.getButtons().add(button3);

        return menu;
    }


    public static class MainConfig {

        private String appId;
        private String appSecret;
        private String token;
        private String aesKey;

        /**
         * 为了生成自定义菜单使用的构造函数
         *
         * @param appId
         * @param appSecret
         * @param token
         * @param aesKey
         */
        protected MainConfig(String appId, String appSecret, String token, String aesKey) {
            this.appId = appId;
            this.appSecret = appSecret;
            this.token = token;
            this.aesKey = aesKey;
        }

        public WxMpConfigStorage wxMpConfigStorage() {
            WxMpInMemoryConfigStorage configStorage = new WxMpInMemoryConfigStorage();
            configStorage.setAppId(this.appId);
            configStorage.setSecret(this.appSecret);
            configStorage.setToken(this.token);
            configStorage.setAesKey(this.aesKey);
            return configStorage;
        }

        public WxMpService wxMpService() {
            WxMpService wxMpService = new WxMpServiceImpl();
            wxMpService.setWxMpConfigStorage(wxMpConfigStorage());
            return wxMpService;
        }

    }

    /**
     * 运行此main函数即可生成公众号自定义菜单，注意要修改MainConfig构造方法行代码的对应四个参数为实际值
     *
     * @param args
     */
    public static void main(String[] args) {
        madeMune();
//        searchCourseList("1");

    }

    private static void madeMune() {
        MainConfig mainConfig = new MainConfig("wxfd04fee4b7f7a651",
            "0027e67ffa9aee90b7b8004ce41369db",
            "shanghang",
            "yifYc0u9H77tw15SnC7sQBzs4RSfKwrDb1F24OLLKse");
        WxMpService wxMpService = mainConfig.wxMpService();
        try {
            wxMpService.getMenuService().menuCreate(getMenu());
        } catch (WxErrorException e) {
            e.printStackTrace();
        }
    }

    private static void searchCourseList(String course_id) {
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
            sbSql.append("select cost from tb_course where course_id="+course_id);



            ResultSet rs = stmt.executeQuery(sbSql.toString());// executeQuery会返回结果的集合，否则返回空值
            System.out.println(sbSql.toString());
            ResultSetMetaData md = rs.getMetaData(); //获得结果集结构信息,元数据
            int columnCount = md.getColumnCount();   //获得列数
            if (columnCount > 0) {
                List<Object> objects = ResultSetToFormat.RsToJson(rs);
                String s = objects.get(0).toString();

                Register register = new Gson().fromJson(s, Register.class);
               System.out.print(register.getCost());
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
