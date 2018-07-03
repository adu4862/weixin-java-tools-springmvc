<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>我的订单</title>
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
            "siteurl": "http:\/\/new.9dcm.net\/app\/index.php?i=3&c=entry&m=fx_activity&do=home&ac=index&op=display",
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
            title: "分享标题",
            desc: "",
            link: window.location.href,
            imgUrl: "http://my-photos.changs1992.cn/qrcode_for_gh_e7094005914d_258.jpg"
        };
        wx.ready(function () {
            var _sharedata = {
                title: shareData.title,
                desc: shareData.desc,
                link: shareData.link,
                imgUrl: shareData.imgUrl,
                success: function () {
                    var url = "http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=activity&ac=detail&op=share&";
                    var share_action = "";
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

    <link rel="stylesheet" type="text/css"href="http://my-photos.changs1992.cn/iconfont_2.css"/>
</head>
<body>
<span class="mui-ext-icon"></span><span class="fa"></span>
<style type="text/css">
    .latecolor {
        color: #ff9900;
    }

    .latecolorbg {
        background-color: #ff9900;
    }

    .lateborder {
        border: 1px solid #ff9900
    }

    #wrapper, .caption {
        border: none;
    }

    .wrapper-con {
        border-radius: 8px !important;
        border: 1px solid #E3E3E3;
        overflow: hidden;
    }

    .caption {
        width: 100%;
    }

    .mui-index .mui-box {
        padding-bottom: 80px;
    }

    .mui-index .mui-card {
        margin: 10px 0;
        margin-right: 0;
        box-shadow: rgb(235, 235, 235) 0px 2px 4px;
    }

    .mui-index .mui-card, .mui-index .mui-card-header, .mui-index .mui-card-footer {
        border-radius: 0;
        background-color: #fff;
        border: none;
    }

    .mui-index .mui-card .mui-table-view .mui-table-view-cell.mui-media {
        padding: 10px;
    }

    .mui-index .mui-card-header {
        padding: 10px 8px;
        position: relative;
    }

    .mui-index .mui-card-header:before {
        position: absolute;
        content: "";
        height: 13px;
        left: 0;
        top: 50%;
        width: 6px;
        background-color: #f06000;
        border-radius: 0 20% 20% 0;
        -moz-border-radius: 0 20% 20% 0;
        border-radius: 0 20% 20% 0;
        -webkit-font-smoothing: antialiased;
        -webkit-transform: translateX(-50%) translateY(-50%);
        transform: translateX(-50%) translateY(-50%);
    }

    .mui-index .mui-card-header h5 {
        color: #333;
        font-weight: 600;
        font-size: 15px;
    }

    .mui-index .mui-card-footer {
        text-align: center;
        font-size: 12px;
    }

    .mui-index .mui-card-footer a {
        color: #59acff !important;
    }

    .mui-index .mui-table-view:after {
        margin-left: 10px;
        margin-right: 10px;
        height: 1px !important;
    }

    .mui-index .mui-table-view .mui-media-object {
        max-width: 115px !important;
        width: 115px !important;
        height: 85px;
        background-size: auto 100% !important;
        border-radius: 4px;
    }

    .mui-index .mui-table-view p {
        color: #999999;
        line-height: 1.6;
    }

    .mui-index .mui-table-view p.mui-ellipsis-2 {
        line-height: 1.3;
    }

    .mui-index .mui-table-view span.title {
        color: #333333;
        display: inherit;
        line-height: 1.2;
    }

    .mui-index .mui-slider .mui-slider-indicator {
        bottom: 0;
        text-align: right;
        padding-right: 10px
    }

    .mui-index .mui-slider-title {
        color: #666666;
        opacity: 1;
        background: -webkit-linear-gradient(top, rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, 0.75) 100%);
        background: -moz-linear-gradient(top, rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, 0.75) 100%);
        background: -o-linear-gradient(top, rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, 0.75) 100%);
        background: linear-gradient(top, rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, 0.75) 100%);
        padding-right: 35%;
        color: #fff;
    }

    .mui-index .mui-media-body .mui-media-footer {
        overflow: hidden;
        height: 22px;
    }

    .mui-index .mui-media-body .mui-media-footer span {
        overflow: hidden;
    }

    .mui-index .mui-media-body .mui-media-footer span:first-child ~ span {
        display: inline-block;
        line-height: 1;
        font-size: 12px;
        padding: 2px 0;
    }
</style>
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
    $(document).on('tap', '.js-follow', function () {
        util.alert('请分享此连接到微信打开', ' ', function (e) {
        });
    })
    $('.buttonn').on('tap', function () {
        util.alert('请分享此连接到微信打开', ' ', function (e) {
        });
        //$('.subscribe').remove();
    });
    $('.top .close').on('click', function (e) {
        $('.top').hide();
        $.post("http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=check&ac=check&op=follow", '', function (d) {
            if (d.result) {
                window.location.reload();
            }
        }, "json");
    });
</script>
<nav class="mui-bar mui-bar-tab" id="bar">


    <a class="mui-tab-item" href="${urlWithOpenId1}">
        <span class="mui-icon iconfont icon-faxian"></span>
        <span class="mui-tab-label">报名</span>
    </a>

    <a class="mui-tab-item"
       href=${urlWithOpenId}>
        <span class="mui-icon iconfont icon-my"></span>
        <span class="mui-tab-label">我的</span>
    </a>
</nav>
<script>
    mui.init();
    mui('.mui-bar-tab').on('tap', 'a', function () {
        var $this = $(this);
        if (this.getAttribute('href') != null) {
            console.log(this.getAttribute('href'));
            location.href = this.getAttribute('href');
        } else {
            return false;
        }
    })
</script>
<div class="mui-content mui-index">
    <div class="mui-scroll">
        <div class="mui-box">
            <div class="mui-slider">
                <div class="mui-slider-group mui-slider-loop">
                    <!--支持循环，需要重复图片节点-->
                    <!--支持循环，需要重复图片节点-->
                </div>
                <div class="mui-slider-indicator">

                </div>
            </div>
            <div id="hot" class="mui-card">
                <div class="mui-card-header"><h5>我的订单</h5></div>
                <div class="mui-card-content">
                    <ul class="mui-table-view">
                        <c:forEach items="${list}" var="user">
                            <li class="mui-table-view-cell mui-media">
                                <a href="">
                                    <%--<div class="mui-media-object mui-pull-left"--%>
                                         <%--style="background:url(http://new.9dcm.net/attachment/images/3/2018/05/cY3nLM5dmMl3884444pyPyBWL3VlvP.jpg) no-repeat center">--%>
                                            <%--&lt;%&ndash;<img src=user.iamge_url alt="">&ndash;%&gt;--%>
                                    <%--</div>--%>
                                    <div class="mui-media-body"><span class="title mui-ellipsis">${user.subject}|${user.name}</span>
                                        <p class="mui-ellipsis-2 mui-small"></p>
                                        <p class="mui-small">支付状态：<font color="#666666">支付完成</font><font
                                            color="#666666"></font></p>
                                        <div class="mui-media-footer"><span class="mui-badge">金额: </span>
                                            <span
                                                class="mui-text-orange mui-rmb">${user.cost}</span></div>
                                    </div>
                                </a></li>

                        </c:forEach>

                    </ul>
                </div>
                <%--<div class="mui-card-footer"><a--%>
                    <%--href="http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=activity&ac=activity&op=display">查看更多</a>--%>
                <%--</div>--%>
            </div>
            <style type="text/css">
                .footer {
                    width: 100%;
                    padding-top: 10px;
                    padding-bottom: 30px;
                    display: inline-block;
                    text-align: center;
                    font-size: 12px
                }

                .footer img {
                    display: block;
                    margin: 0 auto 5px auto;
                }

                .latecolor, .latecolor a {
                    color: #c3c3c3;
                }
            </style>
            <div class="footer latecolor">
                <a href="javascript:;">
                    <img src="http://my-photos.changs1992.cn/qrcode_for_gh_e7094005914d_258.jpg"
                         height="30"/>上杭县青少年学生校外活动中心</a>
            </div>
        </div>
    </div>
</div>
<script>
    //获得slider插件对象
    var gallery = mui('.mui-slider');
    gallery.slider({
        interval: 5000//自动轮播周期，若为0则不自动播放，默认为0；
    });
    var pageStart = 0, pageEnd = 0, totalpage = 0, thispage = 1, thispsize = 100;
    mui.getJSON("http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=home&ac=index&op=ajax", {
            page: thispage,
            psize: thispsize
        },
        function (data) {
            var stime = new Date(), result = '';
            totalpage = data.tpage;
            if (data.tpage == 0) {
                result = '<li class="mui-table-view-cell"><p style="text-align:center">当前没有推荐信息</p><li>';
            }
            pageEnd = data.lists.length <= thispsize ? data.lists.length : thispsize;
            for (var i = pageStart; i < pageEnd; i++) {
                joinstime = new Date(data.lists[i].joinstime.replace("-", "/").replace("-", "/"));
                joinetime = new Date(data.lists[i].joinetime.replace("-", "/").replace("-", "/"));
                starttime = new Date(data.lists[i].starttime.replace("-", "/").replace("-", "/"));
                endtime = new Date(data.lists[i].endtime.replace("-", "/").replace("-", "/"));
                sToend1 = joinetime.format('MM月dd日 hh:mm');
                sToend2 = starttime.format('MM月dd日 hh:mm');//+'~'+endtime.format('MM月dd日 hh:mm')

                var joinnum = parseInt(data.lists[i].joinnum),
                    quota = parseInt(data.lists[i].quota),
                    showjoin = parseInt(data.lists[i].showjoin),
                    aprice = data.lists[i].aprice,
                    minaprice = data.lists[i].minaprice;
                if (stime > endtime) {
                    tpl_status = '<span class="mui-badge">活动结束</span>';
                } else {
                    if (joinnum >= quota && quota > 0) {
                        tpl_status = '<span class="mui-badge mui-badge-danger">名额已满</span>';
                    } else {
                        tpl_status = joinstime > stime ? '<span class="mui-badge">还未开始</span>' : (stime > joinetime ? '<span class="mui-badge">报名结束</span>' : '<span class="mui-badge mui-badge-orange">报名中</span>');
                    }
                }
                var ii = 0, tpl_atlas = '', reg = /\"(.*?)\"/g;
                while (atlas = reg.exec(data.lists[i].atlas)) {
                    ii++;
                    tpl_atlas += '<span class="scroll-control-item' + (ii == 1 ? ' mui-col-xs-12' : '') + '"><img src="' + "http://new.9dcm.net/attachment/" + atlas[1] + '"></span>';
                }
                tpl_atlas = ii > 1 ? tpl_atlas.replace(/ mui-col-xs-12/g, '') : tpl_atlas;
                tpl_price = aprice > 0 || minaprice > 0 ? '<span class="mui-text-orange mui-rmb">' + (minaprice ? minaprice + ' 起' : aprice) + '</span>' : '<span class="mui-text-success">免费活动</span>';

                result += '<li class="mui-table-view-cell mui-media">'
                    + '    <a href="' + "http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=activity&ac=detail&op=display&activityid=" + data.lists[i].id + '">'
                    + '        <div class="mui-media-object mui-pull-left" style="background:url(' + "http://new.9dcm.net/attachment/" + data.lists[i].thumb + ') no-repeat center"></div>'
                    + '        <div class="mui-media-body">'
                    + '            <span class="title mui-ellipsis">' + data.lists[i].title + '</span>'
                    + '            <p class="mui-ellipsis-2 mui-small">' + data.lists[i].intro + '</p>'
                    + '            <p class="mui-small">' + (showjoin ? '已报名：<font color="#666666">' + joinnum + ' 人</font> ' : '') + '剩余名额：<font color="#666666">' + (quota > 0 ? (quota - joinnum) + ' 人' : ' 不限') + '</font></p>'
                    + '            <div class="mui-media-footer">'
                    + '            ' + tpl_status
                    + '            ' + tpl_price
                    + '            </div>'
                    + '        </div>'
                    + '    </a>'
                    + '</li>';
            }
            $("#hot").find('.mui-table-view').append(result);
        });
    //格式化日期
    Date.prototype.format = function (format) {
        var o = {
            "M+": this.getMonth() + 1,
            "d+": this.getDate(),
            "h+": this.getHours(),
            "m+": this.getMinutes(),
            "s+": this.getSeconds(),
            "q+": Math.floor((this.getMonth() + 3) / 3),
            "S": this.getMilliseconds()
        }
        if (/(y+)/.test(format)) {
            format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        }

        for (var k in o) {
            if (new RegExp("(" + k + ")").test(format)) {
                format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
            }
        }
        return format;
    }
</script>
<script>;</script>
<script type="text/javascript"
        src="http://new.9dcm.net/app/index.php?i=3&c=utility&a=visit&do=showjs&m=fx_activity"></script>
</body>
</html>
