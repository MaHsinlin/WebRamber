<%--
  Created by IntelliJ IDEA.
  User: AlbusDumbledore
  Date: 2019/3/2 0002
  Time: 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WebRamber - 关于我们</title>
    <link rel="shortcut icon" href="./img/favicon48.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="./script/layui/css/layui.css">
    <script src="./script/layui/layui.js"></script>
    <script src="./script/jquery.js"></script>
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
<body style="background-color: #f0f0f0;margin: 0;padding: 0">
<%--导航栏开始--%>
<div class="layui-row" style="background-color: #ffffff;height: 3rem">
    <%--左上角logo开始--%>
    <div class="layui-col-md5" style="height: 100%">
        <div style="width: 2px;height: 24%"></div>
        <a href="./index.jsp">
            <img src="./img/index/logo.png" style="height:60%;margin-left: 1.6%">
        </a>
    </div>
    <%--左上角logo结束--%>
    <%--右上角按钮开始--%>
    <div style="height: 100%;float: right">
        <ul style="height: 100%">
            <li style="height: 100%;float: left;width: 6rem;line-height: 3rem">
                <a href="" style="color: black">入门教程</a>
            </li>
            <li style="height: 100%;float: left;width: 6rem;line-height: 3rem;margin-right: 1rem">
                <a href="./diagrams.jsp" style="color: black">进入我的文件</a>
            </li>
        </ul>
    </div>
    <%--右上角按钮结束--%>
</div>
<%--导航栏结束--%>
<%--正文开始--%>
<div style="background-color: #f0f0f0;width: 100%;padding-top: 2rem;padding-bottom: 3rem">
    <b>
        <p style="width: 100%;text-align: center;font-size: 1.5rem">
            关于我们
        </p>
    </b>
    <h1 style="width: 100%;text-align: center;font-size: 1rem;color: #000000;margin-top: 1rem">
        我们的目标是成为您最挚爱的网页制作工具，并为此不断努力
    </h1>
    <p style="margin-top: 2rem;text-indent: 1.8rem;font-size: 0.9rem;width: 70%;margin-left: 15%;line-height: 1.7rem;color: #444444">
        WebRamber 隶属于江西XXXX有限公司，是一款专业在线网页制作工具和分享社区。它支持大部分静态网页元素生成,如div、button、img、ul、input、table等。WebRamber 为思维视觉化提供了更多可能。 除了工具属性外，WebRamber 也是一个分享社区，用户将自己有价值的作品发布到WebRamber平台，与相关行业大V在站内进行交流。
    </p>
    <p style="margin-top: 0rem;text-indent: 1.8rem;font-size: 0.9rem;width: 70%;margin-left: 15%;line-height: 1.7rem;color: #444444">
        实践胜千言，符合WebRamber的价值愿景。
    </p>
    <br>
    <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;width: 70%;margin-left: 15%;line-height: 1.7rem;color: #bfbfbf">
        联系电话 : 0731-XXXXXXXX  QQ群 : XXXXXXXXX  邮箱: support@webramber.com
    </p>
    <p style="text-indent: 1.8rem;font-size: 0.9rem;width: 70%;margin-left: 15%;line-height: 1.7rem;color: #bfbfbf">
        公司地址 : 江西省南昌市XXXXXXXXXXXXX
    </p>
</div>
<%--正文结束--%>
<%--footer开始--%>
<div style="background-color: #ffffff;height: 40%;width: 100%;padding-top: 2.5rem">
    <p style="width: 100%;text-align: center;font-size: 1.2rem;color: #555">
        WenRamber，简易生成网页，实时修改
    </p>
    <div style="width: 100%;margin-top: 1.3rem">
        <span style="margin-top: 3rem;text-align: center;width: 40%;margin-left: 40%;color: #333">
            <a href="./index.jsp">首页</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
            <a href="">推荐</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
            <a href="">关于我们</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
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
</html>
