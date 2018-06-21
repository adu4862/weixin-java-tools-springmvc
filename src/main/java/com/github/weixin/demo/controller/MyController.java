package com.github.weixin.demo.controller;

import com.github.weixin.demo.dao.impl.UserInfoDaoImpl;
import com.github.weixin.demo.service.CoreService;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/wechat/my")
public class MyController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private String title;
    private String descb;
    private String movInfoOuter;
    private String detail ="";
    private List<Map<String, Object>> list = new ArrayList<>();

    @Autowired
    private WxMpService wxService;
    @Autowired
    protected WxMpConfigStorage configStorage;
    @Autowired
    protected WxMpService wxMpService;
    @Autowired
    protected CoreService coreService;

    @ResponseBody
    @RequestMapping(method = RequestMethod.GET,produces = "text/plain;charset=UTF-8")
//    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView get(@RequestParam(name = "openId", required = false) String openId) throws WxErrorException {
        this.logger.info("\n：[{}]");
//        searchCourseList();
        String lang = "zh_CN"; //语言
//        WxMpUser user = wxMpService.getUserService().userInfo(openId,lang);

        WxMpUser user = new UserInfoDaoImpl().getUserInfo(openId);

        ModelAndView mav = new ModelAndView("my");
        //将参数返回给页面
        mav.addObject("headImgUrl", user.getHeadImgUrl());
        mav.addObject("nickname", user.getNickname());
        mav.addObject("orderUrl", "http://www.fjshhdzx.cn/wechat/my_order_list?openId=" + openId);

        return mav;
    }


}
