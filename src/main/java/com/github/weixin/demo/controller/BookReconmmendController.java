package com.github.weixin.demo.controller;

import com.github.weixin.demo.config.MainConfiguration;
import com.github.weixin.demo.service.CoreService;
import com.github.weixin.demo.util.HttpRequestUtil;
import com.github.weixin.demo.util.ResponseUtils;
import me.chanjar.weixin.mp.api.WxMpConfigStorage;
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

@RestController
@RequestMapping("/book-list/**/recommend")
public class BookReconmmendController {
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
        String s = requestURL.toString().split("/book-list/")[1];
        s = s.split("/recommend")[0];
        String respString = HttpRequestUtil.sendGet(MainConfiguration.API_BASE_URL + "/book-list/" + s + "/recommend?limit=3");
        ResponseUtils.renderJson(response, respString);

    }


}
