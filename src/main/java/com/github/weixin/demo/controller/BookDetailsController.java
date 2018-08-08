package com.github.weixin.demo.controller;

import com.github.weixin.demo.config.MainConfiguration;
import com.github.weixin.demo.service.CoreService;
import com.github.weixin.demo.util.HttpRequestUtil;
import com.github.weixin.demo.util.ResponseUtils;
import com.github.weixin.demo.util.ReturnModel;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpOAuth2AccessToken;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.apache.http.util.TextUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("/book/**")
public class BookDetailsController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());


    @Autowired
    protected WxMpConfigStorage configStorage;
    @Autowired
    protected WxMpService wxMpService;
    @Autowired
    protected CoreService coreService;
    private ModelAndView mav;

    @ResponseBody
    @RequestMapping(method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
    public void get(HttpServletResponse response, HttpServletRequest request) {
//        this.logger.info("\n课程列表：[{}]");
        //获取书籍详情数据
        String contextPath = request.getContextPath();
//        request.requestD
        StringBuffer requestURL = request.getRequestURL();
        String bookId = requestURL.toString().split("/book/")[1];
        String respString = HttpRequestUtil.sendGet(MainConfiguration.API_BASE_URL+"/book/"+bookId);
        ResponseUtils.renderJson(response,respString);

    }



}
