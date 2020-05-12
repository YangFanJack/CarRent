<%--
  Created by IntelliJ IDEA.
  User: 11445
  Date: 2020/5/1
  Time: 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户登录</title>
    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/page-userLogin.css" type="text/css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery-3.3.1.js"></script>
    <script src="js/script.js"></script>
    <script>
        $(function () {
            //登录信息显示
            var loginUser = "<%=session.getAttribute("loginUser")%>";
            if (loginUser != "null") {
                var exit = document.getElementById("exit");
                var homePage = document.getElementById("homePage");
                var label = document.getElementsByClassName("user")[0].getElementsByTagName("label")[0];
                exit.removeAttribute("hidden");
                homePage.removeAttribute("hidden");
                label.removeAttribute("hidden");
                label.innerHTML = "欢迎你," + loginUser;
                var mark = "<%=session.getAttribute("mark")%>";
                if (mark == "user") {
                    exit.href = "exitUserLogin.do";
                    homePage.href = "userFunc.jsp";
                }
                if (mark == "manager") {
                    exit.href = "exitManagerLogin.do";
                    homePage.href = "manageFunc.jsp";
                }
            }
        });
    </script>
</head>
<body>
<!--头部-->
<div class="header w">
    <!--创建导航条-->
    <ul class="nav">
        <li>
            <a href="findRentByPage.do?page=aboutRent">租车资讯</a>
            <p>ABOUT RENT</p>
        </li>
        <li>
            <a href="findCarByPage.do?isSale=1&page=weekSpecials">本周特价</a>
            <p>WEEK SPECIALS</p>
        </li>
        <li>
            <a href="manageLogin.jsp">管理员登录</a>
            <p>ADMINISTRATOR LOGIN</p>
        </li>
        <li>
            <a href="aboutUs.jsp">关于我们</a>
            <p>ABOUT US</p>
        </li>
        <li>
            <a href="contactUs.jsp">在线留言</a>
            <p>CONTACT US</p>
        </li>
    </ul>

    <div class="logo">
        <a href="findInit.do" title="一个牛逼的网站">
            <img src="img/logo.jpg" alt="网站的logo">
        </a>
    </div>

    <div class="user">
        <label hidden>欢迎你，XXXX</label>&nbsp;&nbsp;&nbsp;&nbsp;
        <a hidden id="homePage" href="#">我的主页/</a>
        <a hidden id="exit" href="#">退出登录</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="userLogin.jsp">用户登录</a>&nbsp;/&nbsp;
        <a href="userRegister.jsp">用户注册</a>
    </div>
</div>

<!--网站主内容-->
<div class="content w clearfix">
    <div class="rightForm">
        <form action="userLogin.do" class="form">
            <div class="form-head">
                <h2>用户登录</h2>
            </div>
            <div class="form-body">
                <div class="ui-input">
                    <input type="text" placeholder="帐号" name="userName">
                </div>
                <div class="ui-input">
                    <input type="password" placeholder="密码" name="password">
                </div>
                <p class="forget-password">
                    <a href="">忘记密码？</a>
                </p>
                <button class="ui-button ui-button--primary">登录</button>
                <s:property value="resultInfo.msg"/>
            </div>
        </form>
    </div>
</div>

<!--网站底部-->
<div class="footer">
    <div class="w">
        <p><a href="findInit.do">网站主页</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="aboutUs.jsp">关于我们</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="findRentByPage.do?page=aboutRent">租车资讯</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="findCarByPage.do?isSale=1&page=weekSpecials">本周特价</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="contactUs.jsp">在线留言</a></p>
        <br/>
        <p>版权所有 YangfanJack1024</p>
        <br/>
        <p><a href="Mailto:yangfanjack1024@qq.com">如果您对该汽车租赁网站有任何意见，点击这里发送邮件给我们。</a></p>
    </div>
</div>
</body>
</html>
