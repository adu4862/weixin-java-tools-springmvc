<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>报名信息填写</title>
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
    <%--<script type="text/javascript">--%>
        <%--window.sysinfo = window.sysinfo || {--%>
            <%--"uniacid": 3,--%>
            <%--"acid": "3",--%>
            <%--"siteroot": "http:\/\/new.9dcm.net\/",--%>
            <%--"siteurl": "http:\/\/new.9dcm.net\/app\/index.php?i=3&c=entry&m=fx_activity&do=home&ac=join&op=display&activityid=78",--%>
            <%--"attachurl": "http:\/\/new.9dcm.net\/attachment\/",--%>
            <%--"cookie": {"pre": "bde9_"},--%>
            <%--"openid": "o1o3BwS8-mewE3P0yu0Mlqcg4cUE",--%>
            <%--"MODULE_URL": "http:\/\/new.9dcm.net\/addons\/fx_activity\/"--%>
        <%--} || {};--%>

        <%--// jssdk config 对象--%>
        <%--jssdkconfig = {--%>
            <%--"appId": "wx6d1da488e028291b",--%>
            <%--"nonceStr": "bzcHV7MM97C0L78T",--%>
            <%--"timestamp": "1529026574",--%>
            <%--"signature": "f8aee7ee410ae19783bc9040713da85229aa8621"--%>
        <%--} || {};--%>

        <%--// 是否启用调试--%>
        <%--jssdkconfig.debug = false;--%>

        <%--jssdkconfig.jsApiList = [--%>
            <%--'checkJsApi',--%>
            <%--'onMenuShareTimeline',--%>
            <%--'onMenuShareAppMessage',--%>
            <%--'onMenuShareQQ',--%>
            <%--'onMenuShareWeibo',--%>
            <%--'hideMenuItems',--%>
            <%--'showMenuItems',--%>
            <%--'hideAllNonBaseMenuItem',--%>
            <%--'showAllNonBaseMenuItem',--%>
            <%--'translateVoice',--%>
            <%--'startRecord',--%>
            <%--'stopRecord',--%>
            <%--'onRecordEnd',--%>
            <%--'playVoice',--%>
            <%--'pauseVoice',--%>
            <%--'stopVoice',--%>
            <%--'uploadVoice',--%>
            <%--'downloadVoice',--%>
            <%--'chooseImage',--%>
            <%--'previewImage',--%>
            <%--'uploadImage',--%>
            <%--'downloadImage',--%>
            <%--'getNetworkType',--%>
            <%--'openLocation',--%>
            <%--'getLocation',--%>
            <%--'hideOptionMenu',--%>
            <%--'showOptionMenu',--%>
            <%--'closeWindow',--%>
            <%--'scanQRCode',--%>
            <%--'chooseWXPay',--%>
            <%--'openProductSpecificView',--%>
            <%--'addCard',--%>
            <%--'chooseCard',--%>
            <%--'openCard'--%>
        <%--];--%>

        <%--wx.config(jssdkconfig);--%>

    <%--</script><!--兼容图片上传1.0-->--%>
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
            imgUrl: "http://new.9dcm.net/attachment/images/3/2018/01/rJ652LwFKaGXxa2Tk6HTX2gL20PajX.jpg"
        };
        wx.ready(function () {
            var _sharedata = {
                title: shareData.title,
                desc: shareData.desc,
                link: shareData.link,
                imgUrl: shareData.imgUrl,
                success: function () {
                    var url = "http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=activity&ac=detail&op=share&id=78";
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
<script type="text/javascript" src="http://new.9dcm.net/addons/fx_activity/app/resource/js/jquery.cookie.js"></script>
<style type="text/css">
    .mui-bar a {
        color: #ff9900;
    }

    .mui-btn-primary {
        background-color: #ff9900;
    }

    .mui-btn-primary:enabled:active {
        background-color: #ec7230 !important;
    }

    .mui-textarea {
        height: auto !important;
        width: 100%;
    }

    .area {
        margin: 20px auto 0px auto;
    }

    .mui-input-group:first-child {
        margin-top: 20px;
    }

    .mui-rmb i {
        font-style: normal;
    }

    .mui-input-row label ~ input, .mui-input-row label ~ select, .mui-input-row label ~ textarea {
        width: 65%;
    }

    footer .mui-input-row label {
        line-height: 2 !important;
        padding: 11px 0;
        text-align: right;
        float: right;
    }

    footer .mui-input-row span {
        line-height: 2;
        padding: 11px 10px 11px 0;
    }

    footer .mui-input-row span.mui-rmb {
        line-height: 1.7 !important;
    }

    footer .mui-input-row .mui-btn {
        top: 0;
        font-size: 16px;
        line-height: 1.6 !important;
        border-radius: 0;
        width: 35%
    }

    .mui-input-row #get_code {
        width: auto;
        border-radius: 0;
        line-height: 1.7;
    }

    .mui-help-top .mui-table-view-cell {
        padding: 9px 12px;
    }

    .mui-help-top .mui-icon-help:before {
        color: #fe5001;
        font-size: 18px;
    }

    .mui-help-top .mui-small {
        font-size: 90% !important;
    }

    .mui-help-top .mui-help-info:before {
        position: absolute;
        content: "";
        height: 99% !important;
        left: 0;
        top: 0;
        width: 3px;
        background-color: #fe5001;
    }

    .mui-input-row.mui-help .mui-help-info {
        padding-right: 30px;
    }

    [data-type=date] .mui-dtpicker-title h5, [data-type=date] .mui-picker {
        width: 20% !important;
    }

    .mui-dtpicker-title h5, .mui-picker {
        display: inline-block !important;
    }
</style>
<form action="" method="get" onSubmit="return check(this)" style="position: initial">
    <footer class="mui-bar mui-bar-footer">
        <button type="submit" class="mui-btn mui-btn-orange mui-btn-block">提交报名</button>
        <input type="hidden" name="submit" value="提交报名"/>
        <input type="hidden" name="activityid" value="78"/>
        <input type="hidden" name="optionid" value="0"/>
        <input type="hidden" name="token" value="M1Q4"/>
        <input type="hidden" value="${cost}" name="cost"/>
        <input type="hidden" value="${openId}" name="openId"/>
        <input type="hidden" value="${course_id}" name="course_id"/>
    </footer>
    <div class="mui-content">
        <ul class="mui-table-view mui-help-top" style="margin-top:0;">
            <li class="mui-table-view-cell mui-help-info">
                <span class="mui-navigate-left mui-icon-help mui-text-orange mui-small"> &nbsp;&nbsp;&nbsp;&nbsp; 提醒：凡是"必填"，或者"必选"的为必填选项</span>
            </li>
        </ul>
        <div class="mui-content-padded">
            <p>基本信息</p>
        </div>
        <div class="mui-input-group">
            <input type="hidden" name="op" value="join"/>
            <div class="mui-input-row">
                <label>姓名</label>
                <input type="text" name="member[realname]" id="realname" placeholder="姓名 (必填)" value="">
            </div>
            <div class="mui-input-row mui-help">
                <label>手机</label>
                <input type="number" name="member[mobile]" id="mobile" placeholder="手机 (必填)" pattern="[0-9]*"
                       value="18686868686"/>
            </div>
            <input name="form_id[]" type="hidden" class="form-control form_id" value="928"/>
            <input name="essential" type="hidden" value="0" title="性别" data-type="3"/>
            <div class="mui-input-row">
                <label>性别</label>
                <input name="form_item_val_0" value="" type="text" placeholder="请输入性别 (必填)">
            </div>
            <input name="form_id[]" type="hidden" class="form-control form_id" value="922"/>
            <input name="essential" type="hidden" value="1" title="学校" data-type="3"/>
            <div class="mui-input-row">
                <label>就读学校</label>
                <input name="form_item_val_1" value="" type="text" placeholder="请输入学校 (必填)">
            </div>
            <input name="form_id[]" type="hidden" class="form-control form_id" value="923"/>

            <input name="essential" type="hidden" value="2" title="年级" data-type="3"/>
            <div class="mui-input-row">
                <label>年级</label>
                <input name="form_item_val_2" value="" type="text" placeholder="请输入年级 (必填)">
            </div>
            <input name="form_id[]" type="hidden" class="form-control form_id" value="929"/>
            <div class="mui-input-row">
                <label>兴趣爱好</label>
                <input name="form_item_val_7" value="" type="text" placeholder="请输入兴趣爱好">
            </div>
            <input name="form_id[]" type="hidden" class="form-control form_id" value="929"/>

            <div class="mui-input-row">
                <label>家庭住址</label>
                <input name="form_item_val_8" value="" type="text" placeholder="请输入家庭住址">
            </div>
            <input name="form_id[]" type="hidden" class="form-control form_id" value="929"/>

            <div class="mui-input-row">
                <label>家长（父亲）</label>
                <input name="form_item_val_3" value="" type="text" placeholder="请输入家长（父亲）">
            </div>
            <input name="form_id[]" type="hidden" class="form-control form_id" value="925"/>
            <input name="essential" type="hidden" value="4" title="电话" data-type="3"/>
            <div class="mui-input-row">
                <label>电话</label>
                <input name="form_item_val_4" value="" type="text" placeholder="请输入电话 (必填)">
            </div>
            <input name="form_id[]" type="hidden" class="form-control form_id" value="930"/>
            <input name="essential" type="hidden" value="5" title="家长（母亲）" data-type="3"/>
            <div class="mui-input-row">
                <label>家长（母亲）</label>
                <input name="form_item_val_5" value="" type="text" placeholder="请输入家长（母亲） (必填)">
            </div>
            <input name="form_id[]" type="hidden" class="form-control form_id" value="927"/>
            <input name="essential" type="hidden" value="6" title="电话" data-type="3"/>
            <div class="mui-input-row">
                <label>电话</label>
                <input name="form_item_val_6" value="" type="text" placeholder="请输入电话 (必填)">
            </div>
            <ul class="mui-table-view">
                <li class="mui-table-view-cell mui-pl15" style="display:none">
                    <a class="mui-navigate-right js-marketing" href="#">主办方优惠<span
                        class="mui-badge mui-badge-inverted"></span></a>
                </li>
                <li class="mui-table-view-cell">
                    <textarea id="textarea" class="mui-input-clear" name="msg" placeholder="给主办方留言"
                              style="padding:3px;"></textarea>
                </li>
            </ul>
            <p>&nbsp;</p>
        </div>
    </div>
</form>
<script type="text/javascript">
    mui('.mui-scroll-wrapper').scroll();
    $(function () {
        $('input[type=text]').each(function (key) {
            if ($(this).attr("readonly")) $(this).attr('onfocus', 'this.blur()');
        });
        var oldMoble = "18686868686";
        $('.js-check-mobile').on("tap", function (e) {
            if (!$('#smscode').parent().hasClass('active')) {
                $('#smscode').parent().show().addClass('active');
                $('#mobile').removeAttr('onfocus');
                $(this).find('span').text('取消变更');
            } else {
                $('#smscode').parent().hide().removeClass('active');
                $('#mobile').attr('onfocus', 'this.blur()').val(oldMoble).blur();
                $(this).find('span').text('点此变更');
            }
        });
        //报名协议
        $(".js-popover").on("tap", function (e) {
            mui('#popover').popover('toggle');
        });
        $(".js-readagreement").on("tap", function (e) {
            $("input[name='agreement']").prop("checked", true);
            mui('#popover').popover('toggle');
        });
        //报名人数控制
        var payprice, aprice = 0.00, teamquota = parseInt(0), quota = parseInt(0), joinnum = parseInt(14);
        var forquota = quota ? quota - joinnum : 0;
        $("input.js-pay-team").bind('input propertychange, change', function (e) {
            e.stopPropagation();
            $this = $(this);
            if ($(this).val() == 0) {
                $(this).val(1);
            }
            //判断名额
            if ($(this).val() > forquota && quota > 0) {
                $(this).val(forquota);
                util.alert('已超出剩余名额范围', ' ', function () {
                    $(".js-pay-team").val(forquota);
                });
            }
            //团名额限制
            if ($(this).val() > teamquota && teamquota > 0) {
                $(".js-pay-team").val(teamquota);
                util.alert('您最多只可填写 ' + teamquota + ' 个名额', ' ', function () {
                    $('.js-pay-price').val(payprice);
                });
            }
            //配制优惠
            if (aprice > 0) {
                var maxmeet = 0, give = 0, markettype = 0, obj_ = new Object();
                $("#marketing .mui-input-row").each(function (key) {
                    //console.log();
                    $(this).find('input').attr('disabled', "true");
                    $(this).find('input').removeAttr("checked");
                    $(this).addClass('mui-disabled');
                    if ($this.val() >= $(this).data("meet")) {
                        markettype = $(this).data("type");
                        if ($(this).data("meet") > maxmeet) obj_ = this;
                        give = $(this).data("meet") > maxmeet ? $(this).find("input[name='give']").val() : give;
                        maxmeet = $(this).data("meet") > maxmeet ? $(this).data("meet") : maxmeet;

                    } else {
                        maxmeet = 0;
                    }
                });
                $(obj_).find('input').prop("checked", 'true');
                $(obj_).removeClass('mui-disabled');
                switch (markettype) {
                    case 0:
                        payprice = (aprice * $(this).val()).toFixed(2);
                        $('.js-marketing').parent().hide();
                        break;
                    case 1:
                        $('.js-marketing').find('span').html('主办方' + give + '折优惠券');
                        $('.js-marketing').parent().show();
                        payprice = (aprice * $(this).val() * give * 0.1).toFixed(2);
                        //console.log(payprice);
                        break;
                    case 2:
                        $('.js-marketing').find('span').html('主办方优惠券' + give + '元');
                        $('.js-marketing').parent().show();
                        payprice = (aprice * $(this).val() - give).toFixed(2);
                        //console.log(payprice);
                        break;
                    default:
                        break;
                }
                $('.js-pay-price').val(payprice);
                $('.js-teamquota').text(" ×" + $(this).val());
                $('footer .mui-rmb').html(payprice);
            }
        });

    });

    function check(form) {
        var patt = new RegExp(/\s+/g);
        var checksubmit = false, value = '';
        if ($.trim(form['member[realname]'].value) == '') {
            util.alert('请输入姓名', ' ', function () {
                $(form['member[realname]']).focus();
            });
            return false;
        }
        if (!form['member[mobile]'].value) {
            util.alert('请输入手机号', ' ', function () {
                $(form['member[mobile]']).focus();
            });
            return false;
        } else {
            var mobile = $('#mobile').val();
            var pattern = /^1[34578]\d{9}$/;

            if (!pattern.test(mobile)) {
                util.alert('手机号不合法', ' ', function () {
                    $(form['member[mobile]']).focus();
                });
                return false;
            }
        }


        if ($(form['essential']).length) {
            $(form['essential']).each(function () {
                var inputkey = $(this).val();
                var formtype = $(this).data('type');
                var inputName = 'form_item_val_' + $(this).val();
                if (inputkey != '') {
                    if ($(form[inputName + '[]']).length || formtype == '6') {
                        inputName = inputName + '[]';
                        if ($(form[inputName]).attr("type") == 'checkbox' && $('input:checkbox[name="' + inputName + '"]:checked').length == 0) {
                            util.alert($(this).attr("title") + '为必选项', ' ', function () {
                                $(form[inputName]).focus();
                            });
                            checksubmit = false;
                            return false;
                        } else if (formtype == '6' && !$(form[inputName]).length) {
                            util.alert($(this).attr("title") + '不能为空', ' ', function () {
                            });
                            checksubmit = false;
                            return false;
                        }
                    } else if ($(form[inputName + '[province]']).length) {
                        if (!form[inputName + '[province]'].value) {
                            util.alert($(this).attr("title") + '为必选项', ' ', function () {
                                $('.mui-district-picker-' + inputName).trigger('tap');
                            });
                            checksubmit = false;
                            return false;
                        }
                    } else {
                        if ($.trim(form[inputName].value) == "" && $(form[inputName]).attr("type") != 'radio' && !$(form[inputName]).next().val()) {
                            var msg = $(form[inputName]).siblings('.mui-calendar-picker' + inputkey).length ? '为必选项' : '不能为空';
                            util.alert($(this).attr("title") + msg, ' ', function () {
                                if (formtype == '3' || formtype == '4') {
                                    $(form[inputName]).focus();
                                }
                                $(form[inputName]).siblings('.mui-calendar-picker' + inputkey).trigger('tap')
                                $(form[inputName]).trigger('tap');
                            });
                            checksubmit = false;
                            return false;
                        } else if ($(form[inputName]).attr("type") == 'radio' && $('input:radio[name="' + inputName + '"]:checked').length == 0) {
                            util.alert($(this).attr("title") + '为必选项', ' ', function () {
                                $(form[inputName]).focus();
                                $(form[inputName]).trigger('tap');
                            });
                            checksubmit = false;
                            return false;
                        }
                    }
                } else {
                    inputName = "member[" + formtype + "]";
                    if ($(form[formtype]).val() == "" && (formtype == "education" || formtype == "constellation" || formtype == "zodiac" || formtype == "bloodtype")) {
                        util.alert($(this).attr("title") + '为必选项', ' ', function () {
                            $(form[formtype]).siblings('.mui-' + formtype + '-picker').trigger('tap')
                        });
                        checksubmit = false;
                        return false;
                    } else if ($.trim($(form[inputName]).val()) == "" && $(form[inputName]).length) {
                        util.alert($(this).attr("title") + '不能为空', ' ', function () {
                            $(form[inputName]).focus();
                        });
                        checksubmit = false;
                        return false;
                    } else {
                        var pattern = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
                        if (formtype == 'idcard' && !pattern.test($(form[inputName]).val())) {
                            util.alert($(this).attr("title") + '不合法', ' ', function () {
                                $(form[inputName]).focus();
                            });
                            checksubmit = false;
                            return false;
                        }
                    }
                }
                checksubmit = true;
            });
        } else {
            checksubmit = true;
        }
        //if (form['gender'].value=='') {
        //	util.alert('请选择您的性别', ' ', function() {
        //		$(".js-user-options").trigger('tap');
        //	});
        //	return false;
        //}
        if (checksubmit) {
            util.loading();
            $.ajax({
                type: 'GET',
                // url: "http://new.9dcm.net/app/index.php?i=3&c=entry&m=fx_activity&do=home&ac=join&op=validquota&activityid=78&optionid=0&teamnum=" + form['teamnum'].value,
                url: "http://localhost:8080/wechat/create_order?name=" + form['member[realname]'].value
                + "&phone=" + form['member[mobile]'].value
                + "&sex=" + form['form_item_val_0'].value
                + "&school=" + form['form_item_val_1'].value
                + "&grade=" + form['form_item_val_2'].value
                + "&father_name=" + form['form_item_val_3'].value
                + "&father_phone=" + form['form_item_val_4'].value
                + "&mother_name=" + form['form_item_val_5'].value
                + "&mother_phone=" + form['form_item_val_6'].value
                + "&hobby=" + form['form_item_val_7'].value
                + "&cost=" + form['cost'].value
                + "&course_id=" + form['course_id'].value
                + "&openId=" + form['openId'].value
                //
                ,
                dataType: 'json',
                async: false,
                success: function (data) {
                    setTimeout(function () {
                        util.loading().close();
                    }, 500);
                    if (!data.errno) {
                        checksubmit = true;
                    } else {
                        checksubmit = false;
                        setTimeout(function () {
                            util.alert(data.message, ' ', function () {
                                return false;
                            });
                        }, 450);
                    }
                },
                error: function () {
                    setTimeout(function () {
                        util.loading().close();
                    }, 500);
                    checksubmit = false;
                    setTimeout(function () {
                        util.alert('服务器加载错误, 请联系主办方', ' ', function () {
                            return false;
                        });
                    }, 450);
                }
            });
        }
        return checksubmit;
    }
</script>
<script>;</script>
<script type="text/javascript"
        src="http://new.9dcm.net/app/index.php?i=3&c=utility&a=visit&do=showjs&m=fx_activity"></script>
</body>
</html>
