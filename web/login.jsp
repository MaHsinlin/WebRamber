<%--
  Created by IntelliJ IDEA.
  User: AlbusDumbledore
  Date: 2019/2/15 0015
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>登录 | WebRamber</title>
    <link rel="shortcut icon" href="./img/favicon48.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./script/layui/css/layui.css">
    <script src="./script/layui/layui.js"></script>
    <script src="./script/jquery.js"></script>
</head>
<body style="background-color: #f0f0f0">
<img src="./img/login_register/logo_big.png" style="width: 16%;margin-left: 42%;margin-top: 5%">
<form class="layui-form" action="" onsubmit="return false">
    <div class="layui-form-item" style="width: 28%;margin-left: 28%;height: 3rem;margin-top: 2.4rem;">
        <div class="layui-input-block" style="height: 100%;width: 100%">
            <input id="mail" style="height: 100%;width: 100%;border-radius: 1.4rem" type="text" name="title" placeholder="邮箱地址" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="width: 56%;margin-left: 28%;height: 3rem;margin-top: 1.2rem">
        <div class="layui-input-block" style="height: 100%;width: 50%">
            <input id="pwd" style="height: 100%;border-radius: 1.4rem" type="password" name="password" placeholder="密码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="width: 28%;margin-left: 28%;height: 2.2rem;margin-top: 1.2rem">
        <div class="layui-input-block" style="height: 100%;width: 100%">
            <button style="height: 100%;width: 100%;border-radius: 1rem;background-color: #4e7af7" class="layui-btn" onclick="login()">立即登录</button>
        </div>
    </div>
    <div class="layui-form-item" style="width: 28%;margin-left: 28%;height: 2.2rem;margin-top: 1.2rem">
        <div class="layui-input-block" style="height: 100%;width: 100%">
            <a href="./register.jsp" style="float: left">注册</a>
            <a href="./forget.jsp" style="float: right">忘记密码</a>
        </div>
    </div>
    <div class="layui-form-item" style="width: 28%;margin-left: 28%;height: 1rem;margin-top: 1.2rem">
        <div class="layui-input-block" style="height: 100%;width: 100%">
            <hr style="width: 100%;background-color: #d9d9d9">
        </div>
    </div>
    <div class="layui-form-item" style="width: 28%;margin-left: 28%;height: 1rem;margin-top: 0.6rem">
        <div class="layui-input-block" style="height: 100%;width: 100%;text-align: center;font-size: 0.5rem">
            使用WebRamber表示您已阅读和同意&nbsp
            <a href="./serviceterm.jsp">服务协议</a>
        </div>
    </div>
</form>
</body>
<script>
    //立即登录onclick
    function login() {
        var mail = document.getElementById("mail").value;
        var pwd = document.getElementById("pwd").value;
        var mailreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
        if (mail == ""){
            layui.use('layer',function () {
                var layer = layui.layer;
                layer.msg("请填写邮箱地址");
            });
        } else if (pwd == ""){
            layui.use('layer',function () {
                var layer = layui.layer;
                layer.msg("请填写密码");
            });
        } else if (!mailreg.test(mail)){
            layui.use('layer',function () {
                var layer = layui.layer;
                layer.msg("提示：请输入有效邮箱地址");
            });
        } else {
            //测试跳转页面
            window.location.href="./diagrams.jsp?mail="+mail;
            $.ajax(
                {
                    url: "user/login",
                    type: "POST",
                    dataType: "json",
                    data: { mail: mail, pwd: pwd},
                    success: function (result) {
                        var obj = result.responseJSON;
                        layui.use('layer',function () {
                            var layer = layui.layer;
                            layer.msg(obj);
                        });
                        if (obj == "ok"){

                        } else {
                            layui.use('layer',function () {
                                var layer = layui.layer;
                                layer.msg("账号或密码错误");
                            });
                        }
                    },
                    error: function (err) {

                    }
                });
        }
    }
</script>
</html>
