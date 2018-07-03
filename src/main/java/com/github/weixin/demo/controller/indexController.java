package com.github.weixin.demo.controller;

import com.github.weixin.demo.service.CoreService;
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

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/wechat/index")
public class indexController {
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
    public ModelAndView get(
                            @RequestParam(name = "code", required = false) String code) {
        this.logger.info("\n课程列表：[{}]");
        mav = new ModelAndView("index");

        if (!TextUtils.isEmpty(code)) {
            ReturnModel returnModel = new ReturnModel();
            WxMpOAuth2AccessToken accessToken;
            WxMpUser wxMpUser;
            String openId = null;
            try {
                accessToken = this.wxMpService.oauth2getAccessToken(code);
                wxMpUser = this.wxMpService.getUserService()
                    .userInfo(accessToken.getOpenId(), "zh_CN");
                returnModel.setResult(true);
                returnModel.setDatum(wxMpUser);
                openId = wxMpUser.getOpenId();

                //将参数返回给页面


            } catch (WxErrorException e) {
                returnModel.setResult(false);
                returnModel.setReason(e.getError().toString());
//                renderString(response, returnModel);
                this.logger.error(e.getError().toString());
            }

            mav.addObject("openId", openId);
            mav.addObject("urlWithOpenId1",
                "http://www.fjshhdzx.cn/wechat/course_list?openId=" + openId+"&class_type=1");
            mav.addObject("urlWithOpenId2",
                "http://www.fjshhdzx.cn/wechat/course_list?openId=" + openId+"&class_type=2");
            mav.addObject("urlWithOpenId3",
                "http://www.fjshhdzx.cn/wechat/course_list?openId=" + openId+"&class_type=3");
            mav.addObject("urlWithOpenId4",
                "http://www.fjshhdzx.cn/wechat/course_list?openId=" + openId+"&class_type=4");
            return mav;
        }


        return mav;
    }



}
