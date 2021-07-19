<%--
  Created by IntelliJ IDEA.
  User: AlbusDumbledore
  Date: 2019/2/13 0013
  Time: 22:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WebRamber - 网页辅助生成系统</title>
    <link rel="shortcut icon" href="./img/favicon48.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./script/layui/css/layui.css">
    <style>
        /** 滚动条 **/
        ::-webkit-scrollbar {
            width: 10px;
            height: 10px;
        }

        ::-webkit-scrollbar-button:vertical {
            display: none;
        }

        ::-webkit-scrollbar-track, ::-webkit-scrollbar-corner {
            background-color: #e2e2e2;
        }

        ::-webkit-scrollbar-thumb {
            border-radius: 0;
            background-color: rgba(0, 0, 0, .3);
        }

        ::-webkit-scrollbar-thumb:vertical:hover {
            background-color: rgba(0, 0, 0, .35);
        }

        ::-webkit-scrollbar-thumb:vertical:active {
            background-color: rgba(0, 0, 0, .38);
        }
    </style>
</head>
<body style="background-color: #ffffff;margin: 0;padding: 0">
<%--<img src="./img/index/WAGS_login_bg.png" style="position: absolute"></img>--%>
<%--导航栏开始--%>
<div class="layui-row" style="background-color: #ffffff;height: 3rem">
    <%--左上角logo开始--%>
    <div class="layui-col-md6" style="height: 100%">
        <div style="width: 2px;height: 24%"></div>
        <a href="./index.jsp">
            <img src="./img/index/logo.png" style="height:70%;margin-left: 1.6%">
        </a>
    </div>
    <%--左上角logo结束--%>
    <%--登录注册开始--%>
    <div class="layui-col-md6" style="height: 100%">
        <ul class="layui-nav" style="float: right;background-color: #ffffff">
            <li class="layui-nav-item">
                <a href="./login.jsp" style="color: black">登录</a>
            </li>
            <li class="layui-nav-item">
                <a href="./register.jsp" style="color: black">注册</a>
            </li>
        </ul>
    </div>
    <%--登录注册结束--%>
</div>
<%--导航栏结束--%>
<%--第一栏开始--%>
<div style="background-color: #f0f0f0;height: 68%;width: 100%;margin-top: 0.75rem;padding-top: 4rem">
    <h1 style="width: 100%;text-align: center;font-size: 2.7rem">
        简易生成网页，实时修改
    </h1>
    <h1 style="width: 100%;text-align: center;font-size: 0.9rem;color: #444;margin-top: 1.5rem">
        WebRamber支持大部分静态网页元素生成,如div、button、img、ul、input、table等
    </h1>
    <img src="./img/index/display1.JPG" style="margin-top: 3rem;background-color: #00a2d4;width: 40%;height: auto;margin-left: 30%">
</div>
<%--第一栏结束--%>
<%--第二栏开始--%>
<div style="background-color: #ffffff;height: 84%;width: 100%;padding-top: 1.5rem">
    <h1 style="width: 100%;text-align: center;font-size: 1.6rem">
        高效易用、轻松生成
    </h1>
    <h1 style="width: 100%;text-align: center;font-size: 0.9rem;color: #444;margin-top: 1.5rem">
        WebRamber是一个在线制作网页的聚合平台，它可以在线设计或拖拽各类元素以制作您想要的页面，
    </h1>
    <h1 style="width: 100%;text-align: center;font-size: 0.9rem;color: #444;margin-top: 0.1rem">
        您无需担心下载和更新的问题，不管Mac还是Windows，一个浏览器就可以随时随地的发挥创意，规划工作
    </h1>
    <img src="./img/index/display2.png" style="margin-top: 3rem;width: 40%;height: auto;margin-left: 30%">
</div>
<%--第二栏结束--%>
<%--第三栏开始--%>
<div style="background-color: #f0f0f0;height: 84%;width: 100%;padding-top: 1.5rem">
    <h1 style="width: 100%;text-align: center;font-size: 1.6rem">
        团队协作、头脑风暴
    </h1>
    <h1 style="width: 100%;text-align: center;font-size: 0.9rem;color: #444;margin-top: 1.5rem">
        您可以把作品分享给团队成员或好友，无论何时何地大家都可以对作品进行编辑、阅读和评论
    </h1>
    <img src="./img/index/display3.png" style="margin-top: 3rem;background-color: #00a2d4;width: 40%;height: auto;margin-left: 30%">
</div>
<%--第三栏结束--%>
<%--footer开始--%>
<div style="background-color: #ffffff;height: 40%;width: 100%;padding-top: 2.5rem">
    <p style="width: 100%;text-align: center;font-size: 1.2rem;color: #555">
        WenRamber，简易生成网页，实时修改
    </p>
    <div style="width: 100%;margin-top: 1.3rem">
        <span style="margin-top: 3rem;text-align: center;width: 40%;margin-left: 40%;color: #333">
            <a href="./index.jsp">首页</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
            <a href="">推荐</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
            <a href="./aboutus.jsp">关于我们</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
            <a href="./serviceterm.jsp">服务条款</a>
        </span>
    </div>
    <div style="width: 100%;margin-top: 1.3rem;color: #777">
        <div style="width: 50%;float: left">
            <div style="margin-left: 50%">联系方式 : QQ1627707178</div>
            <div style="margin-left: 50%;margin-top: 1.1rem">邮&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp箱 : <a>support@webramber.com</a></div>
            <div style="margin-left: 50%;margin-top: 1.1rem">电&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp话 : <a>13672222492</a></div>
            <div style="margin-left: 50%;margin-top: 1.1rem">江西XXXX有限公司&nbsp©2019&nbsp赣ICP备00000000号-0</div>
        </div>
        <div style="width: 40%;float: left">
            <img src="img/index/2Dcode.png" style="height: 6rem;margin-left: 40%">
            <div style="color: black;margin-left: 43.5%;margin-top: 0.4rem">关注微信</div>
        </div>
    </div>
</div>
<%--footer结束--%>
</body>
<script src="./srcipt/layui/layui.js"></script>
</html>
