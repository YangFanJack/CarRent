<%--
  Created by IntelliJ IDEA.
  User: 11445
  Date: 2020/5/1
  Time: 9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>关于我们</title>
    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/page-aboutUs.css" type="text/css">
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
        <div class="contents">
            <div class="title">
                <label>关于我们</label>
            </div>
            <div class="news">
                <div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XX租车有限公司(CAR Inc.，简称XX租车)成立于2007年9月，总部位于北京。作为中国领先的汽车租赁服务提供商，XX租车积极借鉴国际上成功的汽车租赁模式，并结合中国客户的消费习惯，为客户提供短租、长租及融资租赁等专业化的汽车租赁服务，以及全国救援、异地还车等完善的配套服务。截至2017年12月，神州租车在国内300余个主要城市设有1100余个服务网点，服务个人客户过千万、企业客户数万家，是目前中国汽车租赁行业的领跑企业。
                </div><hr>
                <div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XX租车坚持以客户为本的专业态度，颠覆繁琐的传统租车模式，为客户提供了快速便捷的全新租车服务体验。公司遍布在中国大陆各主要城市及旅游地区的服务网络，以及24小时的取还车服务和配套服务，不仅可以随时随地满足客户的租车服务需求，更可为客户的安全行车保驾护航。
                </div><hr>
                <div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;自成立以来，XX租车获得了客户的一致认可和社会各界的广泛好评。2008年，公司成为第29届奥运会租车服务提供商，2008年公司获评《中国企业家》“21世纪未来之星”企业，2009年公司荣登《福布斯》中文版“中国潜力企业榜”，2010年公司获评《新财富》“最具增长潜力商业模式”、中华网“年度最佳租车服务奖”，2011年公司获评哈佛《商业评论》“管理行动奖”金奖、中国品牌节“品牌中国大奖最佳服务奖”、《时尚旅游》“中国旅游金榜”最佳租车公司奖。
                </div><hr>
                <div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;秉持“Any One、Any Time、Any Car、Any Where”的服务理念，XX租车以推动绿色出行和新型汽车消费文化为己任，致力成为消费者首选的中国汽车租赁服务品牌，并立志为推动中国的汽车租赁产业和汽车工业的发展而努力。
                </div><hr>
                <div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;根据第三方机构罗兰贝格的调查报告，XX租车是目前中国最具认知度的汽车租赁服务提供商，并在车队规模、网点覆盖、市场份额和业务收入等各项运营和财务指标上，处于中国汽车租赁行业绝对的领导地位。
                </div><hr>
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
