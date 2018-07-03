<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>我的</title>
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
    <link rel="stylesheet" type="text/css"href="http://my-photos.changs1992.cn/iconfont_2.css"/>
    <script type="text/javascript">
        window.sysinfo = window.sysinfo || {
            "uniacid": 3,
            "acid": "3",
            "siteroot": "http:\/\/new.9dcm.net\/",
            "siteurl": "http:\/\/new.9dcm.net\/app\/index.php?i=3&c=entry&m=fx_activity&do=member&ac=home&op=display",
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
</head>
<body>
<span class="mui-ext-icon"></span><span class="fa"></span>
<style>
    .mui-card.mui-one {
        box-shadow: none
    }

    .mui-media-body span {
        font-size: 18px;
        line-height: 1.8;
    }

    .mui-media-body p {
        color: #666666;
    }

    .mui-table-view .mui-media-object {
        width: 65px;
        max-width: 65px;
        height: 65px;
        line-height: 65px;
    }

    .mui-table-view li img {
        border-radius: 10%;
        margin-right: 10px;
        vertical-align: middle;
    }

    .mui-table-view-cell {
        padding: 11px 12px;
    }

    .mui-table-view-cell .mui-ext-icon p {
        font-size: 15px;
        margin-top: 1.5px;
    }

    .mui-card-link.mui-text-gray p {
        color: #828282 !important
    }

    .mui-card-media .mui-table-view:after {
        height: 1px !important;
    }

    .mui-table-view.mui-grid-view {
        background-color: none;
    }

    .mui-table-view.mui-grid-view .mui-table-view-cell {
        border: none;
        background-color: #fff;
        padding: 8px 15px;
        position: relative;
        margin-right: 0px;
    }

    .mui-table-view.mui-grid-view .mui-table-view-cell:after {
        content: "";
        position: absolute;
        right: 0;
        left: auto;
        top: 50%;
        border-right: 0.5px solid #e0e0e0;
        height: 60%;
        -webkit-transform: translateY(-50%) scaleX(0.5);
        transform: translateY(-50%) scaleX(0.5);
    }

    .mui-table-view.mui-grid-view .mui-table-view-cell > a:not(.mui-btn) {
        margin: -11px -14px;
    }

    .mui-table-view.mui-grid-view .mui-table-view-cell:last-child:after {
        border: none;
    }

    .mui-table-view.mui-grid-view .mui-table-view-cell .mui-media-body {
        color: #777777;
        font-size: 80%;
        margin-top: 6px;
    }

    .mui-table-view.mui-grid-view span.mui-ext-icon {
        position: relative;
        width: 30px;
        height: 25px;
        margin: 0 auto;
        display: inline-block;
    }

    .mui-table-view.mui-grid-view span.mui-ext-icon:before {
        left: 50%;
        transform: translate(-50%, -50%);
        -webkit-transform: translate(-50%, -50%);
        font-size: 18px;
    }

    .mui-table-view.mui-grid-view span.mui-ext-icon.mui-icon-qianbao:before {
        font-size: 18px;
    }

    .mui-table-view.mui-grid-view .mui-badge {
        position: absolute;
    }
</style>
<nav class="mui-bar mui-bar-tab" id="bar">
    <a class="mui-tab-item" href="${homeUrl}">
        <span class="mui-icon iconfont icon-faxian"></span>
        <span class="mui-tab-label">报名</span>
    </a>

    <a class="mui-tab-item"
       href=${myUrl}>
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
<div class="mui-content">
    <ul class="mui-table-view" style="margin-top: 0;">
        <li class="mui-table-view-cell mui-media">
            <%--<a class="mui-navigate-right js-popover" data-popover='member'>--%>
                <img class="mui-media-object mui-pull-left" src="${headImgUrl}">
                <div class="mui-media-body">
                    <span></span>
                    <p class="mui-ellipsis">昵称：${nickname}</p>
                </div>
            <%--</a>--%>
        </li>
        <%--<li class="mui-table-view-cell js-change" data-type="nickname">--%>
            <%--<a>昵称<span class="mui-badge mui-badge-inverted">${nickname}</span></a>--%>
        <%--</li>--%>
    </ul>
    <ul class="mui-table-view mui-grid-view mui-afterbefore-no mui-text-gray" style="margin:0; padding:0;">
        <li class="mui-table-view-cell mui-media mui-col-xs-6 mui-col-sm-2">
            <%--<a href="http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=member&ac=favorite&"--%>
            <%--class="mui-text-gray">--%>
            <%--<span class="mui-ext-icon mui-icon-favorite"></span>--%>
            <%--<div class="mui-media-body">收藏</div>--%>
            <%--</a>--%>
        </li>
        <li class="mui-table-view-cell mui-media mui-col-xs-6 mui-col-sm-2">
            <%--<a href="http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=member&ac=profile&op=list"><span--%>
            <%--class="mui-ext-icon mui-icon-fensi"></span>--%>
            <%--<div class="mui-media-body">关注</div>--%>
            <%--</a>--%>
        </li>
    </ul>
    <div class="mui-card mui-one">
        <div class="mui-card-header mui-card-media" style="padding:0;">
            <ul class="mui-table-view">
                <li class="mui-table-view-cell">
                    <a class="mui-navigate-right"
                       href="${orderUrl}">
                        <p >我的报名</p>
                        <%--<span class="mui-badge  iconfont icon-gengduo">全部记录</span>--%>
                    </a>
                </li>

            </ul>
        </div>
        <%--<div class="mui-card-footer mui-small" style="text-align:center">--%>
        <%--<a class="mui-card-link mui-text-gray"--%>
        <%--href="http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=records&ac=records&op=list&index=1">--%>
        <%--<p>0</p>待付款</a>--%>
        <%--<a class="mui-card-link mui-text-gray"--%>
        <%--href="http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=records&ac=records&op=list&index=2">--%>
        <%--<p>0</p>待参与</a>--%>
        <%--<a class="mui-card-link mui-text-gray"--%>
        <%--href="http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=records&ac=records&op=list&index=3">--%>
        <%--<p>0</p>已完成</a>--%>
        <%--<a class="mui-card-link mui-text-gray"--%>
        <%--href="http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=records&ac=records&op=list&index=4">--%>
        <%--<p>0</p>已取消</a>--%>
        <%--<a class="mui-card-link mui-text-gray"--%>
        <%--href="http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=records&ac=records&op=list&index=5">--%>
        <%--<p>0</p>已退款</a>--%>
        <%--</div>--%>
    </div>

    <ul class="mui-table-view mui-afterbefore-no" style="margin-bottom:20px;">
    </ul>
    <div class="mui-content-padded">
        <%--<a class="mui-btn mui-btn-orange mui-btn-block"--%>
        <%--href="http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=member&ac=merch&op=display"--%>
        <%--style="border-radius:100px;">我是主办方</span>--%>
        <%--</a>--%>
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
            <img src="http://my-photos.changs1992.cn/qrcode_for_gh_e7094005914d_258.jpg" height="30"/>上杭县青少年学生校外活动中心</a>
    </div>
</div>
<style type="text/css">
    .mui-popover .mui-popover-header {
        background: #f3f3f3;
        color: #3b424c;
        padding: 10px;
        font-size: 16px;
        line-height: 1;
        position: relative
    }

    .mui-popover .mui-popover-header:after {
        background-color: #e6e6e6 !important;
    }

    .mui-popover .mui-popover-header a.mui-popover-close {
        color: #969696;
        position: absolute;
        z-index: 1;
        display: block;
        right: -10px;
        top: 50%;
        -webkit-transform: translateX(-50%) translateY(-50%);
        transform: translateX(-50%) translateY(-50%);
    }

    .mui-popover .mui-popover-header a.mui-popover-close me {
        font-size: 30px;
    }

    .mui-popover .mui-popover-content {
        height: 94.5%;
    }

    .mui-setting-content .mui-popover .mui-popover-header:after {
        content: '';
        position: absolute;
        left: 0;
        bottom: 0;
        right: auto;
        top: auto;
        height: 1px;
        width: 100%;
        background-color: #d0d0d0;
        display: block;
        z-index: 15;
        -webkit-transform: scaleY(.5);
        transform: scaleY(.5);
    }

    .mui-setting-content .mui-popover .mui-table-view-cell .mui-badge {
        padding: 0;
        margin: 0;
    }

    .mui-setting-content .mui-popover .mui-table-view-cell.avatar {
        line-height: 40px;
    }

    .mui-setting-content .mui-popover .mui-table-view-cell.avatar .upload-btn {
        position: absolute;
        top: 0;
        height: 100%;
        width: 100%;
        left: 0;
    }

    .mui-setting-content .mui-popover .mui-table-view-cell.avatar .upload-btn div {
        width: 100% !important;
        height: 100% !important;
    }

    .mui-setting-content .mui-popover .mui-table-view-cell.avatar .head-img {
        margin-right: 20px;
        border-radius: 10%;
        vertical-align: middle;
    }

    .mui-popup-backdrop {
        z-index: 9999;
    }

    #merch_detail textarea {
        border: none;
        padding: 5px 10px;
        border-radius: 10px;
    }
</style>
<div class="mui-setting-content">
    <div id="member" class="mui-popover mui-popover-left">
        <div class="mui-popover-header">个人资料<a href="#member" class="mui-pull-right mui-popover-close">
            <me class="mui-icon mui-icon-closeempty"></me>
        </a></div>
        <div class="mui-popover-content">
            <div class="mui-scroll-wrapper">
                <div class="mui-scroll">
                    <ul class="mui-table-view">
                        <li class="mui-table-view-cell avatar">
                            <a id="head" class="mui-navigate-right">头像
                                <span class="mui-pull-right">
                                    <img class="head-img mui-action-preview" width="40" height="40" src="">
                                </span>
                            </a>
                            <div class="upload-btn js-avatar-avatar" style="position:absolute;"></div>
                        </li>
                        <script>
                            util.img($('.js-avatar-avatar'), function (url) {
                                $('.avatar img').attr('src', url.url);
                                $.post('./index.php?i=3&c=mc&a=profile&do=avatar&', {'avatar': url.attachment}, function (data) {
                                    data = $.parseJSON(data);
                                    if (data.type == 'success') {
                                        util.toast(data.message);
                                    } else {
                                        util.toast('更新失败');
                                    }
                                })
                            }, {
                                crop: true,
                                pxSize: 320,
                                aspectRatio: 1 / 1
                            });
                        </script>
                        <li class="mui-table-view-cell js-change" data-type="nickname">
                            <a>昵称<span class="mui-badge mui-badge-inverted"></span></a>
                        </li>
                        <li class="mui-table-view-cell js-change" data-type="realname">
                            <a>姓名<span class="mui-badge mui-badge-inverted"></span></a>
                        </li>
                        <li class="mui-table-view-cell js-change" data-type="gender">
                            <a>性别<span class="mui-badge mui-badge-inverted">女</span></a>
                        </li>
                    </ul>
                    <ul class="mui-table-view">
                        <li class="mui-table-view-cell">
                            <a href="http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=member&ac=bond&op=mobile&setting=1">手机号<span
                                class="mui-badge mui-badge-inverted mui-text-primary">待绑定</span></a>
                        </li>
                        <li class="mui-table-view-cell js-change" data-type="qq">
                            <a>QQ号<span class="mui-badge mui-badge-inverted mui-text-primary">待绑定</span></a>
                        </li>
                        <li class="mui-table-view-cell" style="display:none">
                            <a>邮箱地址<span class="mui-badge mui-badge-inverted"></span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(".js-change").on('tap', function (e) {
            e.detail.gesture.preventDefault(); //修复iOS 8.x平台存在的bug，使用plus.nativeUI.prompt会造成输入法闪一下又没了
            var $this = $(this);
            var placeholder = '', params = '', value = '', type = $(this).data("type");
            switch (type) {
                case 'nickname':
                    placeholder = '请输入新的昵称';
                    break;
                case 'realname':
                    placeholder = '请输入真实姓名';
                    break;
                case 'qq'      :
                    placeholder = '请输入您的QQ';
                    break;
                default:
                    break;
            }
            if (type != 'gender') {
                mui.prompt('资料修改', placeholder, ' ', function (e) {
                    if (e.index == 1) {
                        value = e.value;
                        if ($.trim(value) == '') {
                            util.tips('更改信息不能为空');
                            return false;
                        }
                        switch (type) {
                            case 'nickname':
                                params = {'nickname': value, type: type};
                                break;
                            case 'realname':
                                params = {'realname': value, type: type};
                                break;
                            case 'qq'      :
                                params = {'qq': value, type: type};
                                break;
                            default:
                                break;
                        }
                        //console.log(params);
                        $.post("http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=member&ac=profile&op=mc", params, function (data) {
                            data = $.parseJSON(data);
                            if (data.type == 'success') {
                                util.toast(data.message);
                                $this.find('span').removeClass('mui-text-primary').text(value);
                            } else {
                                util.toast('更新失败');
                            }
                        })
                    }
                });
            }
        });
    </script>
</div>
<script>
    mui('.mui-scroll-wrapper').scroll({indicators: false});
    $(".js-popover").on('click', function (e) {
        var popover = "#" + $(this).data("popover");
        mui(popover).popover('toggle');
        if (popover == '#act_setting') {
            setTimeout(function () {
                $(popover).css('transition', 'none')
            }, 290);
        }
        //window.onpopstate = function (e) {}
        //history.pushState({page: "setting"}, "我的", "http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=member&ac=home&op=display#1");
    });
    $(".js-popover-close").on("click", function (e) {
        var popover = "#" + $(this).data("popover");
        if (popover == '#act_setting') {
            if (fomrData != '') {
                $('#forms').html(fomrData);
                fomrNeed.each(function (key) {
                    if ($(this).is(':checked')) {
                        $('#forms .js-needFill').eq(key).attr("checked", true);
                    } else {
                        $('#forms .js-needFill').eq(key).attr("checked", false);
                    }
                });
            }
            $(popover).css('transition', 'transform .3s,opacity .3s');
        }
        mui(popover).popover('toggle');
    });
    $(".js-popover-sub").on('tap', function (e) {
        var popover = "#" + $(this).data("popover");
        $(popover).css('display', 'block')[0].offsetWidth;
        $(popover).addClass('mui-active');
        $('body').append('<div class="mui-backdrop mui-active mui-backdrop-sub"></div>');
    });
    $('.js-popover-sub-close').on('click', function (e) {
        var popover = "#" + $(this).data("popover");
        $(popover).removeClass('mui-active').fadeOut();
        $('body').find('.mui-backdrop-sub').remove();
    });
    $('body').delegate('.mui-backdrop-sub', 'tap', function (e) {
        $(this).remove();
        $('.mui-popover-sub').removeClass('mui-active').fadeOut();
    });

    /*$.get("http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=member&ac=home&op=display#1").done(function (data) { $("#wrapper").html(data); });
    var u = navigator.userAgent;
    var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端

    if (history.state){
        window.addEventListener("popstate", function() {
            var jsonstate = history.state;//获取当前所在的state
            console.log(jsonstate);
            if (jsonstate && jsonstate.page == 'setting') { //page即是pushState时设置的参数
                //history.go(-1);
            }else{
                mui("#setting").popover('toggle');
            }
        });
        window.onload = function(){
            setTimeout(function() {
                //mui("#setting").popover('toggle');
            },230);
        }
    }*/
</script>
<script>;</script>
<script type="text/javascript"
        src="http://new.9dcm.net/app/index.php?i=3&c=utility&a=visit&do=showjs&m=fx_activity"></script>
</body>
</html>
