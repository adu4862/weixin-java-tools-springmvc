package com.github.weixin.demo.controller;

import me.chanjar.weixin.mp.api.WxMpService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/wechat/order_info")
public class OrderInfoController {
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
    public ModelAndView get(@RequestParam(name = "course_id", required = false) String course_id,
                            @RequestParam(name = "cost", required = false) String cost,
                            @RequestParam(name = "openId", required = false) String openId,
                            @RequestParam(name = "subject", required = false) String subject,
                            @RequestParam(name = "class_type", required = false) int class_type,

                            @RequestParam(name = "body", required = false) String body
                    ) {
        this.logger.info("\n：[{}]");
//        searchCourseList();
        String lang = "zh_CN"; //语言
//        WxMpUser user = wxMpService.getUserService().userInfo(openid,lang);

        ModelAndView mav = new ModelAndView("order_info2");
        //将参数返回给页面
        mav.addObject("course_id",  course_id);
        mav.addObject("cost",  cost);
        mav.addObject("openId",  openId);
        mav.addObject("body",  body);
        mav.addObject("class_type",  class_type);
        if (StringUtils.isEmpty(subject)) {
            subject = body.split("|")[0];
        }
        mav.addObject("subject",  subject);
        return mav;
    }


}
