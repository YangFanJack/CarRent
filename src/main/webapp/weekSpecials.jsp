<%--
  Created by IntelliJ IDEA.
  User: 11445
  Date: 2020/5/1
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>每周特价</title>
    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/page-weekSpecials.css" type="text/css">
    <script src="js/jquery-3.3.1.js"></script>
    <script>
        $(function () {
            //登录信息显示
            var loginUser = "<%=session.getAttribute("loginUser")%>";
            if (loginUser !== "null") {
                var exit = document.getElementById("exit");
                var homePage = document.getElementById("homePage");
                var label = document.getElementsByClassName("user")[0].getElementsByTagName("label")[0];
                exit.removeAttribute("hidden");
                homePage.removeAttribute("hidden");
                label.removeAttribute("hidden");
                label.innerHTML = "欢迎你," + loginUser;
                var mark = "<%=session.getAttribute("mark")%>";
                if (mark === "user") {
                    exit.href = "exitUserLogin.do";
                    homePage.href = "userFunc.jsp";
                    let n = document.getElementsByClassName("morea");
                    for (let i=0;i<n.length;i++){
                        n[i].href="userFunc.jsp";
                    }
                }
                if (mark === "manager") {
                    exit.href = "exitManagerLogin.do";
                    homePage.href = "manageFunc.jsp";
                    document.getElementsByClassName("morea").href="manageFunc.jsp";
                    let n = document.getElementsByClassName("morea");
                    for (let i=0;i<n.length;i++){
                        n[i].href="manageFunc.jsp";
                    }
                }
            }
            else{
                let n = document.getElementsByClassName("moreb");
                for (let i=0;i<n.length;i++){
                    n[i].onclick=function () {
                        alert("请先登录！");
                    }
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
            <a href="findRentByPage.do?page=aboutRent&pageSize=6">租车资讯</a>
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
    <div class="contents">
        <div class="title">
            <label>本周特价</label>
        </div>
        <div class="news">
            <s:iterator value="resultInfo.data.list" var="name" status="st">
                <div class="imgDIV">
                    <img src="<s:property value="#name.url"/>">
                    <div>
                        <p class="p2"><s:property value="#name.name"/>(<s:property value="#name.brief"/>)</p>
                        <p class="p3">￥<s:property value="#name.price"/>/日</p>
                        <a class="morea"><button class="moreb">查看详情</button></a>
                    </div>
                </div><hr>
            </s:iterator>
        </div>
        <div class="pageNum">
            <ul>
                <li><a href="findCarByPage.do?isSale=1&page=weekSpecials">首页</a></li>
                <li class="threeword"><a href="findCarByPage.do?isSale=1&page=weekSpecials&currentPage=<s:property value="resultInfo.data.currentPage-1"/>">上一页</a></li>
                <s:iterator value="new int[resultInfo.data.totalPage]" status="st">
                    <s:if test="resultInfo.data.currentPage == #st.count">
                        <li class="curPage"><a href="findCarByPage.do?isSale=1&page=weekSpecials&currentPage=<s:property value="#st.count"/>"><s:property value="#st.count"/></a></li>
                    </s:if>
                    <s:if test="resultInfo.data.currentPage != #st.count">
                        <li><a href="findCarByPage.do?isSale=1&page=weekSpecials&currentPage=<s:property value="#st.count"/>"><s:property value="#st.count"/></a></li>
                    </s:if>
                </s:iterator>
                <li class="threeword"><a href="findCarByPage.do?isSale=1&page=weekSpecials&currentPage=<s:property value="resultInfo.data.currentPage+1"/>&total=<s:property value="resultInfo.data.totalPage"/>">下一页</a></li>
                <li><a href="findCarByPage.do?isSale=1&page=weekSpecials&currentPage=<s:property value="resultInfo.data.totalPage"/>">末页</a></li>
            </ul>
            共条<s:property value="resultInfo.data.totalCount"/>数据，共<s:property value="resultInfo.data.totalPage"/>页
        </div>
    </div>
</div>

<!--网站底部-->
<div class="footer">
    <div class="w">
        <p><a href="findInit.do">网站主页</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="aboutUs.jsp">关于我们</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="findRentByPage.do?page=aboutRent&pageSize=6">租车资讯</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
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