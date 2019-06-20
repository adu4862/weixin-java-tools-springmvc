<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
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
</head>
<body>
<div class="container">
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

                <div class="">
                    <ul class="clearfix">
                        <li class="similar-li "><a href="${urlWithOpenId1}"  onclick="" class="color_similar btn copyBtn"  data-clipboard-action="copy" data-clipboard-target="#foo"><img
                            src="http://qiniu1.huanxinchao.com/icon_Scenic.png" width="100%">
                            <h3>艺术类(上午)</h3></a></li>
                        <li class="similar-li "><a href="${urlWithOpenId2}"  onclick="" class="color1_similar btn copyBtn" data-clipboard-action="copy" data-clipboard-target="#foo"><img
                            src="http://qiniu1.huanxinchao.com/icon_Scenic.png" width="100%">
                            <h3> 艺术类(下午)</h3></a></li>
                        <li class="similar-li "><a href="${urlWithOpenId3}"  onclick="" class="color2_similar btn copyBtn" data-clipboard-action="copy" data-clipboard-target="#foo"><img
                            src="http://qiniu1.huanxinchao.com/icon_spa.png" width="100%">
                            <h3>文化类（上午）</h3></a></li>
                        <li class="similar-li "><a href="${urlWithOpenId4}"  onclick="" class="color3_similar btn copyBtn" data-clipboard-action="copy" data-clipboard-target="#foo"><img
                            src="http://qiniu1.huanxinchao.com/icon_spa.png" width="100%">
                            <h3>文化类(下午)</h3></a></li>
                    </ul>
                </div>
                <!--切换-->

            </div>
            <!---->
        </section>

    </div>
</div>
<script>
    var clipboard = new Clipboard('.btn');
    clipboard.on('success', function(e){
        console.log(e);
        e.clearSelection();
    });
    clipboard.on('error', function(e){
    });
</script>

</body>
</html>
