package com.github.weixin.demo.controller;

import com.github.binarywang.wxpay.bean.request.WxPayUnifiedOrderRequest;
import com.github.binarywang.wxpay.config.WxPayConfig;
import com.github.binarywang.wxpay.exception.WxPayException;
import com.github.binarywang.wxpay.service.WxPayService;
import com.github.weixin.demo.util.MD5Util;
import com.github.weixin.demo.util.ReturnModel;
import com.google.gson.Gson;
import me.chanjar.weixin.mp.api.WxMpService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/wechat/getJSSDKPayInfo")
public class PyaInfoController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private String title;
    private String descb;
    private String movInfoOuter;
    private String detail ="";
    private List<Map<String, Object>> list = new ArrayList<>();
    @Autowired
    private WxPayConfig payConfig;
    @Autowired
    private WxPayService payService;

    @Autowired
    private WxMpService wxService;

    @ResponseBody
    @RequestMapping(method = RequestMethod.GET,produces = "text/plain;charset=UTF-8")
//    @RequestMapping(method = RequestMethod.GET)
    public void get(HttpServletResponse response,
                            HttpServletRequest request,
                    @RequestParam(name = "openId", required = false) String openId,
                    @RequestParam(name = "out_trade_no", required = false) String out_trade_no,
                    @RequestParam(name = "total_fee", required = false) String total_fee,
                    @RequestParam(name = "body", required = false) String body
                    ) {
        String ip2 = MD5Util.getIp2(request);
        ReturnModel returnModel = new ReturnModel();
//        String out_trade_no = request.getParameter("out_trade_no");
//        String total_fee = request.getParameter("total_fee");
//        String body = request.getParameter("body");

//        WxPayUnifiedOrderRequest prepayInfo = WxPayUnifiedOrderRequest.newBuilder()
//            .openid(openId)//公众号支付），此参数必传，此参数为微信用户在商户对应appid下的唯一标识
//            .outTradeNo(out_trade_no)//	商户系统内部订单号，要求32个字符内，只能是数字、大小写字母_-|* 且在同一个商户号下唯一
//            .totalFee(Integer.parseInt(total_fee))//	订单总金额，单位为分，详见支付金额
//            .body(body)//商品描述
//            //2、交易类型trade_type
//            //JSAPI--公众号支付、NATIVE--原生扫码支付、APP--app支付，统一下单接口trade_type的传参可参考这里
//            //
//            //MICROPAY--刷卡支付，刷卡支付有单独的支付接口，不调用统一下单接口
//            .tradeType("JSAPI")
//            .spbillCreateIp(ip2)//用户终端ip
//            .notifyUrl("http://www.fjshhdzx.cn/weixin_pay/")//异步接收微信支付结果通知的回调地址，通知url必须为外网可访问的url，不能携带参数。
//            .build();
//
//        try {
//            Map<String, String> payInfo = this.payService.getPayInfo(prepayInfo);
//            returnModel.setResult(true);
//            returnModel.setDatum(payInfo);
//            renderString(response, returnModel);
//        } catch (WxPayException e) {
//            returnModel.setResult(false);
//            returnModel.setReason(e.getErrCodeDes());
//            renderString(response, returnModel);
//            this.logger.error(e.getErrCodeDes());
//        }
    }


    /**
     * 客户端返回JSON字符串
     *
     * @param response
     * @param object
     * @return
     */
    protected String renderString(HttpServletResponse response, Object object) {
        return renderString(response, new Gson().toJson(object), "application/json");
    }

    /**
     * 客户端返回字符串
     *
     * @param response
     * @param string
     * @return
     */
    protected String renderString(HttpServletResponse response, String string, String type) {
        try {
            response.reset();
            response.setContentType(type);
            response.setCharacterEncoding("utf-8");
            //解决跨域问题
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.getWriter().print(string);
            return null;
        } catch (IOException e) {
            return null;
        }
    }


}
