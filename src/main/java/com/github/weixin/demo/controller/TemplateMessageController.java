package com.github.weixin.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.github.weixin.demo.dao.impl.CourseDaoImpl;
import com.github.weixin.demo.dao.impl.OrderDaoImpl;
import com.github.weixin.demo.domain.ResponseEntity;
import com.github.weixin.demo.util.ResponseUtils;
import com.google.gson.Gson;
import org.apache.http.util.TextUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.template.WxMpTemplateData;
import me.chanjar.weixin.mp.bean.template.WxMpTemplateMessage;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * 模板消息Controller
 * <p>
 * Created by FirenzesEagle on 2016/7/11 0011.
 * Email:liumingbo2008@gmail.com
 */
@Controller
@RequestMapping(value = "templateMessage")
public class TemplateMessageController extends GenericController {

    // 模板消息字体颜色
    private static final String TEMPLATE_FRONT_COLOR = "#32CD32";
    @Autowired
    protected WxMpConfigStorage configStorage;
    @Autowired
    protected WxMpService wxMpService;
    private String orderId;

    @RequestMapping(value = "notifyOrderPaySuccessTemplate")
    public void notifyOrderPaySuccessTemplate(HttpServletResponse response,
                                                      HttpServletRequest request) {
        WxMpTemplateMessage orderPaySuccessTemplate = WxMpTemplateMessage.builder().build();
        if (!TextUtils.isEmpty(orderId)) {
            if (orderId.equals(request.getParameter("orderId"))) {
                ResponseEntity responseEntity = new ResponseEntity();
                responseEntity.setMsg("该订单已处理");
                rend(response, true, responseEntity);
                return;
            }
        }

        orderId = request.getParameter("orderId");
        //更改订单信息
        boolean b = new OrderDaoImpl().updateOrder(orderId, "set payed =1 " );
        String course_id = orderId.split("_")[0];
        //更改课程已支付报名数量
        CourseDaoImpl courseDao = new CourseDaoImpl();
        List<Map<String, Object>> courseList = courseDao.getCourseList("where course_id = " + course_id);
        if (courseList!=null) {
            if (courseList.size()>0) {
                int pay_number = (int) courseList.get(0).get("pay_number");
                pay_number++;
                boolean b1 = courseDao.updateCourse(course_id, "set pay_number = " + pay_number);
            }
        }

        orderPaySuccessTemplate.setToUser(request.getParameter("openId"));
        orderPaySuccessTemplate.setTemplateId("g5vMwAeslQxt9by9F9V5fjyuvuJYRtTVph-gKwI2H9Y");
        orderPaySuccessTemplate.setUrl(request.getParameter("url"));
        WxMpTemplateData firstData = new WxMpTemplateData("first", "你好，你已成功购买课程", TEMPLATE_FRONT_COLOR);
        WxMpTemplateData orderMoneySumData = new WxMpTemplateData("keyword1", "微信支付"+request.getParameter("orderMoneySum")+"元", TEMPLATE_FRONT_COLOR);
        WxMpTemplateData orderProductNameData = new WxMpTemplateData("keyword2", request.getParameter("orderProductName"), TEMPLATE_FRONT_COLOR);
        WxMpTemplateData orderProductIdData = new WxMpTemplateData("keyword3", orderId, TEMPLATE_FRONT_COLOR);
        WxMpTemplateData remarkData = new WxMpTemplateData("remark", "", TEMPLATE_FRONT_COLOR);
        orderPaySuccessTemplate.addData(firstData)
            .addData(orderMoneySumData)
            .addData(orderProductNameData)
            .addData(orderProductIdData)
            .addData(remarkData);
        try {
            wxMpService.getTemplateMsgService()
                .sendTemplateMsg(orderPaySuccessTemplate);
        } catch (WxErrorException e) {
            logger.error(e.getMessage().toString());
        }

//        ModelAndView modelAndView = new ModelAndView("redirect://wechat/my_order_list?openId="+request.getParameter("openId"));
//
//        return modelAndView;
        ResponseEntity responseEntity = new ResponseEntity();
        rend(response, true, responseEntity);

    }

    private void rend(HttpServletResponse response, boolean b, ResponseEntity responseEntity) {
        if (b) {
            responseEntity.setSuccess(true);
            ResponseUtils.renderJson(response, new Gson().toJson(responseEntity));
        } else {
            responseEntity.setMsg("Some errors occured.");
            ResponseUtils.renderJson(response, new Gson().toJson(responseEntity));
        }
    }

    @RequestMapping(value = "notifyOrderStatusUpdateTemplate")
    public void notifyOrderStatusUpdateTemplate(HttpServletResponse response,
                                                HttpServletRequest request) {
        WxMpTemplateMessage orderPaySuccessTemplate = WxMpTemplateMessage.builder().build();
        orderPaySuccessTemplate.setToUser(request.getParameter("openid"));
        orderPaySuccessTemplate.setTemplateId("g5vMwAeslQxt9by9F9V5fjyuvuJYRtTVph-gKwI2H9Y");
        orderPaySuccessTemplate.setUrl(request.getParameter("url"));
        WxMpTemplateData firstData = new WxMpTemplateData("first", "你好，你已成功购买课程", TEMPLATE_FRONT_COLOR);
        WxMpTemplateData orderMoneySumData = new WxMpTemplateData("keyword1", request.getParameter("OrderSn"), TEMPLATE_FRONT_COLOR);
        WxMpTemplateData orderProductNameData = new WxMpTemplateData("keyword2", request.getParameter("OrderStatus"), TEMPLATE_FRONT_COLOR);
        WxMpTemplateData remarkData = new WxMpTemplateData("remark", request.getParameter("remark"), TEMPLATE_FRONT_COLOR);
        orderPaySuccessTemplate.addData(firstData)
            .addData(orderMoneySumData)
            .addData(orderProductNameData)
            .addData(remarkData);
        try {
            wxMpService.getTemplateMsgService()
                .sendTemplateMsg(orderPaySuccessTemplate);
        } catch (WxErrorException e) {
            logger.error(e.getMessage().toString());
        }
    }

}
