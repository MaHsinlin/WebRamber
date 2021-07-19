<%--
  Created by IntelliJ IDEA.
  User: AlbusDumbledore
  Date: 2019/3/2 0002
  Time: 23:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>反馈</title>
    <link rel="shortcut icon" href="./img/favicon48.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="./script/layui/css/layui.css">
    <script src="./script/layui/layui.js"></script>
    <script src="./script/jquery.js"></script>
</head>
<body>
<div style="margin-top: 1.7rem;margin-left: 0.8rem;font-size: 0.9rem">直接加入我们QQ群进行反馈&nbsp&nbsp:&nbsp&nbspXXXXXXXXX</div>
<div style="margin-top: 1.7rem;margin-left: 0.8rem;font-size: 0.9rem">问题分类</div>
<div class="layui-input-block">
    <select name="question_type" lay-verify="required">
        <option value="使用问题" selected>使用问题</option>
        <option value="错误提交">错误提交</option>
        <option value="功能建议">功能建议</option>
        <option value="寻求合作">寻求合作</option>
    </select>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">选择框</label>
    <div class="layui-input-block">
        <select name="city" lay-verify="required">
            <option value=""></option>
            <option value="0">北京</option>
            <option value="1">上海</option>
            <option value="2">广州</option>
            <option value="3">深圳</option>
            <option value="4">杭州</option>
        </select>
    </div>
</div>
</body>
<script>
    layui.use('form', function(){
        var form = layui.form;

    });
</script>
</html>
