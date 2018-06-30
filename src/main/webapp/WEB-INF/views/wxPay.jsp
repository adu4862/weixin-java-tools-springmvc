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
    <style type="text/css">
        /* 重置 [[*/
        body, p, ul, li, h1, h2, form, input {
            margin: 0;
            padding: 0;
        }

        h1, h2 {
            font-size: 100%;
        }

        ul {
            list-style: none;
        }

        body {
            -webkit-user-select: none;
            -webkit-text-size-adjust: none;
            font-family: Helvetica;
            background: #ECECEC;
        }

        html, body {
            height: 100%;
        }

        a, button, input, img {
            -webkit-touch-callout: none;
            outline: none;
        }

        a {
            text-decoration: none;
        }

        /* 重置 ]]*/
        /* 功能 [[*/
        .hide {
            display: none !important;
        }

        .cf:after {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }

        /* 功能 ]]*/
        /* 按钮 [[*/
        a[class*="btn"] {
            display: block;
            height: 42px;
            line-height: 42px;
            color: #FFFFFF;
            text-align: center;
            border-radius: 5px;
        }

        .btn-blue {
            background: #3D87C3;
            border: 1px solid #1C5E93;
        }

        .btn-green {
            background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #43C750), color-stop(1, #31AB40));
            border: 1px solid #2E993C;
            box-shadow: 0 1px 0 0 #69D273 inset;
        }

        /* 按钮 [[*/
        /* 充值页 [[*/
        .charge {
            font-family: Helvetica;
            padding-bottom: 10px;
            -webkit-user-select: none;
        }

        .charge h1 {
            height: 44px;
            line-height: 44px;
            color: #FFFFFF;
            background: #3D87C3;
            text-align: center;
            font-size: 20px;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        .charge h2 {
            font-size: 14px;
            color: #777777;
            margin: 5px 0;
            text-align: center;
        }

        .charge .content {
            padding: 10px 12px;
        }

        .charge .select li {
            position: relative;
            display: block;
            float: left;
            width: 100%;
            margin-right: 2%;
            height: 150px;
            line-height: 150px;
            text-align: center;
            border: 1px solid #BBBBBB;
            color: #666666;
            font-size: 16px;
            margin-bottom: 5px;
            border-radius: 3px;
            background-color: #FFFFFF;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            overflow: hidden;
        }

        .charge .price {
            border-bottom: 1px dashed #C9C9C9;
            padding: 10px 10px 15px;
            margin-bottom: 20px;
            color: #666666;
            font-size: 12px;
        }

        .charge .price strong {
            font-weight: normal;
            color: #EE6209;
            font-size: 26px;
            font-family: Helvetica;
        }

        .charge .showaddr {
            border: 1px dashed #C9C9C9;
            padding: 10px 10px 15px;
            margin-bottom: 20px;
            color: #666666;
            font-size: 12px;
            text-align: center;
        }

        .charge .showaddr strong {
            font-weight: normal;
            color: #9900FF;
            font-size: 26px;
            font-family: Helvetica;
        }

        .charge .copy-right {
            margin: 5px 0;
            font-size: 12px;
            color: #848484;
            text-align: center;
        }

        /* 充值页 ]]*/
    </style>
</head>
<body>


<form action="" method="get" onSubmit="return check(this)" style="position: initial">
    <footer class="mui-bar mui-bar-footer">
        <input type="hidden" value="${appid}" name="appId" id="appId"/>
        <input type="hidden" value="${timeStamp}" name="timeStamp" id="timeStamp"/>
        <input type="hidden" value="${wxPackage}" name="package" id="package"/>
        <input type="hidden" value="${paySign}" name="paySign" id="paySign"/>
        <input type="hidden" value="${nonceStr}" name="nonceStr" id="nonceStr"/>
    </footer>
</form>
<article class="charge">
    <section class="content">
        <h2>课程: 剪纸2|三年级||周六（下午4:00-5:30）</h2>

        <p class="copy-right">收款方:上杭县青少年学生校外活动中心 </p>
        <div class="price">价格：<strong>￥${money}
        </strong></div>
        <div class="operation"><a class="btn-green" id="getBrandWCPayRequest"
                                  href="javascript:void(0);" onclick="callpay()" class="ljzf_but all_w">立即支付</a>
        </div>
    </section>
</article>
</body>
<script type="text/javascript">
    function callpay() {
        // alert('diaoqi');
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
                // alert("微信支付成功!");
                //重定向跳转

                $.ajax({
                    url: 'http://www.fjshhdzx.cn/templateMessage/notifyOrderPaySuccessTemplate',
                    type: 'GET',     // 请求类型，常用的有 GET 和 POST
                    data: {
                        openId :'${openId}',
                        orderId:'${orderId}',
                        orderMoneySum:${money},
                        orderProductName:'${body}'
                    },
                    success: function() { // 接口调用成功回调函数
                        setTimeout("javascript:location.href='http://www.fjshhdzx.cn/wechat/my?openId=${openId}'", 500);

                    },
                    error: function() {
                        setTimeout("javascript:location.href='http://www.fjshhdzx.cn/wechat/my?openId=${openId}'", 500);
                    }
                });
            } else if (res.err_msg == "get_brand_wcpay_request:cancel") {
                // alert("用户取消支付!");
                setTimeout("javascript:location.href='http://www.fjshhdzx.cn/wechat/my?openId=${openId}'", 500);
            } else {
                // alert("支付失败!");
                setTimeout("javascript:location.href='http://www.fjshhdzx.cn/wechat/my?openId=${openId}'", 500);
            }
        })
    }


</script>
</html>
