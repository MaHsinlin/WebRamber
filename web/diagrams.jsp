<%--
  Created by IntelliJ IDEA.
  User: AlbusDumbledore
  Date: 2019/2/23 0023
  Time: 23:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WebRamber - 我的文件</title>
    <link rel="shortcut icon" href="./img/favicon48.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="./script/layui/css/layui.css">
    <script src="./script/layui/layui.js"></script>
    <script src="./script/jquery.js"></script>
    <style>
        body .layui-nav .layui-nav-more {
            display: none
        }
    </style>
</head>
<body style="background-color: #f0f0f0;margin: 0;padding: 0;overflow-y: hidden;overflow-x: hidden">
<%--<img src="./img/index/WAGS_login_bg.png" style="position: absolute"></img>--%>
<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief"
     style="height: 100%;background-color: white;margin: 0px">
    <%--导航栏开始--%>
    <%--左上角logo开始--%>
    <div style="height: 3rem;width: 100%">
        <div class="layui-col-md5" style="height: 100%;z-index: 10">
            <div style="width: 2px;height: 24%"></div>
            <a href="./diagrams.jsp">
                <img src="./img/index/logo.png" style="height:60%;margin-left: 1.6%">
            </a>
        </div>
        <ul class="layui-tab-title" style="border-color: transparent;height: 100%">
            <li class="layui-this" style="height: 100%">个人作品</li>
            <li style="height: 100%">推荐作品</li>
        </ul>
        <ul class="layui-nav" lay-filter=""
            style="position: absolute;right: 1rem;top: 0;font-size: 0.8rem;line-height: 3rem;height: 3rem;background-color: white">
            <li class="layui-nav-item" style="height: 100%;line-height: 3rem;">
                <img src="./img/index/logo.png"
                     style="height: 2rem;width: 2rem;border-radius: 2rem;float: right;margin-top: 0.5rem">
                <a href="javascript:;" id="usernickname" style="height: 100%;color: black;float: right;width: 0"></a>
                <dl class="layui-nav-child" style="top: 3rem">
                    <dd><a href="./diagrams.jsp">个人文件</a></dd>
                    <dd><a href="">账户中心</a></dd>
                    <dd><a href="">个人主页</a></dd>
                    <dd><a href="./help_info.jsp">入门教程</a></dd>
                    <dd><a href="">更新日志</a></dd>
                    <dd><a href="./index.jsp">退出登录</a></dd>
                </dl>
            </li>
        </ul>
    </div>
    <%--导航栏结束--%>
    <div class="layui-tab-content" style="width: 100%;height: 92.5%;margin: 0;padding: 0">
        <%--选项卡1：个人作品开始--%>
        <div class="layui-tab-item layui-show" style="width: 100%;height: 100%;background-color: #f0f0f0">
            <%--选项卡1：个人作品左侧导航栏开始--%>
            <div style="width: 20%;height: 100%;float: left">
                <button class="layui-btn" onclick="newfile()"
                        style="margin-top: 1.5rem;width: 40%;margin-left: 30%;height: 2.1rem;line-height: 2.1rem">
                    <i class="layui-icon">&#xe608;</i> 新建
                </button>
                <button id="myPackage" onclick="leftbutton(this)"
                        style="margin-top: 1.5rem;width: 40%;margin-left: 30%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #515151">
                    <i class="layui-icon layui-icon-home"></i> &nbsp&nbsp我的文件
                </button>
                <button id="history" onclick="leftbutton(this)"
                        style="margin-top: 1.1rem;width: 40%;margin-left: 30%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #bfbfbf">
                    <i class="layui-icon layui-icon-log"></i> &nbsp&nbsp最近修改
                </button>
                <button id="cooperation" onclick="leftbutton(this)"
                        style="margin-top: 1.1rem;width: 40%;margin-left: 30%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #bfbfbf">
                    <i class="layui-icon layui-icon-user"></i> &nbsp&nbsp合作文件
                </button>
                <button id="collect" onclick="leftbutton(this)"
                        style="margin-top: 1.1rem;width: 40%;margin-left: 30%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #bfbfbf">
                    <i class="layui-icon layui-icon-rate"></i> &nbsp&nbsp我的收藏
                </button>
                <button id="recycle" onclick="leftbutton(this)"
                        style="margin-top: 1.1rem;width: 40%;margin-left: 30%;height: 2.1rem;line-height: 2.1rem;background: none;border: none;cursor: pointer;color: #bfbfbf">
                    <i class="layui-icon layui-icon-delete"></i> &nbsp&nbsp回收项目
                </button>
                <div style="position: absolute;bottom: 0.7rem;width: 20%;left: 0rem">
                    <div style="height: 1rem;line-height: 1rem;color: #707070;margin-bottom: 0.5rem;width: 90%;margin-left: 5%">
                        <p style="float: left">文件数&nbsp&nbsp</p>
                        <p id="file_num" style="float: left"></p>
                        <p style="float: left">&nbsp/&nbsp20</p>
                    </div>
                    <div class="layui-progress" lay-filter="userfile_num_progress"
                         style="margin-bottom: 1rem;width: 90%;margin-left: 5%">
                        <div class="layui-progress-bar layui-bg-red" lay-percent="10/20"></div>
                    </div>
                    <div style="margin-bottom: 0.2rem;width: 90%;margin-left: 5%">
                        <button onclick="help_info()"
                                style="background: none;border: none;cursor: pointer;color: #707070">帮助手册
                        </button>
                        &nbsp&nbsp
                        <button onclick="feedback()"
                                style="background: none;border: none;cursor: pointer;color: #bfbfbf">反馈
                        </button>
                    </div>
                    <div style="width: 90%;margin-left: 5%">
                        <button onclick="serviceterm()"
                                style="background: none;border: none;cursor: pointer;color: #bfbfbf">服务条款
                        </button>
                        &nbsp&nbsp
                        <button onclick="aboutus()"
                                style="background: none;border: none;cursor: pointer;color: #bfbfbf">关于我们
                        </button>
                    </div>
                </div>
            </div>
            <%--选项卡1：个人作品左侧导航栏结束--%>
            <%--选项卡1：个人作品右部作品预览开始--%>
            <div style="width: 80%;height: 100%;float: left;background-color: #f0f0f0">
                <div style="margin-left: 1rem;margin-top: 1rem;color: #515151;font-size: 1rem">我的文件</div>
                <div style="margin-left: 1rem;margin-top: 1rem;color: #BFBFBF;font-size: 0.7rem">文件</div>
            </div>
            <%--选项卡1：个人作品右部作品预览结束--%>
        </div>
        <%--选项卡1：个人作品结束--%>
        <%--选项卡2：推荐作品开始--%>
        <div class="layui-tab-item" style="width: 100%;height: 100%;background-color: #f0f0f0">

        </div>
        <%--选项卡2：推荐作品结束--%>
    </div>
</div>

</body>
<script>
    //用户的文件数，初始化数值为0<------
    var file_num = 0;
    //获取文件数

    //给页面文件数赋值!!给进度条赋值归并进入下方element模块内部
    document.getElementById("file_num").innerHTML = file_num;

    //elemeny调用 layui依赖组件 <-----!!!!tab、进度条等均依赖!!!!
    layui.use('element', function () {
        var element = layui.element;
        //一些事件监听
        element.on('tab(demo)', function (data) {
            console.log(data);
        });
        //给进度条赋值
        var user_progress = file_num / 20;
        element.progress('userfile_num_progress', toPercent(user_progress));
    });

    //将小数转换为百分数，为了适配进度条函数   !!!重要 进度条组件重载严重依赖
    function toPercent(point) {
        if (point == 0) {
            return 0;
        }
        var str = Number(point * 100).toFixed();
        str += "%";
        return str;
    }

    //获取上个页面提交的用户信息!!!!最高重要级别<----------
    function getUrlString(name) {
        var result = window.location.search.match(new RegExp("[\?\&]" + name + "=([^\&]+)", "i"));
        if (result == null || result.length < 1) {
            return "";
        }
        return result[1];
    }

    //更改昵称，当前设计暂不需要，应保留
    var usernickname = getUrlString("mail");
    //    document.getElementById("usernickname").innerHTML = usernickname;

    //个人文件左侧按钮onclick，改变按钮样式，并改变右侧div
    function leftbutton(btn) {
        document.getElementById("myPackage").style.color = "#bfbfbf";
        document.getElementById("history").style.color = "#bfbfbf";
        document.getElementById("cooperation").style.color = "#bfbfbf";
        document.getElementById("collect").style.color = "#bfbfbf";
        document.getElementById("recycle").style.color = "#bfbfbf";
        btn.style.color = "#515151";

    }

    //帮助手册按钮onclick
    function help_info() {
        window.location.href = "./help_info.jsp";
    }
    //反馈按钮onclick
    function feedback() {
        layui.use('layer', function () {
            var layer = layui.layer;
            layer.open({
                type: 2,
                title: '感谢您的反馈',
                shadeClose: false,
                shade: [0.8, '#393D49'],
                maxmin: true, //开启最大化最小化按钮
                area: ['31rem', '23rem'],
                content: './feedback.jsp'
            });
        });
    }
    //服务条款按钮onclick
    function serviceterm() {
        window.location.href = "./serviceterm.jsp";
    }
    //关于我们按钮onclick
    function aboutus() {
        window.location.href = "./aboutus.jsp";
    }

    //新建文件onclick
    function newfile() {
        //检查文件是否超过上限
        if (file_num == 20) {
            layui.use('layer', function () {
                var layer = layui.layer;
                layer.confirm('您的文件数量不足，无法创建新的文件',
                    {
                        title: '请确认',
                        icon: 2,
                        btn: ['确认', '取消'] ,
                        funtion:{

                        }
                    }
                );
            });
        }
        //创建新文件
        else {
            window.open('./workshop.jsp');
        }
    }
</script>
</html>
