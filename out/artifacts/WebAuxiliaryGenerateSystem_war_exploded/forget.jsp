<%--
  Created by IntelliJ IDEA.
  User: AlbusDumbledore
  Date: 2019/2/23 0023
  Time: 22:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>忘记密码 | WebRamber</title>
    <link rel="shortcut icon" href="./img/favicon48.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./script/layui/css/layui.css">
    <script src="./srcipt/layui/layui.js"></script>
</head>
<body style="background-color: #f0f0f0">
<img src="./img/login_register/logo_big.png" style="width: 16%;margin-left: 42%;margin-top: 5%">
<form class="layui-form" action="">
    <div class="layui-form-item" style="width: 28%;margin-left: 28%;height: 3rem;margin-top: 2.4rem;">
        <div class="layui-input-block" style="height: 100%;width: 100%">
            <input style="height: 100%;width: 100%;border-radius: 1.4rem" type="text" name="title" required  lay-verify="required" placeholder="邮箱地址" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="width: 28%;margin-left: 28%;height: 2.2rem;margin-top: 1.2rem">
        <div class="layui-input-block" style="height: 100%;width: 100%">
            <button style="height: 100%;width: 100%;border-radius: 1rem;background-color: #4e7af7" class="layui-btn" lay-submit lay-filter="formDemo">重置密码</button>
        </div>
    </div>
    <div class="layui-form-item" style="width: 28%;margin-left: 28%;height: 2.2rem;margin-top: 1.2rem">
        <div class="layui-input-block" style="height: 100%;width: 100%">
            <a href="./register.jsp" style="float: left">注册</a>
            <a href="./login.jsp" style="float: right">登录</a>
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
    layui.use('form', function(){
        var form = layui.form;
        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>
</html>
