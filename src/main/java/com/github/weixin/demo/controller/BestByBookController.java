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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("/post/review/best-by-book")
public class BestByBookController {
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
    public void get(HttpServletResponse response, HttpServletRequest request,@RequestParam(name = "book", required = false) String book) {

        String respString = HttpRequestUtil.sendGet(MainConfiguration.API_BASE_URL+"/post/review/best-by-book?book="+book);
        ResponseUtils.renderJson(response,respString);

    }



}
