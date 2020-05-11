<%--
  Created by IntelliJ IDEA.
  User: 11445
  Date: 2020/5/1
  Time: 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>汽车租赁网</title>
    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/page-index.css" type="text/css">
    <script type="text/javascript" src="js/tools.js"></script>
    <script type="text/javascript" src="js/banner.js"></script>
    <script src="js/jquery-3.3.1.js"></script>
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
<%
    session.setAttribute("path","index");
%>
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

<!--轮播图-->
<div class="banner w">
    <ul id="imgList">
        <li><img class="bannerP" src="https://s1.ax1x.com/2020/05/11/YYKTiR.jpg" alt="这是轮播图1"></li>
        <li><img class="bannerP" src="https://s1.ax1x.com/2020/05/11/YYKIo9.jpg" alt="这是轮播图2"></li>
        <li><img class="bannerP" src="https://s1.ax1x.com/2020/05/11/YYK4Z4.jpg" alt="这是轮播图3"></li>
        <li><img class="bannerP" src="https://s1.ax1x.com/2020/05/11/YYK5dJ.jpg" alt="这是轮播图4"></li>
        <li><img class="bannerP" src="https://s1.ax1x.com/2020/05/11/YYKTiR.jpg" alt="这是轮播图1"></li>
    </ul>
    <div class="pointerDIV">
        <a class="bannerA" href="#"></a>
        <a class="bannerA" href="#"></a>
        <a class="bannerA" href="#"></a>
        <a class="bannerA" href="#"></a>
    </div>
</div>

<!--网站主内容-->
<div class="content w clearfix">
    <h1>
        您的需求，我们的帮助，为您营造方便路途！
    </h1>
    <div class="specials">
        <h2>本周特价</h2>
        <p class="p1">On sale this week</p>
        <s:iterator value="#list[0]" begin="0" end="2" var="name" status="st">
            <div class="imgDIV">
                <img src="<s:property value="#name.url"/>" alt="车辆图片">
                <p class="p2"><s:property value="#name.name"/></p><s:property value="#name.brief"/>
                <p class="p3">￥<s:property value="#name.price"/>/日</p>
            </div>
        </s:iterator>
        <a class="lm" href="findCarByPage.do?isSale=1&page=weekSpecials"><button>更多特价信息</button></a>
    </div>
    <div class="main">
        <div class="shang">
            <div class="rent">
                <h2>租车资讯</h2>
                <p class="p1">Instructions for car rental</p>
                <div class="wenzi">
                    <s:iterator value="#list[1]" begin="0" end="5" var="name" status="st">
                        <div><a href="findRentByPage.do?page=aboutRent&it=<s:property value="#name.item"/>"><s:property value="#name.item"/></a></div><hr>
                    </s:iterator>
                </div>
                <a href="findRentByPage.do?page=aboutRent"><button>了解更多租车资讯</button></a>
            </div>
            <div class="us">
                <h2>关于我们</h2>
                <p class="p1">Learn more about us</p>
                <div class="wenzi">
                    <img src="https://s1.ax1x.com/2020/05/11/YYKgzV.jpg">
                    <p>
                        XX租车有限公司(CAR Inc.，简称XX租车)成立于2007年9月，总部位于北京。作为中国领先的汽车租赁服务提供商，XX租车积极借鉴国际上成功的汽车租赁模式，并结合中国客户的消费习惯，为客户提供短租、长租及融资租赁等专业化的汽车租赁服务，以及全国救援、异地还车等完善的配套服务。截至2017年12月，神州租车在国内300余个主要城市设有1100余个服务网点，服务个人客户过千万、企业客户数万家，是目前中国汽车租赁行业的领跑企业...
                    </p>
                </div>
                <a href="aboutUs.jsp"><button>更多关于我们的信息</button></a>
            </div>
        </div>
        <div class="contact">
            <h2>在线留言</h2>
            <p class="p1">Contact us by online message</p>
            <div class="feedback">
                <form action="submitMessage.do" class="form">
                    <div class="form-body">
                        <div class="ui-input">
                            <input type="text" placeholder="姓名" name="name">
                        </div>
                        <div class="ui-input">
                            <input type="text" placeholder="邮箱" name="mail">
                        </div>
                        <div class="ui-input">
                            <input type="text" placeholder="留言主题" name="messageItem">
                        </div>
                        <div class="ui-input">
                            <textarea placeholder="留言内容" rows="10" cols="30" name="messageContent"></textarea>
                        </div>
                        <a href="javascript:void(0);"><button type="submit">提交</button></a>
                        <br/>
                        <s:property value="resultInfo.msg"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!--网站底部-->
<div class="footer">
    <div class="w">
        <p><a href="index.jsp">网站主页</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
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
