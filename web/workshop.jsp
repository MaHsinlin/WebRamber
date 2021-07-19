<%--
  Created by IntelliJ IDEA.
  User: AlbusDumbledore
  Date: 2019/3/3 0003
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>未命名文件 - WebRamber</title>
    <link rel="shortcut icon" href="./img/favicon48.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="./script/layui/css/layui.css">

    <script src="./script/layui/layui.js"></script>
    <script src="./script/jquery.js"></script>
    <script src="./script/draggable/jquery.udraggable.js"></script>
    <script src="./script/draggable/jquery.js"></script>
    <script src="./script/draggable/jquery.event.ue.js"></script>

    <style>
        /** 通过css绘制三角形：只显示四分之一部分的border **/
        .triangle_top {
            width: 0px;
            height: 0px;
            border-top: 0.4rem solid #0C0C0C;
            border-right: 0.4rem solid transparent;
            border-bottom: 0.4rem solid transparent;
            border-left: 0.4rem solid transparent;
        }

        .triangle_right {
            width: 0px;
            height: 0px;
            border-top: 0.4rem solid transparent;
            border-right: 0.4rem solid #0C0C0C;
            border-bottom: 0.4rem solid transparent;
            border-left: 0.4rem solid transparent;
        }

        .triangle_bottom {
            width: 0px;
            height: 0px;
            border-top: 0.4rem solid transparent;
            border-right: 0.4rem solid transparent;
            border-bottom: 0.4rem solid #0C0C0C;
            border-left: 0.4rem solid transparent;
        }

        .triangle_left {
            width: 0px;
            height: 0px;
            border-top: 0.4rem solid transparent;
            border-right: 0.4rem solid transparent;
            border-bottom: 0.4rem solid transparent;
            border-left: 0.4rem solid #0C0C0C;
        }

        /** 取消tab二级菜单的箭头 **/
        body .layui-nav .layui-nav-more {
            display: none
        }

        /** 文字不可被选中的css样式 **/
        .cannotselect {
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
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

        /** 搜索框叠加图标 **/
        .icon-user {
            position: absolute;
            right: 0.5rem;
            top: 0.3rem;
            z-index: 4;
            background-position: 0px 0px; /*图片显示的位置*/
            width: 0.8rem; /*设置图片显示的宽*/
            height: 0.8rem; /*图片显示的高*/
        }

    </style>
</head>
<body style="overflow-y: hidden;overflow-x: hidden">
<%--顶部可隐藏区域开始--%>
<div id="workshop_top" style="background-color: #f6f6f6;width: 100%;height: 4.5rem;border-bottom: 1px solid #c6c6c6">
    <div style="width: 60%;height: 100%;float: left">
        <div style="height: 50%;width: 100%;padding-left: 0.5rem;padding-top: 0.5rem;line-height: 2.25rem">
            <b>
                <div onmouseover="getshadow_back(this)" onmouseleave="delshadow_back(this)" onclick="back_diagrams()"
                     style="float: left;width: 1.5rem;height: 1.5rem;line-height: 1.5rem;text-align:center;margin-top: 0.3rem;margin-left: 0.5rem">
                    <i class="layui-icon layui-icon-return"></i>
                </div>
                <%--返回上一页的tips--%>
                <div id="back_tips"
                     style="position: absolute;pointer-events: none;top: 1.8rem;left: 0.55rem;display: none">
                    <div class="triangle_bottom" style="margin-left: 0.85rem"></div>
                    <div style="background-color: #0C0C0C;width: 2.5rem;font-weight: normal;font-size: 0.5rem;height: 1.5rem;color: white;border-radius: 0.2rem;line-height: 1.5rem;text-align: center">
                        返回
                    </div>
                </div>
                <%--返回上一页的tips--%>
                <div class="cannotselect" id="file_name_div" onclick="rename_start()"
                     onmouseover="getshadow_filename(this)"
                     onmouseleave="delshadow_filename(this)"
                     style="font-size: 1rem;float: left;margin-left: 1rem;padding-left: 0.5rem;padding-right: 0.5rem">
                    未命名文件
                </div>
                <input id="file_name_input" onblur="rename_end()" type="text" class="layui-input"
                       style="display: none;height: 1.7rem;width: 40%;float: left;margin-top: 0.2rem;margin-left: 1rem">
            </b>
        </div>
        <div class="cannotselect" style="height: 50%;width: 100%">
            <div id="menu1" onclick="submenu_appear(this)" onmouseover="tool_shadow_appear(this)"
                 onmouseleave="tool_shadow_disappear(this)"
                 style="padding-left: 0.6rem;padding-right: 0.6rem;padding-top: 0.25rem;padding-bottom: 0.25rem;float: left;margin-left: 3.5rem;font-size: 0.8rem">
                文件
            </div>
            <div id="menu2" onclick="submenu_appear(this)" onmouseover="tool_shadow_appear(this)"
                 onmouseleave="tool_shadow_disappear(this)"
                 style="padding-left: 0.6rem;padding-right: 0.6rem;padding-top: 0.25rem;padding-bottom: 0.25rem;float: left;font-size: 0.8rem">
                编辑
            </div>
            <div id="menu3" onclick="submenu_appear(this)" onmouseover="tool_shadow_appear(this)"
                 onmouseleave="tool_shadow_disappear(this)"
                 style="padding-left: 0.6rem;padding-right: 0.6rem;padding-top: 0.25rem;padding-bottom: 0.25rem;float: left;font-size: 0.8rem">
                视图
            </div>
            <div id="menu4" onclick="submenu_appear(this)" onmouseover="tool_shadow_appear(this)"
                 onmouseleave="tool_shadow_disappear(this)"
                 style="padding-left: 0.6rem;padding-right: 0.6rem;padding-top: 0.25rem;padding-bottom: 0.25rem;float: left;font-size: 0.8rem">
                页面
            </div>
            <div id="menu5" onclick="submenu_appear(this)" onmouseover="tool_shadow_appear(this)"
                 onmouseleave="tool_shadow_disappear(this)"
                 style="padding-left: 0.6rem;padding-right: 0.6rem;padding-top: 0.25rem;padding-bottom: 0.25rem;float: left;font-size: 0.8rem">
                排列
            </div>
            <div id="menu6" onclick="submenu_appear(this)" onmouseover="tool_shadow_appear(this)"
                 onmouseleave="tool_shadow_disappear(this)"
                 style="padding-left: 0.6rem;padding-right: 0.6rem;padding-top: 0.25rem;padding-bottom: 0.25rem;float: left;font-size: 0.8rem">
                帮助
            </div>
        </div>
    </div>
    <div style="width: 40%;height: 100%;float: left">
        <div style="height: 1.8rem;margin-top: 1.35rem;float: right;margin-left: 0.7rem;background-color: #93D1FF">
            <ul class="layui-nav" lay-filter=""
                style="font-size: 0.8rem;line-height: 1.8rem;height: 1.8rem;padding: 0;background-color: #f6f6f6">
                <li ondragstart="return false" class="layui-nav-item cannotselect"
                    style="height: 100%;line-height: 3rem;">
                    <img src="./img/index/logo.png"
                         style="height: 1.8rem;width: 1.8rem;border-radius: 1.8rem;float: left">
                    <a href="javascript:;" id="usernickname"
                       style="height: 100%;color: black;float: left;line-height: 1.8rem">用户的昵称</a>
                    <dl class="layui-nav-child" style="top: 1.9rem">
                        <dd><a href="./diagrams.jsp">我的文件</a></dd>
                        <dd><a href="./index.jsp">退出</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
        <div style="height: 1.8rem;width: 1px;margin-top: 1.35rem;margin-left: 0.7rem;float: right;background-color: #c6c6c6"></div>
        <button onclick="HTML_preview()" class="layui-btn layui-btn-primary"
                style="float: right;line-height: 1.5rem;padding-left: 0.5rem;padding-right:0.5rem;height: 1.5rem;margin-top: 1.5rem;margin-left: 0.7rem">
            预览
        </button>
        <button class="layui-btn layui-btn-primary"
                style="float: right;line-height: 1.5rem;padding-left: 0.5rem;padding-right:0.5rem;height: 1.5rem;margin-top: 1.5rem">
            下载
        </button>
    </div>
</div>
<%--顶部可隐藏区域结束--%>

<%--二级菜单栏：文件-隐藏下拉div开始--%>
<div class="cannotselect" id="submenu1" onblur="submenu_onblur(this)" tabindex="2"
     style="z-index: 5;outline: 0;display: none;position: absolute;width: 11rem;border: 1px solid #c6c6c6;top: 4.4rem;left: 3.5rem;border-radius: 3px;padding-top: 0.2rem;padding-bottom: 0.2rem;background-color: white">
    <div onclick="submenu_1_rename()" onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        重命名文件
    </div>
    <div style="width: 100%;height: 1px;background-color: #C6C6C6;margin-top: 0.2rem;margin-bottom: 0.2rem"></div>
    <div onclick="submenu_1_close()" onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        关闭
    </div>
</div>
<%--二级菜单栏：文件-隐藏下拉div结束--%>
<%--二级菜单栏：编辑-隐藏下拉div开始--%>
<div class="cannotselect" id="submenu2" onblur="submenu_onblur(this)" tabindex="2"
     style="z-index: 5;outline: 0;display: none;position: absolute;width: 13rem;border: 1px solid #c6c6c6;top: 4.4rem;left: 6.3rem;border-radius: 3px;padding-top: 0.2rem;padding-bottom: 0.2rem;background-color: white">
    <div id="submenu2_revoke" onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img src="./img/workshop/menu/edit/revoke_000000.png" style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        撤销
        <div id="submenu2_revoke_hotkey" style="color: #7f7f7f;float: right;margin-right: 0.5rem">Ctrl+Z</div>
    </div>
    <div id="submenu2_recover" onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img src="./img/workshop/menu/edit/recover_000000.png"
             style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        恢复
        <div id="submenu2_recover_hotkey" style="color: #7f7f7f;float: right;margin-right: 0.5rem">Ctrl+Y</div>
    </div>
    <div style="width: 100%;height: 1px;background-color: #C6C6C6;margin-top: 0.2rem;margin-bottom: 0.2rem"></div>
    <div id="submenu2_cut" onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img src="./img/workshop/menu/edit/cut_000000.png" style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        剪切
        <div id="submenu2_cut_hotkey" style="color: #7f7f7f;float: right;margin-right: 0.5rem">Ctrl+X</div>
    </div>
    <div id="submenu2_copy" onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img src="./img/workshop/menu/edit/copy_000000.png" style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        复制
        <div id="submenu2_copy_hotkey" style="color: #7f7f7f;float: right;margin-right: 0.5rem">Ctrl+C</div>
    </div>
    <div id="submenu2_paste" onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img src="./img/workshop/menu/edit/paste_000000.png" style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        粘贴
        <div id="submenu2_paste_hotkey" style="color: #7f7f7f;float: right;margin-right: 0.5rem">Ctrl+V</div>
    </div>
    <div style="width: 100%;height: 1px;background-color: #C6C6C6;margin-top: 0.2rem;margin-bottom: 0.2rem"></div>
    <div id="submenu2_selectall" onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img src="./img/workshop/menu/edit/selectall_000000.png"
             style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        全选
        <div id="submenu2_selectall_hotkey" style="color: #7f7f7f;float: right;margin-right: 0.5rem">Ctrl+A</div>
    </div>
    <div id="submenu2_delete" onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img src="./img/workshop/menu/edit/delete_000000.png" style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        删除
        <div id="submenu2_delete_hotkey" style="color: #7f7f7f;float: right;margin-right: 0.5rem">Delete/Backspace</div>
    </div>
</div>
<%--二级菜单栏：编辑-隐藏下拉div结束--%>
<%--二级菜单栏：视图-隐藏下拉div开始--%>
<div class="cannotselect" id="submenu3" onblur="submenu_onblur(this)" tabindex="2"
     style="z-index: 5;outline: 0;display: none;position: absolute;width: 13rem;border: 1px solid #c6c6c6;top: 4.4rem;left: 9.1rem;border-radius: 3px;padding-top: 0.2rem;padding-bottom: 0.2rem;background-color: white">
    <div id="submenu3_zoomin" onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img src="./img/workshop/menu/view/zoomin_000000.png" style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        放大
        <div id="submenu3_zoomin_hotkey" style="color: #7f7f7f;float: right;margin-right: 0.5rem">Alt+(+)</div>
    </div>
    <div id="submenu3_zoomout" onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img src="./img/workshop/menu/view/zoomout_000000.png"
             style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        缩小
        <div id="submenu3_zoomout_hotkey" style="color: #7f7f7f;float: right;margin-right: 0.5rem">Alt+(-)</div>
    </div>
    <div style="width: 100%;height: 1px;background-color: #C6C6C6;margin-top: 0.2rem;margin-bottom: 0.2rem"></div>
    <div onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 2.2rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        50%
    </div>
    <div onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 2.2rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        75%
    </div>
    <div onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 2.2rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        100%
    </div>
    <div onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 2.2rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        150%
    </div>
    <div onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 2.2rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        200%
    </div>
</div>
<%--二级菜单栏：视图-隐藏下拉div结束--%>
<%--二级菜单栏：页面-隐藏下拉div开始--%>
<div class="cannotselect" id="submenu4" onblur="submenu_onblur(this)" tabindex="2"
     style="z-index: 5;outline: 0;display: none;position: absolute;width: 13rem;border: 1px solid #c6c6c6;top: 4.4rem;left: 11.9rem;border-radius: 3px;padding-top: 0.2rem;padding-bottom: 0.2rem;background-color: white">
    <div id="submenu4_bfcolor" onmouseover="submenu_onmouseover_arrow(this)"
         onmouseleave="submenu_onmouseleave_arrow(this)"
         style="position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img src="./img/workshop/menu/page/bgcolor_000000.png"
             style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        背景颜色
        <img id="submenu4_bfcolor_arrow" src="./img/workshop/menu/rightarrow_7f7f7f.png"
             style="float: right;margin-right: 0.5rem;width: 0.8rem;height: 0.8rem;margin-top: 0.1rem">
    </div>
    <div id="submenu4_pagesize" onmouseover="submenu_onmouseover_arrow(this)"
         onmouseleave="submenu_onmouseleave_arrow(this)"
         style="position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img src="./img/workshop/menu/page/pagesize_000000.png"
             style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        页面大小
        <img id="submenu4_pagesize_arrow" src="./img/workshop/menu/rightarrow_7f7f7f.png"
             style="float: right;margin-right: 0.5rem;width: 0.8rem;height: 0.8rem;margin-top: 0.1rem">
    </div>
    <div id="submenu4_padding" onmouseover="submenu_onmouseover_arrow(this)"
         onmouseleave="submenu_onmouseleave_arrow(this)"
         style="position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img src="./img/workshop/menu/page/padding_000000.png"
             style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        内边距
        <img id="submenu4_padding_arrow" src="./img/workshop/menu/rightarrow_7f7f7f.png"
             style="float: right;margin-right: 0.5rem;width: 0.8rem;height: 0.8rem;margin-top: 0.1rem">
    </div>
    <div id="submenu4_margin" onmouseover="submenu_onmouseover_arrow(this)"
         onmouseleave="submenu_onmouseleave_arrow(this)"
         style="position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img src="./img/workshop/menu/page/margin_000000.png" style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        外边距
        <img id="submenu4_margin_arrow" src="./img/workshop/menu/rightarrow_7f7f7f.png"
             style="float: right;margin-right: 0.5rem;width: 0.8rem;height: 0.8rem;margin-top: 0.1rem">
    </div>
    <div style="width: 100%;height: 1px;background-color: #C6C6C6;margin-top: 0.2rem;margin-bottom: 0.2rem"></div>
    <div onclick="submenu4_showgrid_onclick(this)" onmouseover="submenu_onmouseover(this)"
         onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img id="submenu4_showgrid_img" src="./img/workshop/menu/page/check_000000.png"
             style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        显示网格
    </div>
    <div id="submenu4_grid" onmouseover="submenu_onmouseover_arrow(this)"
         onmouseleave="submenu_onmouseleave_arrow(this)"
         style="position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img src="./img/workshop/menu/page/grid_000000.png" style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        网格大小
        <img id="submenu4_grid_arrow" src="./img/workshop/menu/rightarrow_7f7f7f.png"
             style="float: right;margin-right: 0.5rem;width: 0.8rem;height: 0.8rem;margin-top: 0.1rem">
        <%--三级菜单栏：页面-网格大小右拉div开始--%>
        <div class="cannotselect" onmouseleave="termenu_donot_need_focus()" id="submenu4_grid_tertiarymenu" tabindex="2"
             style="z-index: 5;outline: 0;display: none;position: absolute;width: 11rem;border: 1px solid #c6c6c6;top: -0.2rem;left: 13rem;border-radius: 3px;padding-top: 0.2rem;padding-bottom: 0.2rem;background-color: white">
            <div id="submenu4_grid_small" onclick="submenu4_grid_onclick(this)" onmouseover="termenu_onmouseover(this)"
                 onmouseleave="termenu_onmouseleave(this)"
                 style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                小
            </div>
            <div id="submenu4_grid_normal" onclick="submenu4_grid_onclick(this)" onmouseover="termenu_onmouseover(this)"
                 onmouseleave="termenu_onmouseleave(this)"
                 style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                正常
            </div>
            <div id="submenu4_grid_big" onclick="submenu4_grid_onclick(this)" onmouseover="termenu_onmouseover(this)"
                 onmouseleave="termenu_onmouseleave(this)"
                 style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                大
            </div>
            <div id="submenu4_grid_huge" onclick="submenu4_grid_onclick(this)" onmouseover="termenu_onmouseover(this)"
                 onmouseleave="termenu_onmouseleave(this)"
                 style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                很大
            </div>
        </div>
        <%--三级菜单栏：页面-网格大小右拉div结束--%>
    </div>
</div>
<%--二级菜单栏：页面-隐藏下拉div结束--%>
<%--二级菜单栏：排列-隐藏下拉div开始--%>
<div class="cannotselect" id="submenu5" onblur="submenu_onblur(this)" tabindex="2"
     style="z-index: 5;outline: 0;display: none;position: absolute;width: 13rem;border: 1px solid #c6c6c6;top: 4.4rem;left: 14.7rem;border-radius: 3px;padding-top: 0.2rem;padding-bottom: 0.2rem;background-color: white">
    <div id="submenu5_top" onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img src="./img/workshop/menu/arrange/top_000000.png" style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        置于顶层
        <div id="submenu5_top_hotkey" style="color: #7f7f7f;float: right;margin-right: 0.5rem">Ctrl+]</div>
    </div>
    <div id="submenu5_bottom" onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img src="./img/workshop/menu/arrange/bottom_000000.png"
             style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        置于底层
        <div id="submenu5_bottom_hotkey" style="color: #7f7f7f;float: right;margin-right: 0.5rem">Ctrl+[</div>
    </div>
    <div id="submenu5_upone" onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img src="./img/workshop/menu/arrange/upone_000000.png"
             style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        上移一层
        <div id="submenu5_upone_hotkey" style="color: #7f7f7f;float: right;margin-right: 0.5rem">Ctrl+Shift+]</div>
    </div>
    <div id="submenu5_downone" onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img src="./img/workshop/menu/arrange/downone_000000.png"
             style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        下移一层
        <div id="submenu5_downone_hotkey" style="color: #7f7f7f;float: right;margin-right: 0.5rem">Ctrl+Shift+[</div>
    </div>
    <div style="width: 100%;height: 1px;background-color: #C6C6C6;margin-top: 0.2rem;margin-bottom: 0.2rem"></div>
    <div id="submenu5_align" onmouseover="submenu_onmouseover_arrow(this)"
         onmouseleave="submenu_onmouseleave_arrow(this)"
         style="position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img src="./img/workshop/menu/arrange/align_000000.png"
             style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        控件对齐
        <img id="submenu5_align_arrow" src="./img/workshop/menu/rightarrow_7f7f7f.png"
             style="float: right;margin-right: 0.5rem;width: 0.8rem;height: 0.8rem;margin-top: 0.1rem">
    </div>
    <div id="submenu5_match" onmouseover="submenu_onmouseover_arrow(this)"
         onmouseleave="submenu_onmouseleave_arrow(this)"
         style="position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img src="./img/workshop/menu/arrange/match_000000.png"
             style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        匹配大小
        <img id="submenu5_match_arrow" src="./img/workshop/menu/rightarrow_7f7f7f.png"
             style="float: right;margin-right: 0.5rem;width: 0.8rem;height: 0.8rem;margin-top: 0.1rem">
    </div>
    <div style="width: 100%;height: 1px;background-color: #C6C6C6;margin-top: 0.2rem;margin-bottom: 0.2rem"></div>
    <div id="submenu5_lock" onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img src="./img/workshop/menu/arrange/lock_000000.png"
             style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        锁定
        <div id="submenu5_lock_hotkey" style="color: #7f7f7f;float: right;margin-right: 0.5rem">Ctrl+L</div>
    </div>
    <div id="submenu5_unlock" onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img src="./img/workshop/menu/arrange/unlock_000000.png"
             style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        解锁
        <div id="submenu5_unlock_hotkey" style="color: #7f7f7f;float: right;margin-right: 0.5rem">Ctrl+Shift+L</div>
    </div>
    <div style="width: 100%;height: 1px;background-color: #C6C6C6;margin-top: 0.2rem;margin-bottom: 0.2rem"></div>
    <div id="submenu5_combine" onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img src="./img/workshop/menu/arrange/combine_000000.png"
             style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        组合
        <div id="submenu5_combine_hotkey" style="color: #7f7f7f;float: right;margin-right: 0.5rem">Ctrl+G</div>
    </div>
    <div id="submenu5_uncombine" onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        <img src="./img/workshop/menu/arrange/uncombine_000000.png"
             style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
        取消组合
        <div id="submenu5_uncombine_hotkey" style="color: #7f7f7f;float: right;margin-right: 0.5rem">Ctrl+Shift+G</div>
    </div>
</div>
<%--二级菜单栏：排列-隐藏下拉div结束--%>
<%--二级菜单栏：帮助-隐藏下拉div开始--%>
<div class="cannotselect" id="submenu6" onblur="submenu_onblur(this)" tabindex="2"
     style="z-index: 5;outline: 0;display: none;position: absolute;width: 11rem;border: 1px solid #c6c6c6;top: 4.4rem;left: 17.5rem;border-radius: 3px;padding-top: 0.2rem;padding-bottom: 0.2rem;background-color: white">
    <div onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        快捷键列表
    </div>
    <div onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        开始向导
    </div>
    <div onmouseover="submenu_onmouseover(this)" onmouseleave="submenu_onmouseleave(this)"
         style="width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 1rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
        发送反馈
    </div>
</div>
<%--二级菜单栏：帮助-隐藏下拉div结束--%>

<%--三级菜单栏：页面-背景颜色右拉div开始--%>

<%--三级菜单栏：页面-背景颜色右拉div结束--%>
<%--三级菜单栏：页面-页面大小右拉div开始--%>

<%--三级菜单栏：页面-页面大小右拉div结束--%>
<%--三级菜单栏：页面-内边距右拉div开始--%>

<%--三级菜单栏：页面-内边距右拉div结束--%>
<%--三级菜单栏：页面-外边距右拉div开始--%>

<%--三级菜单栏：页面-外边距右拉div结束--%>
<%--三级菜单栏：排列-控件大小右拉div开始--%>

<%--三级菜单栏：排列-控件大小右拉div结束--%>
<%--三级菜单栏：排列-匹配大小右拉div开始--%>

<%--三级菜单栏：排列-匹配大小右拉div结束--%>

<%--整个下部可移动区域开始--%>
<div id="workshop_bottom" style="width: 100%;height: 34.5rem;position: absolute;top: 4.54rem">
    <%--工具栏区域开始--%>
    <div class="cannotselect" id="bottom_top"
         style="width: 100%;height: 2.4rem;background-color: #f3f3f3;border-bottom: 1px solid #a2a2a2;position: relative;border-top: 0.1px solid transparent">
        <%--顶部工具栏撤销模块开始--%>
        <div id="top_tool_1" onmouseover="top_tools_unitonmouseover(this)"
             onmouseleave="top_tools_unitonmouseleave(this)"
             style="position: relative;float: left;border-radius: 2px;height: 1.4rem;width: 1.4rem;border: 1px solid #f3f3f3;margin-top: 0.45rem;text-align: center;margin-left: 2.5rem">
            <img src="./img/workshop/top_tools/revoke_000000.png" style="width: 1rem;height: 1rem;margin-top: 0.15rem">
            <%--顶部工具栏撤销模块的tips开始--%>
            <div id="top_tool_1_tips"
                 style="position: absolute;pointer-events: none;top: 1.08rem;left: -0.5rem;display: none;z-index: 6">
                <div class="triangle_bottom" style="margin-left: 0.85rem"></div>
                <div style="background-color: #0C0C0C;width: 5rem;font-weight: normal;font-size: 0.5rem;height: 1.5rem;color: white;border-radius: 0.2rem;line-height: 1.5rem;text-align: center">
                    撤销(Ctrl+Z)
                </div>
            </div>
            <%--顶部工具栏撤销模块的tips结束--%>
        </div>
        <%--顶部工具栏撤销模块结束--%>
        <%--顶部工具栏恢复模块开始--%>
        <div id="top_tool_2" onmouseover="top_tools_unitonmouseover(this)"
             onmouseleave="top_tools_unitonmouseleave(this)"
             style="position: relative;float: left;border-radius: 2px;height: 1.4rem;width: 1.4rem;border: 1px solid #f3f3f3;margin-top: 0.45rem;text-align: center;margin-left: 0.2rem">
            <img src="./img/workshop/top_tools/recover_000000.png" style="width: 1rem;height: 1rem;margin-top: 0.15rem">
            <%--顶部工具栏恢复模块的tips开始--%>
            <div id="top_tool_2_tips"
                 style="position: absolute;pointer-events: none;top: 1.08rem;left: -0.5rem;display: none;z-index: 6">
                <div class="triangle_bottom" style="margin-left: 0.85rem"></div>
                <div style="background-color: #0C0C0C;width: 5rem;font-weight: normal;font-size: 0.5rem;height: 1.5rem;color: white;border-radius: 0.2rem;line-height: 1.5rem;text-align: center">
                    恢复(Ctrl+Y)
                </div>
            </div>
            <%--顶部工具栏恢复模块的tips结束--%>
        </div>
        <%--顶部工具栏恢复模块结束--%>
        <div style="float: left;height: 100%;width: 1px;background-color: #c6c6c6;margin-left: 0.2rem"></div>
        <%--顶部工具栏粗体模块开始--%>
        <div id="top_tool_3" onclick="top_tool_3_onclick(this)" onmouseover="top_tools_unitonmouseover(this)"
             onmouseleave="top_tool_3_onmouseleave(this)"
             style="position: relative;float: left;border-radius: 2px;height: 1.4rem;width: 1.4rem;border: 1px solid #f3f3f3;margin-top: 0.45rem;text-align: center;margin-left: 0.2rem">
            <img src="./img/workshop/top_tools/bold_000000.png"
                 style="width: 0.8rem;height: 0.8rem;margin-top: 0.25rem">
            <%--顶部工具栏粗体模块的tips开始--%>
            <div id="top_tool_3_tips"
                 style="position: absolute;pointer-events: none;top: 1.08rem;left: -0.5rem;display: none;z-index: 6">
                <div class="triangle_bottom" style="margin-left: 0.85rem"></div>
                <div style="background-color: #0C0C0C;width: 5rem;font-weight: normal;font-size: 0.5rem;height: 1.5rem;color: white;border-radius: 0.2rem;line-height: 1.5rem;text-align: center">
                    粗体(Ctrl+B)
                </div>
            </div>
            <%--顶部工具栏粗体模块的tips结束--%>
        </div>
        <%--顶部工具栏粗体模块结束--%>
        <%--顶部工具栏斜体模块开始--%>
        <div id="top_tool_4" onclick="top_tool_4_onclick(this)" onmouseover="top_tools_unitonmouseover(this)"
             onmouseleave="top_tool_4_onmouseleave(this)"
             style="position: relative;float: left;border-radius: 2px;height: 1.4rem;width: 1.4rem;border: 1px solid #f3f3f3;margin-top: 0.45rem;text-align: center;margin-left: 0.2rem">
            <img src="./img/workshop/top_tools/italic_000000.png"
                 style="width: 0.8rem;height: 0.8rem;margin-top: 0.25rem">
            <%--顶部工具栏斜体模块的tips开始--%>
            <div id="top_tool_4_tips"
                 style="position: absolute;pointer-events: none;top: 1.08rem;left: -0.5rem;display: none;z-index: 6">
                <div class="triangle_bottom" style="margin-left: 0.85rem"></div>
                <div style="background-color: #0C0C0C;width: 5rem;font-weight: normal;font-size: 0.5rem;height: 1.5rem;color: white;border-radius: 0.2rem;line-height: 1.5rem;text-align: center">
                    斜体(Ctrl+I)
                </div>
            </div>
            <%--顶部工具栏斜体模块的tips结束--%>
        </div>
        <%--顶部工具栏斜体模块结束--%>
        <%--顶部工具栏下划线模块开始--%>
        <div id="top_tool_5" onclick="top_tool_5_onclick(this)" onmouseover="top_tools_unitonmouseover(this)"
             onmouseleave="top_tool_5_onmouseleave(this)"
             style="position: relative;float: left;border-radius: 2px;height: 1.4rem;width: 1.4rem;border: 1px solid #f3f3f3;margin-top: 0.45rem;text-align: center;margin-left: 0.2rem">
            <img src="./img/workshop/top_tools/underline_000000.png"
                 style="width: 0.8rem;height: 0.9rem;margin-top: 0.25rem">
            <%--顶部工具栏下划线模块的tips开始--%>
            <div id="top_tool_5_tips"
                 style="position: absolute;pointer-events: none;top: 1.08rem;left: -0.5rem;display: none;z-index: 6">
                <div class="triangle_bottom" style="margin-left: 0.85rem"></div>
                <div style="background-color: #0C0C0C;width: 5.7rem;font-weight: normal;font-size: 0.5rem;height: 1.5rem;color: white;border-radius: 0.2rem;line-height: 1.5rem;text-align: center">
                    下划线(Ctrl+U)
                </div>
            </div>
            <%--顶部工具栏下划线模块的tips结束--%>
        </div>
        <%--顶部工具栏下划线模块结束--%>
        <%--顶部工具栏文本颜色模块开始--%>
        <div id="top_tool_6" onmouseover="top_tools_unitonmouseover(this)"
             onmouseleave="top_tools_unitonmouseleave(this)"
             style="position: relative;float: left;border-radius: 2px;height: 1.4rem;width: 2.7rem;border: 1px solid #f3f3f3;margin-top: 0.45rem;text-align: center;margin-left: 0.2rem;line-height: 1.4rem">
            <img src="./img/workshop/top_tools/font_color_000000.png"
                 style="float: left;width: 0.8rem;height: 0.8rem;margin-top: 0.35rem;margin-left: 0.2rem">
            <%--字体颜色的颜色选择器开始--%>
            <div id="tool_fontcolor_picker" onclick="top_tool_6_onclick(this)"
                 onblur="top_tool_disappearmyself_onblur(this)"
                 style="float: left;width: 0.8rem;height: 0.8rem;margin-left: 0.3rem"></div>
            <%--字体颜色的颜色选择器结束--%>
            <%--顶部工具栏文本颜色模块的tips开始--%>
            <div id="top_tool_6_tips"
                 style="position: absolute;pointer-events: none;top: 1.08rem;left: -0.5rem;display: none;z-index: 6">
                <div class="triangle_bottom" style="margin-left: 0.85rem"></div>
                <div style="background-color: #0C0C0C;width: 4rem;font-weight: normal;font-size: 0.5rem;height: 1.5rem;color: white;border-radius: 0.2rem;line-height: 1.5rem;text-align: center">
                    文本颜色
                </div>
            </div>
            <%--顶部工具栏文本颜色模块的tips结束--%>
        </div>
        <%--顶部工具栏文本颜色模块结束--%>
        <%--顶部工具栏文本对齐模块开始--%>
        <div id="top_tool_7" onclick="top_tool_7_onclick(this)" onmouseover="top_tools_unitonmouseover(this)"
             onmouseleave="top_tools_unitonmouseleave(this)"
             style="position: relative;float: left;border-radius: 2px;height: 1.4rem;width: 2rem;border: 1px solid #f3f3f3;margin-top: 0.45rem;text-align: center;margin-left: 0.2rem;line-height: 1.4rem">
            <img id="now_align" src="./img/workshop/top_tools/font_left_000000.png"
                 style="float: left;width: 0.8rem;height: 0.8rem;margin-top: 0.25rem;margin-left: 0.2rem">
            <i class="layui-icon layui-icon-triangle-d"
               style="float: left;color: #6f6f6f;font-size: 0.4rem;margin-left: 0.1rem;margin-right: 0.1rem"></i>
            <%--顶部工具栏文本对齐模块的tips开始--%>
            <div id="top_tool_7_tips"
                 style="position: absolute;pointer-events: none;top: 1.08rem;left: 0rem;display: none;z-index: 6">
                <div class="triangle_bottom" style="margin-left: 0.85rem"></div>
                <div style="background-color: #0C0C0C;width: 4rem;font-weight: normal;font-size: 0.5rem;height: 1.5rem;color: white;border-radius: 0.2rem;line-height: 1.5rem;text-align: center">
                    文本对齐
                </div>
            </div>
            <%--顶部工具栏文本对齐模块的tips结束--%>
            <%--文本对齐下拉菜单栏开始--%>
            <div class="cannotselect" id="tool_align_menu" onblur="tool_font_menu_onblur(this)"
                 onmouseover="tool_align_menu_onmouseover()" onmouseleave="tool_align_menu_onmouseleave()" tabindex="2"
                 style="z-index: 5;outline: 0;display: none;position: absolute;width: 5.7rem;border: 1px solid #c6c6c6;top: 1.45rem;left: -0.05rem;border-radius: 3px;padding-top: 0.2rem;padding-bottom: 0.2rem;background-color: white">
                <div id="font_left" onclick="tool_align_content_onclick(this)"
                     onmouseover="tool_align_content_onmouseover(this)"
                     onmouseleave="tool_align_content_onmouseleave(this)"
                     style="float:left;text-align: left;position: relative;width: 1.1rem;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;padding: 0.3rem;margin-left: 0.3rem">
                    <img id="align_1_img" src="./img/workshop/top_tools/font_left_000000.png"
                         style="height: 1rem;width: 1rem;margin-right: 0.2rem">
                </div>
                <div id="font_center" onclick="tool_align_content_onclick(this)"
                     onmouseover="tool_align_content_onmouseover(this)"
                     onmouseleave="tool_align_content_onmouseleave(this)"
                     style="float:left;text-align: left;position: relative;width: 1.1rem;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;padding: 0.3rem">
                    <img id="align_2_img" src="./img/workshop/top_tools/font_center_000000.png"
                         style="height: 1rem;width: 1rem;margin-right: 0.2rem">
                </div>
                <div id="font_right" onclick="tool_align_content_onclick(this)"
                     onmouseover="tool_align_content_onmouseover(this)"
                     onmouseleave="tool_align_content_onmouseleave(this)"
                     style="float:left;text-align: left;position: relative;width: 1.1rem;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;padding: 0.3rem">
                    <img id="align_3_img" src="./img/workshop/top_tools/font_right_000000.png"
                         style="height: 1rem;width: 1rem;margin-right: 0.2rem">
                </div>
            </div>
            <%--文本对齐下拉菜单栏结束--%>
        </div>
        <%--顶部工具栏文本对齐模块结束--%>
        <div style="float: left;height: 100%;width: 1px;background-color: #c6c6c6;margin-left: 0.2rem"></div>
        <%--顶部工具栏字体模块开始--%>
        <div id="top_tool_8" onclick="top_tool_8_onclick(this)" onmouseover="top_tools_unitonmouseover(this)"
             onmouseleave="top_tools_unitonmouseleave(this)"
             style="background-color: #f3f3f3;position: relative;float: left;border-radius: 2px;height: 1.4rem;width: 8rem;border: 1px solid #f3f3f3;margin-top: 0.45rem;text-align: left;margin-left: 0.2rem;line-height: 1.4rem">
            <div id="now_font"
                 style="float: left;width: 6.5rem;height: 1rem;margin-top: 0.15rem;line-height: 1rem;margin-left: 0.2rem;font-size: 0.6rem;font-family: Arial">
                Arial
            </div>
            <i class="layui-icon layui-icon-triangle-d"
               style="float: right;color: #6f6f6f;font-size: 0.4rem;margin-left: 0.1rem;margin-right: 0.1rem"></i>
            <%--顶部工具栏字体模块的tips开始--%>
            <div id="top_tool_8_tips"
                 style="position: absolute;pointer-events: none;top: 1.08rem;left: 1rem;display: none;z-index: 6">
                <div class="triangle_bottom" style="margin-left: 0.85rem"></div>
                <div style="background-color: #0C0C0C;width: 2rem;font-weight: normal;font-size: 0.5rem;height: 1.5rem;color: white;border-radius: 0.2rem;line-height: 1.5rem;text-align: center">
                    字体
                </div>
            </div>
            <%--顶部工具栏字体模块的tips结束--%>
            <%--字体菜单栏开始--%>
            <div class="cannotselect" id="tool_font_menu" onblur="tool_font_menu_onblur(this)"
                 onmouseover="tool_font_menu_onmouseover()" onmouseleave="tool_font_menu_onmouseleave()" tabindex="2"
                 style="z-index: 5;outline: 0;display: none;position: absolute;width: 9rem;border: 1px solid #c6c6c6;top: 1.45rem;left: -0.05rem;border-radius: 3px;padding-top: 0.2rem;padding-bottom: 0.2rem;background-color: white">
                <div id="font_1" onclick="tool_font_change_onclick(this)" onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="font-family: Arial;text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="font_1_img" src="./img/workshop/menu/page/check_000000.png"
                         style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    Arial
                </div>
                <div id="font_2" onclick="tool_font_change_onclick(this)" onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="font-family: Verdana;text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="font_2_img" src="" style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    Verdana
                </div>
                <div id="font_3" onclick="tool_font_change_onclick(this)" onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="font-family: Georgia;text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="font_3_img" src="" style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    Georgia
                </div>
                <div id="font_4" onclick="tool_font_change_onclick(this)" onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="font-family: 'Times New Roman';text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="font_4_img" src="" style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    Times New Roman
                </div>
                <div id="font_5" onclick="tool_font_change_onclick(this)" onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="font-family: 'Courier New';text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="font_5_img" src="" style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    Courier New
                </div>
                <div id="font_6" onclick="tool_font_change_onclick(this)" onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="font-family: Impact;text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="font_6_img" src="" style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    Impact
                </div>
                <div id="font_7" onclick="tool_font_change_onclick(this)" onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="font-family: 'Comic Sans MS';text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="font_7_img" src="" style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    Comic Sans MS
                </div>
                <div id="font_8" onclick="tool_font_change_onclick(this)" onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="font-family: Tahoma;text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="font_8_img" src="" style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    Tahoma
                </div>
                <div id="font_9" onclick="tool_font_change_onclick(this)" onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="font-family: Garamond;text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="font_9_img" src="" style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    Garamond
                </div>
                <div id="font_10" onclick="tool_font_change_onclick(this)" onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="font-family: 'Lucida Console';text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="font_10_img" src="" style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    Lucida Console
                </div>
                <div style="width: 100%;height: 1px;background-color: #C6C6C6;margin-top: 0.2rem;margin-bottom: 0.2rem"></div>
                <div id="font_11" onclick="tool_font_change_onclick(this)" onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="font-family: 宋体;text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="font_11_img" src="" style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    宋体
                </div>
                <div id="font_12" onclick="tool_font_change_onclick(this)" onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="font-family: 微软雅黑;text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="font_12_img" src="" style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    微软雅黑
                </div>
                <div id="font_13" onclick="tool_font_change_onclick(this)" onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="font-family: 黑体;text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="font_13_img" src="" style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    黑体
                </div>
            </div>
            <%--字体菜单栏结束--%>
        </div>
        <%--顶部工具栏字体模块结束--%>
        <div style="float: left;height: 100%;width: 1px;background-color: #c6c6c6;margin-left: 0.2rem"></div>
        <%--顶部工具栏字号模块开始--%>
        <div id="top_tool_9" onmouseover="top_tools_fontsize_onmouseover(this)"
             onmouseleave="top_tools_fontsize_onmouseleave(this)"
             style="position: relative;float: left;border-radius: 2px;height: 1.6rem;width: 4rem;border: 1px solid #f3f3f3;margin-top: 0.35rem;text-align: center;margin-left: 0.2rem;line-height: 1.6rem">
            <input onclick="top_tools_fontsize_input(this)" id="top_tool_9_input" value="13" type="text" maxlength="3"
                   style="float: left;background-color: #f3f3f3;width: 3.11rem;height: 100%;line-height: 3.2rem;font-size: 0.6rem;border: none;padding-right: 1rem;text-align: right"
                   onkeydown="top_tool_9_onkeydown(this)" onkeyup="if(isNaN(value))execCommand('undo')"
                   onafterpaste="if(isNaN(value))execCommand('undo')">
            <div id="top_tool_9_arrow" style="float: right;width: 0.8rem;height: 100%;border-left: 1px solid #f3f3f3">
                <div onclick="top_tools_fontsize_add()" onmouseover="top_tools_fontsize_arrow_onmouseover(this)"
                     onmouseleave="top_tools_fontsize_arrow_onmouseleave(this)"
                     style="width: 100%;height: 50%;float: left">
                    <img src="./img/workshop/top_tools/upper_arrow_6f6f6f.png"
                         style="width: 80%;margin-left: 10%;height: 70%;margin-top: 15%">
                </div>
                <div onclick="top_tools_fontsize_sub()" onmouseover="top_tools_fontsize_arrow_onmouseover(this)"
                     onmouseleave="top_tools_fontsize_arrow_onmouseleave(this)"
                     style="width: 100%;height: 50%;float: left">
                    <img src="./img/workshop/top_tools/under_arrow_6f6f6f.png"
                         style="width: 80%;margin-left: 10%;height: 70%;margin-top: 15%">
                </div>
            </div>
            <div style="position: absolute;top: 0.1rem;right: 1rem;font-size: 0.6rem">px</div>
            <%--顶部工具栏字号模块的tips开始--%>
            <div id="top_tool_9_tips"
                 style="position: absolute;pointer-events: none;top: 1.25rem;left: 1rem;display: none;z-index: 6">
                <div class="triangle_bottom" style="margin-left: 0.85rem"></div>
                <div style="background-color: #0C0C0C;width: 2rem;font-weight: normal;font-size: 0.5rem;height: 1.5rem;color: white;border-radius: 0.2rem;line-height: 1.5rem;text-align: center">
                    字号
                </div>
            </div>
            <%--顶部工具栏字号模块的tips结束--%>
        </div>
        <%--顶部工具栏字号模块结束--%>
        <div style="float: left;height: 100%;width: 1px;background-color: #c6c6c6;margin-left: 0.2rem"></div>
        <%--顶部工具栏填充样式模块开始--%>
        <div id="top_tool_10" onmouseover="top_tools_unitonmouseover(this)"
             onmouseleave="top_tools_unitonmouseleave(this)"
             style="position: relative;float: left;border-radius: 2px;height: 1.4rem;width: 2.65rem;border: 1px solid #f3f3f3;margin-top: 0.45rem;text-align: center;margin-left: 0.2rem;line-height: 1.4rem">
            <img src="./img/workshop/top_tools/color_fill_000000.png"
                 style="float: left;width: 0.8rem;height: 0.8rem;margin-top: 0.25rem;margin-left: 0.2rem">
            <%--填充颜色的颜色选择器开始--%>
            <div id="tool_colorfill_picker" onclick="top_tool_6_onclick(this)"
                 style="float: left;width: 0.8rem;height: 0.8rem;margin-left: 0.3rem"></div>
            <%--填充颜色的颜色选择器结束--%>
            <%--顶部工具栏填充样式模块的tips开始--%>
            <div id="top_tool_10_tips"
                 style="position: absolute;pointer-events: none;top: 1.08rem;left: -0.5rem;display: none;z-index: 6">
                <div class="triangle_bottom" style="margin-left: 0.85rem"></div>
                <div style="background-color: #0C0C0C;width: 4rem;font-weight: normal;font-size: 0.5rem;height: 1.5rem;color: white;border-radius: 0.2rem;line-height: 1.5rem;text-align: center">
                    填充样式
                </div>
            </div>
            <%--顶部工具栏填充样式模块的tips结束--%>
        </div>
        <%--顶部工具栏填充样式模块结束--%>
        <%--顶部工具栏边框颜色模块开始--%>
        <div id="top_tool_11" onmouseover="top_tools_unitonmouseover(this)"
             onmouseleave="top_tools_unitonmouseleave(this)"
             style="position: relative;float: left;border-radius: 2px;height: 1.4rem;width: 2.7rem;border: 1px solid #f3f3f3;margin-top: 0.45rem;text-align: center;margin-left: 0.2rem;line-height: 1.4rem">
            <img src="./img/workshop/top_tools/border_color_000000.png"
                 style="float: left;width: 0.8rem;height: 0.8rem;margin-top: 0.25rem;margin-left: 0.2rem">
            <%--边框颜色的颜色选择器开始--%>
            <div id="tool_bordercolor_picker" onclick="top_tool_6_onclick(this)"
                 style="float: left;width: 0.8rem;height: 0.8rem;margin-left: 0.3rem"></div>
            <%--边框颜色的颜色选择器结束--%>
            <%--顶部工具栏边框颜色模块的tips开始--%>
            <div id="top_tool_11_tips"
                 style="position: absolute;pointer-events: none;top: 1.08rem;left: -0.5rem;display: none;z-index: 6">
                <div class="triangle_bottom" style="margin-left: 0.85rem"></div>
                <div style="background-color: #0C0C0C;width: 4rem;font-weight: normal;font-size: 0.5rem;height: 1.5rem;color: white;border-radius: 0.2rem;line-height: 1.5rem;text-align: center">
                    边框颜色
                </div>
            </div>
            <%--顶部工具栏边框颜色模块的tips结束--%>
        </div>
        <%--顶部工具栏边框颜色模块结束--%>
        <%--顶部工具栏边框宽度模块开始--%>
        <div id="top_tool_12" onclick="top_tool_12_onclick(this)" onmouseover="top_tools_unitonmouseover(this)"
             onmouseleave="top_tools_unitonmouseleave(this)"
             style="position: relative;float: left;border-radius: 2px;height: 1.4rem;width: 2rem;border: 1px solid #f3f3f3;margin-top: 0.45rem;text-align: center;margin-left: 0.2rem;line-height: 1.4rem">
            <img src="./img/workshop/top_tools/line_weight_000000.png"
                 style="float: left;width: 0.7rem;height: 0.7rem;margin-top: 0.3rem;margin-left: 0.2rem">
            <i class="layui-icon layui-icon-triangle-d"
               style="float: left;color: #6f6f6f;font-size: 0.4rem;margin-left: 0.1rem;margin-right: 0.1rem"></i>
            <%--顶部工具栏边框宽度模块的tips开始--%>
            <div id="top_tool_12_tips"
                 style="position: absolute;pointer-events: none;top: 1.08rem;left: 0rem;display: none;z-index: 6">
                <div class="triangle_bottom" style="margin-left: 0.85rem"></div>
                <div style="background-color: #0C0C0C;width: 4rem;font-weight: normal;font-size: 0.5rem;height: 1.5rem;color: white;border-radius: 0.2rem;line-height: 1.5rem;text-align: center">
                    边框宽度
                </div>
            </div>
            <%--顶部工具栏边框宽度模块的tips结束--%>
            <%--边框宽度菜单栏开始--%>
            <div class="cannotselect" id="tool_lineheight_menu" onblur="tool_font_menu_onblur(this)"
                 onmouseover="tool_lineheight_menu_onmouseover()" onmouseleave="tool_lineheight_menu_onmouseleave()"
                 tabindex="2"
                 style="z-index: 5;outline: 0;display: none;position: absolute;width: 9rem;border: 1px solid #c6c6c6;top: 1.45rem;left: -0.05rem;border-radius: 3px;padding-top: 0.2rem;padding-bottom: 0.2rem;background-color: white">
                <div id="lineheight_0" onclick="tool_lineheight_change_onclick(this)"
                     onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="lineheight_0_img" src="./img/workshop/menu/page/check_000000.png"
                         style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    0px
                </div>
                <div id="lineheight_1" onclick="tool_lineheight_change_onclick(this)"
                     onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="lineheight_1_img" src=""
                         style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    1px
                </div>
                <div id="lineheight_2" onclick="tool_lineheight_change_onclick(this)"
                     onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="lineheight_2_img" src=""
                         style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    2px
                </div>
                <div id="lineheight_3" onclick="tool_lineheight_change_onclick(this)"
                     onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="lineheight_3_img" src=""
                         style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    3px
                </div>
                <div id="lineheight_4" onclick="tool_lineheight_change_onclick(this)"
                     onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="lineheight_4_img" src=""
                         style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    4px
                </div>
                <div id="lineheight_5" onclick="tool_lineheight_change_onclick(this)"
                     onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="lineheight_5_img" src=""
                         style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    5px
                </div>
                <div id="lineheight_6" onclick="tool_lineheight_change_onclick(this)"
                     onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="lineheight_6_img" src=""
                         style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    6px
                </div>
                <div id="lineheight_7" onclick="tool_lineheight_change_onclick(this)"
                     onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="lineheight_7_img" src=""
                         style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    7px
                </div>
                <div id="lineheight_8" onclick="tool_lineheight_change_onclick(this)"
                     onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="lineheight_8_img" src=""
                         style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    8px
                </div>
                <div id="lineheight_9" onclick="tool_lineheight_change_onclick(this)"
                     onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="lineheight_9_img" src=""
                         style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    9px
                </div>
                <div id="lineheight_10" onclick="tool_lineheight_change_onclick(this)"
                     onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="lineheight_10_img" src=""
                         style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    10px
                </div>
            </div>
            <%--边框宽度菜单栏结束--%>
        </div>
        <%--顶部工具栏边框宽度模块结束--%>
        <%--顶部工具栏边框样式模块开始--%>
        <div id="top_tool_13" onclick="top_tool_13_onclick(this)" onmouseover="top_tools_unitonmouseover(this)"
             onmouseleave="top_tools_unitonmouseleave(this)"
             style="position: relative;float: left;border-radius: 2px;height: 1.4rem;width: 2rem;border: 1px solid #f3f3f3;margin-top: 0.45rem;text-align: center;margin-left: 0.2rem;line-height: 1.4rem">
            <img src="./img/workshop/top_tools/line_style_000000.png"
                 style="float: left;width: 0.8rem;height: 1rem;margin-top: 0.2rem;margin-left: 0.2rem">
            <i class="layui-icon layui-icon-triangle-d"
               style="float: left;color: #6f6f6f;font-size: 0.4rem;margin-left: 0.1rem;margin-right: 0.1rem"></i>
            <%--顶部工具栏边框样式模块的tips开始--%>
            <div id="top_tool_13_tips"
                 style="position: absolute;pointer-events: none;top: 1.08rem;left: 0rem;display: none;z-index: 6">
                <div class="triangle_bottom" style="margin-left: 0.85rem"></div>
                <div style="background-color: #0C0C0C;width: 4rem;font-weight: normal;font-size: 0.5rem;height: 1.5rem;color: white;border-radius: 0.2rem;line-height: 1.5rem;text-align: center">
                    边框样式
                </div>
            </div>
            <%--顶部工具栏边框样式模块的tips结束--%>
            <%--边框样式菜单栏开始--%>
            <div class="cannotselect" id="tool_linestyle_menu" onblur="tool_font_menu_onblur(this)"
                 onmouseover="tool_linestyle_menu_onmouseover()" onmouseleave="tool_linestyle_menu_onmouseleave()"
                 tabindex="2"
                 style="z-index: 5;outline: 0;display: none;position: absolute;width: 8rem;border: 1px solid #c6c6c6;top: 1.45rem;left: -0.05rem;border-radius: 3px;padding-top: 0.2rem;padding-bottom: 0.2rem;background-color: white">
                <div id="linestyle_1" onclick="tool_linestyle_change_onclick(this)"
                     onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="linestyle_1_img" src="./img/workshop/menu/page/check_000000.png"
                         style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    &nbsp&nbsp&nbsp&nbsp无&nbsp&nbsp&nbsp&nbsp边&nbsp&nbsp&nbsp&nbsp框
                </div>
                <div id="linestyle_2" onclick="tool_linestyle_change_onclick(this)"
                     onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="linestyle_2_img" src=""
                         style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    <hr style="float: right;width: 4.5rem;height: 0.5rem;border: 1px solid #0C0C0C;background-color: #fff;margin-right: 1rem;margin-top: 0.2rem">
                </div>
                <div id="linestyle_3" onclick="tool_linestyle_change_onclick(this)"
                     onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="linestyle_3_img" src=""
                         style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    <hr style="float: right;width: 4.5rem;height: 0.5rem;border: 1px dotted #0C0C0C;background-color: #fff;margin-right: 1rem;margin-top: 0.2rem">
                </div>
                <div id="linestyle_4" onclick="tool_linestyle_change_onclick(this)"
                     onmouseover="submenu_onmouseover_arrow(this)"
                     onmouseleave="submenu_onmouseleave_arrow(this)"
                     style="text-align: left;position: relative;width: 100%;height: 1.1rem;line-height: 1.1rem;font-size: 0.8rem;text-indent: 0.5rem;padding-top: 0.3rem;padding-bottom: 0.3rem">
                    <img id="linestyle_4_img" src=""
                         style="height: 0.8rem;width: 0.8rem;margin-right: 0.2rem">
                    <hr style="float: right;width: 4.5rem;height: 0.5rem;border: 1px dashed #0C0C0C;background-color: #fff;margin-right: 1rem;margin-top: 0.2rem">
                </div>
            </div>
            <%--边框样式菜单栏结束--%>
        </div>
        <%--顶部工具栏边框样式模块结束--%>
        <div style="float: left;height: 100%;width: 1px;background-color: #c6c6c6;margin-left: 0.2rem"></div>
        <%--顶部工具栏置于顶层模块开始--%>
        <div id="top_tool_14" onclick="top_tool_14_onclick(this)" onmouseover="top_tools_unitonmouseover(this)"
             onmouseleave="top_tools_unitonmouseleave(this)"
             style="position: relative;float: left;border-radius: 2px;height: 1.4rem;width: 1.4rem;border: 1px solid #f3f3f3;margin-top: 0.5rem;text-align: center;margin-left: 0.2rem">
            <img src="./img/workshop/top_tools/top_000000.png" style="width: 1rem;height: 1rem;margin-top: 0.15rem">
            <%--顶部工具栏置于顶层模块的tips开始--%>
            <div id="top_tool_14_tips"
                 style="position: absolute;pointer-events: none;top: 1.08rem;left: -0.5rem;display: none;z-index: 6">
                <div class="triangle_bottom" style="margin-left: 0.85rem"></div>
                <div style="background-color: #0C0C0C;width: 6rem;font-weight: normal;font-size: 0.5rem;height: 1.5rem;color: white;border-radius: 0.2rem;line-height: 1.5rem;text-align: center">
                    上移一层(Ctrl+])
                </div>
            </div>
            <%--顶部工具栏置于顶层模块的tips结束--%>
        </div>
        <%--顶部工具栏置于顶层模块结束--%>
        <%--顶部工具栏置于底层模块开始--%>
        <div id="top_tool_15" onclick="top_tool_15_onclick(this)" onmouseover="top_tools_unitonmouseover(this)"
             onmouseleave="top_tools_unitonmouseleave(this)"
             style="position: relative;float: left;border-radius: 2px;height: 1.4rem;width: 1.4rem;border: 1px solid #f3f3f3;margin-top: 0.5rem;text-align: center;margin-left: 0.2rem">
            <img src="./img/workshop/top_tools/bottom_000000.png" style="width: 1rem;height: 1rem;margin-top: 0.15rem">
            <%--顶部工具栏置于底层模块的tips开始--%>
            <div id="top_tool_15_tips"
                 style="position: absolute;pointer-events: none;top: 1.08rem;left: -0.5rem;display: none;z-index: 6">
                <div class="triangle_bottom" style="margin-left: 0.85rem"></div>
                <div style="background-color: #0C0C0C;width: 6rem;font-weight: normal;font-size: 0.5rem;height: 1.5rem;color: white;border-radius: 0.2rem;line-height: 1.5rem;text-align: center">
                    下移一层(Ctrl+[)
                </div>
            </div>
            <%--顶部工具栏置于底层模块的tips结束--%>
        </div>
        <%--顶部工具栏置于底层模块结束--%>
        <div style="float: left;height: 100%;width: 1px;background-color: #c6c6c6;margin-left: 0.2rem"></div>
        <%--顶部工具栏控件锁定模块开始--%>
        <div id="top_tool_16" onmouseover="top_tools_unitonmouseover(this)"
             onmouseleave="top_tools_unitonmouseleave(this)"
             style="position: relative;float: left;border-radius: 2px;height: 1.4rem;width: 1.4rem;border: 1px solid #f3f3f3;margin-top: 0.5rem;text-align: center;margin-left: 0.2rem">
            <img src="./img/workshop/top_tools/lock_000000.png" style="width: 1rem;height: 1rem;margin-top: 0.15rem">
            <%--顶部工具栏控件锁定模块的tips开始--%>
            <div id="top_tool_16_tips"
                 style="position: absolute;pointer-events: none;top: 1.08rem;left: -0.5rem;display: none;z-index: 6">
                <div class="triangle_bottom" style="margin-left: 0.85rem"></div>
                <div style="background-color: #0C0C0C;width: 6rem;font-weight: normal;font-size: 0.5rem;height: 1.5rem;color: white;border-radius: 0.2rem;line-height: 1.5rem;text-align: center">
                    控件锁定(Ctrl+L)
                </div>
            </div>
            <%--顶部工具栏控件锁定模块的tips结束--%>
        </div>
        <%--顶部工具栏控件锁定模块结束--%>
        <%--顶部工具栏控件解锁模块开始--%>
        <div id="top_tool_17" onmouseover="top_tools_unitonmouseover(this)"
             onmouseleave="top_tools_unitonmouseleave(this)"
             style="position: relative;float: left;border-radius: 2px;height: 1.4rem;width: 1.4rem;border: 1px solid #f3f3f3;margin-top: 0.5rem;text-align: center;margin-left: 0.2rem">
            <img src="./img/workshop/top_tools/unlock_000000.png" style="width: 1rem;height: 1rem;margin-top: 0.15rem">
            <%--顶部工具栏控件解锁模块的tips开始--%>
            <div id="top_tool_17_tips"
                 style="position: absolute;pointer-events: none;top: 1.08rem;left: -0.5rem;display: none;z-index: 6">
                <div class="triangle_bottom" style="margin-left: 0.85rem"></div>
                <div style="background-color: #0C0C0C;width: 8rem;font-weight: normal;font-size: 0.5rem;height: 1.5rem;color: white;border-radius: 0.2rem;line-height: 1.5rem;text-align: center">
                    控件解锁(Ctrl+Shift+L)
                </div>
            </div>
            <%--顶部工具栏控件解锁模块的tips结束--%>
        </div>
        <%--顶部工具栏控件解锁模块结束--%>
        <div style="float: left;height: 100%;width: 1px;background-color: #c6c6c6;margin-left: 0.2rem"></div>
        <%--顶部工具栏撤销模块开始--%>

        <%--顶部工具栏撤销模块结束--%>
        <%--顶部工具栏撤销模块开始--%>

        <%--顶部工具栏撤销模块结束--%>
        <%--顶部工具栏撤销模块开始--%>

        <%--顶部工具栏撤销模块结束--%>
        <%--顶部工具栏撤销模块开始--%>

        <%--顶部工具栏撤销模块结束--%>


        <div id="hide_arrow_rotate" onclick="hide_arrow_onclick()" onmouseover="hide_arrow_onmouseover(this)"
             onmouseleave="hide_arrow_onmouseleave(this)"
             style="transform: rotate(90deg);float: right;border: 1px solid #f3f3f3;border-radius: 2px;height: 1.6rem;width: 1.6rem;margin-top: 0.4rem;line-height: 1.7rem;text-indent: 0.4rem;margin-right: 1rem">
            <b>
                <i style="font-size: 0.6rem" class="layui-icon layui-icon-prev"></i>
            </b>
        </div>
        <%--所有下方tips存放地开始:必须放在这里，相对于上一级绝对定位，以防移动后全部错乱--%>
        <%--高重要级！！！新加的tips必须加上pointer-events: none用于防止onmouseover时间的闪烁现象--%>
        <%--搜索控件的tips--%>
        <div id="search_control_tips" class="cannotselect"
             style="z-index:6;position: absolute;pointer-events: none;top: 2.4rem;left: 8.3rem;display: none">
            <div class="triangle_right" style="margin-left: 0.85rem;float: left;margin-top: 10px"></div>
            <div style="background-color: #0C0C0C;float: left;width: 10rem;font-weight: normal;font-size: 0.5rem;padding: 4px 5px 4px 5px;color: white;border-radius: 0.2rem;line-height: 1rem">
                搜索WebRamber库中所提供的基础控件，请使用英文单词。
            </div>
        </div>
        <%--搜索控件的tips--%>

        <%--所有下方tips存放地结束--%>
        <%--可视化区域右上角工具栏开始--%>
        <div id="view_tools" class="cannotselect"
             style="z-index: 20;position: absolute;top: 2.4rem;right: 10px;width: 2.4rem">
            <div style="width: 2.4rem;height: 10px;background-color: #484848"></div>
            <div style="width: 2.4rem;border-bottom: 1px solid #a2a2a2;border-left: 1px solid #a2a2a2;background-color: #f4f4f4;padding-top: 0.4rem">
                <div onmouseover="view_tools_onmouseover(this)" onmouseleave="view_tools_onmouseleave(this)" title="导航"
                     style="position: relative;border-radius: 3px;width: 1.4rem;height: 1.4rem;margin-left: 0.45rem;border: 1px solid #f4f4f4;margin-bottom: 0.45rem">
                    <img src="./img/workshop/view_tools/navigator_222222.png" style="width: 100%;height: 100%">
                </div>
                <div onclick="viewtool_measure_open(this)" onmouseover="view_tools_onmouseover(this)" onmouseleave="view_tools_onmouseleave(this)" title="度量"
                     style="position: relative;border-radius: 3px;width: 1.4rem;height: 1.4rem;margin-left: 0.45rem;border: 1px solid #f4f4f4;margin-bottom: 0.45rem">
                    <img src="./img/workshop/view_tools/measure_222222.png" style="width: 100%;height: 100%">
                    <div id="view_measure_div" title="" style="display: none;position: absolute;width: 222px;height: 140px;right: 30px;top:-0.2rem;z-index: 20;border: 1px solid #999;background: #f5f5f5;box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.33);">
                        <div style="height: 18px;width: 100%;line-height: 18px;border-top: #bfbfbf solid 1px;border-bottom: #666666 solid 1px;text-shadow: 0 1px 0 rgba(255, 255, 255, 0.33);background-color: #a6a6a6;font-size: 13px;background-image: -webkit-linear-gradient(top,#b2b2b2,#9b9b9b);text-indent: 10px">
                            度量
                            <div onmouseover="viewtool_shutdown_onmouseover(this)" onmouseleave="viewtool_shutdown_onmouseleave(this)" onclick="viewtool_shutdown_all()" style="width: 12px;height: 12px;position: absolute;right: 3px;top: 2px;font-weight: bold;font-size: 8px;color: #0C0C0C;cursor: pointer;border-radius: 2px;border: 1px solid transparent;">
                                <img style="width: 100%;height: 100%;display: block" src="./img/workshop/view_tools/fold_viewtools.png">
                            </div>
                        </div>
                        <div style="font-size: 15px;font-weight: bold;text-indent: 10px;margin-top: 7px">位置和大小</div>
                        <div style="position: relative;width: 40%;height: 1.8rem;line-height: 1.8rem;margin-top: 0.4rem;margin-left: 1.8rem;float: left">
                            <div style="float:left;">X:&nbsp</div>
                            <input id="control_X_input" value="0px" type="text" maxlength="6" disabled="disabled" style="border: 1px solid #e8e8e8;background-color: #ffffff;color: #b3b3b3;text-align: right;padding-right: 0.3rem;float: left;width: 3.7rem;height: 1.8rem;line-height: 1.8rem" onkeydown="control_X_input_onkeydown(this)">
                        </div>
                        <div style="position: relative;width: 40%;height: 1.8rem;line-height: 1.8rem;margin-top: 0.4rem;margin-left: 0.5rem;float: left">
                            <div style="float:left;">宽:&nbsp</div>
                            <input id="control_Width_input" value="0px" type="text" maxlength="6" disabled="disabled" style="border: 1px solid #e8e8e8;background-color: #ffffff;color: #b3b3b3;text-align: right;padding-right: 0.3rem;float: left;width: 3.7rem;height: 1.8rem;line-height: 1.8rem" onkeydown="control_Width_input_onkeydown(this)">
                        </div>
                        <div style="position: relative;width: 40%;height: 1.8rem;line-height: 1.8rem;margin-top: 0.4rem;margin-left: 1.8rem;float: left">
                            <div style="float:left;">Y:&nbsp</div>
                            <input id="control_Y_input" value="0px" type="text" maxlength="6" disabled="disabled" style="border: 1px solid #e8e8e8;background-color: #ffffff;color: #b3b3b3;text-align: right;padding-right: 0.3rem;float: left;width: 3.7rem;height: 1.8rem;line-height: 1.8rem" onkeydown="control_Y_input_onkeydown(this)">
                        </div>
                        <div style="position: relative;width: 40%;height: 1.8rem;line-height: 1.8rem;margin-top: 0.4rem;margin-left: 0.5rem;float: left">
                            <div style="float:left;">高:&nbsp</div>
                            <input id="control_Height_input" value="0px" type="text" maxlength="6" disabled="disabled" style="border: 1px solid #e8e8e8;background-color: #ffffff;color: #b3b3b3;text-align: right;padding-right: 0.3rem;float: left;width: 3.7rem;height: 1.8rem;line-height: 1.8rem" onkeydown="control_Height_input_onkeydown(this)">
                        </div>
                    </div>
                </div>
                <div onmouseover="view_tools_onmouseover(this)" onmouseleave="view_tools_onmouseleave(this)"
                     title="控件属性"
                     style="position: relative;border-radius: 3px;width: 1.4rem;height: 1.4rem;margin-left: 0.45rem;border: 1px solid #f4f4f4;margin-bottom: 0.45rem">
                    <img src="./img/workshop/view_tools/attribute_222222.png" style="width: 100%;height: 100%">
                </div>
                <div onmouseover="view_tools_onmouseover(this)" onmouseleave="view_tools_onmouseleave(this)"
                     title="页面设置"
                     style="position: relative;border-radius: 3px;width: 1.4rem;height: 1.4rem;margin-left: 0.45rem;border: 1px solid #f4f4f4;margin-bottom: 0.45rem">
                    <img src="./img/workshop/view_tools/page_222222.png" style="width: 100%;height: 100%">
                </div>
                <div onmouseover="view_tools_onmouseover(this)" onmouseleave="view_tools_onmouseleave(this)"
                     title="历史版本"
                     style="position: relative;border-radius: 3px;width: 1.4rem;height: 1.4rem;margin-left: 0.45rem;border: 1px solid #f4f4f4;margin-bottom: 0.45rem">
                    <img src="./img/workshop/view_tools/history_222222.png" style="width: 100%;height: 100%">
                </div>
                <div onmouseover="view_tools_onmouseover(this)" onmouseleave="view_tools_onmouseleave(this)" title="评论"
                     style="position: relative;border-radius: 3px;width: 1.4rem;height: 1.4rem;margin-left: 0.45rem;border: 1px solid #f4f4f4;margin-bottom: 0.45rem">
                    <img src="./img/workshop/view_tools/comment_222222.png" style="width: 100%;height: 100%">
                </div>
            </div>
        </div>
        <%--可视化区域右上角工具栏结束--%>
    </div>
    <%--工具栏区域结束--%>
    <%--工作区域开始开始--%>
    <%--工作区域左部工具箱开始--%>
    <div id="bottom_left"
         style="float: left;width: 7%;height: 72rem;background-color: #f1f1f1;overflow-x: hidden;overflow-y: scroll">
        <div onmouseover="search_control_onmouseover()" onmouseleave="search_control_onmouseleave()"
             style="height: 1.5rem;width: 100%;position: relative">
            <input type="text" placeholder="搜索" class="layui-input" style="height: 100%">
            <i class="layui-icon layui-icon-search icon-user"></i>
        </div>
        <div style="height: 1px;width: 100%;background-color: #c6c6c6"></div>
        <div id="fundamental_control" onclick="fundamental_control_onclick()" class="cannotselect"
             style="height: 2rem;width: 100%;line-height: 2rem;font-size: 0.75rem;padding-left: 10px">
            <i id="fundamental_control_i" class="layui-icon layui-icon-triangle-d"
               style="font-size: 0.6rem;margin-top: 0.1rem"></i>
            <b>基础控件库</b>
        </div>
        <div style="height: 1px;width: 100%;background-color: #c6c6c6"></div>
        <div id="fundamental_control_list"
             style="width: 100%;display: block;border-bottom: 1px solid #c6c6c6;padding-top: 0.5rem;padding-bottom: 0.5rem">
            <%--基础控件——DIV--%>
            <div id="fundamental_control_list_1" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;width: 100%;height: 2rem;line-height: 2rem;padding-top: 0.4rem">
                <div style="font-size: 1rem;float: left;width: 6rem;height: 1.4rem;line-height: 1.4rem;text-align: center;border: 1px solid #000;margin-left: 0.5rem">
                    DIV
                </div>
                <button onclick="add_div_toCanvas()" class="layui-btn"
                        style="float: left;width: 2.2rem;height: 1.4rem;line-height: 1.4rem;padding: 0;font-size: 8px;margin-left: 0.4rem;margin-top: 0.07rem">
                    增加
                </button>
            </div>
            <%--基础控件——IMG--%>
            <div id="fundamental_control_list_2" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;width: 100%;height: 2rem;line-height: 2rem;padding-top: 0.4rem">
                <i class="layui-icon layui-icon-picture"
                   style="font-size: 1.1rem;float: left;width: 6rem;height: 1.4rem;line-height: 1.4rem;text-align: center;border: 1px solid #000;margin-left: 0.5rem"></i>
                <button onclick="add_img_toCanvas()" class="layui-btn"
                        style="float: left;width: 2.2rem;height: 1.4rem;line-height: 1.4rem;padding: 0;font-size: 8px;margin-left: 0.4rem;margin-top: 0.07rem">
                    增加
                </button>
            </div>

        </div>
        <div id="fundamental_icon" onclick="font_icon_onclick()" class="cannotselect"
             style="height: 2rem;width: 100%;line-height: 2rem;font-size: 0.75rem;padding-left: 10px">
            <i id="fundamental_icon_i" class="layui-icon layui-icon-triangle-d"
               style="font-size: 0.6rem;margin-top: 0.1rem"></i>
            <b>字体图标库</b>
        </div>
        <div id="fundamental_icon_list"
             style="width: 100%;display: block;padding-top: 0.5rem;padding-bottom: 0.5rem">
            <%--字体图标——星星-空心--%>
            <div id="fundamental_icon_list_1" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-rate" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——星星-实心--%>
            <div id="fundamental_icon_list_2" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-rate-solid" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——手机--%>
            <div id="fundamental_icon_list_3" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-cellphone" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——验证码--%>
            <div id="fundamental_icon_list_4" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-vercode" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——微信--%>
            <div id="fundamental_icon_list_5" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-login-wechat" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——QQ--%>
            <div id="fundamental_icon_list_6" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-login-qq" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——微博--%>
            <div id="fundamental_icon_list_7" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-login-weibo" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——密码--%>
            <div id="fundamental_icon_list_8" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-password" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——用户名--%>
            <div id="fundamental_icon_list_9" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-username" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——刷新-粗--%>
            <div id="fundamental_icon_list_10" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-refresh-3" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——授权--%>
            <div id="fundamental_icon_list_11" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-auz" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——左向右伸缩菜单--%>
            <div id="fundamental_icon_list_12" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-spread-left" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——右向左伸缩菜单--%>
            <div id="fundamental_icon_list_13" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-shrink-right" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——雪花--%>
            <div id="fundamental_icon_list_14" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-snowflake" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——提示说明--%>
            <div id="fundamental_icon_list_15" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-tips" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——便签--%>
            <div id="fundamental_icon_list_16" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-note" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——主页--%>
            <div id="fundamental_icon_list_17" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-home" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——高级--%>
            <div id="fundamental_icon_list_18" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-senior" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——刷新--%>
            <div id="fundamental_icon_list_19" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-refresh" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——旗帜--%>
            <div id="fundamental_icon_list_20" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-flag" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——主题--%>
            <div id="fundamental_icon_list_21" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-theme" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——消息-通知--%>
            <div id="fundamental_icon_list_22" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-notice" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——网站--%>
            <div id="fundamental_icon_list_23" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-website" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——控制台--%>
            <div id="fundamental_icon_list_24" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-console" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——表情-惊讶--%>
            <div id="fundamental_icon_list_25" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-face-surprised" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——设置-空心--%>
            <div id="fundamental_icon_list_26" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-set" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——模板--%>
            <div id="fundamental_icon_list_27" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-template-1" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——应用--%>
            <div id="fundamental_icon_list_28" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-app" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——赞--%>
            <div id="fundamental_icon_list_29" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-praise" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——踩--%>
            <div id="fundamental_icon_list_30" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-tread" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——男--%>
            <div id="fundamental_icon_list_31" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-male" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——女--%>
            <div id="fundamental_icon_list_32" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-female" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——相机-空心--%>
            <div id="fundamental_icon_list_33" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-camera" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——相机-实心--%>
            <div id="fundamental_icon_list_34" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-camera-fill" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——菜单-水平--%>
            <div id="fundamental_icon_list_35" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-more" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——菜单-垂直--%>
            <div id="fundamental_icon_list_36" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-more-vertical" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——金额-人民币--%>
            <div id="fundamental_icon_list_37" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-rmb" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——金额-人民币--%>
            <div id="fundamental_icon_list_38" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-dollar" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——钻石-等级--%>
            <div id="fundamental_icon_list_39" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-diamond" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——火--%>
            <div id="fundamental_icon_list_40" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-fire" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——返回--%>
            <div id="fundamental_icon_list_41" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-return" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——位置-地图--%>
            <div id="fundamental_icon_list_42" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-location" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——办公-阅读--%>
            <div id="fundamental_icon_list_43" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-read" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——调查--%>
            <div id="fundamental_icon_list_44" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-survey" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——表情-微笑--%>
            <div id="fundamental_icon_list_45" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-face-smile" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——表情-哭泣--%>
            <div id="fundamental_icon_list_46" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-face-cry" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——购物车--%>
            <div id="fundamental_icon_list_47" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-cart" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——购物车--%>
            <div id="fundamental_icon_list_48" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-next" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——上一页--%>
            <div id="fundamental_icon_list_49" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-prev" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——上传-实心--%>
            <div id="fundamental_icon_list_50" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-upload" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——下载-圆圈--%>
            <div id="fundamental_icon_list_51" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-download-circle" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——组件--%>
            <div id="fundamental_icon_list_52" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-component" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——文件-粗--%>
            <div id="fundamental_icon_list_53" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-file-b" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——用户--%>
            <div id="fundamental_icon_list_54" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-user" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——发现-实心--%>
            <div id="fundamental_icon_list_55" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-find-fill" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——loading--%>
            <div id="fundamental_icon_list_56" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-loading" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——添加--%>
            <div id="fundamental_icon_list_57" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-add-1" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——播放--%>
            <div id="fundamental_icon_list_58" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-play" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——暂停--%>
            <div id="fundamental_icon_list_59" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-pause" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——音频-耳机--%>
            <div id="fundamental_icon_list_60" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-headset" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——视频--%>
            <div id="fundamental_icon_list_61" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-video" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——语音-声音--%>
            <div id="fundamental_icon_list_62" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-voice" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——消息-通知-喇叭--%>
            <div id="fundamental_icon_list_63" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-speaker" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——删除线--%>
            <div id="fundamental_icon_list_64" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-fonts-del" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——代码--%>
            <div id="fundamental_icon_list_65" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-fonts-code" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——HTML--%>
            <div id="fundamental_icon_list_66" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-fonts-html" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——字体加粗--%>
            <div id="fundamental_icon_list_67" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-fonts-strong" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——删除链接--%>
            <div id="fundamental_icon_list_68" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-unlink" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——图片--%>
            <div id="fundamental_icon_list_69" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-picture" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——链接--%>
            <div id="fundamental_icon_list_70" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-link" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——左对齐--%>
            <div id="fundamental_icon_list_71" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-align-left" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——右对齐--%>
            <div id="fundamental_icon_list_72" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-align-right" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——居中对齐--%>
            <div id="fundamental_icon_list_73" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-align-center" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——字体-下划线--%>
            <div id="fundamental_icon_list_74" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-fonts-u" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——字体-斜体--%>
            <div id="fundamental_icon_list_75" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-fonts-i" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——Tabs 选项卡--%>
            <div id="fundamental_icon_list_76" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-tabs" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——单选框-选中--%>
            <div id="fundamental_icon_list_77" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-radio" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——单选框-候选--%>
            <div id="fundamental_icon_list_78" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-circle" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——编辑--%>
            <div id="fundamental_icon_list_79" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-edit" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——分享--%>
            <div id="fundamental_icon_list_80" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-share" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——删除--%>
            <div id="fundamental_icon_list_81" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-delete" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——表单--%>
            <div id="fundamental_icon_list_82" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-form" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——聊天 对话 沟通--%>
            <div id="fundamental_icon_list_83" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-dialogue" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——文字格式化--%>
            <div id="fundamental_icon_list_84" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-fonts-clear" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——日期--%>
            <div id="fundamental_icon_list_85" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-date" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——水 下雨--%>
            <div id="fundamental_icon_list_86" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-water" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——代码-圆圈--%>
            <div id="fundamental_icon_list_87" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-code-circle" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——翻页--%>
            <div id="fundamental_icon_list_88" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-prev-circle" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——布局--%>
            <div id="fundamental_icon_list_89" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-layouts" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——工具--%>
            <div id="fundamental_icon_list_90" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-util" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——上传-圆圈--%>
            <div id="fundamental_icon_list_91" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-upload-circle" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——树--%>
            <div id="fundamental_icon_list_92" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-tree" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——表格--%>
            <div id="fundamental_icon_list_93" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-table" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——图表--%>
            <div id="fundamental_icon_list_94" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-chart" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——引擎--%>
            <div id="fundamental_icon_list_95" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-engine" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——下三角--%>
            <div id="fundamental_icon_list_96" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-triangle-d" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——右三角--%>
            <div id="fundamental_icon_list_97" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-triangle-r" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——文件--%>
            <div id="fundamental_icon_list_98" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-file" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——添加-圆圈--%>
            <div id="fundamental_icon_list_99" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-add-circle" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——404--%>
            <div id="fundamental_icon_list_100" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-404" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——关于--%>
            <div id="fundamental_icon_list_101" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-about" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——箭头 向上--%>
            <div id="fundamental_icon_list_102" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-up" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——箭头 向下--%>
            <div id="fundamental_icon_list_103" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-down" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——箭头 向左--%>
            <div id="fundamental_icon_list_104" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-left" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——箭头 向右--%>
            <div id="fundamental_icon_list_105" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-right" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——圆点--%>
            <div id="fundamental_icon_list_106" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-circle-dot" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——搜索--%>
            <div id="fundamental_icon_list_107" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-search" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——设置-实心--%>
            <div id="fundamental_icon_list_108" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-set-fill" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——群组--%>
            <div id="fundamental_icon_list_109" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-group" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——好友--%>
            <div id="fundamental_icon_list_110" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-friends" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——回复 评论 实心--%>
            <div id="fundamental_icon_list_111" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-reply-fill" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——菜单 隐身 实心--%>
            <div id="fundamental_icon_list_112" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-menu-fill" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——记录--%>
            <div id="fundamental_icon_list_113" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-log" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——列表--%>
            <div id="fundamental_icon_list_114" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-list" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——发布 纸飞机--%>
            <div id="fundamental_icon_list_115" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-release" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——对 OK--%>
            <div id="fundamental_icon_list_116" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-ok" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——帮助--%>
            <div id="fundamental_icon_list_117" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-help" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——客服--%>
            <div id="fundamental_icon_list_118" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-chat" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——top 置顶--%>
            <div id="fundamental_icon_list_119" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-top" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——收藏-空心--%>
            <div id="fundamental_icon_list_120" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-star" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——收藏-实心--%>
            <div id="fundamental_icon_list_121" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-star-fill" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——关闭-实心--%>
            <div id="fundamental_icon_list_122" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-close-fill" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——关闭-空心--%>
            <div id="fundamental_icon_list_123" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-close" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——正确--%>
            <div id="fundamental_icon_list_124" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-ok-circle" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
            <%--字体图标——添加-圆圈-细体--%>
            <div id="fundamental_icon_list_125" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;float: left;width: 33.3%;height: 0;padding-bottom: 33.3%;line-height: 2.4rem;padding-top: 0.4rem;text-align: center">
                <i class="layui-icon layui-icon-add-circle-fine" onclick="add_i_toCanvas(this)"
                   style="font-size: 2rem; color: #000"></i>
            </div>
        </div>
        <div style="float: left;height: 1px;width: 100%;background-color: #c6c6c6;margin-top: 0.5rem"></div>
        <div id="fundamental_form" onclick="form_element_onclick()" class="cannotselect"
             style="float: left;height: 2rem;width: 100%;line-height: 2rem;font-size: 0.75rem;padding-left: 10px">
            <i id="fundamental_form_i" class="layui-icon layui-icon-triangle-d"
               style="font-size: 0.6rem;margin-top: 0.1rem"></i>
            <b>表单元素库</b>
        </div>
        <div style="float: left;height: 1px;width: 100%;background-color: #c6c6c6"></div>
        <div id="fundamental_form_list"
             style="float: left;width: 100%;display: block;border-bottom: 1px solid #c6c6c6;padding-top: 0.5rem;padding-bottom: 0.5rem">
            <%--表单元素——INPUT--%>
            <div id="fundamental_form_list_1" onmouseover="wecanbe_drag_onmouseover(this)"
                 onmouseleave="wecanbe_drag_onmouseleave(this)"
                 style="position: relative;width: 100%;height: 2rem;line-height: 2rem;padding-top: 0.4rem">
                <input placeholder="INPUT"
                       style="font-size: 1rem;float: left;width: 6rem;height: 1.4rem;line-height: 1.4rem;text-align: center;border: 1px solid #000;margin-left: 0.5rem">
                <button onclick="add_input_toCanvas()" class="layui-btn"
                        style="float: left;width: 2.2rem;height: 1.4rem;line-height: 1.4rem;padding: 0;font-size: 8px;margin-left: 0.4rem;margin-top: 0.07rem">
                    增加
                </button>
            </div>
        </div>
    </div>
    <%--工作区域左部工具箱结束--%>
    <div style="width: 0.1%;height: 72rem;background-color: #a2a2a2;float: left"></div>
    <%--工作区域右部可视化区域开始--%>
    <div id="bottom_right"
         style="float: left;width: 92.9%;height: 72rem;background-color: #f1f1f1;overflow-y: scroll;overflow-x: scroll">
        <%--最底层花纹画布开始--%>
        <div style="width: 3964px;height: 3000px;background:  url(./img/workshop/workshopbg.png);float: left">
            <%--灰底画布开始--%>
            <div onclick="Canvas_onclick()" readonly="readonly"
                 style="width: 2558px;height: 1297px;background-color: #f0f0f0;margin-left: 842px;margin-top: 1000px;float: left;box-shadow:5px 5px 5px #8a8a8a;">
                <%--白底网格画布开始--%>
                <div id="main_canvas"
                     style="z-index: 3;position: relative;width: 2518px;height: 1257px;background-color: #ffffff;margin-left: 20px;margin-top: 20px;float: left;background-image: url(./img/workshop/canvas_bg_normal.png)">

                </div>
                <%--白底网格画布结束--%>
            </div>
            <%--灰底画布结束--%>
        </div>
        <%--最底层花纹画布结束--%>
    </div>
    <%--工作区域右部可视化区域结束--%>
    <%--工作区域开始结束--%>
</div>
<%--整个下部可移动区域结束--%>
<%--footer开始--%>
<div style="width: 100%;height: 2rem;background-color: #f1f1f1;border-top: 1px solid #a2a2a2;position: absolute;bottom: 0">
    <div style="float: left;width: 7%;height: 100%;background-color: #f1f1f1">
        <button class="layui-btn"
                style="width: 60%;margin-left: 20%;margin-top: 0.2rem;height: 1.6rem;line-height: 1.6rem">更多控件
        </button>
    </div>
    <div style="width: 0.1%;height: 100%;background-color: #a2a2a2;float: left"></div>
    <img class="cannotselect" src="./img/index/logo.png"
         style="height: 1.5rem;width: 1.5rem;border-radius: 1.5rem;float: left;margin-left: 10px;margin-top: 0.25rem">
    <div class="cannotselect" id="invite_friend_inproject" onmouseover="invite_friend_inproject_onmouseover(this)"
         onmouseleave="invite_friend_inproject_onmouseleave(this)"
         style="border: 1px solid #f1f1f1;cursor: pointer;padding-left: 0.3rem;padding-right: 0.3rem;margin-left: 1.5rem;height: 1.4rem;margin-top: 0.25rem;line-height: 1.4rem;float: left;font-size: 0.6rem">
        <img src="./img/workshop/invite_333333.png" style="width: 1rem">
        <b>邀请朋友加入项目</b>
    </div>
    <div style="height: 100%;float: right">
        <b>
            <div class="cannotselect" onmouseover="right_bottom_onmouseover(this)"
                 onmouseleave="right_bottom_onmouseleave(this)"
                 style="float: left;height: 2rem;background-color: #f1f1f1;line-height: 1.9rem;color: #4a4a4a;font-size: 0.6rem;padding-left: 0.6rem;padding-right: 0.6rem;cursor: pointer;border-left: 1px solid #a2a2a2">
                <img src="./img/workshop/wechat_logo.png"
                     style="float: left;height: 1.2rem;margin-top: 0.4rem;margin-right: 0.4rem">
                <img src="./img/workshop/sina_logo.png"
                     style="float: left;height: 1.4rem;margin-top: 0.3rem;margin-right: 0.4rem">
                关注我们
            </div>
            <div class="cannotselect" onclick="jump_to_helpinfo()" onmouseover="right_bottom_onmouseover(this)"
                 onmouseleave="right_bottom_onmouseleave(this)"
                 style="float: left;height: 2rem;background-color: #f1f1f1;line-height: 1.9rem;color: #4a4a4a;font-size: 0.6rem;padding-left: 0.6rem;padding-right: 0.6rem;cursor: pointer;border-left: 1px solid #a2a2a2">
                帮助中心
            </div>
            <div class="cannotselect" onmouseover="feedback_right_bottom_onmouseover(this)"
                 onmouseleave="feedback_right_bottom_onmouseleave(this)"
                 style="float: left;height: 2rem;background-color: #4d4d4d;line-height: 1.9rem;color: #ffffff;font-size: 0.6rem;padding-left: 0.6rem;padding-right: 0.6rem;cursor: pointer">
                提交反馈
            </div>
        </b>
    </div>
</div>
<%--下面是预加载图片时需用的input--%>
<input type="file" onchange="previewImage(this)" style="display: none;" id="previewImg">
<%--footer结束--%>
</body>
<script>
    /////////////////////////////初始化INIT开始////////////////////////////////////
    ////////////////////////////全局变量定义区//////////////////////////////////////
    //文件名中间变量，方式空命名
    var tep_name = document.title;
    //判断顶部区域是否已被折叠的标签:false是未折叠,用于给折叠的onclick以判断条件
    var top_fold_tag = false;
    //通过scrollTop设置滚动到990px位置
    document.getElementById('bottom_right').scrollTop = 990;
    //通过scrollTop设置滚动到832px位置
    document.getElementById('bottom_right').scrollLeft = 832;
    //基础控件库的展开与否的判定，初始状态为展开
    var fundamental_control_expansion = true;
    //字体图标库的展开与否的判定，初始状态为展开
    var font_icon_expansion = true;
    //表单元素库的展开与否的判定，初始状态为展开
    var form_element_expansion = false;
    //当前选中的空间的ID
    var now_selected_control = "";
    //Canvas中Div的数量标志，用于增加或删除DIV时的id标记
    var Canvas_DIV_num = 1;
    //Canvas中i的数量标志，用于增加或删除i时的id标记
    var Canvas_i_num = 1;
    //控件库折叠初始化
    if (fundamental_control_expansion == true) {
        document.getElementById("fundamental_control_i").className = "layui-icon layui-icon-triangle-d";
        document.getElementById("fundamental_control_list").style.display = "block";
        document.getElementById("fundamental_control").style.boxShadow = "0px 5px 5px #C6C6C6";
    } else {
        document.getElementById("fundamental_control_i").className = "layui-icon layui-icon-triangle-r";
        document.getElementById("fundamental_control_list").style.display = "none";
        document.getElementById("fundamental_control").style.boxShadow = "none";
    }
    if (font_icon_expansion == true) {
        document.getElementById("fundamental_icon_i").className = "layui-icon layui-icon-triangle-d";
        document.getElementById("fundamental_icon_list").style.display = "block";
        document.getElementById("fundamental_icon").style.boxShadow = "0px 5px 5px #C6C6C6";
    } else {
        document.getElementById("fundamental_icon_i").className = "layui-icon layui-icon-triangle-r";
        document.getElementById("fundamental_icon_list").style.display = "none";
        document.getElementById("fundamental_icon").style.boxShadow = "none";
    }
    if (form_element_expansion == true) {
        document.getElementById("fundamental_form_i").className = "layui-icon layui-icon-triangle-d";
        document.getElementById("fundamental_form_list").style.display = "block";
        document.getElementById("fundamental_form").style.boxShadow = "0px 5px 5px #C6C6C6";
    } else {
        document.getElementById("fundamental_form_i").className = "layui-icon layui-icon-triangle-r";
        document.getElementById("fundamental_form_list").style.display = "none";
        document.getElementById("fundamental_form").style.boxShadow = "none";
    }
    //根据三级菜单是否onmouseover来决定二级菜单是否会触发onblur的标记
    var sub_dependon_ter_tag = true;
    //鼠标从二级菜单转到三级菜单时，给onmouseleave一个极短延时，来判断①执行三级菜单的onmouseover还是②执行二级菜单的onmouseleave
    var judge_subleave_or_terover_tag = true;
    //菜单功能：是否已经显示网格的判断的标记
    var show_grid_tag = true;
    //菜单功能：当前控件内的文字或者文字是否为粗体的标记
    var now_bold_tag = false;
    //菜单功能：当前控件内的文字或者文字是否为斜体的标记
    var now_italic_tag = false;
    //菜单功能：当前控件内的文字或者文字是否有下划线的标记
    var now_underline_tag = false;
    //菜单功能：当前控件的文本颜色标记
    var now_fontcolor = "#000";
    //菜单功能：当前控件的文本对齐标记
    var now_textalign = "center";
    //菜单功能：当前控件的字体
    var now_fontfamily = "Arial";
    //菜单功能：当前控件的字号
    var now_fontsize = "13";
    //菜单功能：当前控件的背景颜色标记
    var now_backgroundcolor = "#FFF";
    //菜单功能：当前控件的边框颜色标记
    var now_bordercolor = "#000";
    //菜单功能：当前控件的边框宽度标记
    var now_borderwidth = "1px";
    //菜单功能：当前控件的边框样式标记
    var now_borderstyle = "solid";

    /////////////////////////////初始化INIT结束////////////////////////////////////

    //elemeny调用 layui依赖组件 <-----!!!!tab依赖!!!!
    layui.use('element', function () {
        var element = layui.element;
        //一些事件监听
        element.on('tab(demo)', function (data) {
            console.log(data);
        });
    });

    //顶部文件重命名的点击事件
    function rename_start() {
        document.getElementById("file_name_div").style.display = "none";
        document.getElementById("file_name_input").style.display = "block";
        document.getElementById("file_name_input").value = document.getElementById("file_name_div").innerHTML.replace(/(^\s*)|(\s*$)/g, "");
        document.getElementById("file_name_input").focus();
        document.getElementById("file_name_input").select();
        tep_name = document.getElementById("file_name_div").innerHTML.replace(/(^\s*)|(\s*$)/g, "");
    }

    //文件input失去焦点事件
    function rename_end() {
        //使用正则去掉名字中的所有空格
        var check_name = document.getElementById("file_name_input").value;
        check_name = check_name.replace(/\s*/g, "");
        document.getElementById("file_name_div").style.display = "block";
        document.getElementById("file_name_input").style.display = "none";
        if (check_name == "") {
            document.getElementById("file_name_div").innerHTML = tep_name;
            document.title = tep_name + " - WebRamber";
        } else {
            document.getElementById("file_name_div").innerHTML = check_name;
            document.title = check_name + " - WebRamber";
        }
    }
    //input回车事件<----执行结果与上面失去焦点事件相同
    $('#file_name_input').bind('keydown', function (event) {
        if (event.keyCode == "13") {
            rename_end();
        }
    });

    //返回键的背景阴影onmouseover事件
    function getshadow_back(sth) {
        sth.style.backgroundColor = "#ECECEC";
        document.getElementById("back_tips").style.display = "block";
    }
    //返回键的背景阴影onmouseleave事件
    function delshadow_back(sth) {
        sth.style.backgroundColor = "#f6f6f6";
        document.getElementById("back_tips").style.display = "none";
    }

    //文件名的背景阴影onmouseover事件
    function getshadow_filename(sth) {
        sth.style.backgroundColor = "#ECECEC";
    }
    //文件名的背景阴影onmouseleave事件
    function delshadow_filename(sth) {
        sth.style.backgroundColor = "#f6f6f6";
    }

    //返回图标的onclick事件
    function back_diagrams() {
        window.location.href = "./diagrams.jsp";
    }

    //顶部菜单栏的阴影出现事件onmouseover
    function tool_shadow_appear(sth) {
        sth.style.backgroundColor = "#ECECEC";
    }
    //顶部菜单栏的阴影消失事件onmouseleave
    function tool_shadow_disappear(sth) {
        sth.style.backgroundColor = "#f6f6f6";
    }

    //顶部菜单栏的onclick
    function submenu_appear(sth) {
        for (var num = 1; num <= 6; num++) {
            document.getElementById("submenu" + num).style.display = "none";
        }
        document.getElementById("sub" + sth.id).style.display = "block";
        document.getElementById("sub" + sth.id).focus();
    }
    //顶部菜单栏的onblur失去焦点事件
    function submenu_onblur(sth) {
        var t = setTimeout(function () {
            if (sub_dependon_ter_tag == true) {
                sth.style.display = "none";
            }
        }, 10);
    }

    //二级菜单栏的onmouseover事件<----含快捷键提示的
    function submenu_onmouseover(sth) {
        sth.style.backgroundColor = "#ececec";
        document.getElementById(sth.id + "_hotkey").style.color = "#3d3d3d";
    }
    //二级菜单栏的onmouseover事件<----含箭头三级菜单的
    function submenu_onmouseover_arrow(sth) {
        sth.style.backgroundColor = "#ececec";
        document.getElementById(sth.id + "_arrow").src = "./img/workshop/menu/rightarrow_3d3d3d.png";
        document.getElementById(sth.id + "_tertiarymenu").style.display = "block";
    }
    //二级菜单栏的onmouseleave事件<----含快捷键提示的
    function submenu_onmouseleave(sth) {
        sth.style.backgroundColor = "#ffffff";
        document.getElementById(sth.id + "_hotkey").style.color = "#7f7f7f";
    }
    //二级菜单栏的onmouseleave事件<----含箭头三级菜单的
    function submenu_onmouseleave_arrow(sth) {
        var t = setTimeout(function () {
            if (judge_subleave_or_terover_tag == true) {
                sth.style.backgroundColor = "#ffffff";
                document.getElementById(sth.id + "_arrow").src = "./img/workshop/menu/rightarrow_7f7f7f.png";
                document.getElementById(sth.id + "_tertiarymenu").style.display = "none";
            }
        }, 10);
    }

    //三级菜单栏的onmouseover事件
    function termenu_onmouseover(sth) {
        judge_subleave_or_terover_tag = false;
        sth.style.backgroundColor = "#ececec";
        sub_dependon_ter_tag = false;
    }
    //三级菜单栏的onmouseleave事件
    function termenu_onmouseleave(sth) {
        judge_subleave_or_terover_tag = true;
        sth.style.backgroundColor = "#ffffff";
        sub_dependon_ter_tag = true;
    }
    //三级菜单大框体的onmouseleave
    function termenu_donot_need_focus() {
        document.getElementById("submenu4_grid").parentNode.focus();
    }

    //网页预览onclick
    function HTML_preview() {
        var content = document.getElementById("main_canvas").innerHTML;
        //window.location.href="./preview.jsp?content="+content;
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.open({
                type: 1,
                title: '将input中的内容复制进你的HTML文件即可',
                closeBtn: 0,
                shadeClose: true,
                skin: 'yourclass',
                area: ['30rem'],
                content: "<input type='text' value='"+content+"'/ style='width:30rem'>"
            });
        });
    }

    //菜单栏-文件-重命名文件onclick事件
    function submenu_1_rename() {
        rename_start();
    }

    //菜单栏-文件-关闭onclick事件
    function submenu_1_close() {
        window.location.href = "./diagrams.jsp";
    }

    //工具栏右端隐藏箭头的onmouseover
    function hide_arrow_onmouseover(sth) {
        sth.style.border = "1px solid #c6c6c6";
    }
    //工具栏右端隐藏箭头的onmouseleave
    function hide_arrow_onmouseleave(sth) {
        sth.style.border = "1px solid #f3f3f3";
    }
    //工具栏右端隐藏箭头的onclick
    function hide_arrow_onclick() {
        if (top_fold_tag == false) {
            document.getElementById("bottom_left").style.height = "37.05rem";
            document.getElementById("bottom_right").style.height = "37.05rem";
            $("#workshop_bottom").animate({
                top: "-=4.55rem"
            }, 300);
            document.getElementById("hide_arrow_rotate").style.transform = "rotate(270deg)";
            top_fold_tag = true;
            var timeoutId = window.setTimeout(function () {
                document.getElementById("workshop_top").style.display = "none";
            }, 300);
        } else {
            document.getElementById("workshop_top").style.display = "block";
            $("#workshop_bottom").animate({
                top: "+=4.55rem"
            }, 300);
            document.getElementById("hide_arrow_rotate").style.transform = "rotate(90deg)";
            var timeoutId = window.setTimeout(function () {
                document.getElementById("bottom_left").style.height = "32.5rem";
                document.getElementById("bottom_right").style.height = "32.5rem";
            }, 300);
            top_fold_tag = false;
        }
    }

    //邀请朋友进入项目的onmouseover
    function invite_friend_inproject_onmouseover(sth) {
        sth.style.border = "1px solid #c6c6c6";
    }
    //邀请朋友进入项目的onmouseleave
    function invite_friend_inproject_onmouseleave(sth) {
        sth.style.border = "1px solid #f1f1f1";
    }
    //邀请朋友进入项目的onclick
    function invite_friend_inproject_onclick(sth) {

    }

    //右下角提交反馈的onmouseover   <------区别与菜单栏-帮助-发送反馈，但两者onclick一致
    function feedback_right_bottom_onmouseover(sth) {
        sth.style.backgroundColor = "#54b4e6";
    }
    //右下角提交反馈的onmouseleave   <------区别与菜单栏-帮助-发送反馈，但两者onclick一致
    function feedback_right_bottom_onmouseleave(sth) {
        sth.style.backgroundColor = "#4D4D4D";
    }

    //右下角灰白色底的onmouseover
    function right_bottom_onmouseover(sth) {
        sth.style.color = "#54b4e6";
    }
    //右下角灰白色底的onmouseleave
    function right_bottom_onmouseleave(sth) {
        sth.style.color = "#4a4a4a";
    }

    //帮助向导的onclick<-----场景：右下角-帮助中心
    function jump_to_helpinfo() {
        window.open('./help_info.jsp');
    }

    //控件搜索框的onmouseover
    function search_control_onmouseover() {
        document.getElementById("search_control_tips").style.display = "block";
    }
    //控件搜索框的onmouseleave
    function search_control_onmouseleave() {
        document.getElementById("search_control_tips").style.display = "none";
    }

    //基础控件库的onclick
    function fundamental_control_onclick() {
        if (fundamental_control_expansion == true) {
            document.getElementById("fundamental_control_i").className = "layui-icon layui-icon-triangle-r";
            document.getElementById("fundamental_control_list").style.display = "none";
            document.getElementById("fundamental_control").style.boxShadow = "none";
            fundamental_control_expansion = false;
        } else {
            document.getElementById("fundamental_control_i").className = "layui-icon layui-icon-triangle-d";
            document.getElementById("fundamental_control_list").style.display = "block";
            document.getElementById("fundamental_control").style.boxShadow = "0px 5px 5px #C6C6C6";
            fundamental_control_expansion = true;
        }
    }

    //字体图标库的onclick
    function font_icon_onclick() {
        if (font_icon_expansion == true) {
            document.getElementById("fundamental_icon_i").className = "layui-icon layui-icon-triangle-r";
            document.getElementById("fundamental_icon_list").style.display = "none";
            document.getElementById("fundamental_icon").style.boxShadow = "none";
            font_icon_expansion = false;
        } else {
            document.getElementById("fundamental_icon_i").className = "layui-icon layui-icon-triangle-d";
            document.getElementById("fundamental_icon_list").style.display = "block";
            document.getElementById("fundamental_icon").style.boxShadow = "0px 5px 5px #C6C6C6";
            font_icon_expansion = true;
        }
    }

    //表单元素库的onclick
    function form_element_onclick() {
        if (form_element_expansion == true) {
            document.getElementById("fundamental_form_i").className = "layui-icon layui-icon-triangle-r";
            document.getElementById("fundamental_form_list").style.display = "none";
            document.getElementById("fundamental_form").style.boxShadow = "none";
            form_element_expansion = false;
        } else {
            document.getElementById("fundamental_form_i").className = "layui-icon layui-icon-triangle-d";
            document.getElementById("fundamental_form_list").style.display = "block";
            document.getElementById("fundamental_form").style.boxShadow = "0px 5px 5px #C6C6C6";
            form_element_expansion = true;
        }
    }
    //导航栏度量的onclick事件
    function viewtool_measure_open(sth) {
        sth.style.boxShadow = "inset 0 1px 2px rgba(0,0,0,.1)";
        sth.style.backgroundColor = "#eee";
        sth.style.backgroundImage = "-webkit-linear-gradient(top,#eee,#e0e0e0)";
        sth.style.border = "1px solid #f4f4f4";
        document.getElementById("view_measure_div").style.display = "block";
    }
    //导航栏的onmouseover
    function view_tools_onmouseover(sth) {
        sth.style.border = "1px solid #c6c6c6";
        sth.style.backgroundColor = "#f6f6f6";
    }
    //导航栏栏的onmouseleave
    function view_tools_onmouseleave(sth) {
        sth.style.border = "1px solid #f4f4f4";
        sth.style.backgroundColor = "#f4f4f4";
    }

    //导航栏关闭按钮的onmouseover事件
    function viewtool_shutdown_onmouseover(sth) {
        sth.style.backgroundColor = "#7E7E7E";
    }
    //导航栏关闭按钮的onmouseleave事件
    function viewtool_shutdown_onmouseleave(sth) {
        sth.style.backgroundColor = "";
    }
    //导航栏关闭按钮的onclick事件
    function viewtool_shutdown_all() {
        var timeoutId = window.setTimeout(function () {
            document.getElementById("view_measure_div").parentNode.style.boxShadow = "";
            document.getElementById("view_measure_div").parentNode.style.backgroundColor = "";
            document.getElementById("view_measure_div").parentNode.style.backgroundImage = "";
            document.getElementById("view_measure_div").parentNode.style.border = "1px solid transparent";
            document.getElementById("view_measure_div").style.display = "none";
        }, 10);
    }

    //导航栏中度量模块的刷新事件
    function viewtool_measure_refresh() {
        if (document.getElementById(now_selected_control) != null){
            //document.getElementById("")
        } else if (document.getElementById(now_selected_control) == null){

        }
    }
    //度量模块X轴的回车事件
    function control_X_input_onkeydown(sth) {
        //回车键的keyCode
        if (event.keyCode == "13") {
            if (now_selected_control != "") {
                document.getElementById(now_selected_control).style.left = sth.value;
            } else if (now_selected_control == "") {
                //如果当前没有选中控件，什么都不干
            }
        }
    }
    //度量模块控件宽度的回车事件
    function control_Width_input_onkeydown(sth) {
        //回车键的keyCode
        if (event.keyCode == "13") {
            if (now_selected_control != "") {
                document.getElementById(now_selected_control).style.width = sth.value;
            } else if (now_selected_control == "") {
                //如果当前没有选中控件，什么都不干
            }
        }
    }
    //度量模块Y轴的回车事件
    function control_Y_input_onkeydown(sth) {
        //回车键的keyCode
        if (event.keyCode == "13") {
            if (now_selected_control != "") {
                document.getElementById(now_selected_control).style.top = sth.value;
            } else if (now_selected_control == "") {
                //如果当前没有选中控件，什么都不干
            }
        }
    }
    //度量模块控件高度的回车事件
    function control_Height_input_onkeydown(sth) {
        //回车键的keyCode
        if (event.keyCode == "13") {
            if (now_selected_control != "") {
                document.getElementById(now_selected_control).style.height = sth.value;
            } else if (now_selected_control == "") {
                //如果当前没有选中控件，什么都不干
            }
        }
    }

    //顶部工具栏的统一onmouseover事件
    function top_tools_unitonmouseover(sth) {
        sth.style.border = "1px solid #c6c6c6";
        document.getElementById(sth.id + "_tips").style.display = "block";
    }
    //顶部工具栏的统一onmouseleave事件
    function top_tools_unitonmouseleave(sth) {
        sth.style.border = "1px solid #f3f3f3";
        document.getElementById(sth.id + "_tips").style.display = "none";
    }
    //顶部工具栏的统一onmouseover事件<-----针对字号模块的特殊化处理
    function top_tools_fontsize_onmouseover(sth) {
        sth.style.border = "1px solid #c6c6c6";
        document.getElementById("top_tool_9_input").style.backgroundColor = "#ffffff";
        document.getElementById("top_tool_9_arrow").style.borderLeft = "1px solid #c6c6c6";
        document.getElementById(sth.id + "_tips").style.display = "block";
    }
    //顶部工具栏的统一onmouseleave事件<-----针对字号模块的特殊化处理
    function top_tools_fontsize_onmouseleave(sth) {
        sth.style.border = "1px solid #f3f3f3";
        document.getElementById("top_tool_9_input").style.backgroundColor = "#f3f3f3";
        document.getElementById("top_tool_9_arrow").style.borderLeft = "1px solid #f3f3f3";
        document.getElementById(sth.id + "_tips").style.display = "none";
    }

    //字号模块上下键的onmouseover
    function top_tools_fontsize_arrow_onmouseover(sth) {
        sth.style.backgroundColor = "#cccccc";
    }
    //字号模块上下键的onmouseleave
    function top_tools_fontsize_arrow_onmouseleave(sth) {
        sth.style.backgroundColor = "#f0f0f0";
    }

    //显示网格的onclick事件
    function submenu4_showgrid_onclick(sth) {
        if (show_grid_tag == true) {
            document.getElementById("main_canvas").style.backgroundImage = "";
            document.getElementById("submenu4_showgrid_img").src = "";
            show_grid_tag = false;
        } else {
            document.getElementById("main_canvas").style.backgroundImage = "url(./img/workshop/canvas_bg_normal.png)";
            document.getElementById("submenu4_showgrid_img").src = "./img/workshop/menu/page/check_000000.png";
            show_grid_tag = true;
        }
        sth.parentNode.style.display = "none";
    }
    //改变网格大小的onclick事件
    function submenu4_grid_onclick(sth) {
        if (sth.id == "submenu4_grid_small") {
            document.getElementById("main_canvas").style.backgroundImage = "url(./img/workshop/canvas_bg_small.png)";
        } else if (sth.id == "submenu4_grid_normal") {
            document.getElementById("main_canvas").style.backgroundImage = "url(./img/workshop/canvas_bg_normal.png)";
        } else if (sth.id == "submenu4_grid_big") {
            document.getElementById("main_canvas").style.backgroundImage = "url(./img/workshop/canvas_bg_big.png)";
        } else if (sth.id == "submenu4_grid_huge") {
            document.getElementById("main_canvas").style.backgroundImage = "url(./img/workshop/canvas_bg_huge.png)";
        }
        sth.parentNode.parentNode.parentNode.style.display = "none";
    }

    //粗体模块的onclick事件
    function top_tool_3_onclick(sth) {
        if (now_bold_tag == true) {
            //加粗已开启，要关闭
            sth.style.backgroundColor = "#f6f6f6";
            now_bold_tag = false;
            sth.style.border = "1px solid #f3f3f3";
            document.getElementById(now_selected_control).style.fontWeight = "";
        } else if (now_bold_tag == false) {
            //加粗已关闭，要开启
            sth.style.backgroundColor = "#E4E4E4";
            now_bold_tag = true;
            sth.style.border = "1px solid #c6c6c6";
            document.getElementById(now_selected_control).style.fontWeight = "bold";
        }
    }
    //粗体的onmouseleave事件
    function top_tool_3_onmouseleave(sth) {
        if (now_bold_tag == true) {

        } else if (now_bold_tag == false) {
            sth.style.border = "1px solid #f3f3f3";
        }
        document.getElementById(sth.id + "_tips").style.display = "none";
    }

    //斜体模块的onclick事件
    function top_tool_4_onclick(sth) {
        if (now_italic_tag == true) {
            //斜体已开启，要关闭
            sth.style.backgroundColor = "#f6f6f6";
            now_italic_tag = false;
            sth.style.border = "1px solid #f3f3f3";
            document.getElementById(now_selected_control).style.fontStyle = "";
        } else if (now_italic_tag == false) {
            //斜体已关闭，要开启
            sth.style.backgroundColor = "#E4E4E4";
            now_italic_tag = true;
            sth.style.border = "1px solid #c6c6c6";
            document.getElementById(now_selected_control).style.fontStyle = "italic";
        }
    }
    //斜体的onmouseleave事件
    function top_tool_4_onmouseleave(sth) {
        if (now_italic_tag == true) {

        } else if (now_italic_tag == false) {
            sth.style.border = "1px solid #f3f3f3";
        }
        document.getElementById(sth.id + "_tips").style.display = "none";
    }

    //下划线模块的onclick事件
    function top_tool_5_onclick(sth) {
        if (now_underline_tag == true) {
            //下划线已开启，要关闭
            document.getElementById(now_selected_control).style.textDecoration = "none";
            sth.style.backgroundColor = "#f6f6f6";
            now_underline_tag = false;
            sth.style.border = "1px solid #f3f3f3";
            if (document.getElementById(now_selected_control + "_text") != null){
                document.getElementById(now_selected_control + "_text").style.textDecoration = "none";
            }
        } else if (now_underline_tag == false) {
            document.getElementById(now_selected_control).style.textDecoration = "underline";
            //下划线已关闭，要开启
            sth.style.backgroundColor = "#E4E4E4";
            now_underline_tag = true;
            sth.style.border = "1px solid #c6c6c6";
            if (document.getElementById(now_selected_control + "_text") != null){
                document.getElementById(now_selected_control + "_text").style.textDecoration = "underline";
            }
        }
    }
    //下划线的onmouseleave事件
    function top_tool_5_onmouseleave(sth) {
        if (now_underline_tag == true) {

        } else if (now_underline_tag == false) {
            sth.style.border = "1px solid #f3f3f3";
        }
        document.getElementById(sth.id + "_tips").style.display = "none";
    }

    //文本颜色下拉模块的onclick事件
    function top_tool_6_onclick(sth) {
        sth.parentNode.style.backgroundColor = "#E4E4E4";
    }
    //colorpicker调用 layui依赖组件 <-----!!!!文本颜色严重依赖!!!!
    layui.use('colorpicker', function () {
        var colorpicker_fontcolor = layui.colorpicker;
        //文本颜色的选择器
        colorpicker_fontcolor.render({
            elem: '#tool_fontcolor_picker'  //绑定元素
            , color: '#000'
            , predefine: true
            , colors: ['#F00', '#0F0', '#00F', 'rgb(255, 69, 0)', 'rgba(255, 69, 0, 0.5)']
            , change: function (color) {

            }
            , done: function (color) {
                if (now_selected_control != "") {
                    //如果当前选中了一个控件，进行下一步判断
                    document.getElementById(now_selected_control).style.color = color;
                    if (document.getElementById(now_selected_control + "_text") != null){
                        //如果控件内部有text编辑，改变控件的文本颜色
                        document.getElementById(now_selected_control + "_text").style.color = color;
                    }
                } else if (now_selected_control == "") {
                    //如果当前没有选择控件,啥都不干
                }
                document.getElementById("top_tool_6").style.backgroundColor = "#f6f6f6";
            }
        });
        //填充颜色的选择器
        var colorpicker_colorfill = layui.colorpicker;
        colorpicker_colorfill.render({
            elem: '#tool_colorfill_picker'  //绑定元素
            , color: '#FFF'
            , predefine: true
            , colors: ['#F00', '#0F0', '#00F', 'rgb(255, 69, 0)', 'rgba(255, 69, 0, 0.5)']
            , change: function (color) {

            }
            , done: function (color) {
                if (now_selected_control != "") {
                    //如果当前选中的控件是图标控件，改变控件的字体颜色，否则就改变背景颜色
                    if(document.getElementById(now_selected_control).tagName == "I"){
                        document.getElementById(now_selected_control).style.color = color;
                    } else {
                        document.getElementById(now_selected_control).style.backgroundColor = color;
                    }
                } else if (now_selected_control == "") {
                    //如果当前没有选择控件,啥都不干
                }
                document.getElementById("top_tool_10").style.backgroundColor = "#f6f6f6";
            }
        });
        //边框颜色的选择器
        var colorpicker_bordercolor = layui.colorpicker;
        colorpicker_bordercolor.render({
            elem: '#tool_bordercolor_picker'  //绑定元素
            , color: '#000'
            , predefine: true
            , colors: ['#F00', '#0F0', '#00F', 'rgb(255, 69, 0)', 'rgba(255, 69, 0, 0.5)']
            , change: function (color) {

            }
            , done: function (color) {
                if (now_selected_control != "") {
                    //如果当前选中了一个控件，改变控件的边框颜色
                    document.getElementById(now_selected_control).style.borderColor = color;
                } else if (now_selected_control == "") {
                    //如果当前没有选择控件,啥都不干
                }
                document.getElementById("top_tool_11").style.backgroundColor = "#f6f6f6";
            }
        });
    });
    //失去焦点后仅使自己变背景颜色onblur事件
    function top_tool_disappearmyself_onblur(sth) {
        sth.parentNode.style.backgroundColor = "#f3f3f3";
    }

    //文本对齐下拉模块的onclick事件
    function top_tool_7_onclick(sth) {
        sth.style.backgroundColor = "#E4E4E4";
        document.getElementById("tool_align_menu").style.display = "block";
        document.getElementById("tool_align_menu").focus();
    }
    //文本对齐下拉菜单的onmouseover事件
    function tool_align_menu_onmouseover() {
        document.getElementById("top_tool_7_tips").style.zIndex = "1";
    }
    //文本对齐下拉菜单的onmouseleave事件
    function tool_align_menu_onmouseleave() {
        document.getElementById("top_tool_7_tips").style.zIndex = "10";
    }
    //文本对齐下拉菜单内容物的onclick事件
    function tool_align_content_onclick(sth) {
        if (now_selected_control != "") {
            //如果当前选中了一个控件，就改变当前控件的文本对齐
            document.getElementById(now_selected_control).style.textAlign = sth.id.slice(5);
            if (document.getElementById(now_selected_control + "_text") != null){
                document.getElementById(now_selected_control + "_text").style.textAlign = sth.id.slice(5);
            }
        } else if (now_selected_control == "") {
            //如果当前没有选中控件，什么都不干
        }
        document.getElementById("now_align").src = "./img/workshop/top_tools/" + sth.id + "_000000.png";
        document.getElementById("top_tool_7_tips").style.display = "none";
        var timeoutId = window.setTimeout(function () {
            sth.parentNode.style.display = "none";
        }, 10);
    }
    //文本对齐下拉菜单内容物的onmouseover事件
    function tool_align_content_onmouseover(sth) {
        sth.style.backgroundColor = "#ececec";
    }
    //文本对齐下拉菜单内容物的onmouseleave事件
    function tool_align_content_onmouseleave(sth) {
        sth.style.backgroundColor = "#ffffff";
    }

    //字体下拉模块的onclick事件
    function top_tool_8_onclick(sth) {
        sth.style.backgroundColor = "#E4E4E4";
        document.getElementById("tool_font_menu").style.display = "block";
        document.getElementById("tool_font_menu").focus();
    }
    //字体下拉菜单的onblur事件
    function tool_font_menu_onblur(sth) {
        sth.parentNode.style.backgroundColor = "#f3f3f3";
        sth.style.display = "none";
    }
    //字体下拉菜单的onmouseover事件
    function tool_font_menu_onmouseover() {
        document.getElementById("top_tool_8_tips").style.zIndex = "1";
    }
    //字体下拉菜单的onmouseleave事件
    function tool_font_menu_onmouseleave() {
        document.getElementById("top_tool_8_tips").style.zIndex = "10";
    }
    //更改字体所触发的onclick事件
    function tool_font_change_onclick(sth) {
        document.getElementById("now_font").innerHTML = sth.textContent;
        document.getElementById("now_font").style.fontFamily = sth.style.fontFamily;
        for (var i = 1; i <= 13; i++) {
            document.getElementById("font_" + i + "_img").src = "";
        }
        document.getElementById(sth.id + "_img").src = "./img/workshop/menu/page/check_000000.png";
        document.getElementById("top_tool_8_tips").style.display = "none";
        if (now_selected_control != "") {
            document.getElementById(now_selected_control).style.fontFamily = sth.textContent.replace(/(^\s*)|(\s*$)/g, "");
            //如果当前选中了一个控件，就改变当前控件的字体
            if (document.getElementById(now_selected_control + "_text") != null){
                document.getElementById(now_selected_control + "_text").style.fontFamily = sth.textContent.replace(/(^\s*)|(\s*$)/g, "");
            }
        } else if (now_selected_control == "") {
            //如果当前没有选中控件，什么都不干
        }
        var timeoutId = window.setTimeout(function () {
            sth.parentNode.style.display = "none";
        }, 10);
    }

    //字号input的onclick事件
    function top_tools_fontsize_input(sth) {
        sth.select();
    }
    //字号input的onkeydown事件
    function top_tool_9_onkeydown(sth) {
        //回车键的keyCode
        if (event.keyCode == "13") {
            if (now_selected_control != "") {
                document.getElementById(now_selected_control).style.fontSize = sth.value + "px";
                //如果当前选中了一个控件，就改变当前控件的字号
                if (document.getElementById(now_selected_control + "_text") != null){
                    document.getElementById(now_selected_control + "_text").style.fontSize = sth.value + "px";
                }
            } else if (now_selected_control == "") {
                //如果当前没有选中控件，什么都不干
            }
        }
    }
    //加大字号onclick事件
    function top_tools_fontsize_add() {
        document.getElementById("top_tool_9_input").value++;
        if (now_selected_control != "") {
            var last_fontsize = document.getElementById(now_selected_control).style.fontSize;
            last_fontsize = last_fontsize.substr(0, last_fontsize.length - 2);
            now_fontsize = ++last_fontsize;
            document.getElementById(now_selected_control).style.fontSize = now_fontsize + "px";
            //如果当前选中了一个控件，就改变当前控件的字号
            if (document.getElementById(now_selected_control + "_text") != null){
                last_fontsize = document.getElementById(now_selected_control + "_text").style.fontSize;
                last_fontsize = last_fontsize.substr(0, last_fontsize.length - 2);
                now_fontsize = ++last_fontsize;
                document.getElementById(now_selected_control + "_text").style.fontSize = now_fontsize + "px";
            }
        } else if (now_selected_control == "") {
            //如果当前没有选中控件，什么都不干
        }
        if (document.getElementById("top_tool_9_input").value > 999) {
            document.getElementById("top_tool_9_input").value = "999";
            if (now_selected_control != "") {
                document.getElementById(now_selected_control).style.fontSize = "999px";
                //如果当前选中了一个控件，就改变当前控件的字号
                if (document.getElementById(now_selected_control + "_text") != null){
                    document.getElementById(now_selected_control + "_text").style.fontSize = "999px";
                }
            } else if (now_selected_control == "") {
                //如果当前没有选中控件，什么都不干
            }
        }
    }
    //减小字号onclick事件
    function top_tools_fontsize_sub() {
        document.getElementById("top_tool_9_input").value--;
        if (now_selected_control != "") {
            var last_fontsize = document.getElementById(now_selected_control).style.fontSize;
            last_fontsize = last_fontsize.substr(0, last_fontsize.length - 2);
            now_fontsize = --last_fontsize;
            document.getElementById(now_selected_control).style.fontSize = now_fontsize + "px";
            //如果当前选中了一个控件，就改变当前控件的字号
            if (document.getElementById(now_selected_control + "_text") != null){
                last_fontsize = document.getElementById(now_selected_control + "_text").style.fontSize;
                last_fontsize = last_fontsize.substr(0, last_fontsize.length - 2);
                now_fontsize = --last_fontsize;
                document.getElementById(now_selected_control + "_text").style.fontSize = now_fontsize + "px";
            }
        } else if (now_selected_control == "") {
            //如果当前没有选中控件，什么都不干
        }
        if (document.getElementById("top_tool_9_input").value < 13) {
            document.getElementById("top_tool_9_input").value = "13";
            if (now_selected_control != "") {
                document.getElementById(now_selected_control).style.fontSize = "13px";
                //如果当前选中了一个控件，就改变当前控件的字号
                if (document.getElementById(now_selected_control + "_text") != null){
                    document.getElementById(now_selected_control + "_text").style.fontSize = "13x";
                }
            } else if (now_selected_control == "") {
                //如果当前没有选中控件，什么都不干
            }
        }
    }

    //边框宽度下拉模块的onclick事件
    function top_tool_12_onclick(sth) {
        sth.style.backgroundColor = "#E4E4E4";
        document.getElementById("tool_lineheight_menu").style.display = "block";
        document.getElementById("tool_lineheight_menu").focus();
    }
    //边框宽度下拉菜单的onmouseover事件
    function tool_lineheight_menu_onmouseover() {
        document.getElementById("top_tool_12_tips").style.zIndex = "1";
    }
    //边框宽度下拉菜单的onmouseleave事件
    function tool_lineheight_menu_onmouseleave() {
        document.getElementById("top_tool_12_tips").style.zIndex = "10";
    }
    //更改边框宽度所触发的onclick事件
    function tool_lineheight_change_onclick(sth) {
        if (now_selected_control != "") {
            //如果当前选中了一个控件，就改变当前控件的边框宽度
            document.getElementById(now_selected_control).style.borderWidth = sth.id.slice(11) + "px";
        } else if (now_selected_control == "") {
            //如果当前没有选中控件，什么都不干
        }
        for (var i = 0; i <= 10; i++) {
            document.getElementById("lineheight_" + i + "_img").src = "";
        }
        document.getElementById(sth.id + "_img").src = "./img/workshop/menu/page/check_000000.png";
        document.getElementById("top_tool_12_tips").style.display = "none";
        var timeoutId = window.setTimeout(function () {
            sth.parentNode.style.display = "none";
        }, 10);
    }

    //边框样式下拉模块的onclick事件
    function top_tool_13_onclick(sth) {
        sth.style.backgroundColor = "#E4E4E4";
        document.getElementById("tool_linestyle_menu").style.display = "block";
        document.getElementById("tool_linestyle_menu").focus();
    }
    //边框样式下拉菜单的onmouseover事件
    function tool_linestyle_menu_onmouseover() {
        document.getElementById("top_tool_13_tips").style.zIndex = "1";
    }
    //边框样式下拉菜单的onmouseleave事件
    function tool_linestyle_menu_onmouseleave() {
        document.getElementById("top_tool_13_tips").style.zIndex = "10";
    }
    //更改边框样式所触发的onclick事件
    function tool_linestyle_change_onclick(sth) {
        if (now_selected_control != "") {
            //如果当前选中了一个控件，就改变当前控件的边框样式
            switch (sth.id) {
                case "linestyle_1":
                    document.getElementById(now_selected_control).style.borderStyle = "none";
                    break;
                case "linestyle_2":
                    document.getElementById(now_selected_control).style.borderStyle = "solid";
                    break;
                case "linestyle_3":
                    document.getElementById(now_selected_control).style.borderStyle = "dotted";
                    break;
                case "linestyle_4":
                    document.getElementById(now_selected_control).style.borderStyle = "dashed";
                    break;
                default:
                    alert("注意！边框样式模块有问题，当前选中控件可能不支持边框样式css");
            }
        } else if (now_selected_control == "") {
            //如果当前没有选中控件，什么都不干
        }
        for (var i = 1; i <= 4; i++) {
            document.getElementById("linestyle_" + i + "_img").src = "";
        }
        document.getElementById(sth.id + "_img").src = "./img/workshop/menu/page/check_000000.png";
        document.getElementById("top_tool_13_tips").style.display = "none";
        var timeoutId = window.setTimeout(function () {
            sth.parentNode.style.display = "none";
        }, 10);
    }

    //控件上移一层的onclick事件
    function top_tool_14_onclick(sth) {
        if (now_selected_control != "") {
            //如果当前选中了一个控件，就上移一层
            document.getElementById(now_selected_control).style.zIndex +=1;
        } else if (now_selected_control == "") {
            //如果当前没有选中控件，什么都不干
        }
    }
    //控件下移一层的onclick事件
    function top_tool_15_onclick(sth) {
        var bottom = document.getElementById("main_canvas").style.zIndex;
        if (document.getElementById(now_selected_control).style.zIndex == bottom){
            //如果已经到达底线层数，啥都不做
        } else if (document.getElementById(now_selected_control).style.zIndex >= bottom){
            if (now_selected_control != "") {
                //如果当前选中了一个控件，就下移一层
                document.getElementById(now_selected_control).style.zIndex -=1;
            } else if (now_selected_control == "") {
                //如果当前没有选中控件，什么都不干
            }
        }
    }

    window.onload = function () {
        // box是装图片的容器,fa是图片移动缩放的范围,scale是控制缩放的小图标
        var fa = document.getElementById('main_canvas');
        var box = document.getElementById("testF");
        var scale = document.getElementById("testC");

    }

    //左侧可拖拽元素库的onmouseover事件
    function wecanbe_drag_onmouseover(sth) {
        sth.style.backgroundColor = "#C6C6C6";
    }
    //左侧可拖拽元素库的onmouseleave事件
    function wecanbe_drag_onmouseleave(sth) {
        sth.style.backgroundColor = "#F1F1F1";
    }

    //向画布中增加DIV的onclick事件
    function add_div_toCanvas() {
        //1.创建一个box  ①.用JS动态创建一个div
        var box = document.createElement('div');
        //设置box的属性  ②.设置div的属性
        box.style.position = "absolute";
        box.style.left = "0px";
        box.style.top = "0px";
        box.style.width = "3rem";
        box.style.height = "2rem";
        box.style.cursor = "move";
        box.style.lineHeight = box.style.height;
//        box.style.fontWeight = "bold";
//        box.style.fontStyle = "italic";
//        box.style.textDecoration = "underline";
        box.style.color = "#794495";
        box.style.textAlign = "center";
        box.style.fontFamily = "Arial";
        box.style.fontSize = "13px";
        box.style.backgroundColor = "#b9b9b9";
        box.style.border = "1px solid #000";
        //设置box的id   ③.设置div的ID
        box.id = "Canvas_Div_" + Canvas_DIV_num;
        //设置box 的onclick事件  ④.设置div的onclick事件（包括更新边框锚点、工具栏）
        box.onclick = function (e) {
            this.style.outline = "1px solid #883333";
            if ((now_selected_control != this.id) && (now_selected_control != "")) {
                document.getElementById(now_selected_control + "_anchor").style.display = "none";
                document.getElementById(now_selected_control).style.outline = "none";
            }
            document.getElementById(this.id + "_anchor").style.display = "block";
            now_selected_control = this.id;
            //将本控件的各类属性赋值给导航栏
            //1.X轴坐标
            document.getElementById("control_X_input").disabled="";
            document.getElementById("control_X_input").style.color = "#000";
            document.getElementById("control_X_input").style.border ="1px solid #c6c6c6";
            document.getElementById("control_X_input").value = this.style.left;
            //2.Y轴坐标
            document.getElementById("control_Y_input").disabled="";
            document.getElementById("control_Y_input").style.color = "#000";
            document.getElementById("control_Y_input").style.border ="1px solid #c6c6c6";
            document.getElementById("control_Y_input").value = this.style.top;
            //3.控件宽度
            document.getElementById("control_Width_input").disabled="";
            document.getElementById("control_Width_input").style.color = "#000";
            document.getElementById("control_Width_input").style.border ="1px solid #c6c6c6";
            document.getElementById("control_Width_input").value = this.style.width;
            //4.控件高度
            document.getElementById("control_Height_input").disabled="";
            document.getElementById("control_Height_input").style.color = "#000";
            document.getElementById("control_Height_input").style.border ="1px solid #c6c6c6";
            document.getElementById("control_Height_input").value = this.style.height;
            //将本控件的各类属性赋值给工具栏
            //1.加粗模块
            var bold = this.style.fontWeight;
            if (bold == "") {
                //如果控件原本不是加粗，将加粗模块复原
                document.getElementById("top_tool_3").style.backgroundColor = "#f6f6f6";
                now_bold_tag = false;
                document.getElementById("top_tool_3").style.border = "1px solid #f3f3f3";
            } else if (bold == "bold") {
                //如果控件原本是加粗，加载加粗模块
                document.getElementById("top_tool_3").style.backgroundColor = "#E4E4E4";
                now_bold_tag = true;
                document.getElementById("top_tool_3").style.border = "1px solid #c6c6c6";
            }
            //2.斜体模块
            var italic = this.style.fontStyle;
            if (italic == "") {
                //如果控件原本不是斜体，将斜体模块复原
                document.getElementById("top_tool_4").style.backgroundColor = "#f6f6f6";
                now_italic_tag = false;
                document.getElementById("top_tool_4").style.border = "1px solid #f3f3f3";
            } else if (italic == "italic") {
                //如果控件原本是斜体，加载斜体模块
                document.getElementById("top_tool_4").style.backgroundColor = "#E4E4E4";
                now_italic_tag = true;
                document.getElementById("top_tool_4").style.border = "1px solid #c6c6c6";
            }
            //3.下划线模块
            var textdecoration = "none";
            if (document.getElementById(now_selected_control + "_text") != null) {
                textdecoration = document.getElementById(now_selected_control + "_text").style.textDecoration;
            } else {
                textdecoration = document.getElementById(now_selected_control).style.textDecoration;
            }
            if ((textdecoration == "none")||(textdecoration == "")) {
                //如果控件原本没有下划线，将下划线模块复原
                document.getElementById("top_tool_5").style.backgroundColor = "#f6f6f6";
                now_underline_tag = false;
                document.getElementById("top_tool_5").style.border = "1px solid #f3f3f3";
            } else if (textdecoration == "underline") {
                //如果控件原本有下划线，加载下划线模块
                document.getElementById("top_tool_5").style.backgroundColor = "#E4E4E4";
                now_underline_tag = true;
                document.getElementById("top_tool_5").style.border = "1px solid #c6c6c6";
            }
            //4.文本颜色模块
            var font_color = "#000";
            if (document.getElementById(now_selected_control + "_text") != null) {
                font_color = document.getElementById(now_selected_control + "_text").style.color;
            } else {
                font_color = document.getElementById(now_selected_control).style.color;
            }
            now_fontcolor = font_color;
            //获取文本颜色颜色选择器
            var font_picker = document.getElementById("tool_fontcolor_picker");
            //获取picker的子元素div
            var font_picker_div = font_picker.firstElementChild;
            //获取picker_div的子元素span
            var font_picker_div_span = font_picker_div.firstElementChild;
            //获取picker_div_span的子元素span
            var font_picker_div_span_span = font_picker_div_span.firstElementChild;
            //给颜色选择器改变颜色
            font_picker_div_span_span.style.backgroundColor = font_color;
            //5.文本对齐模块
            var font_align = "center";
            if (document.getElementById(now_selected_control + "_text") != null) {
                font_align = document.getElementById(now_selected_control + "_text").style.textAlign;
            } else {
                font_align = document.getElementById(now_selected_control).style.textAlign;
            }
            now_textalign = font_align;
            switch (font_align) {
                case "left":
                    document.getElementById("now_align").src = "./img/workshop/top_tools/font_left_000000.png";
                    break;
                case "center":
                    document.getElementById("now_align").src = "./img/workshop/top_tools/font_center_000000.png";
                    break;
                case "right":
                    document.getElementById("now_align").src = "./img/workshop/top_tools/font_right_000000.png";
                    break;
                default:
                    alert("注意！字体对齐模块有问题，当前选中控件可能不支持文本对齐css");
            }
            //6.字体模块
            var font_family = "Arial";
            if (document.getElementById(now_selected_control + "_text") != null) {
                font_family = document.getElementById(now_selected_control + "_text").style.fontFamily.replace(/\"/g, "");
            } else {
                font_family = document.getElementById(now_selected_control).style.fontFamily.replace(/\"/g, "");
            }
            now_fontfamily = font_family;
            document.getElementById("now_font").innerHTML = font_family;
            document.getElementById("now_font").style.fontFamily = font_family;
            for (var i = 1; i <= 13; i++) {
                document.getElementById("font_" + i + "_img").src = "";
            }
            //将字体的对勾放到对应位置
            switch (font_family) {
                case "Arial":
                    document.getElementById("font_1_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "Verdana":
                    document.getElementById("font_2_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "Georgia":
                    document.getElementById("font_3_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "Times New Roman":
                    document.getElementById("font_4_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "Courier New":
                    document.getElementById("font_5_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "Impact":
                    document.getElementById("font_6_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "Comic Sans MS":
                    document.getElementById("font_7_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "Tahoma":
                    document.getElementById("font_8_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "Garamond":
                    document.getElementById("font_9_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "Lucida Console":
                    document.getElementById("font_10_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "宋体":
                    document.getElementById("font_11_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "微软雅黑":
                    document.getElementById("font_12_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "黑体":
                    document.getElementById("font_13_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                default:
                    alert("注意！字体模块有问题，当前选中控件可能不支持字体css");
            }
            //7.字号模块
            var fontsize = "13px";
            if (document.getElementById(now_selected_control + "_text") != null) {
                fontsize = document.getElementById(now_selected_control + "_text").style.fontSize.replace(/[^0-9]/ig, "");
            } else {
                fontsize = document.getElementById(now_selected_control).style.fontSize.replace(/[^0-9]/ig, "");
            }
            now_fontsize = fontsize;
            document.getElementById("top_tool_9_input").value = fontsize;
            //8.背景颜色模块
            var background_color = this.style.backgroundColor;
            now_backgroundcolor = background_color;
            //获取背景颜色颜色选择器
            var bg_picker = document.getElementById("tool_colorfill_picker");
            //获取picker的子元素div
            var bg_picker_div = bg_picker.firstElementChild;
            //获取picker_div的子元素span
            var bg_picker_div_span = bg_picker_div.firstElementChild;
            //获取picker_div_span的子元素span
            var bg_picker_div_span_span = bg_picker_div_span.firstElementChild;
            //给背景颜色选择器改变颜色
            bg_picker_div_span_span.style.backgroundColor = background_color;
            //9.边框颜色模块
            var border_color = this.style.borderColor;
            now_bordercolor = border_color;
            //获取边框颜色颜色选择器
            var border_picker = document.getElementById("tool_bordercolor_picker");
            //获取picker的子元素div
            var border_picker_div = border_picker.firstElementChild;
            //获取picker_div的子元素span
            var border_picker_div_span = border_picker_div.firstElementChild;
            //获取picker_div_span的子元素span
            var border_picker_div_span_span = border_picker_div_span.firstElementChild;
            //给边框颜色选择器改变颜色
            border_picker_div_span_span.style.backgroundColor = border_color;
            //10.边框宽度模块
            var border_width = this.style.borderWidth;
            now_borderwidth = border_width;
            //获取去除尾部px的纯数字宽度
            var cut_px = border_width.substr(0, border_width.length - 2);
            //将边框宽度下拉菜单的对勾全部取消
            for (var i = 0; i <= 10; i++) {
                document.getElementById("lineheight_" + i + "_img").src = "";
            }
            //将边框宽度下拉菜单的与控件匹配的对勾显示
            document.getElementById("lineheight_" + cut_px + "_img").src = "./img/workshop/menu/page/check_000000.png";
            //11.边框样式模块
            var border_style = this.style.borderStyle;
            now_borderstyle = border_style;
            //将边框样式下拉菜单的对勾全部取消
            for (var i = 1; i <= 4; i++) {
                document.getElementById("linestyle_" + i + "_img").src = "";
            }
            //将边框样式下拉菜单的与控件匹配的对勾显示
            switch (border_style) {
                case "none":
                    document.getElementById("linestyle_1_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "solid":
                    document.getElementById("linestyle_2_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "dotted":
                    document.getElementById("linestyle_3_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "dashed":
                    document.getElementById("linestyle_4_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                default:
                    alert("注意！边框样式模块有问题，当前选中控件可能不支持边框样式css");
            }
            //点击box后会显示右下角的辅助定位框体

            //

            //阻止子元素的onclick向父元素冒泡
            e.stopPropagation();
        };
        //创建一个scale   ⑤.创建一个锚点scale
        var scale = document.createElement('div');
        //设置scale的属性   ⑥.设置锚点的属性
        scale.style.width = "6px";
        scale.style.height = "6px";
        scale.style.overflow = "hidden";
        scale.style.cursor = "se-resize";
        scale.style.position = "absolute";
        scale.style.right = "-3.5px";
        scale.style.bottom = "-3.5px";
        scale.style.border = "1px solid #000";
        scale.style.backgroundColor = "#FFF";
        scale.style.zIndex = box.style.zIndex + 1;
        scale.style.display = "none";
        //设置scale的id   ⑦.设置锚点的ID
        scale.id = box.id + "_anchor";
        //使DIVid计数器自增
        Canvas_DIV_num++;
        //获取画布对象
        var fa = document.getElementById('main_canvas');
        //图片移动效果   ⑧.制作控件的移动和缩放效果
        box.onmousedown = function (ev) {
            var oEvent = ev;
            //浏览器有一些图片的默认事件,这里要阻止
            oEvent.preventDefault();
            var disX = oEvent.clientX - box.offsetLeft;
            var disY = oEvent.clientY - box.offsetTop;
            fa.onmousemove = function (ev) {
                oEvent = ev;
                oEvent.preventDefault();
                var x = oEvent.clientX - disX;
                var y = oEvent.clientY - disY;
                //图形移动的边界判断
                x = x <= 0 ? 0 : x;
                x = x >= fa.offsetWidth - box.offsetWidth ? fa.offsetWidth - box.offsetWidth : x;
                y = y <= 0 ? 0 : y;
                y = y >= fa.offsetHeight - box.offsetHeight ? fa.offsetHeight - box.offsetHeight : y;
                box.style.left = x + 'px';
                box.style.top = y + 'px';
            }
            //图形移出父盒子取消移动事件,防止移动过快触发鼠标移出事件,导致鼠标弹起事件失效
            fa.onmouseleave = function () {
                fa.onmousemove = null;
                fa.onmouseup = null;
            }
            //鼠标弹起后停止移动
            fa.onmouseup = function () {
                fa.onmousemove = null;
                fa.onmouseup = null;
            }
        }
        //图片缩放效果
        scale.onmousedown = function (e) {
            //阻止冒泡,避免缩放时触发移动事件
            e.stopPropagation();
            e.preventDefault();
            var pos = {
                'w': box.offsetWidth,
                'h': box.offsetHeight,
                'x': e.clientX,
                'y': e.clientY
            };
            fa.onmousemove = function (ev) {
                ev.preventDefault();
                //设置图片的最小缩放为30*30
                var w = Math.max(30, ev.clientX - pos.x + pos.w)
                var h = Math.max(30, ev.clientY - pos.y + pos.h)
                //console.log(w,h)
                //设置图片的最大宽高
                w = w >= fa.offsetWidth - box.offsetLeft ? fa.offsetWidth - box.offsetLeft : w
                h = h >= fa.offsetHeight - box.offsetTop ? fa.offsetHeight - box.offsetTop : h
                box.style.width = w + 'px';
                box.style.height = h + 'px';
                //console.log(box.offsetWidth,box.offsetHeight)
            }
            fa.onmouseleave = function () {
                fa.onmousemove = null;
                fa.onmouseup = null;
            }
            fa.onmouseup = function () {
                fa.onmousemove = null;
                fa.onmouseup = null;
            }
        }
        //控件右下角锚点的onmousemove事件，用于变化大小时，保持div高度和行高一致，使文字垂直居中
        scale.onmousemove = function () {
            this.parentNode.style.lineHeight = this.parentNode.style.height;
        }
        //增加box的双击事件   ⑨.设置div的双击事件（文本编辑）
        box.ondblclick = function () {
            //创建新的input元素用以添加文本信息
            var text_input = document.createElement('input');
            //text_input的属性设置
            text_input.id = this.id + "_input";
            text_input.type = 'text';
            text_input.style.position = "absolute";
            text_input.style.top = "0";
            text_input.style.left = "0";
            text_input.style.width = "100%";
            text_input.style.height = "100%";
            text_input.style.fontWeight = this.style.fontWeight;
            text_input.style.fontStyle = this.style.fontStyle;
            text_input.style.textDecoration = this.style.textDecoration;
            text_input.style.color = this.style.color;
            text_input.style.textAlign = this.style.textAlign;
            text_input.style.fontFamily = this.style.fontFamily;
            text_input.style.fontSize = this.style.fontSize;
            text_input.style.backgroundColor = this.style.backgroundColor;
            text_input.style.outline = "none";
            text_input.style.border = "none";
            //将text_input放入box之中
            this.appendChild(text_input);
            //为新增元素添加value值
            if (document.getElementById(text_input.parentNode.id + "_text") == null) {
                //如果父亲div里面没有文本内容，则什么都不干
            } else if (document.getElementById(text_input.parentNode.id + "_text") != null) {
                //如果父亲div里面有文本内容，则赋值给text_input
                text_input.value = document.getElementById(text_input.parentNode.id + "_text").innerText;
            }
            text_input.focus();
            //输出框的回车事件
            text_input.onkeydown = function () {
                if (event.keyCode == "13") {
                    //通过内增一个新DIV放置文本内容
                    if (document.getElementById(this.parentNode.id + "_text") == null) {
                        //如果里面没有文本内容，则新建一个
                        var text_new = document.createElement('div');
                        //text_new的属性设置
                        text_new.id = this.parentNode.id + "_text";
                        text_new.style.position = "absolute";
                        text_new.style.width = "100%";
                        text_new.style.height = "100%";
                        text_new.style.fontWeight = this.parentNode.style.fontWeight;
                        text_new.style.fontStyle = this.parentNode.style.fontStyle;
                        text_new.style.textDecoration = this.parentNode.style.textDecoration;
                        text_new.style.color = this.parentNode.style.color;
                        text_new.style.textAlign = this.parentNode.style.textAlign;
                        text_new.style.fontFamily = this.parentNode.style.fontFamily;
                        text_new.style.fontSize = this.parentNode.style.fontSize;
                        //为text_new添加文本
                        text_new.innerText = this.value;
                        this.parentNode.appendChild(text_new);
                    } else if (document.getElementById(this.parentNode.id + "_text") != null) {
                        //如果里面有文本内容，则修改原来的
                        var text_old = document.getElementById(this.parentNode.id + "_text");
                        text_old.innerText = this.value;
                    }
                    //删除text_input
                    this.parentNode.removeChild(this);
                }
            }
        }
        //往画布Canvas里面加入box  ⑩.往画布canvas里加入div，把锚点加入div中
        document.getElementById("main_canvas").appendChild(box);
        //往div里面加入scale
        box.appendChild(scale);
    }

    //向画布中增加IMG的onclick事件
    function add_img_toCanvas() {
        //主要思路：先创建一个img_div，在img_div里面添加img和锚点，因为img不能有子元素
        //先创建一个img_div
        var img_div = document.createElement('div');
        //设置img_div的属性
        img_div.style.position = "absolute";
        img_div.style.left = "0px";
        img_div.style.top = "0px";
        img_div.style.width = "3rem";
        img_div.style.height = "2rem";
        img_div.style.cursor = "move";
        img_div.style.border = "1px solid #000";
        img_div.id = "Canvas_Div_" + Canvas_DIV_num;
        //创建一个img
        var img = document.createElement('img');
        //设置img的属性
        img.style.width = "100%";
        img.style.height = "100%";
        img.style.cursor = "move";
        img.style.backgroundColor = "#b9b9b9";
        img.src = "";
        //设置img的id
        img.id = "Canvas_Div_" + Canvas_DIV_num + "_img";
        //设置img的onclick事件
        img_div.onclick = function (e) {
            this.style.outline = "1px solid #883333";
            if ((now_selected_control != this.id) && (now_selected_control != "")) {
                document.getElementById(now_selected_control + "_anchor").style.display = "none";
                document.getElementById(now_selected_control).style.outline = "none";
            }
            document.getElementById(this.id + "_anchor").style.display = "block";
            now_selected_control = this.id;
            //将本空间的各类属性赋值给导航栏
            //1.X轴坐标
            document.getElementById("control_X_input").disabled="";
            document.getElementById("control_X_input").style.color = "#000";
            document.getElementById("control_X_input").style.border ="1px solid #c6c6c6";
            document.getElementById("control_X_input").value = this.style.left;
            //2.Y轴坐标
            document.getElementById("control_Y_input").disabled="";
            document.getElementById("control_Y_input").style.color = "#000";
            document.getElementById("control_Y_input").style.border ="1px solid #c6c6c6";
            document.getElementById("control_Y_input").value = this.style.top;
            //3.控件宽度
            document.getElementById("control_Width_input").disabled="";
            document.getElementById("control_Width_input").style.color = "#000";
            document.getElementById("control_Width_input").style.border ="1px solid #c6c6c6";
            document.getElementById("control_Width_input").value = this.style.width;
            //4.控件高度
            document.getElementById("control_Height_input").disabled="";
            document.getElementById("control_Height_input").style.color = "#000";
            document.getElementById("control_Height_input").style.border ="1px solid #c6c6c6";
            document.getElementById("control_Height_input").value = this.style.height;
            //将本空间的各类属性赋值给工具栏
            //1.背景颜色模块
            var background_color = this.style.backgroundColor;
            now_backgroundcolor = background_color;
            //获取背景颜色颜色选择器
            var bg_picker = document.getElementById("tool_colorfill_picker");
            //获取picker的子元素div
            var bg_picker_div = bg_picker.firstElementChild;
            //获取picker_div的子元素span
            var bg_picker_div_span = bg_picker_div.firstElementChild;
            //获取picker_div_span的子元素span
            var bg_picker_div_span_span = bg_picker_div_span.firstElementChild;
            //给背景颜色选择器改变颜色
            bg_picker_div_span_span.style.backgroundColor = background_color;
            //2.边框颜色模块
            var border_color = this.style.borderColor;
            now_bordercolor = border_color;
            //获取边框颜色颜色选择器
            var border_picker = document.getElementById("tool_bordercolor_picker");
            //获取picker的子元素div
            var border_picker_div = border_picker.firstElementChild;
            //获取picker_div的子元素span
            var border_picker_div_span = border_picker_div.firstElementChild;
            //获取picker_div_span的子元素span
            var border_picker_div_span_span = border_picker_div_span.firstElementChild;
            //给边框颜色选择器改变颜色
            border_picker_div_span_span.style.backgroundColor = border_color;
            //3.边框宽度模块
            var border_width = this.style.borderWidth;
            now_borderwidth = border_width;
            //获取去除尾部px的纯数字宽度
            var cut_px = border_width.substr(0, border_width.length - 2);
            //将边框宽度下拉菜单的对勾全部取消
            for (var i = 0; i <= 10; i++) {
                document.getElementById("lineheight_" + i + "_img").src = "";
            }
            //将边框宽度下拉菜单的与控件匹配的对勾显示
            document.getElementById("lineheight_" + cut_px + "_img").src = "./img/workshop/menu/page/check_000000.png";
            //4.边框样式模块
            var border_style = this.style.borderStyle;
            now_borderstyle = border_style;
            //将边框样式下拉菜单的对勾全部取消
            for (var i = 1; i <= 4; i++) {
                document.getElementById("linestyle_" + i + "_img").src = "";
            }
            //将边框样式下拉菜单的与控件匹配的对勾显示
            switch (border_style) {
                case "none":
                    document.getElementById("linestyle_1_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "solid":
                    document.getElementById("linestyle_2_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "dotted":
                    document.getElementById("linestyle_3_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "dashed":
                    document.getElementById("linestyle_4_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                default:
                    alert("注意！边框样式模块有问题，当前选中控件可能不支持边框样式css");
            }
            //阻止子元素的onclick向父元素冒泡
            e.stopPropagation();
        };
        //创建一个scale
        var scale = document.createElement('div');
        //设置scale的属性
        scale.style.width = "6px";
        scale.style.height = "6px";
        scale.style.overflow = "hidden";
        scale.style.cursor = "se-resize";
        scale.style.position = "absolute";
        scale.style.right = "-3.5px";
        scale.style.bottom = "-3.5px";
        scale.style.border = "1px solid #000";
        scale.style.backgroundColor = "#FFF";
        scale.style.zIndex = img_div.style.zIndex + 1;
        scale.style.display = "none";
        //设置scale的id
        scale.id = img_div.id + "_anchor";
        //使IMGid计数器自增
        Canvas_DIV_num++;
        //获取画布对象
        var fa = document.getElementById('main_canvas');
        //图片移动效果
        img_div.onmousedown = function (ev) {
            var oEvent = ev;
            //浏览器有一些图片的默认事件,这里要阻止
            oEvent.preventDefault();
            var disX = oEvent.clientX - img_div.offsetLeft;
            var disY = oEvent.clientY - img_div.offsetTop;
            fa.onmousemove = function (ev) {
                oEvent = ev;
                oEvent.preventDefault();
                var x = oEvent.clientX - disX;
                var y = oEvent.clientY - disY;
                //图形移动的边界判断
                x = x <= 0 ? 0 : x;
                x = x >= fa.offsetWidth - img_div.offsetWidth ? fa.offsetWidth - img_div.offsetWidth : x;
                y = y <= 0 ? 0 : y;
                y = y >= fa.offsetHeight - img_div.offsetHeight ? fa.offsetHeight - img_div.offsetHeight : y;
                img_div.style.left = x + 'px';
                img_div.style.top = y + 'px';
            }
            //图形移出父盒子取消移动事件,防止移动过快触发鼠标移出事件,导致鼠标弹起事件失效
            fa.onmouseleave = function () {
                fa.onmousemove = null;
                fa.onmouseup = null;
            }
            //鼠标弹起后停止移动
            fa.onmouseup = function () {
                fa.onmousemove = null;
                fa.onmouseup = null;
            }
        }
        //图片缩放效果
        scale.onmousedown = function (e) {
            //阻止冒泡,避免缩放时触发移动事件
            e.stopPropagation();
            e.preventDefault();
            var pos = {
                'w': img_div.offsetWidth,
                'h': img_div.offsetHeight,
                'x': e.clientX,
                'y': e.clientY
            };
            fa.onmousemove = function (ev) {
                ev.preventDefault();
                //设置图片的最小缩放为30*30
                var w = Math.max(30, ev.clientX - pos.x + pos.w)
                var h = Math.max(30, ev.clientY - pos.y + pos.h)
                //console.log(w,h)
                //设置图片的最大宽高
                w = w >= fa.offsetWidth - img_div.offsetLeft ? fa.offsetWidth - img_div.offsetLeft : w
                h = h >= fa.offsetHeight - img_div.offsetTop ? fa.offsetHeight - img_div.offsetTop : h
                img_div.style.width = w + 'px';
                img_div.style.height = h + 'px';
                //console.log(img_div.offsetWidth,img_div.offsetHeight)
            };
            fa.onmouseleave = function () {
                fa.onmousemove = null;
                fa.onmouseup = null;
            };
            fa.onmouseup = function () {
                fa.onmousemove = null;
                fa.onmouseup = null;
            };
        };
        //控件右下角锚点的onmousemove事件，用于变化大小时，保持div高度和行高一致，使文字垂直居中
        scale.onmousemove = function () {
            this.parentNode.style.lineHeight = this.parentNode.style.height;
        };
        //增加img_div的双击事件
        img.ondblclick = function () {
            now_selected_control = this.id;
            $('#previewImg').click();
        };
        //往画布Canvas里面加入img_div
        document.getElementById("main_canvas").appendChild(img_div);
        //往img_div里面加入img
        img_div.appendChild(img);
        //往img_div里面加入scale
        img_div.appendChild(scale);
    }
    //上传图片需要调用的两个函数
    function previewImage(file) {
        var MAXWIDTH = 90;
        var MAXHEIGHT = 90;
        var div = document.getElementById(now_selected_control).parentNode;
        if (file.files && file.files[0]) {
            var img = document.getElementById(now_selected_control);
            img.onload = function () {
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width = rect.width;
                img.height = rect.height;
                //img.style.marginLeft = rect.left+'px';
                //img.style.marginTop = rect.top + 'px';
            }
            var reader = new FileReader();
            reader.onload = function (evt) {
                img.src = evt.target.result;
            }
            reader.readAsDataURL(file.files[0]);
        } else //兼容IE,但目前IE不可用！！！！！！！未解决最后一行
        {
            var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            var img = document.getElementById(now_selected_control);
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
            div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
        }
    }
    function clacImgZoomParam(maxWidth, maxHeight, width, height) {
        var param = {
            top: 0,
            left: 0,
            width: width,
            height: height
        };
        if (width > maxWidth || height > maxHeight) {
            rateWidth = width / maxWidth;
            rateHeight = height / maxHeight;

            if (rateWidth > rateHeight) {
                param.width = maxWidth;
                param.height = Math.round(height / rateWidth);
            } else {
                param.width = Math.round(width / rateHeight);
                param.height = maxHeight;
            }
        }
        param.left = Math.round((maxWidth - param.width) / 2);
        param.top = Math.round((maxHeight - param.height) / 2);
        return param;
    }

    //向画布中增加字体图标i的onclick事件
    function add_i_toCanvas(sth) {
        //创建一个i
        var icontrol = document.createElement('i');
        //设置box的属性
        icontrol.style.position = "absolute";
        icontrol.className = sth.className;
        icontrol.style.left = "0px";
        icontrol.style.top = "0px";
        icontrol.style.width = "3rem";
        icontrol.style.height = "3rem";
        icontrol.style.cursor = "move";
        icontrol.style.color = "#794495";
        icontrol.style.fontSize = "3rem";
        //设置icontrol的id
        icontrol.id = "Canvas_i_" + Canvas_i_num;
        //设置icontrol的onclick事件
        icontrol.onclick = function (e) {
            this.style.outline = "1px solid #883333";
            if ((now_selected_control != this.id) && (now_selected_control != "")) {
                document.getElementById(now_selected_control + "_anchor").style.display = "none";
                document.getElementById(now_selected_control).style.outline = "none";
            }
            document.getElementById(this.id + "_anchor").style.display = "block";
            now_selected_control = this.id;
            //将本空间的各类属性赋值给导航栏
            //1.X轴坐标
            document.getElementById("control_X_input").disabled="";
            document.getElementById("control_X_input").style.color = "#000";
            document.getElementById("control_X_input").style.border ="1px solid #c6c6c6";
            document.getElementById("control_X_input").value = this.style.left;
            //2.Y轴坐标
            document.getElementById("control_Y_input").disabled="";
            document.getElementById("control_Y_input").style.color = "#000";
            document.getElementById("control_Y_input").style.border ="1px solid #c6c6c6";
            document.getElementById("control_Y_input").value = this.style.top;
            //3.控件宽度
            document.getElementById("control_Width_input").disabled="";
            document.getElementById("control_Width_input").style.color = "#000";
            document.getElementById("control_Width_input").style.border ="1px solid #c6c6c6";
            document.getElementById("control_Width_input").value = this.style.width;
            //4.控件高度
            document.getElementById("control_Height_input").disabled="";
            document.getElementById("control_Height_input").style.color = "#000";
            document.getElementById("control_Height_input").style.border ="1px solid #c6c6c6";
            document.getElementById("control_Height_input").value = this.style.height;
            //将本控件的各类属性赋值给工具栏
            //1.字体图标颜色模块
            var font_color = this.style.color;
            now_fontcolor = font_color;
            //获取文本颜色颜色选择器
            var font_picker = document.getElementById("tool_fontcolor_picker");
            //获取picker的子元素div
            var font_picker_div = font_picker.firstElementChild;
            //获取picker_div的子元素span
            var font_picker_div_span = font_picker_div.firstElementChild;
            //获取picker_div_span的子元素span
            var font_picker_div_span_span = font_picker_div_span.firstElementChild;
            //给颜色选择器改变颜色
            font_picker_div_span_span.style.backgroundColor = font_color;
            //2.字号模块
            var fontsize = this.style.fontSize.replace(/[^0-9]/ig, "");
            now_fontsize = fontsize;
            document.getElementById("top_tool_9_input").value = fontsize;

            //阻止子元素的onclick向父元素冒泡
            e.stopPropagation();
        };
        //创建一个scale
        var scale = document.createElement('div');
        //设置scale的属性
        scale.style.width = "6px";
        scale.style.height = "6px";
        scale.style.overflow = "hidden";
        scale.style.cursor = "se-resize";
        scale.style.position = "absolute";
        scale.style.right = "-3.5px";
        scale.style.bottom = "-3.5px";
        scale.style.border = "1px solid #000";
        scale.style.backgroundColor = "#FFF";
        scale.style.zIndex = icontrol.style.zIndex + 1;
        scale.style.display = "none";
        //设置scale的id
        scale.id = icontrol.id + "_anchor";
        //使i的id计数器自增
        Canvas_i_num++;
        //获取画布对象
        var fa = document.getElementById('main_canvas');
        //图片移动效果
        icontrol.onmousedown = function (ev) {
            var oEvent = ev;
            // 浏览器有一些图片的默认事件,这里要阻止
            oEvent.preventDefault();
            var disX = oEvent.clientX - icontrol.offsetLeft;
            var disY = oEvent.clientY - icontrol.offsetTop;
            fa.onmousemove = function (ev) {
                oEvent = ev;
                oEvent.preventDefault();
                var x = oEvent.clientX - disX;
                var y = oEvent.clientY - disY;
                // 图形移动的边界判断
                x = x <= 0 ? 0 : x;
                x = x >= fa.offsetWidth - icontrol.offsetWidth ? fa.offsetWidth - icontrol.offsetWidth : x;
                y = y <= 0 ? 0 : y;
                y = y >= fa.offsetHeight - icontrol.offsetHeight ? fa.offsetHeight - icontrol.offsetHeight : y;
                icontrol.style.left = x + 'px';
                icontrol.style.top = y + 'px';
            }
            // 图形移出父盒子取消移动事件,防止移动过快触发鼠标移出事件,导致鼠标弹起事件失效
            fa.onmouseleave = function () {
                fa.onmousemove = null;
                fa.onmouseup = null;
            }
            // 鼠标弹起后停止移动
            fa.onmouseup = function () {
                fa.onmousemove = null;
                fa.onmouseup = null;
            }
        }
        // 图片缩放效果
        scale.onmousedown = function (e) {
            // 阻止冒泡,避免缩放时触发移动事件
            e.stopPropagation();
            e.preventDefault();
            var pos = {
                'w': icontrol.offsetWidth,
                'h': icontrol.offsetHeight,
                'x': e.clientX,
                'y': e.clientY
            };
            fa.onmousemove = function (ev) {
                ev.preventDefault();
                // 设置图片的最小缩放为30*30
                var w = Math.max(30, ev.clientX - pos.x + pos.w)
                var h = Math.max(30, ev.clientY - pos.y + pos.h)
                // console.log(w,h)
                // 设置图片的最大宽高
                w = w >= fa.offsetWidth - icontrol.offsetLeft ? fa.offsetWidth - icontrol.offsetLeft : w
                h = h >= fa.offsetHeight - icontrol.offsetTop ? fa.offsetHeight - icontrol.offsetTop : h
                icontrol.style.width = w + 'px';
                icontrol.style.height = h + 'px';
                // console.log(icontrol.offsetWidth,icontrol.offsetHeight)
            }
            fa.onmouseleave = function () {
                fa.onmousemove = null;
                fa.onmouseup = null;
            }
            fa.onmouseup = function () {
                fa.onmousemove = null;
                fa.onmouseup = null;
            }
        }
        //控件右下角锚点的onmousemove事件，用于变化大小时，保持div高度和行高一致，使文字垂直居中
        scale.onmousemove = function () {
            this.parentNode.style.lineHeight = this.parentNode.style.height;
            this.parentNode.style.fontSize = this.parentNode.style.width;
        }
        //往画布Canvas里面加入icontrol
        document.getElementById("main_canvas").appendChild(icontrol);
        //往icontrol里面加入scale
        icontrol.appendChild(scale);
    }

    //向画布中增加INPUT的onclick事件
    function add_input_toCanvas() {
        //主要思路：先创建一个input_div，在input_div里面添加input和锚点，因为input不能有子元素
        //先创建一个input_div
        var input_div = document.createElement('div');
        //设置input_div的属性
        input_div.style.position = "absolute";
        input_div.style.left = "0px";
        input_div.style.top = "0px";
        input_div.style.width = "8rem";
        input_div.style.height = "1.5rem";
        input_div.style.cursor = "text";
        input_div.style.border = "1px solid #000";
        input_div.id = "Canvas_Div_" + Canvas_DIV_num;
        //创建一个input
        var input = document.createElement('input');
        //设置input的属性
        input.style.width = "100%";
        input.style.height = "100%";
        input.style.cursor = "move";
        input.style.textAlign = "left";
        input.style.fontFamily = "Arial";
        input.style.backgroundColor = "#b9b9b9";
        //设置input的id
        input.id = input_div.id + "_input";
        //设置input的onclick事件
        input.onclick = function (e) {
            this.parentNode.style.outline = "1px solid #883333";
            if ((now_selected_control != this.parentNode.id) && (now_selected_control != "")) {
                document.getElementById(now_selected_control + "_anchor").style.display = "none";
                document.getElementById(now_selected_control).style.outline = "none";
            }
            document.getElementById(this.parentNode.id + "_anchor").style.display = "block";
            now_selected_control = this.parentNode.id;
            //将本空间的各类属性赋值给导航栏
            //1.X轴坐标
            document.getElementById("control_X_input").disabled="";
            document.getElementById("control_X_input").style.color = "#000";
            document.getElementById("control_X_input").style.border ="1px solid #c6c6c6";
            document.getElementById("control_X_input").value = this.parentNode.style.left;
            //2.Y轴坐标
            document.getElementById("control_Y_input").disabled="";
            document.getElementById("control_Y_input").style.color = "#000";
            document.getElementById("control_Y_input").style.border ="1px solid #c6c6c6";
            document.getElementById("control_Y_input").value = this.parentNode.style.top;
            //3.控件宽度
            document.getElementById("control_Width_input").disabled="";
            document.getElementById("control_Width_input").style.color = "#000";
            document.getElementById("control_Width_input").style.border ="1px solid #c6c6c6";
            document.getElementById("control_Width_input").value = this.parentNode.style.width;
            //4.控件高度
            document.getElementById("control_Height_input").disabled="";
            document.getElementById("control_Height_input").style.color = "#000";
            document.getElementById("control_Height_input").style.border ="1px solid #c6c6c6";
            document.getElementById("control_Height_input").value = this.parentNode.style.height;
            //将本空间的各类属性赋值给工具栏
            //1.加粗模块
            var bold = this.style.fontWeight;
            if (bold == "") {
                //如果控件原本不是加粗，将加粗模块复原
                document.getElementById("top_tool_3").style.backgroundColor = "#f6f6f6";
                now_bold_tag = false;
                document.getElementById("top_tool_3").style.border = "1px solid #f3f3f3";
            } else if (bold == "bold") {
                //如果控件原本是加粗，加载加粗模块
                document.getElementById("top_tool_3").style.backgroundColor = "#E4E4E4";
                now_bold_tag = true;
                document.getElementById("top_tool_3").style.border = "1px solid #c6c6c6";
            }
            //2.斜体模块

            //TODO  把斜体变灰

            //3.下划线模块

            //TODO  把下划线变灰

            //4.文本颜色模块
            var font_color = this.style.color;
            now_fontcolor = font_color;
            //获取文本颜色颜色选择器
            var font_picker = document.getElementById("tool_fontcolor_picker");
            //获取picker的子元素div
            var font_picker_div = font_picker.firstElementChild;
            //获取picker_div的子元素span
            var font_picker_div_span = font_picker_div.firstElementChild;
            //获取picker_div_span的子元素span
            var font_picker_div_span_span = font_picker_div_span.firstElementChild;
            //给颜色选择器改变颜色
            font_picker_div_span_span.style.backgroundColor = font_color;
            //5.文本对齐模块
            var font_align = this.style.textAlign;
            now_textalign = font_align;
            switch (font_align) {
                case "left":
                    document.getElementById("now_align").src = "./img/workshop/top_tools/font_left_000000.png";
                    break;
                case "center":
                    document.getElementById("now_align").src = "./img/workshop/top_tools/font_center_000000.png";
                    break;
                case "right":
                    document.getElementById("now_align").src = "./img/workshop/top_tools/font_right_000000.png";
                    break;
                default:
                    alert("注意！字体对齐模块有问题，当前选中控件可能不支持文本对齐css");
            }
            //6.字体模块
            var font_family = this.style.fontFamily.replace(/\"/g, "");
            now_fontfamily = font_family;
            document.getElementById("now_font").innerHTML = font_family;
            document.getElementById("now_font").style.fontFamily = font_family;
            for (var i = 1; i <= 13; i++) {
                document.getElementById("font_" + i + "_img").src = "";
            }
            //将字体的对勾放到对应位置
            switch (font_family) {
                case "Arial":
                    document.getElementById("font_1_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "Verdana":
                    document.getElementById("font_2_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "Georgia":
                    document.getElementById("font_3_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "Times New Roman":
                    document.getElementById("font_4_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "Courier New":
                    document.getElementById("font_5_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "Impact":
                    document.getElementById("font_6_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "Comic Sans MS":
                    document.getElementById("font_7_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "Tahoma":
                    document.getElementById("font_8_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "Garamond":
                    document.getElementById("font_9_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "Lucida Console":
                    document.getElementById("font_10_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "宋体":
                    document.getElementById("font_11_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "微软雅黑":
                    document.getElementById("font_12_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "黑体":
                    document.getElementById("font_13_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                default:
                    alert("注意！字体模块有问题，当前选中控件可能不支持字体css");
            }
            //7.字号模块
            var fontsize = this.style.fontSize.replace(/[^0-9]/ig, "");
            now_fontsize = fontsize;
            document.getElementById("top_tool_9_input").value = fontsize;
            //8.背景颜色模块
            var background_color = this.style.backgroundColor;
            now_backgroundcolor = background_color;
            //获取背景颜色颜色选择器
            var bg_picker = document.getElementById("tool_colorfill_picker");
            //获取picker的子元素div
            var bg_picker_div = bg_picker.firstElementChild;
            //获取picker_div的子元素span
            var bg_picker_div_span = bg_picker_div.firstElementChild;
            //获取picker_div_span的子元素span
            var bg_picker_div_span_span = bg_picker_div_span.firstElementChild;
            //给背景颜色选择器改变颜色
            bg_picker_div_span_span.style.backgroundColor = background_color;
            //9.边框颜色模块
            var border_color = this.parentNode.style.borderColor;
            now_bordercolor = border_color;
            //获取边框颜色颜色选择器
            var border_picker = document.getElementById("tool_bordercolor_picker");
            //获取picker的子元素div
            var border_picker_div = border_picker.firstElementChild;
            //获取picker_div的子元素span
            var border_picker_div_span = border_picker_div.firstElementChild;
            //获取picker_div_span的子元素span
            var border_picker_div_span_span = border_picker_div_span.firstElementChild;
            //给边框颜色选择器改变颜色
            border_picker_div_span_span.style.backgroundColor = border_color;
            //10.边框宽度模块
            var border_width = this.parentNode.style.borderWidth;
            now_borderwidth = border_width;
            //获取去除尾部px的纯数字宽度
            var cut_px = border_width.substr(0, border_width.length - 2);
            //将边框宽度下拉菜单的对勾全部取消
            for (var i = 0; i <= 10; i++) {
                document.getElementById("lineheight_" + i + "_img").src = "";
            }
            //将边框宽度下拉菜单的与控件匹配的对勾显示
            document.getElementById("lineheight_" + cut_px + "_img").src = "./img/workshop/menu/page/check_000000.png";
            //11.边框样式模块
            var border_style = this.parentNode.style.borderStyle;
            now_borderstyle = border_style;
            //将边框样式下拉菜单的对勾全部取消
            for (var i = 1; i <= 4; i++) {
                document.getElementById("linestyle_" + i + "_img").src = "";
            }
            //将边框样式下拉菜单的与控件匹配的对勾显示
            switch (border_style) {
                case "none":
                    document.getElementById("linestyle_1_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "solid":
                    document.getElementById("linestyle_2_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "dotted":
                    document.getElementById("linestyle_3_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                case "dashed":
                    document.getElementById("linestyle_4_img").src = "./img/workshop/menu/page/check_000000.png";
                    break;
                default:
                    alert("注意！边框样式模块有问题，当前选中控件可能不支持边框样式css");
            }

            //阻止子元素的onclick向父元素冒泡
            e.stopPropagation();
        };
        //创建一个scale
        var scale = document.createElement('div');
        //设置scale的属性
        scale.style.width = "6px";
        scale.style.height = "6px";
        scale.style.overflow = "hidden";
        scale.style.cursor = "se-resize";
        scale.style.position = "absolute";
        scale.style.right = "-3.5px";
        scale.style.bottom = "-3.5px";
        scale.style.border = "1px solid #000";
        scale.style.backgroundColor = "#FFF";
        scale.style.zIndex = input_div.style.zIndex + 1;
        scale.style.display = "none";
        //设置scale的id
        scale.id = input_div.id + "_anchor";
        //使IMGid计数器自增
        Canvas_DIV_num++;
        //获取画布对象
        var fa = document.getElementById('main_canvas');
        //图片移动效果
        input_div.onmousedown = function (ev) {
            var oEvent = ev;
            // 浏览器有一些图片的默认事件,这里要阻止
            oEvent.preventDefault();
            var disX = oEvent.clientX - input_div.offsetLeft;
            var disY = oEvent.clientY - input_div.offsetTop;
            fa.onmousemove = function (ev) {
                oEvent = ev;
                oEvent.preventDefault();
                var x = oEvent.clientX - disX;
                var y = oEvent.clientY - disY;
                // 图形移动的边界判断
                x = x <= 0 ? 0 : x;
                x = x >= fa.offsetWidth - input_div.offsetWidth ? fa.offsetWidth - input_div.offsetWidth : x;
                y = y <= 0 ? 0 : y;
                y = y >= fa.offsetHeight - input_div.offsetHeight ? fa.offsetHeight - input_div.offsetHeight : y;
                input_div.style.left = x + 'px';
                input_div.style.top = y + 'px';
            }
            // 图形移出父盒子取消移动事件,防止移动过快触发鼠标移出事件,导致鼠标弹起事件失效
            fa.onmouseleave = function () {
                fa.onmousemove = null;
                fa.onmouseup = null;
            }
            // 鼠标弹起后停止移动
            fa.onmouseup = function () {
                fa.onmousemove = null;
                fa.onmouseup = null;
            }
        }
        // 图片缩放效果
        scale.onmousedown = function (e) {
            // 阻止冒泡,避免缩放时触发移动事件
            e.stopPropagation();
            e.preventDefault();
            var pos = {
                'w': input_div.offsetWidth,
                'h': input_div.offsetHeight,
                'x': e.clientX,
                'y': e.clientY
            };
            fa.onmousemove = function (ev) {
                ev.preventDefault();
                // 设置图片的最小缩放为30*30
                var w = Math.max(30, ev.clientX - pos.x + pos.w)
                var h = Math.max(30, ev.clientY - pos.y + pos.h)
                // console.log(w,h)
                // 设置图片的最大宽高
                w = w >= fa.offsetWidth - input_div.offsetLeft ? fa.offsetWidth - input_div.offsetLeft : w
                h = h >= fa.offsetHeight - input_div.offsetTop ? fa.offsetHeight - input_div.offsetTop : h
                input_div.style.width = w + 'px';
                input_div.style.height = h + 'px';
                // console.log(input_div.offsetWidth,input_div.offsetHeight)
            };
            fa.onmouseleave = function () {
                fa.onmousemove = null;
                fa.onmouseup = null;
            };
            fa.onmouseup = function () {
                fa.onmousemove = null;
                fa.onmouseup = null;
            };
        };
        //控件右下角锚点的onmousemove事件，用于变化大小时，保持div高度和行高一致，使文字垂直居中
        scale.onmousemove = function () {
            this.parentNode.style.lineHeight = this.parentNode.style.height;
        };
        //往画布Canvas里面加入input_div
        document.getElementById("main_canvas").appendChild(input_div);
        //往input_div里面加入input
        input_div.appendChild(input);
        //往input_div里面加入scale
        input_div.appendChild(scale);
    }

    //画布的onclick事件---->用于使画布中所有控件失去焦点
    function Canvas_onclick() {
        if ((now_selected_control != "")) {
            //如果当前选中了控件才执行以下代码，防止多次触发
            //关闭所有DIV的锚点
            for (var i = 1; i <= Canvas_DIV_num - 1; i++) {
                document.getElementById("Canvas_Div_" + i + "_anchor").style.display = "none";
                document.getElementById("Canvas_Div_" + i).style.outline = "none";
            }
            //关闭所有I的锚点
            for (var i = 1; i <= Canvas_i_num - 1; i++) {
                document.getElementById("Canvas_i_" + i + "_anchor").style.display = "none";
                document.getElementById("Canvas_i_" + i).style.outline = "none";
            }
            //将导航栏恢复初始化
            //1.X轴坐标
            document.getElementById("control_X_input").disabled="disabled";
            document.getElementById("control_X_input").style.color = "#b3b3b3";
            document.getElementById("control_X_input").style.border ="1px solid #e8e8e8";
            document.getElementById("control_X_input").value = "0px";
            //2.Y轴坐标
            document.getElementById("control_Y_input").disabled="disabled";
            document.getElementById("control_Y_input").style.color = "#b3b3b3";
            document.getElementById("control_Y_input").style.border ="1px solid #e8e8e8";
            document.getElementById("control_Y_input").value = "0px";
            //3.控件宽度
            document.getElementById("control_Width_input").disabled="disabled";
            document.getElementById("control_Width_input").style.color = "#b3b3b3";
            document.getElementById("control_Width_input").style.border ="1px solid #e8e8e8";
            document.getElementById("control_Width_input").value = "0px";
            //4.控件高度
            document.getElementById("control_Height_input").disabled="disabled";
            document.getElementById("control_Height_input").style.color = "#b3b3b3";
            document.getElementById("control_Height_input").style.border ="1px solid #e8e8e8";
            document.getElementById("control_Height_input").value = "0px";
            //将工具栏恢复初始化
            //1.将加粗模块恢复初始化
            now_bold_tag = false;
            document.getElementById("top_tool_3").style.backgroundColor = "#f6f6f6";
            document.getElementById("top_tool_3").style.border = "1px solid #f3f3f3";
            //2.将斜体模块恢复初始化
            now_italic_tag = false;
            document.getElementById("top_tool_4").style.backgroundColor = "#f6f6f6";
            document.getElementById("top_tool_4").style.border = "1px solid #f3f3f3";
            //3.将下划线模块恢复初始化
            now_underline_tag = false;
            document.getElementById("top_tool_5").style.backgroundColor = "#f6f6f6";
            document.getElementById("top_tool_5").style.border = "1px solid #f3f3f3";
            //4.将文本颜色模块恢复初始化
            now_fontcolor = "#000";
            var picker = document.getElementById("tool_fontcolor_picker");
            var picker_div = picker.firstElementChild;
            var picker_div_span = picker_div.firstElementChild;
            var picker_div_span_span = picker_div_span.firstElementChild;
            picker_div_span_span.style.backgroundColor = "#000";
            //5.将文本对齐模块恢复初始化
            now_textalign = "center";
            document.getElementById("now_align").src = "./img/workshop/top_tools/font_center_000000.png";
            //6.将字体模块恢复初始化
            now_fontfamily = "Arial"
            document.getElementById("now_font").innerHTML = "Arial";
            document.getElementById("now_font").style.fontFamily = "Arial";
            for (var i = 1; i <= 13; i++) {
                document.getElementById("font_" + i + "_img").src = "";
            }
            document.getElementById("font_1_img").src = "./img/workshop/menu/page/check_000000.png";
            //7.将字号模块恢复初始化
            now_fontsize = "13"
            document.getElementById("top_tool_9_input").value = "13";
            //8.将背景颜色模块恢复初始化，需求上无用处
            //9.将边框颜色模块恢复初始化，需求上无用处
            //10.将边框宽度模块恢复初始化
            now_borderwidth = "1";
            for (var i = 0; i <= 10; i++) {
                document.getElementById("lineheight_" + i + "_img").src = "";
            }
            document.getElementById("lineheight_1_img").src = "./img/workshop/menu/page/check_000000.png";
            //11.将边框样式模块恢复初始化
            now_borderstyle = "solid";
            for (var i = 1; i <= 4; i++) {
                document.getElementById("linestyle_" + i + "_img").src = "";
            }
            document.getElementById("linestyle_2_img").src = "./img/workshop/menu/page/check_000000.png";
            //

            //如果当前正在编辑div内部的input
            if (document.getElementById(now_selected_control + "_input") != null) {
                if (document.getElementById(now_selected_control + "_text") == null) {
                    //如果里面没有文本内容，则新建一个
                    var text_new = document.createElement('div');
                    //text_new的属性设置
                    text_new.id = now_selected_control + "_text";
                    text_new.style.position = "absolute";
                    text_new.style.width = "100%";
                    text_new.style.height = "100%";
                    text_new.style.fontWeight = document.getElementById(now_selected_control).style.fontWeight;
                    text_new.style.fontStyle = document.getElementById(now_selected_control).style.fontStyle;
                    text_new.style.textDecoration = document.getElementById(now_selected_control).style.textDecoration;
                    text_new.style.color = document.getElementById(now_selected_control).style.color;
                    text_new.style.textAlign = document.getElementById(now_selected_control).style.textAlign;
                    text_new.style.fontFamily = document.getElementById(now_selected_control).style.fontFamily;
                    text_new.style.fontSize = document.getElementById(now_selected_control).style.fontSize;
                    //为text_new添加文本
                    text_new.innerText = document.getElementById(now_selected_control + "_input").value;
                    document.getElementById(now_selected_control).appendChild(text_new);
                } else if (document.getElementById(now_selected_control + "_text") != null) {
                    //如果里面有文本内容，则修改原来的
                    var text_old = document.getElementById(now_selected_control + "_text");
                    text_old.innerText = document.getElementById(now_selected_control + "_input").value;
                }
                //删除text_input
                document.getElementById(now_selected_control + "_input").parentNode.removeChild(document.getElementById(now_selected_control + "_input"));
            }
        } else if (now_selected_control == "") {
            //如果当前没有选中控件才执行以下代码，什么都不做，防止多次触发
        }
        //将当前选中的DIV控件标志恢复""
        now_selected_control = "";

    }
    //画布的onkeydown事件
    document.onkeydown = function (event) {
        var e = event || window.event || arguments.callee.caller.arguments[0];
        //46号Delete按键  ⑪.div的删除
        if ((e) && (e.keyCode == 46)) {
            //如果当前选中了一个控件
            if (now_selected_control != "") {
                //获取控件的类型
                var controlType = document.getElementById(now_selected_control).nodeName;
                //根据类型控件计数器减一
                switch (controlType) {
                    case "DIV":
                        Canvas_DIV_num--;
                        break;
                    case "I":
                        Canvas_i_num--;
                        break;
                    default:
                        alert("注意！控件类型模块判断出现问题!");
                }
                //获取当前选择控件
                var del_control = document.getElementById(now_selected_control);
                //删除当前控件
                del_control.parentNode.removeChild(del_control);
                //将当前控件标记变成空
                now_selected_control = "";
                //将导航栏恢复初始化
                //1.X轴坐标
                document.getElementById("control_X_input").disabled="disabled";
                document.getElementById("control_X_input").style.color = "#b3b3b3";
                document.getElementById("control_X_input").style.border ="1px solid #e8e8e8";
                document.getElementById("control_X_input").value = "0px";
                //2.Y轴坐标
                document.getElementById("control_Y_input").disabled="disabled";
                document.getElementById("control_Y_input").style.color = "#b3b3b3";
                document.getElementById("control_Y_input").style.border ="1px solid #e8e8e8";
                document.getElementById("control_Y_input").value = "0px";
                //3.控件宽度
                document.getElementById("control_Width_input").disabled="disabled";
                document.getElementById("control_Width_input").style.color = "#b3b3b3";
                document.getElementById("control_Width_input").style.border ="1px solid #e8e8e8";
                document.getElementById("control_Width_input").value = "0px";
                //4.控件高度
                document.getElementById("control_Height_input").disabled="disabled";
                document.getElementById("control_Height_input").style.color = "#b3b3b3";
                document.getElementById("control_Height_input").style.border ="1px solid #e8e8e8";
                document.getElementById("control_Height_input").value = "0px";
                //将工具栏恢复初始化
                //1.将加粗模块恢复初始化
                now_bold_tag = false;
                document.getElementById("top_tool_3").style.backgroundColor = "#f6f6f6";
                document.getElementById("top_tool_3").style.border = "1px solid #f3f3f3";
                //2.将斜体模块恢复初始化
                now_italic_tag = false;
                document.getElementById("top_tool_4").style.backgroundColor = "#f6f6f6";
                document.getElementById("top_tool_4").style.border = "1px solid #f3f3f3";
                //3.将下划线模块恢复初始化
                now_underline_tag = false;
                document.getElementById("top_tool_5").style.backgroundColor = "#f6f6f6";
                document.getElementById("top_tool_5").style.border = "1px solid #f3f3f3";
                //4.将文本颜色模块恢复初始化
                now_fontcolor = "#000";
                var picker = document.getElementById("tool_fontcolor_picker");
                var picker_div = picker.firstElementChild;
                var picker_div_span = picker_div.firstElementChild;
                var picker_div_span_span = picker_div_span.firstElementChild;
                picker_div_span_span.style.backgroundColor = "#000";
                //5.将文本对齐模块恢复初始化
                now_textalign = "center";
                document.getElementById("now_align").src = "./img/workshop/top_tools/font_center_000000.png";
                //6.将字体模块恢复初始化
                now_fontfamily = "Arial"
                document.getElementById("now_font").innerHTML = "Arial";
                document.getElementById("now_font").style.fontFamily = "Arial";
                for (var i = 1; i <= 13; i++) {
                    document.getElementById("font_" + i + "_img").src = "";
                }
                document.getElementById("font_1_img").src = "./img/workshop/menu/page/check_000000.png";
                //7.将字号模块恢复初始化
                now_fontsize = "13"
                document.getElementById("top_tool_9_input").value = "13";
                //8.将背景颜色模块恢复初始化，需求上无用处
                //9.将边框颜色模块恢复初始化，需求上无用处
                //10.将边框宽度模块恢复初始化
                now_borderwidth = "1";
                for (var i = 0; i <= 10; i++) {
                    document.getElementById("lineheight_" + i + "_img").src = "";
                }
                document.getElementById("lineheight_1_img").src = "./img/workshop/menu/page/check_000000.png";
                //11.将边框样式模块恢复初始化
                now_borderstyle = "solid";
                for (var i = 1; i <= 4; i++) {
                    document.getElementById("linestyle_" + i + "_img").src = "";
                }
                document.getElementById("linestyle_2_img").src = "./img/workshop/menu/page/check_000000.png";

            } else {
                //什么都不干
            }
        }
        //X号XXX按键

    }

</script>
</html>
