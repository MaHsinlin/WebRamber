<%--
  Created by IntelliJ IDEA.
  User: AlbusDumbledore
  Date: 2019/3/2 0002
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WebRamber - 帮助手册</title>
    <link rel="shortcut icon" href="./img/favicon48.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="./script/layui/css/layui.css">
    <script src="./script/layui/layui.js"></script>
    <script src="./script/jquery.js"></script>
    <style>
        body .layui-nav .layui-nav-more {
            display: none
        }

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
<body style="background-color: #f0f0f0;margin: 0;padding: 0;overflow-y: hidden;overflow-x: hidden">
<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief"
     style="height: 100%;background-color: white;margin: 0px">
    <%--导航栏开始--%>
    <%--左上角logo开始--%>
    <div style="height: 3rem;width: 100%">
        <div class="layui-col-md5" style="height: 100%;float: left">
            <div style="width: 2px;height: 24%"></div>
            <a href="./index.jsp">
                <img src="./img/index/logo.png" style="height:60%;margin-left: 1.6%">
            </a>
        </div>
        <button style="float: left;margin-left: 5%;height: 3rem;line-height: 3rem;background: none;border: none;cursor: pointer;color: #11b1bf">
            帮助中心
        </button>
    </div>
    <%--导航栏结束--%>
    <div class="layui-tab-content" style=";width: 100%;height: 92.5%;margin: 0;padding: 0;background-color: #f0f0f0">
        <%--左侧导航栏开始--%>
        <div style="width: 20%;height: 100%;float: left;overflow-y: scroll">
            <button id="help1" onclick="title_changecolor(this)"
                    style="text-align: left;margin-top: 1.5rem;width: 40%;margin-left: 10%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #4e7af7">
                简介
            </button>
            <br>
            <button style="text-align: left;margin-top: 0rem;width: 40%;margin-left: 10%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #bfbfbf">
                使用手册
            </button>
            <br>
            <button id="help2" onclick="title_changecolor(this)"
                    style="text-align: left;margin-top: 0rem;width: 40%;margin-left: 10%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #515151">
                1 开始使用
            </button>
            <br>
            <button id="help3" onclick="title_changecolor(this)"
                    style="text-align: left;margin-top: 0rem;width: 40%;margin-left: 19%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #515151">
                1.1&nbsp注册账号
            </button>
            <br>
            <button id="help4" onclick="title_changecolor(this)"
                    style="text-align: left;margin-top: 0rem;width: 40%;margin-left: 19%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #515151">
                1.2&nbsp个人设置
            </button>
            <br>
            <button id="help5" onclick="title_changecolor(this)"
                    style="text-align: left;margin-top: 0rem;width: 40%;margin-left: 10%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #515151">
                2 开始使用
            </button>
            <br>
            <button id="help6" onclick="title_changecolor(this)"
                    style="text-align: left;margin-top: 0rem;width: 40%;margin-left: 19%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #515151">
                2.1&nbsp注册账号
            </button>
            <br>
            <button id="help7" onclick="title_changecolor(this)"
                    style="text-align: left;margin-top: 0rem;width: 40%;margin-left: 19%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #515151">
                2.2&nbsp个人设置
            </button>
            <br>
            <button id="help8" onclick="title_changecolor(this)"
                    style="text-align: left;margin-top: 0rem;width: 40%;margin-left: 19%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #515151">
                2.3&nbsp注册账号
            </button>
            <br>
            <button id="help9" onclick="title_changecolor(this)"
                    style="text-align: left;margin-top: 0rem;width: 40%;margin-left: 19%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #515151">
                2.4&nbsp个人设置
            </button>
            <br>
            <button id="help10" onclick="title_changecolor(this)"
                    style="text-align: left;margin-top: 0rem;width: 40%;margin-left: 19%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #515151">
                2.5&nbsp注册账号
            </button>
            <br>
            <button id="help11" onclick="title_changecolor(this)"
                    style="text-align: left;margin-top: 0rem;width: 40%;margin-left: 19%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #515151">
                2.6&nbsp个人设置
            </button>
            <br>
            <button id="help12" onclick="title_changecolor(this)"
                    style="text-align: left;margin-top: 0rem;width: 40%;margin-left: 19%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #515151">
                2.7&nbsp注册账号
            </button>
            <br>
            <button id="help13" onclick="title_changecolor(this)"
                    style="text-align: left;margin-top: 0rem;width: 40%;margin-left: 19%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #515151">
                2.8&nbsp个人设置
            </button>
            <br>
            <button id="help14" onclick="title_changecolor(this)"
                    style="text-align: left;margin-top: 0rem;width: 40%;margin-left: 10%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #515151">
                3 开始使用
            </button>
            <br>
            <button id="help15" onclick="title_changecolor(this)"
                    style="text-align: left;margin-top: 0rem;width: 40%;margin-left: 19%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #515151">
                3.1&nbsp注册账号
            </button>
            <br>
            <button id="help16" onclick="title_changecolor(this)"
                    style="text-align: left;margin-top: 0rem;width: 40%;margin-left: 19%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #515151">
                3.2&nbsp个人设置
            </button>
            <br>
            <button id="help17" onclick="title_changecolor(this)"
                    style="text-align: left;margin-top: 0rem;width: 40%;margin-left: 19%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #515151">
                3.3&nbsp注册账号
            </button>
            <br>
            <button id="help18" onclick="title_changecolor(this)"
                    style="text-align: left;margin-top: 0rem;width: 40%;margin-left: 19%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #515151">
                3.4&nbsp个人设置
            </button>
            <br>
            <button id="help19" onclick="title_changecolor(this)"
                    style="text-align: left;margin-top: 0rem;width: 40%;margin-left: 19%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #515151">
                3.5&nbsp注册账号
            </button>
            <br>
            <button id="help20" onclick="title_changecolor(this)"
                    style="text-align: left;margin-top: 0rem;width: 40%;margin-left: 19%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #515151">
                3.6&nbsp个人设置
            </button>
            <br>
            <button id="help21" onclick="title_changecolor(this)"
                    style="text-align: left;margin-top: 0rem;width: 40%;margin-left: 19%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #515151">
                3.7&nbsp注册账号
            </button>
            <br>
            <button id="help22" onclick="title_changecolor(this)"
                    style="text-align: left;margin-top: 0rem;width: 40%;margin-left: 19%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #515151">
                3.8&nbsp个人设置
            </button>
        </div>
        <%--左侧导航栏结束--%>
        <%--右部开始--%>
        <div style="width: 80%;height: 100%;float: left;background-color: #f8f8f8">
            <%--简介开始--%>
            <div style="width: 100%;height: 100%">

            </div>
            <%--简介结束--%>
        </div>
        <%--右部结束--%>
    </div>
</div>
</body>
<script>
    //左侧导航栏变色事件
    function title_changecolor(btn) {
        for (var help_num = 1;help_num<=22;help_num++){
            document.getElementById("help"+help_num).style.color = "#515151";
        }
        btn.style.color = "#4E7AF7";
    }

</script>
</html>
