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
@RequestMapping("/post/by-block")
public class ByBlockController {
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
    public void get(HttpServletResponse response, HttpServletRequest request,
                    @RequestParam(name = "block", required = false) String block
        , @RequestParam(name = "duration", required = false) String duration
        , @RequestParam(name = "sort", required = false) String sort
        , @RequestParam(name = "type", required = false) String type
        , @RequestParam(name = "start", required = false) String start
        , @RequestParam(name = "limit", required = false) String limit) {

        String respString = HttpRequestUtil.sendGet(MainConfiguration.API_BASE_URL + "/post/by-block?block=" + block
            + "&duration=" + duration
            + "&sort=" + sort
            + "&type=" + type
            + "&start=" + start
            + "&limit=" + limit
        );
        ResponseUtils.renderJson(response, respString);

    }


}
