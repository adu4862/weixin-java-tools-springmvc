<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>微信支付</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" type="text/css"/>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript"
            src="http://new.9dcm.net/app/resource/js/lib/jquery-1.11.1.min.js?v=20171106"></script>
</head>
<body>

<div class="wenx_xx">
    <div class="mz">(这是一个最终付款确认页)</div>
    <div class="wxzf_price">￥11.90</div>
</div>
<div class="skf_xinf">
    <div class="all_w">
        <span class="bt">收款方</span> <span class="fr">上杭县青少年学生校外活动中心</span>
    </div>
</div>
<form action="" method="get" onSubmit="return check(this)" style="position: initial">
    <footer class="mui-bar mui-bar-footer">
        <input type="hidden" value="${appid}" name="appId" id="appId"/>
        <input type="hidden" value="${timeStamp}" name="timeStamp" id="timeStamp"/>
        <input type="hidden" value="${wxPackage}" name="package" id="package"/>
        <input type="hidden" value="${paySign}" name="paySign" id="paySign"/>
        <input type="hidden" value="${nonceStr}" name="nonceStr" id="nonceStr"/>
    </footer>
</form>
<a id="wx-pay" href="javascript:void(0);" onclick="callpay()" class="ljzf_but all_w">立即支付</a>
</body>
<script type="text/javascript">
    function onBridgeReady() {
        WeixinJSBridge.invoke('getBrandWCPayRequest', {
            "appId": $("#appId").val(),
            "timeStamp": $("#timeStamp").val(),
            "nonceStr": $("#nonceStr").val(),
            "package": $("#package").val(),
            "signType": "MD5",
            "paySign": $("#paySign").val()
        }, function (res) {
            if (res.err_msg == "get_brand_wcpay_request:ok") {
                alert("微信支付成功!");
                //重定向跳转
            } else if (res.err_msg == "get_brand_wcpay_request:cancel") {
                alert("用户取消支付!");
            } else {
                alert("支付失败!");
            }
        })
    }

    function callpay() {
        if (typeof WeixinJSBridge == "undefined") {
            if (document.addEventListener) {
                document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
            } else if (document.attachEvent) {
                document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
                document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
            }
        } else {
            onBridgeReady();
        }
    }
</script>
</html>
