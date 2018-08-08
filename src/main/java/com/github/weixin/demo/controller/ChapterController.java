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
import java.net.URLEncoder;

@RestController
@RequestMapping("/chapter/**")
public class ChapterController {
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
    public void get(HttpServletResponse response, HttpServletRequest request
            ,@RequestParam(name = "method", required = false) String method
        ,@RequestParam(name = "bookId", required = false) String bookId
        ,@RequestParam(name = "chapterFile", required = false) String chapterFile
        ) {

//        request.requestD
        StringBuffer requestURL = request.getRequestURL();

        String url = requestURL.toString().split("/chapter/")[1] +"?method="+method +"&bookId="+bookId +"&chapterFile="+chapterFile;
        String encode = URLEncoder.encode(url);
        String respString = HttpRequestUtil.sendGet("http://chapter2.zhuishushenqi.com/chapter/" +encode
           );
        ResponseUtils.renderJson(response, respString);

    }


}
