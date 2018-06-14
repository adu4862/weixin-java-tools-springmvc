package com.github.weixin.demo.controller;

import me.chanjar.weixin.mp.api.WxMpService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/wechat/register")
public class RegisterController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private String title;
    private String descb;
    private String movInfoOuter;
    private String detail ="";
    private List<Map<String, Object>> list = new ArrayList<>();

    @Autowired
    private WxMpService wxService;

    @ResponseBody
    @RequestMapping(method = RequestMethod.GET,produces = "text/plain;charset=UTF-8")
//    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView get() {
        this.logger.info("\n：[{}]");
//        searchCourseList();
        String lang = "zh_CN"; //语言
//        WxMpUser user = wxMpService.getUserService().userInfo(openid,lang);

        ModelAndView mav = new ModelAndView("register");
        //将参数返回给页面
        mav.addObject("register", list);
        return mav;
    }


}
