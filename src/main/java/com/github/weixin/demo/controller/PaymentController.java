package com.github.weixin.demo.controller;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.github.weixin.demo.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.binarywang.wxpay.bean.entpay.EntPayRequest;
import com.github.binarywang.wxpay.bean.entpay.EntPayResult;
import com.github.binarywang.wxpay.bean.request.WxPayUnifiedOrderRequest;
import com.github.binarywang.wxpay.bean.result.WxPayUnifiedOrderResult;
import com.github.binarywang.wxpay.config.WxPayConfig;
import com.github.binarywang.wxpay.exception.WxPayException;
import com.github.binarywang.wxpay.service.WxPayService;
import com.github.binarywang.wxpay.util.SignUtils;
import com.github.weixin.demo.util.ReturnModel;
import com.github.weixin.demo.util.Sha1Util;
import com.github.weixin.demo.util.XMLUtil;
import com.google.gson.Gson;
import me.chanjar.weixin.common.exception.WxErrorException;

/**
 * 微信支付Controller
 * <p>
 * Created by FirenzesEagle on 2016/6/20 0020.
 * Email:liumingbo2008@gmail.com
 */
@Controller
@RequestMapping(value = "wxPay")
public class PaymentController extends GenericController {

    @Autowired
    private WxPayConfig payConfig;
    @Autowired
    private WxPayService payService;

    /**
     * 用于返回预支付的结果 WxMpPrepayIdResult，一般不需要使用此接口
     *
     * @param response
     * @param request
     * @throws WxErrorException
     */
    @RequestMapping(value = "getPrepayIdResult")
    public void getPrepayId(HttpServletResponse response,
                            HttpServletRequest request) throws WxErrorException, WxPayException {
        WxPayUnifiedOrderRequest payInfo = WxPayUnifiedOrderRequest.newBuilder()
            .openid(request.getParameter("openid"))
            .outTradeNo(request.getParameter("out_trade_no"))
            .totalFee(Integer.valueOf(request.getParameter("total_fee")))
            .body(request.getParameter("body"))
            .tradeType(request.getParameter("trade_type"))
            .spbillCreateIp(request.getParameter("spbill_create_ip"))
            .notifyUrl("")
            .build();
        this.logger
            .info("PartnerKey is :" + this.payConfig.getMchKey());
        WxPayUnifiedOrderResult result = this.payService.unifiedOrder(payInfo);
        this.logger.info(new Gson().toJson(result));
        renderString(response, result);
    }

    /**
     * 返回前台H5调用JS支付所需要的参数，公众号支付调用此接口
     *
     * @param response
     * @param request
     */
//    @RequestMapping(value = "/wechat/getJSSDKPayInfo")
//    public void getJSSDKPayInfo(HttpServletResponse response,
//                                HttpServletRequest request) {
//        String ip2 = MD5Util.getIp2(request);
//        ReturnModel returnModel = new ReturnModel();
//        WxPayUnifiedOrderRequest prepayInfo = WxPayUnifiedOrderRequest.newBuilder()
//            .openid(request.getParameter("openId"))//公众号支付），此参数必传，此参数为微信用户在商户对应appid下的唯一标识
//            .outTradeNo(request.getParameter("out_trade_no"))//	商户系统内部订单号，要求32个字符内，只能是数字、大小写字母_-|* 且在同一个商户号下唯一
//            .totalFee(Integer.valueOf(request.getParameter("total_fee")))//	订单总金额，单位为分，详见支付金额
//            .body(request.getParameter("body"))//商品描述
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
//    }

    /**
     * 微信通知支付结果的回调地址，notify_url
     *
     * @param request
     * @param response
     */
//    @RequestMapping(value = "/weixin_pay")
//    public void getJSSDKCallbackData(HttpServletRequest request,
//                                     HttpServletResponse response) {
////        try {
////            synchronized (this) {
////                Map<String, String> kvm = XMLUtil.parseRequestXmlToMap(request);
////                if (SignUtils.checkSign(kvm, null, this.payConfig.getMchKey())) {
////                    if (kvm.get("result_code").equals("SUCCESS")) {
////                        //TODO(user) 微信服务器通知此回调接口支付成功后，通知给业务系统做处理
////                        logger.info("out_trade_no: " + kvm.get("out_trade_no") + " pay SUCCESS!");
////                        response.getWriter().write("<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[ok]]></return_msg></xml>");
////                    } else {
////                        this.logger.error("out_trade_no: "
////                            + kvm.get("out_trade_no") + " result_code is FAIL");
////                        response.getWriter().write(
////                            "<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[result_code is FAIL]]></return_msg></xml>");
////                    }
////                } else {
////                    response.getWriter().write(
////                        "<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[check signature FAIL]]></return_msg></xml>");
////                    this.logger.error("out_trade_no: " + kvm.get("out_trade_no")
////                        + " check signature FAIL");
////                }
////            }
////        } catch (Exception e) {
////            e.printStackTrace();
////        }
//    }

    @RequestMapping(value = "entPay")
    public void payToIndividual(HttpServletResponse response,
                                HttpServletRequest request) {
        EntPayRequest wxEntPayRequest = new EntPayRequest();
        wxEntPayRequest.setAppid(payConfig.getAppId());
        wxEntPayRequest.setMchId(payConfig.getMchId());
        wxEntPayRequest.setNonceStr(Sha1Util.getNonceStr());
        wxEntPayRequest.setPartnerTradeNo(request.getParameter("partner_trade_no"));
        wxEntPayRequest.setOpenid(request.getParameter("openid"));
        wxEntPayRequest.setCheckName("NO_CHECK");
        wxEntPayRequest.setAmount(Integer.valueOf(request.getParameter("amount")));
        wxEntPayRequest.setDescription(request.getParameter("desc"));
        wxEntPayRequest.setSpbillCreateIp(request.getParameter("spbill_create_ip"));

        try {
            EntPayResult wxEntPayResult = payService.getEntPayService().entPay(wxEntPayRequest);
            if ("SUCCESS".equals(wxEntPayResult.getResultCode().toUpperCase())
                && "SUCCESS".equals(wxEntPayResult.getReturnCode().toUpperCase())) {
                this.logger.info("企业对个人付款成功！\n付款信息：\n" + wxEntPayResult.toString());
            } else {
                this.logger.error("err_code: " + wxEntPayResult.getErrCode()
                    + "  err_code_des: " + wxEntPayResult.getErrCodeDes());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

