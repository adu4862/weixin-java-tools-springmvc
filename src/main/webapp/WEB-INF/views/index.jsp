<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN" style="height: 100%;">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link href="http://qiniu1.huanxinchao.com/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="http://qiniu1.huanxinchao.com/common.css" rel="stylesheet" type="text/css">
    <link href="http://qiniu1.huanxinchao.com/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="http://qiniu1.huanxinchao.com/TouchSlide.1.1.js" type="text/javascript"></script>
    <script src="http://qiniu1.huanxinchao.com/jquery.min.1.8.2.js" type="text/javascript"></script>
    <script src="http://qiniu1.huanxinchao.com/TouchSlide.1.1.js" type="text/javascript"></script>
    <script src="https://cdn.bootcss.com/clipboard.js/1.5.1/clipboard.min.js"></script>
    <title>上杭县青少年学生校外活动中心</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/vant@2.2/lib/index.css">
    <style scoped>
        .van-search {
            position: fixed;
            width: 100%;
            top: 1.25rem;
            z-index: 1;
        }

        .prompt_name {
            margin-left: 10px;
            margin-top: 10px;
        }

        .van-search__content--round {
            background: #e5f3f3;
        }

        .van-cell-group {
            margin-top: 2.125rem;
            display: flex;
            justify-content: space-evenly;
            flex-wrap: wrap;
        }

        .cell {
            position: relative;
            width: 45%;
            text-align: left;
            margin-bottom: 0.25rem;
            padding: .2rem;
            border-radius: 4px;
            box-shadow: 0 1px 5px #f3f3f3;
        }

        .van-cell__title span {
            font-weight: 600;
            color: #008c8c;
        }

        .van-cell__title span i {
            font-weight: 400;
            font-size: .375rem;
            color: #969799;
        }

        .van-cell > i {
            position: absolute;
            top: 0;
            right: .175rem;
            font-size: .25rem;
            color: #f99e07;
        }

        .van-image {
            width: 100%;
        }

        .describeBox {
            display: flex;
            width: 100%;
            /*border: 1px solid red;*/
        }

        .describeBox div {
            /*flex: 1;*/
            font-size: 0.34375rem;
            font-family: MicrosoftYaHei-Bold;
            font-weight: normal;
            font-stretch: normal;
            margin-top: 0.15625rem;
            color: #3c3c3c;
        }

        .describeBox div:last-child {
            text-align: right;
            color: #fe0000;
        }

        .describeBox-img {
            width: 100%;
            /* border: 1px solid red; */
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: beige;
            height: 130px;
            border-radius: 5px;
        }

        .describeBox-img img {
            border-radius: 5px;
            height: 50px;
            width: 50px;
            /* height: 25px; */
        }

        .describeBox-img {
            display: flex;
        }

        .describeBox-img img {
        }
    </style>
</head>
<body style="height: 100%;">
<div class="container" style="height: 100%;position: relative">
    <div class="row">
        <div style="width: 100%;height: 25%">
            <img src="http://qiniu1.huanxinchao.com/%E5%B0%81%E9%9D%A211.png" style="height: 100%;width: 100%">
        </div>

        <!---->
        <section>
            <div class="index_content">
                <input id="foo" value="￥HSSHYfidmUN￥" style="display: none">
                <!--<div class="in_title_name">上杭县青少年学生校外活动中心 报名首页-->
                <!--</div>-->
                <div class="prompt_name"> 请选择您要报名的班级类型</div>
                <div data-v-1f31456b="" class="van-cell-group">
                    <a href="${urlWithOpenId1}" data-v-1f31456b="" class="cell  van-cell--clickable">
                        <div data-v-1f31456b="" class="describeBox-img"><img data-v-1f31456b=""
                                                                             src="http://qiniu1.huanxinchao.com/J-yishu.png">
                        </div>
                        <div data-v-1f31456b="" class="describeBox">
                            <div data-v-1f31456b="" style="font-size: 1rem">艺术类(上午)</div>
                            <div data-v-1f31456b=""></div>
                        </div>
                    </a>
                    <a href="${urlWithOpenId2}" data-v-1f31456b="" class="cell  van-cell--clickable">
                        <div data-v-1f31456b="" class="describeBox-img"><img data-v-1f31456b=""
                                                                             src="http://qiniu1.huanxinchao.com/J-yishu.png">
                        </div>
                        <div data-v-1f31456b="" class="describeBox">
                            <div data-v-1f31456b="" style="font-size: 1rem" style="font-size: 1rem">艺术类(下午)</div>
                            <div data-v-1f31456b=""></div>
                        </div>
                    </a>
                    <a href="${urlWithOpenId3}" data-v-1f31456b="" class="cell  van-cell--clickable">
                        <div data-v-1f31456b="" class="describeBox-img"><img data-v-1f31456b=""
                                                                             src="http://qiniu1.huanxinchao.com/I-wenxue.png">
                        </div>
                        <div data-v-1f31456b="" class="describeBox">
                            <div data-v-1f31456b="" style="font-size: 1rem">文化类（上午）</div>
                            <div data-v-1f31456b=""></div>
                        </div>
                    </a>
                    <a href="${urlWithOpenId4}" data-v-1f31456b="" class="cell  van-cell--clickable">
                        <div data-v-1f31456b="" class="describeBox-img"><img data-v-1f31456b=""
                                                                             src="http://qiniu1.huanxinchao.com/I-wenxue.png">
                        </div>
                        <div data-v-1f31456b="" class="describeBox">
                            <div data-v-1f31456b="" style="font-size: 1rem">文化类(下午)</div>
                            <div data-v-1f31456b=""></div>
                        </div>
                    </a>
                </div>
                <%--<div class="">--%>
                <%--<ul class="clearfix">--%>
                <%--<li class="similar-li "><a href="${urlWithOpenId1}" onclick="" class="color_similar btn copyBtn"--%>
                <%--data-clipboard-action="copy" data-clipboard-target="#foo"><img--%>
                <%--src="http://qiniu1.huanxinchao.com/J-yishu.png" width="100%">--%>
                <%--<h3>艺术类(上午)</h3></a></li>--%>
                <%--<li class="similar-li "><a href="${urlWithOpenId2}" onclick=""--%>
                <%--class="color1_similar btn copyBtn" data-clipboard-action="copy"--%>
                <%--data-clipboard-target="#foo"><img--%>
                <%--src="http://qiniu1.huanxinchao.com/icon_Scenic.png" width="100%">--%>
                <%--<h3> 艺术类(下午)</h3></a></li>--%>
                <%--<li class="similar-li "><a href="${urlWithOpenId3}" onclick=""--%>
                <%--class="color2_similar btn copyBtn" data-clipboard-action="copy"--%>
                <%--data-clipboard-target="#foo"><img--%>
                <%--src="http://qiniu1.huanxinchao.com/icon_spa.png" width="100%">--%>
                <%--<h3>文化类（上午）</h3></a></li>--%>
                <%--<li class="similar-li "><a href="${urlWithOpenId4}" onclick=""--%>
                <%--class="color3_similar btn copyBtn" data-clipboard-action="copy"--%>
                <%--data-clipboard-target="#foo"><img--%>
                <%--src="http://qiniu1.huanxinchao.com/icon_spa.png" width="100%">--%>
                <%--<h3>文化类(下午)</h3></a></li>--%>
                <%--</ul>--%>
                <%--</div>--%>
                <!--切换-->

            </div>
            <!---->
        </section>

    </div>

    <div style="width: 100%;position: absolute;margin-top: 30px;margin-bottom: 20px" data-v-01db9b24="" class=" footend-container">
        <a href="http://www.beian.miit.gov.cn" data-v-01db9b24="" class="footend"
             style="display: flex;
    align-items: center;
    justify-content: center;">闽ICP备18013532号 &nbsp;©2018-2020
        </a>
    </div>
</div>
<script>
    var clipboard = new Clipboard('.btn');
    clipboard.on('success', function (e) {
        console.log(e);
        e.clearSelection();
    });
    clipboard.on('error', function (e) {
    });
</script>

</body>
</html>
