<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>活动详情</title>
    <meta name="format-detection" content="telephone=no, email=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-touch-fullscreen" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>
    <link rel="shortcut icon" href="http://new.9dcm.net/attachment/images/global/wechat.jpg"/>
    <link rel="stylesheet" type="text/css" href="http://new.9dcm.net/app/resource/css/common.min.css?v=20171106">
    <link rel="stylesheet" type="text/css"
          href="http://new.9dcm.net/addons/fx_activity/app/resource/components/mui/mui.ext.css?v=20171206">
    <link rel="stylesheet" type="text/css"
          href="http://new.9dcm.net/addons/fx_activity/app/resource/components/dropload/dropload.css?v=20171106">

    <script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
    <script type="text/javascript">
        window.sysinfo = window.sysinfo || {
            "uniacid": 3,
            "acid": "3",
            "siteroot": "http:\/\/new.9dcm.net\/",
            "siteurl": "http:\/\/new.9dcm.net\/app\/index.php?i=3&c=entry&m=fx_activity&do=activity&ac=detail&op=display&activityid=77",
            "attachurl": "http:\/\/new.9dcm.net\/attachment\/",
            "cookie": {"pre": "bde9_"},
            "MODULE_URL": "http:\/\/new.9dcm.net\/addons\/fx_activity\/"
        } || {};

        // jssdk config 对象
        jssdkconfig = null || {};

        // 是否启用调试
        jssdkconfig.debug = false;

        jssdkconfig.jsApiList = [
            'checkJsApi',
            'onMenuShareTimeline',
            'onMenuShareAppMessage',
            'onMenuShareQQ',
            'onMenuShareWeibo',
            'hideMenuItems',
            'showMenuItems',
            'hideAllNonBaseMenuItem',
            'showAllNonBaseMenuItem',
            'translateVoice',
            'startRecord',
            'stopRecord',
            'onRecordEnd',
            'playVoice',
            'pauseVoice',
            'stopVoice',
            'uploadVoice',
            'downloadVoice',
            'chooseImage',
            'previewImage',
            'uploadImage',
            'downloadImage',
            'getNetworkType',
            'openLocation',
            'getLocation',
            'hideOptionMenu',
            'showOptionMenu',
            'closeWindow',
            'scanQRCode',
            'chooseWXPay',
            'openProductSpecificView',
            'addCard',
            'chooseCard',
            'openCard'
        ];

        wx.config(jssdkconfig);

    </script><!--兼容图片上传1.0-->
    <script>var app_module_name = 'fx_activity';</script>
    <script type="text/javascript" src="http://new.9dcm.net/app/resource/js/app/util.js?v=20171206"></script>
    <script type="text/javascript" src="http://new.9dcm.net/app/resource/js/require.js?v=20171106"></script>
    <script type="text/javascript"
            src="http://new.9dcm.net/app/resource/js/lib/jquery-1.11.1.min.js?v=20171106"></script>
    <script type="text/javascript"
            src="http://new.9dcm.net/addons/fx_activity/app/resource/js/app/util.min.js?v=20171206"></script>
    <script type="text/javascript" src="http://new.9dcm.net/app/resource/js/lib/mui.min.js?v=20171106"></script>
    <script type="text/javascript" src="http://new.9dcm.net/app/resource/js/app/common.js?v=20171106"></script>
    <script type="text/javascript"
            src="http://new.9dcm.net/addons/fx_activity/app/resource/components/dropload/dropload.min.js"></script>
    <script type="text/javascript">
        var shareData = {
            title: "${subject}|${class_name}|${time}",
            desc: "${subject}|${class_name}",
            link: window.location.href,
            imgUrl: "http://new.9dcm.net/attachment/images/3/2018/01/PtWvtuUZbwEslkbT0hGgWAUlSDSudS.jpg"
        };
        wx.ready(function () {
            var _sharedata = {
                title: shareData.title,
                desc: shareData.desc,
                link: shareData.link,
                imgUrl: shareData.imgUrl,
                success: function () {
                    var url = "http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=activity&ac=detail&op=share&id=77";
                    var share_action = "1";
                    if (share_action == '1') {
                        $.post(url, function (d) {
                            if (d.result == 1) {
                                util.alert('恭喜您获取 ' + d.data + ' 积分', ' ');
                            } else if (d.result == 2) {
                                util.alert(d.data, ' ');
                            }
                        }, "json");
                    }
                },
                cancel: function () {
                }
            };
            wx.onMenuShareAppMessage(_sharedata);
            wx.onMenuShareTimeline(_sharedata);
            wx.onMenuShareQQ(_sharedata);
        });
    </script>
</head>
<body>
<span class="mui-ext-icon"></span><span class="fa"></span>
<link rel="stylesheet" type="text/css"
      href="http://new.9dcm.net/addons/fx_activity/app/resource/css/style.css?v=20170912">
<link rel="stylesheet" type="text/css"
      href="http://new.9dcm.net/addons/fx_activity/app/resource/css/detail.css?v=20170912">
<style type="text/css">
    .latecolor {
        color: #ff9900
    }

    .latecolorbg {
        background-color: #ff9900
    }

    .lateborder {
        border: 1px solid #ff9900
    }

    .addressXX {
        color: #000;
        line-height: 22px
    }

    .tag {
        padding: 10px;
        background: -webkit-linear-gradient(top, rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, 0.85) 100%);
        background: -moz-linear-gradient(top, rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, 0.85) 100%);
        background: -o-linear-gradient(top, rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, 0.85) 100%);
        background: linear-gradient(top, rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, 0.85) 100%);
        position: absolute;
        bottom: 0;
        z-index: 10;
        height: 40px;
        left: 0;
        right: 0;
    }

    .tag span {
        font-size: 14px;
        line-height: 1.5;
        text-align: left;
        color: #fff;
    }

    .box-float {
        display: none;
    }

    .basic-box .mui-navigate-left {
        color: #828282;
    }

    .basic-box .mui-navigate-left p {
        color: #828282;
        margin: 0;
    }

    .mui-detail {
        text-align: justify
    }

    .mui-detail .mui-card-header span {
        display: block;
        position: relative;
        color: #666666;
        font-size: 15px;
        line-height: 1.5
    }

    .mui-detail .mui-card-header span:before {
        position: absolute;
        content: "";
        height: 100% !important;
        left: 0;
        top: 0;
        width: 4px;
        background-color: #ff8208;
    }

    .mui-detail .mui-card-content p {
        margin-bottom: 0px;
        margin-top: 10px;
    }

    .mui-detail .mui-card-content p:first-child {
        margin: 0;
    }

    .mui-detail .mui-card-content img {
        margin: 0 !important;
        max-width: 100%;
        height: auto !important;
        vertical-align: bottom;
        font-size: 0;
    }

    .mui-detail .mui-card-content ul, .mui-detail .mui-card-content ol {
        padding-left: 15px;
        line-height: 1.5;
        color: #7f7f7f;
        margin: 0;
    }

    .mui-detail .mui-card-footer {
        text-align: center;
        font-size: 12px;
    }

    .mui-detail .mui-card-footer.js-show {
        -webkit-box-shadow: 0 -20px 30px #fff;
        box-shadow: 0px -25px 30px #FFF;
        -webkit-backface-visibility: hidden;
        backface-visibility: hidden;
    }

    .mui-detail .mui-card-footer.js-show .mui-ext-icon:after {
        content: "\e662";
        font-size: 10px;
    }

    .mui-detail .mui-card-footer.js-hide .mui-ext-icon:after {
        content: "\e663";
        font-size: 10px;
    }

    .mui-detail .mui-card-footer.js-hide {
        box-shadow: none;
    }

    .pricebar > .mui-card {
        position: relative;
    }

    .pricebar > .mui-card:after {
        position: absolute;
        left: 10px;
        right: 10px;
        bottom: 0;
        height: 1px;
        background-color: #D9D9D9 !important;
        content: "";
        -webkit-transform: scaleY(0.5);
        transform: scaleY(0.5);
        -webkit-transform-origin: 0 100%;
        transform-origin: 0 100%;
    }

    .pricebar > .mui-card .mui-card-header h5 {
        color: #333333;
        line-height: 1.3;
        font-size: 16px;
    }

    .pricebar > .mui-card .mui-card-footer {
        min-height: 25px;
        padding: 0 10px;
        padding-bottom: 5px;
    }

    .pricebar > .mui-card .mui-card-footer span {
        color: #828282;
    }

    .mui-card-media .mui-table-view:after {
        height: 1px !important;
    }

    .mui-card-media .mui-table-view a.mui-active {
        background: #fff;
    }

    .mui-card.mui-one {
        box-shadow: none;
    }

    .mui-bar .mui-btn-outlined {
        border: none !important;
    }

    .mui-card.mui-two .mui-card-header {
        position: relative;
    }

    .mui-card.mui-two .mui-card-header, .mui-card.mui-one .mui-card-footer {
        background: none;
    }

    .mui-card.mui-two .mui-card-header img:first-child {
        width: 36px !important;
        height: 36px !important;
        border-radius: 5px;
    }

    .mui-card.mui-two .mui-card-header .mui-media-body {
        height: 36px;
        font-size: 13px;
        line-height: 1.8 !important;
        overflow: hidden;
        margin-left: 48px;
    }

    .mui-card.mui-two .mui-card-header .mui-media-body > span {
        overflow: hidden;
        position: relative;
    }

    .mui-card.mui-two .mui-card-header .mui-media-body i.mui-badge {
        right: 0;
        padding-top: 4px;
    }

    .mui-card.mui-two .mui-card-header .mui-media-body i.mui-badge-orange {
        background: #fff !important;
        color: #ff6f02 !important;
        padding-top: 6px;
        padding-bottom: 5px;
    }

    .mui-card.mui-two .mui-card-header .mui-media-body i.mui-badge-orange:after {
        content: " ";
        width: 200%;
        height: 200%;
        position: absolute;
        top: 0;
        left: 0;
        border: 1px solid #ff6f02;
        box-sizing: border-box;
        border-radius: 100px;
        -webkit-transform: scale(0.5);
        transform: scale(0.5);
        -webkit-transform-origin: 0 0;
        transform-origin: 0 0;
    }

    .mui-card.mui-two .mui-card-header .mui-icon-renzheng3 {
        width: 15px;
        height: 15px;
        font-size: 12px;
        line-height: 15px;
        text-align: center;
        position: absolute;
        top: 35px;
        left: 35px;
        background: #fff;
        border-radius: 100%;
        z-index: 999
    }

    .mui-card.mui-two .mui-card-header .mui-icon-renzheng3:after {
        color: #ff6d1f;
    }

    .mui-card.mui-two .mui-card-content {
        margin: 0 10px;
    }

    .mui-card.mui-two .mui-card-content:after {
        height: 0px;
    }

    .mui-card.mui-two .mui-card-content-inner {
        background: #f7f7f7;
        padding: 10px;
        border-radius: 10px;
        margin-bottom: 10px;
    }

    .mui-card.mui-two .mui-card-content-inner p.mui-small {
        font-size: 80% !important;
        line-height: 1.5
    }

    .mui-card.mui-two .mui-card-footer a.mui-badge {
        font-size: 13px;
        padding: 0 10px;
        padding-top: 6px;
        padding-bottom: 5px;
    }

    .mui-card.mui-two .mui-card-footer span:nth-child(3) {
        position: relative
    }

    .mui-card.mui-two .mui-card-footer span:nth-child(3):after {
        content: " ";
        position: absolute;
        border-right: 1px solid #d3d3d3;
        top: 50%;
        height: 120%;
        -webkit-transform: scaleX(0.5) translateY(-50%);
        transform: scaleX(0.5) translateY(-50%);
        -webkit-transform-origin: 0 100%;
        transform-origin: 0 100%;
    }

    .mui-card.mui-three .mui-card-content:after {
        height: 0;
    }

    .mui-card.mui-three .mui-media .mui-media-body .mui-ext-icon {
        display: block;
        position: relative;
    }

    .mui-card.mui-three .mui-media .mui-media-body .mui-ext-icon:before {
        font-size: 95%;
        color: #9c9c9c;
        top: 48%;
    }

    .mui-card.mui-three .mui-media .mui-tel {
        position: absolute;
        width: 45px;
        height: 100%;
        top: 0px;
        right: 0px;
        z-index: 999;
        margin: 0;
    }

    .mui-card.mui-three .mui-icon-phone1:after {
        line-height: 2;
        color: #ff6d1f;
        font-size: 25px;
    }

    .mui-card.mui-three .mui-icon-phone1 .mui-media-body {
        position: relative;
        overflow: initial;
        min-height: 35px;
        display: table;
        width: 100%;
    }

    .mui-card.mui-three .mui-icon-phone1 .mui-media-body .mui-media-content-inner {
        vertical-align: middle;
        display: table-cell;
    }

    .mui-card.mui-three .mui-icon-phone1 .mui-media-body:after {
        content: " ";
        position: absolute;
        border-right: 1px solid #e5e5e5;
        top: 0px;
        right: -10px;
        height: 100%;
        -webkit-transform: scaleX(0.5);
        transform: scaleX(0.5);
    }

    .mui-media .mui-media-header .mui-badge, .mui-index .mui-table-view .mui-badge {
        border-radius: 3px;
        padding: 3px;
    }
</style>

<footer class="mui-bar mui-bar-footer">
    <a class="js-btn-join js-follow" href=${course_id} >
        <span class="mui-btn mui-btn-orange mui-btn-block" id="btn_follow">我要报名</span>
    </a>
</footer>

<!--
followed.html
 判断是否已经关注该微信公众号，引导关注
Created by Administrator on 2016-02-29.
Copyright 2016 Administrator. All rights reserved.
-->
<style type="text/css">
    .subscribe {
        position: absolute;
        width: 100%;
        left: 0;
        right: 0;
        background-color: rgba(0, 0, 0, 0.8);
        z-index: 10;
        overflow: hidden;
        margin: 0 auto;
        height: 2.3rem;
    }

    .subscribe .img {
        width: 1.6rem;
        height: 1.6rem;
        position: absolute;
        left: 0.35rem;
        top: 0.35rem;
    }

    .subscribe .img img {
        width: 1.6rem;
        height: 1.6rem;
        border-radius: 3px;
    }

    .subscribe .text {
        padding: 0.35rem 3.8rem 0.35rem 2.2rem;
        line-height: 1.3;
        color: #fff;
    }

    .subscribe .text p {
        font-size: 0.55rem;
    }

    .subscribe .text font {
        color: #FA5343;
    }

    .subscribe .btn {
        position: absolute;
        right: 10px;
        top: 0.55rem;
    }

    .subscribe .btn .buttonn {
        background: #FA5343;
        width: 3rem;
        height: 1.2rem;
        line-height: 2.2;
        font-size: 0.55rem;
        text-align: center;
        border-radius: 5px;
        color: #fff;
        border: none;
    }

    .subscribe p {
        color: #FFF;
        margin-bottom: 5px;
    }

    .subscribe ~ .mui-content {
        padding-top: 2.3rem;
    }

    .subscribe ~ .mui-bar-tab ~ .mui-content {
        padding-top: 2.3rem;
    }

    .subscribe ~ .mui-bar-nav ~ .mui-content {
        padding-top: 4rem;
    }

    .subscribe ~ .mui-bar-nav, .subscribe ~ .mui-bar-nav .mui-tab-more {
        top: 2.3rem;
    }

    .st {
        position: absolute;
        top: 20%;
        left: 0;
        right: 0;
        z-index: 100000;
        opacity: 0.75;
        color: white;
        background: rgba(68, 68, 68, 0);
        background-image: initial;
        background-position-x: initial;
        background-position-y: initial;
        background-size: initial;
        background-repeat-x: initial;
        background-repeat-y: initial;
        background-attachment: initial;
        background-origin: initial;
        background-clip: initial;
        background-color: rgba(68, 68, 68, 0);
    }

    .st .m_guide {
        text-align: center
    }

    .st .close {
        display: block;
        width: 200px;
        margin: auto;
        text-align: right;
    }

    .all {
        position: absolute;
        z-index: 99999;
        width: 100%;
        height: 100%;
        opacity: 0.75;
        background-color: #000000;
    }
</style>
<div class="top" id="m_popUp" style="display: none;">
    <div class="all" style="font-size:14px;">
    </div>
    <div class="st">
        <div class="st" style="position: absolute;margin-top: -80px; text-align:center"><span class="close">×关闭</span>
        </div>
        <div style="float: right;opacity: 0.75;color: #000000;"></div>
        <div class="m_guide">
            <div style="margin-left: auto;margin-right: auto;background-color: rgba(0, 0, 0, 0);">
                <img src="http://my-photos.changs1992.cn/qrcode_for_gh_e7094005914d_258.jpg"
                     style="width: 200px;height: 200px;">
            </div>
            <div class="m_how" style="margin-top: 10px;">
                <h4 style="text-align: center;">长按识别二维码打开公众号</h4>
            </div>
        </div>
    </div>
</div>
<%--<div class="subscribe">--%>
<%--<div class="img"><img src="http://my-photos.changs1992.cn/qrcode_for_gh_e7094005914d_258.jpg">--%>
<%--</div>--%>
<%--<div class="text">--%>
<%--<p>欢迎来到<font>上杭县青少年学生校外活动中心</font></p>--%>
<%--<p>打开公众号，享受专属服务</p>--%>
<%--</div>--%>
<%--<div class="btn">--%>
<%--<a class="lizhuanz" href="javascript:;">--%>
<%--<div class="buttonn">立即打开</div>--%>
<%--</a>--%>
<%--</div>--%>
<%--</div>--%>
<script>
    // $(document).on('tap', '.js-follow', function () {
    //     util.alert('请分享此连接到微信打开', ' ', function (e) {
    //     });
    // })
    // $('.buttonn').on('tap', function () {
    //     util.alert('请分享此连接到微信打开', ' ', function (e) {
    //     });
    //     //$('.subscribe').remove();
    // });
    $('.top .close').on('click', function (e) {
        $('.top').hide();
        $.post("http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=check&ac=check&op=follow", '', function (d) {
            if (d.result) {
                window.location.reload();
            }
        }, "json");
    });
    if (${isFull}){
        $(".js-btn-join").attr('disabled', 'true');
        $(".js-btn-join").attr('datahref',$("a").attr("href"));
        $(".js-btn-join").removeAttr('href');
        $('.js-btn-join').find('span.mui-btn').text('报名已满');
        $('.js-btn-join').find('span.mui-btn').removeClass('mui-btn-orange');
        $('.js-btn-join').find('span.mui-btn').addClass('mui-btn-default');
    }


</script>
<div class="mui-content">
    <div class="mui-scroll-ext">
        <div class="mui-slider">
            <div class="mui-slider-group mui-slider-loop">
                <!--支持循环，需要重复图片节点-->

                <!--支持循环，需要重复图片节点-->
            </div>
            <div class="mui-slider-indicator">
            </div>
        </div>
        <script>
            var gallery = mui('.mui-slider');//获得slider插件对象
            gallery.slider({
                interval: 5000//自动轮播周期，若为0则不自动播放，默认为0；
            });</script>
        <div class="pricebar" id="J_PriceBar">
            <div class="mui-card mui-one" style="margin:0;">
                <div class="mui-card-header mui-card-media" style="padding-bottom:0;">
                    <h5 class="mui-ellipsis-2"> ${subject}|${class_name}|${time}</h5>
                </div>
                <%--<div class="mui-card-footer" style="text-align:center;">--%>
                <%--<span><em class="mui-icon mui-icon-eye"></em> 249</span>--%>
                <%--<span><em class="mui-icon mui-icon-redo"></em>0</span>--%>
                <%--<span></span>--%>
                <%--<span></span>--%>
                <%--<span></span>--%>
                <%--<span></span>--%>
                <%--<span class="" onClick="openFun.setProperty(this,77,'favorite')" data-favorite="1">--%>
                <%--<em class="mui-ext-icon mui-icon-xihuan"> 0</em></span>--%>
                <%--</div>--%>
            </div>
            <div style="position:relative;display: block;overflow: hidden; padding-top:10px;">
                <div class="subleft avil">
                    <div class="price mui-text-orange">
                        <strong>￥${cost}</strong>
                    </div>
                    <div class="information">
                        <div class="oprice" style=" display:none">
                            ¥
                            <del>380.00</del>
                        </div>
                        <%--<div class="soldcount mui-badge-orange">--%>
                        <%--<span>已报名&nbsp;4 人</span>--%>
                        <%--</div>--%>
                    </div>
                </div>
                <%--<div class="countdown">--%>
                <%--<span class="txt" style="font-size:20px; line-height:1.8">名额已满</span>--%>
                <%--</div>--%>
            </div>
        </div>
        <div class="content">
            <!-- 基本信息 -->
            <div class="mui-card mui-one mui-two" style="margin-bottom:0px">
                <div class="mui-card-header mui-card-media">
                    <a href="http://www.fjshhdzx.cn/weisite/cmsController.do?goPage&page=index">
                        <img src="http://my-photos.changs1992.cn/qrcode_for_gh_e7094005914d_258.jpg">
                        <span class="mui-ext-icon mui-icon-renzheng3"></span>
                        <div class="mui-media-body">
                            <span class="mui-ellipsis">上杭县青少年学生校外活动中心</span>
                            <%--<p class="mui-small">108位粉丝</p>--%>
                            <%--<i class="mui-badge mui-badge-orange mui-pull-right js-merch-follow" data-follow="1"--%>
                            <%--data-id="0" data-muid="0" onClick="javascript:return false;">+ 关注</i>--%>
                        </div>
                    </a>
                </div>
                <div class="mui-card-content">
                    <div class="mui-card-content-inner">
                        <p class="mui-ellipsis-3 mui-text-gray mui-small" style="margin:0;">官方介绍</p>
                    </div>
                </div>
            </div>
            <div class="mui-card mui-one mui-three" style="margin-top:0px;">
                <div class="mui-card-content">
                    <ul class="mui-table-view mui-table-view-chevron">
                        <li class="mui-table-view-cell mui-media">
                            <a class="mui-navigate-right mui-icon-phone1"
                               onClick="openFun.wxMap(24.435048,117.805566,'地点名称','上杭县青少年学生校外活动中心');">
                                <div class="mui-media-body">
                                    <div class="mui-media-content-inner">
                                        <p style="display:none">地点名称</p>
                                        <p class="mui-ext-icon mui-icon-dingwei">
                                            <span class="mui-pl15 mui-ellipsis-2">上杭县青少年学生校外活动中心</span>
                                        </p>
                                    </div>
                                </div>
                            </a>
                            <a class="mui-tel" href="tel:0597-3843617"></a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="mui-card mui-one mui-three mui-detail" style="margin-top:10px;">
                <div class="mui-card-header mui-card-media" style="padding:0;">
                    <ul class="mui-table-view">
                        <li class="mui-table-view-cell"><a href="javascript:;"><p>报名须知</p></a></li>
                    </ul>
                </div>
                <div class="mui-card-content">
                    <div class="mui-card-content-inner" style="padding:10px;">

                        <p class="mui-text-gray">
                            <span class="mui-text-yellow">上课时间</span><br>
                            <font color="#FF0000">${time}</font></p>
                        <p>${subject}|${class_name}|${time} 报名须知</p>
                        <p></p>
                        <p>
                            <span style="color:rgb(255,0,0);">特别提示：</span>
                            ${information}
                        </p>
                        <p></p>
                        <p><span style="color:rgb(255,0,0);">特别提示：</span>报名成功的家长应自行记清所报班级的开班日期和上课时段，开班前活动中心任课教师会与报名成功的家长取得联系，建立班级家长群，家长需随时关注班级群的通知，确保按时参加培训。
                        </p></div>
                </div>
            </div>
            <div class="mui-card mui-one mui-three mui-detail js-detail" style="margin-top:10px">
                <div class="mui-card-header mui-card-media" style="padding:0;">
                    <ul class="mui-table-view">
                        <li class="mui-table-view-cell"><a href="javascript:;"><p>图文详情</p></a></li>
                    </ul>
                </div>
                <div class="mui-card-content" style="overflow:hidden;">
                    <div class="mui-card-content-inner" style="padding:10px;">
                        <p>${subject}</p>
                        <p>招生对象：${class_name}</p>
                        <p>上课时间：${time}</p>
                        <p>任课教师：${teacher}</p>
                        <p>教室：${classroom}</p>
                    </div>
                    <div class="mui-card-footer js-show">
                        <span class="mui-ext-icon mui-text-orange" style="width:100%;">查看全部详情 </span>
                    </div>
                    <script>$(function () {
                        setTimeout(function () {
                            var h1 = 3000, h2 = $('.js-detail').find('.mui-card-content-inner').height();
                            if (h2 > h1) {
                                $('.js-detail').find('.mui-card-content').css('max-height', '2000px');
                                $('.js-detail').find('.mui-card-footer').show()
                            } else {
                                $('.js-detail').find('.mui-card-content').css('max-height', 'none');
                                $('.js-detail').find('.mui-card-footer').hide()
                            }
                        }, 200);
                        $('.js-detail').delegate(".js-show", "tap", function (e) {
                            $('.js-detail').find('.mui-card-content').css('max-height', 'none');
                            $(this).removeClass('js-show').addClass('js-hide');
                            $(this).find('span').text('收起详情 ')
                        });
                        $('.js-detail').delegate(".js-hide", "tap", function (e) {
                            $('.js-detail').find('.mui-card-content').css('max-height', '2000px');
                            $(this).removeClass('js-hide').addClass('js-show');
                            $(this).find('span').text('查看全部详情 ')
                        })
                    });</script>
                </div>


                <div style="height:65px;"></div>
            </div>
        </div>
    </div>
    <div id="cover"></div>
    <div id="guide"><img src="http://new.9dcm.net/addons/fx_activity/app/resource/images/guide.png"></div>
    <script>

        var container = "unknown";
        var openFun = {
            wxMap: function (lat, lng, name, address) {
                if (container == 'wechat') {
                    wx.ready(function () {
                        wx.openLocation({
                            latitude: lat, // 纬度，浮点数，范围为90 ~ -90
                            longitude: lng, // 经度，浮点数，范围为180 ~ -180。
                            name: name, // 位置名
                            address: address, // 地址详情说明
                            scale: 16, // 地图缩放级别,整形值,范围从1~28。默认为最大
                            infoUrl: '' // 在查看位置界面底部显示的超链接,可点击跳转
                        });
                    });
                } else {
                    location.href = "http://apis.map.qq.com/uri/v1/marker?marker=coord:" + lat + "," + lng + ";title:" + name + ";addr:" + address + "&referer=myapp";
                }
            },
            loadstore: function () {
                var latitude, longitude;
                wx.ready(function () {
                    wx.getLocation({
                        type: 'gcj02', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
                        success: function (res) {
                            latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
                            longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
                            var speed = res.speed; // 速度，以米/每秒计
                            var accuracy = res.accuracy; // 位置精度
                            //alert(latitude+','+longitude);
                        }
                    });

                });
                $.post("http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=activity&ac=detail&op=distance", {
                    lat_a: latitude,
                    lng_a: longitude
                }, function (data) {
                    //alert(data.stores);
                }, 'json');
            },
            setProperty: function (obj, id, op) {/*收藏 */
                var total_favo = parseInt($(obj).find('em').text());
                var favorite = parseInt($(obj).attr('data-favorite'));
                util.loading();
                $.post("http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=activity&ac=detail&op=favorite", {
                    activityid: id,
                    favorite: favorite,
                    type: 'detail'
                }, function (d) {
                    util.loading().close();
                    if (op == 'favorite') {
                        if (d.result == '1') {
                            ;
                            util.toast('操作成功');
                            $(obj).attr("data-favorite", d.data);
                            $(obj).toggleClass("mui-active");
                            $(obj).find('em').text(' ' + (d.data ? total_favo + 1 : total_favo - 1));
                        } else if (d.result == 2) {
                            if (container == 'wechat') {
                                util.confirm('还未注册，点击确认自动注册？', ' ', function (e) {
                                    if (e.index == 1) {
                                        location.href = "http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=auth&ac=oauth&op=info";
                                    }
                                });
                            } else {
                                util.tips('需要在微信中打开');
                            }
                        } else {
                            util.tips('操作失败');
                        }
                    }
                }, "json");
            }
        }

        //关注
        $('.js-merch-follow').on("tap", function (e) {
            var $this = $(this);
            util.loading();
            $.post("http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=member&ac=profile&op=follow", {
                id: $this.data('id'),
                muid: $this.data('muid'),
                follow: $this.attr('data-follow'),
                type: 'detail'
            }, function (d) {
                util.loading().close();
                if (d.result == 1) {
                    util.tips('操作成功');
                    $this.attr("data-follow", d.data);
                    $this.toggleClass("mui-badge-orange");
                    $this.text(d.data ? '+ 关注' : '已关注');
                } else if (d.result == 2) {
                    if (container == 'wechat') {
                        util.confirm('还未注册，点击确认自动注册？', ' ', function (e) {
                            if (e.index == 1) {
                                location.href = "http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=auth&ac=oauth&op=info";
                            }
                        });
                    } else {
                        util.tips('需要在微信中打开');
                    }
                } else {
                    util.tips('操作失败', '', 'error');
                }
            }, "json");
        });
        /* 浮标拖动动作 */
        var drag = document.getElementById('touchbtn'),
            winWeight = window.innerWidth,
            winHeight = window.innerHeight - 50,
            middleWin = winWeight / 2,
            middleHin = winHeight / 6,
            endTouchX = 0,
            endTouchY = 0,
            iTime = 0;

        function touchMove(ev) {
            ev.preventDefault();
            var ev = ev.touches[0];
            drag.style.top = (ev.pageY - 30) + 'px';
            drag.style.left = (ev.pageX - 30) + 'px';
            endTouchX = ev.pageX;
            endTouchY = ev.pageY;
        }

        drag.addEventListener('touchstart', function (ev) {
                clearTimeout(iTime);
                $(drag).fadeTo(50, 0.85);
                document.addEventListener('touchmove', touchMove, false);
                document.addEventListener('touchend', function (ev) {
                        document.ontouchmove = null;
                        document.ontouchend = null;
                        if (endTouchY < middleHin && endTouchX > 80 && endTouchX < winWeight - 80) { //停靠上边
                            //drag.style.top = '2px';
                            $(drag).stop().animate({top: '2px'}, 160, function () {
                                iTime = setTimeout(function () {
                                    $(drag).fadeTo(600, 0.35)
                                }, 3800);
                            });
                        } else if (endTouchY > middleHin * 5 && endTouchX > 80 && endTouchX < winWeight - 80) { //停靠下边
                            $(drag).stop().animate({top: winHeight - 55 + 'px'}, 160, function () {
                                iTime = setTimeout(function () {
                                    $(drag).fadeTo(600, 0.35)
                                }, 3800);
                            });
                        } else {
                            if (endTouchX > 0 && endTouchX < middleWin) { //停靠左边
                                $(drag).stop().animate({left: '2px'}, 160, function () {
                                    iTime = setTimeout(function () {
                                        $(drag).fadeTo(600, 0.35)
                                    }, 3800);
                                });

                            } else if (endTouchX != 0) { //停靠右边
                                $(drag).stop().animate({left: winWeight - 50 + 'px'}, 160, function () {
                                    iTime = setTimeout(function () {
                                        $(drag).fadeTo(600, 0.35)
                                    }, 3800);
                                });
                            }
                        }
                        document.removeEventListener('touchmove', touchMove, false);
                    },
                    false)
            },
            false)
        //计时
        var sh, joinstime = "2018-02-01 19:00:00", joinetime = "2018-02-23 19:00:00";
        FreshTime(".clockrun", joinstime, joinetime);
        sh = setInterval(function () {
            FreshTime(".clockrun", joinstime, joinetime)
        }, 1000);

        function FreshTime(id, starttime, endtime) {
            var st = starttime.replace(/-/g, "/"),//开始时间
                et = endtime.replace(/-/g, "/");//结束时间
            st = new Date(st);//开始时间
            et = new Date(et);//结束时间
            //console.log(st);
            var nowtime = new Date(),//当前时间
                start_time = parseInt(st.getTime()),
                end_time = parseInt(et.getTime()),
                now_time = parseInt(nowtime.getTime()),
                lefttime = -1;
            if (start_time > now_time) {
                lefttime = parseInt((start_time - now_time) / 1000);
            } else if (end_time > now_time) {
                lefttime = parseInt((end_time - now_time) / 1000);
                //console.log(lefttime);
            }

            var hasoption = parseInt("0");
            var guanzhu = parseInt("2");
            var follow = parseInt("");


        }

        //阅读量计数器
        $.post("http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=activity&ac=detail&op=read&id=77", function (d) {
        }, "json");
    </script>
    <script type="text/javascript"
            src="http://new.9dcm.net/app/index.php?i=3&c=utility&a=visit&do=showjs&m=fx_activity"></script>
</body>

</html>
