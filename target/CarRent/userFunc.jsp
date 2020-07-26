<%--
  Created by IntelliJ IDEA.
  User: 11445
  Date: 2020/5/1
  Time: 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>普通用户模块</title>
    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/page-userFunc.css" type="text/css">
    <link rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/a.js"></script>
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


            //页面显示调整
            // alert(window.location.pathname.split("/")[2]);
            var spath = decodeURI(window.location.pathname).split("/")[2];
            var Xpath;
            if(document.location.href.toString().indexOf("?")!==-1 && document.location.href.toString().indexOf("&")===-1){
                Xpath=decodeURI(document.location.href).split("?")[1];
            }
            if(document.location.href.toString().indexOf("?")!==-1 && document.location.href.toString().indexOf("&")!==-1){
                var allUrl = decodeURI(document.location.href).split("?")[1];
                Xpath= allUrl.toString().split("&")[0];
            }
            if(spath === "findCarById.do"){
                if(Xpath === "type=短租自驾"){
                    none();
                    setTab('one',1);
                    setTab('colum',1);
                    tan01();
                }
                if(Xpath === "type=长租服务"){
                    none();
                    setTab('one',1);
                    setTab('colum',2);
                    tan02();
                }
                if(Xpath === "type=企业租车"){
                    none();
                    setTab('one',1);
                    setTab('colum',3);
                    tan03();
                }
                if(Xpath === "type=顺风车站"){
                    none();
                    setTab('one',1);
                    setTab('colum',4);
                    tan04();
                }
                if(Xpath === "isSale=1"){
                    none();
                    setTab('one',1);
                    setTab('colum',5);
                    tan05();
                }
            }

            if(spath === "orderCar.do"){
                if(Xpath === "car.type=短租自驾"){
                    none();
                    setTab('one',1);
                    setTab('colum',1);
                    tan01();
                }
                if(Xpath === "car.type=长租服务"){
                    none();
                    setTab('one',1);
                    setTab('colum',2);
                    tan02();
                }
                if(Xpath === "car.type=企业租车"){
                    none();
                    setTab('one',1);
                    setTab('colum',3);
                    tan03();
                }
                if(Xpath === "car.type=顺风车站"){
                    none();
                    setTab('one',1);
                    setTab('colum',4);
                    tan04();
                }
                if(Xpath === "car.isSale=1"){
                    none();
                    setTab('one',1);
                    setTab('colum',5);
                    tan05();
                }
            }

            if(spath === "findOrderByPage.do"){
                if(Xpath === "isConfirm=0"){
                    none();
                    setTab('one',2);
                    setTab('colm',1);
                }
                else if(Xpath === "isConfirm=1"){
                    none();
                    setTab('one',2);
                    setTab('colm',2);
                }
                else{
                    none();
                    setTab('one',2);
                    setTab('colm',1);
                }
            }

            if((spath === "findCarByPage.do" && Xpath === "type=短租自驾")){
                none();
                setTab('one',1);
                setTab('colum',1);
            }
            if((spath === "findCarByPage.do" && Xpath === "type=长租服务")){
                none();
                setTab('one',1);
                setTab('colum',2);
            }
            if((spath === "findCarByPage.do" && Xpath === "type=企业租车")){
                none();
                setTab('one',1);
                setTab('colum',3);
            }
            if((spath === "findCarByPage.do" && Xpath === "type=顺风车站")){
                none();
                setTab('one',1);
                setTab('colum',4);
            }
            if((spath === "findCarByPage.do" && Xpath === "isSale=1")){
                none();
                setTab('one',1);
                setTab('colum',5);
            }

            if(spath === "deleteOrder"){
                none();
                setTab('one',2);
                setTab('colm',1);
            }

            //动态显示订单价格
            let days1 = document.getElementById("days1");
            days1.onblur=function(){
                let dayss1 = days1.value;
                let price1 = document.getElementById("price1").value;
                document.getElementById("totalPrice1").innerHTML=(dayss1-0)*(price1-0);
            }
            let days2 = document.getElementById("days2");
            days2.onblur=function(){
                let dayss2 = days2.value;
                let price2 = document.getElementById("price1").value;
                document.getElementById("totalPrice2").innerHTML=(dayss2-0)*(price2-0);
            }
            let days3 = document.getElementById("days3");
            days3.onblur=function(){
                let dayss3 = days3.value;
                let price3 = document.getElementById("price1").value;
                document.getElementById("totalPrice3").innerHTML=(dayss3-0)*(price3-0);
            }
            let days4 = document.getElementById("days4");
            days4.onblur=function(){
                let dayss4 = days4.value;
                let price4 = document.getElementById("price1").value;
                document.getElementById("totalPrice4").innerHTML=(dayss4-0)*(price4-0);
            }
            let days5 = document.getElementById("days5");
            days5.onblur=function(){
                let dayss5 = days5.value;
                let price5 = document.getElementById("price1").value;
                document.getElementById("totalPrice5").innerHTML=(dayss5-0)*(price5-0);
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
    <div class="top">
        <div class="tab0" id="tab0">
            <ul class="nav1">
                <li id="one0" onclick="block();setTab('one',0)">
                    <a href="#"><img src="img/1.png">
                        <p>首页</p>
                    </a>
                </li>
                <li id="one1" onclick="none();setTab('one',1)">
                    <a href="findCarByPage.do?type=短租自驾&page=userFunc"><img src="img/2.png">
                        <p>租车查询</p>
                    </a>
                </li>
                <li id="one2" onclick="none();setTab('one',2)">
                    <a href="findOrderByPage.do?isConfirm=0&page=userFunc"><img src="img/3.png">
                        <p>我的订单</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>


    <div class="content1 con_one" id="con_one_0" style="display:block;">
        <div class="hyy">
            <p></p>
        </div>
    </div>


    <div class="content1 con_one" id="con_one_1" style="display:none;">
        <div class="left-column">
            <div class="service">
                <h5>租车查询</h5>
            </div>
            <div class="tab1" id="tab1">
                <ul class="call">
                    <li id="colum1" onclick="setTab('colum',1)"><a href="findCarByPage.do?type=短租自驾&page=userFunc">短租自驾</a></li>
                    <li id="colum2" onclick="setTab('colum',2)"><a href="findCarByPage.do?type=长租服务&page=userFunc">长租服务</a></li>
                    <li id="colum3" onclick="setTab('colum',3)"><a href="findCarByPage.do?type=企业租车&page=userFunc">企业租车</a></li>
                    <li id="colum4" onclick="setTab('colum',4)"><a href="findCarByPage.do?type=顺风车站&page=userFunc">顺风车站</a></li>
                    <li id="colum5" onclick="setTab('colum',5)"><a href="findCarByPage.do?isSale=1&page=userFunc">特价车型</a></li>
                </ul>
            </div>
        </div>

        <div class="collection">
            <div class="right-content con_colum" id="con_colum_1" style="display:block">
                <form action="findCarByPage.do" class="search">
                    <input type="hidden" name="type" value="短租自驾">
                    <input type="hidden" name="page" value="userFunc">
                    <input name="name" type="text" placeholder="关键词" class="search_input" autocomplete="off">
                    <button class="search-button">搜索</button>
                </form>
                <table>
                    <tr>
                        <th>编号</th>
                        <th>车名</th>
                        <th>展示</th>
                        <th>类型</th>
                        <th>特价</th>
                        <th>价格</th>
                        <th>详情</th>
                        <th>下单</th>
                    </tr>
                    <s:iterator value="resultInfo.data.list" var="name" status="st">
                        <tr>
                            <td><div><s:property value="#st.count"/></div></td>
                            <td><div><s:property value="#name.name"/></div></td>
                            <td><div><img src="<s:property value="#name.url"/>"></div></td>
                            <td><div><s:property value="#name.type"/></div></td>
                            <td><div><s:property value="#name.isSale"/></div></td>
                            <td><div>￥<s:property value="#name.price"/>/日</div></td>
                            <td><div><s:property value="#name.details" escapeHtml="false"/></div></td>
                            <td><div><a href="findCarById.do?type=短租自驾&id=<s:property value="#name.id"/>&page=userFunc"><button>下单</button></a></div></td>
                        </tr>
                    </s:iterator>
                </table>
                <div class="pageNum">
                    <ul>
                        <li><a href="findCarByPage.do?type=短租自驾&name=<s:property value="#condition.name"/>&page=userFunc">首页</a></li>
                        <li class="threeword"><a href="findCarByPage.do?type=短租自驾&currentPage=<s:property value="resultInfo.data.currentPage-1"/>&name=<s:property value="#condition.name"/>&page=userFunc">上一页</a></li>
                        <s:iterator value="new int[resultInfo.data.totalPage]" status="st">
                            <s:if test="resultInfo.data.currentPage == #st.count">
                                <li class="curPage"><a href="findCarByPage.do?type=短租自驾&currentPage=<s:property value="#st.count"/>&name=<s:property value="#condition.name"/>&page=userFunc"><s:property value="#st.count"/></a></li>
                            </s:if>
                            <s:if test="resultInfo.data.currentPage != #st.count">
                                <li><a href="findCarByPage.do?type=短租自驾&currentPage=<s:property value="#st.count"/>&name=<s:property value="#condition.name"/>&page=userFunc"><s:property value="#st.count"/></a></li>
                            </s:if>
                        </s:iterator>
                        <li class="threeword"><a href="findCarByPage.do?type=短租自驾&currentPage=<s:property value="resultInfo.data.currentPage+1"/>&total=<s:property value="resultInfo.data.totalPage"/>&name=<s:property value="#condition.name"/>&page=userFunc">下一页</a></li>
                        <li><a href="findCarByPage.do?type=短租自驾&currentPage=<s:property value="resultInfo.data.totalPage"/>&name=<s:property value="#condition.name"/>&page=userFunc">末页</a></li>
                    </ul>
                    共条<s:property value="resultInfo.data.totalCount"/>数据，共<s:property value="resultInfo.data.totalPage"/>页
                </div>
            </div>
            <div class="right-content con_colum" id="con_colum_2" style="display:none">
                <form action="findCarByPage.do" class="search">
                    <input type="hidden" name="type" value="长租服务">
                    <input type="hidden" name="page" value="userFunc">
                    <input name="name" type="text" placeholder="关键词" class="search_input" autocomplete="off">
                    <button class="search-button">搜索</button>
                </form>
                <table>
                    <tr>
                        <th>编号</th>
                        <th>车名</th>
                        <th>展示</th>
                        <th>类型</th>
                        <th>特价</th>
                        <th>价格</th>
                        <th>详情</th>
                        <th>下单</th>
                    </tr>
                    <s:iterator value="resultInfo.data.list" var="name" status="st">
                        <tr>
                            <td><div><s:property value="#st.count"/></div></td>
                            <td><div><s:property value="#name.name"/></div></td>
                            <td><div><img src="<s:property value="#name.url"/>"></div></td>
                            <td><div><s:property value="#name.type"/></div></td>
                            <td><div><s:property value="#name.isSale"/></div></td>
                            <td><div>￥<s:property value="#name.price"/>/日</div></td>
                            <td><div><s:property value="#name.details" escapeHtml="false"/></div></td>
                            <td><div><a href="findCarById.do?type=长租服务&id=<s:property value="#name.id"/>&page=userFunc"><button>下单</button></a></div></td>
                        </tr>
                    </s:iterator>
                </table>
                <div class="pageNum">
                    <ul>
                        <li><a href="findCarByPage.do?type=长租服务&name=<s:property value="#condition.name"/>&page=userFunc">首页</a></li>
                        <li class="threeword"><a href="findCarByPage.do?type=长租服务&currentPage=<s:property value="resultInfo.data.currentPage-1"/>&name=<s:property value="#condition.name"/>&page=userFunc">上一页</a></li>
                        <s:iterator value="new int[resultInfo.data.totalPage]" status="st">
                            <s:if test="resultInfo.data.currentPage == #st.count">
                                <li class="curPage"><a href="findCarByPage.do?type=长租服务&currentPage=<s:property value="#st.count"/>&name=<s:property value="#condition.name"/>&page=userFunc"><s:property value="#st.count"/></a></li>
                            </s:if>
                            <s:if test="resultInfo.data.currentPage != #st.count">
                                <li><a href="findCarByPage.do?type=长租服务&currentPage=<s:property value="#st.count"/>&name=<s:property value="#condition.name"/>&page=userFunc"><s:property value="#st.count"/></a></li>
                            </s:if>
                        </s:iterator>
                        <li class="threeword"><a href="findCarByPage.do?type=长租服务&currentPage=<s:property value="resultInfo.data.currentPage+1"/>&total=<s:property value="resultInfo.data.totalPage"/>&name=<s:property value="#condition.name"/>&page=userFunc">下一页</a></li>
                        <li><a href="findCarByPage.do?type=长租服务&currentPage=<s:property value="resultInfo.data.totalPage"/>&name=<s:property value="#condition.name"/>&page=userFunc">末页</a></li>
                    </ul>
                    共条<s:property value="resultInfo.data.totalCount"/>数据，共<s:property value="resultInfo.data.totalPage"/>页
                </div>
            </div>
            <div class="right-content con_colum" id="con_colum_3" style="display:none">
                <form action="findCarByPage.do" class="search">
                    <input type="hidden" name="type" value="企业租车">
                    <input type="hidden" name="page" value="userFunc">
                    <input name="name" type="text" placeholder="关键词" class="search_input" autocomplete="off">
                    <button class="search-button">搜索</button>
                </form>
                <table>
                    <tr>
                        <th>编号</th>
                        <th>车名</th>
                        <th>展示</th>
                        <th>类型</th>
                        <th>特价</th>
                        <th>价格</th>
                        <th>详情</th>
                        <th>下单</th>
                    </tr>
                    <s:iterator value="resultInfo.data.list" var="name" status="st">
                        <tr>
                            <td><div><s:property value="#st.count"/></div></td>
                            <td><div><s:property value="#name.name"/></div></td>
                            <td><div><img src="<s:property value="#name.url"/>"></div></td>
                            <td><div><s:property value="#name.type"/></div></td>
                            <td><div><s:property value="#name.isSale"/></div></td>
                            <td><div>￥<s:property value="#name.price"/>/日</div></td>
                            <td><div><s:property value="#name.details" escapeHtml="false"/></div></td>
                            <td><div><a href="findCarById.do?type=企业租车&id=<s:property value="#name.id"/>&page=userFunc"><button>下单</button></a></div></td>
                        </tr>
                    </s:iterator>
                </table>
                <div class="pageNum">
                    <ul>
                        <li><a href="findCarByPage.do?type=企业租车&name=<s:property value="#condition.name"/>&page=userFunc">首页</a></li>
                        <li class="threeword"><a href="findCarByPage.do?type=企业租车&currentPage=<s:property value="resultInfo.data.currentPage-1"/>&name=<s:property value="#condition.name"/>&page=userFunc">上一页</a></li>
                        <s:iterator value="new int[resultInfo.data.totalPage]" status="st">
                            <s:if test="resultInfo.data.currentPage == #st.count">
                                <li class="curPage"><a href="findCarByPage.do?type=企业租车&currentPage=<s:property value="#st.count"/>&name=<s:property value="#condition.name"/>&page=userFunc"><s:property value="#st.count"/></a></li>
                            </s:if>
                            <s:if test="resultInfo.data.currentPage != #st.count">
                                <li><a href="findCarByPage.do?type=企业租车&currentPage=<s:property value="#st.count"/>&name=<s:property value="#condition.name"/>&page=userFunc"><s:property value="#st.count"/></a></li>
                            </s:if>
                        </s:iterator>
                        <li class="threeword"><a href="findCarByPage.do?type=企业租车&currentPage=<s:property value="resultInfo.data.currentPage+1"/>&total=<s:property value="resultInfo.data.totalPage"/>&name=<s:property value="#condition.name"/>&page=userFunc">下一页</a></li>
                        <li><a href="findCarByPage.do?type=企业租车&currentPage=<s:property value="resultInfo.data.totalPage"/>&name=<s:property value="#condition.name"/>&page=userFunc">末页</a></li>
                    </ul>
                    共条<s:property value="resultInfo.data.totalCount"/>数据，共<s:property value="resultInfo.data.totalPage"/>页
                </div>
            </div>
            <div class="right-content con_colum" id="con_colum_4" style="display:none">
                <form action="findCarByPage.do" class="search">
                    <input type="hidden" name="type" value="顺风车站">
                    <input type="hidden" name="page" value="userFunc">
                    <input name="name" type="text" placeholder="关键词" class="search_input" autocomplete="off">
                    <button class="search-button">搜索</button>
                </form>
                <table>
                    <tr>
                        <th>编号</th>
                        <th>车名</th>
                        <th>展示</th>
                        <th>类型</th>
                        <th>特价</th>
                        <th>价格</th>
                        <th>详情</th>
                        <th>下单</th>
                    </tr>
                    <s:iterator value="resultInfo.data.list" var="name" status="st">
                        <tr>
                            <td><div><s:property value="#st.count"/></div></td>
                            <td><div><s:property value="#name.name"/></div></td>
                            <td><div><img src="<s:property value="#name.url"/>"></div></td>
                            <td><div><s:property value="#name.type"/></div></td>
                            <td><div><s:property value="#name.isSale"/></div></td>
                            <td><div>￥<s:property value="#name.price"/>/日</div></td>
                            <td><div><s:property value="#name.details" escapeHtml="false"/></div></td>
                            <td><div><a href="findCarById.do?type=顺风车站&id=<s:property value="#name.id"/>&page=userFunc"><button>下单</button></a></div></td>
                        </tr>
                    </s:iterator>
                </table>
                <div class="pageNum">
                    <ul>
                        <li><a href="findCarByPage.do?type=顺风车站&name=<s:property value="#condition.name"/>&page=userFunc">首页</a></li>
                        <li class="threeword"><a href="findCarByPage.do?type=顺风车站&currentPage=<s:property value="resultInfo.data.currentPage-1"/>&name=<s:property value="#condition.name"/>&page=userFunc">上一页</a></li>
                        <s:iterator value="new int[resultInfo.data.totalPage]" status="st">
                            <s:if test="resultInfo.data.currentPage == #st.count">
                                <li class="curPage"><a href="findCarByPage.do?type=顺风车站&currentPage=<s:property value="#st.count"/>&name=<s:property value="#condition.name"/>&page=userFunc"><s:property value="#st.count"/></a></li>
                            </s:if>
                            <s:if test="resultInfo.data.currentPage != #st.count">
                                <li><a href="findCarByPage.do?type=顺风车站&currentPage=<s:property value="#st.count"/>&name=<s:property value="#condition.name"/>&page=userFunc"><s:property value="#st.count"/></a></li>
                            </s:if>
                        </s:iterator>
                        <li class="threeword"><a href="findCarByPage.do?type=顺风车站&currentPage=<s:property value="resultInfo.data.currentPage+1"/>&total=<s:property value="resultInfo.data.totalPage"/>&name=<s:property value="#condition.name"/>&page=userFunc">下一页</a></li>
                        <li><a href="findCarByPage.do?type=顺风车站&currentPage=<s:property value="resultInfo.data.totalPage"/>&name=<s:property value="#condition.name"/>&page=userFunc">末页</a></li>
                    </ul>
                    共条<s:property value="resultInfo.data.totalCount"/>数据，共<s:property value="resultInfo.data.totalPage"/>页
                </div>
            </div>
            <div class="right-content con_colum" id="con_colum_5" style="display:none">
                <form action="findCarByPage.do" class="search">
                    <input type="hidden" name="isSale" value=1>
                    <input type="hidden" name="page" value="userFunc">
                    <input name="name" type="text" placeholder="关键词" class="search_input" autocomplete="off">
                    <button class="search-button">搜索</button>
                </form>
                <table>
                    <tr>
                        <th>编号</th>
                        <th>车名</th>
                        <th>展示</th>
                        <th>类型</th>
                        <th>特价</th>
                        <th>价格</th>
                        <th>详情</th>
                        <th>下单</th>
                    </tr>
                    <s:iterator value="resultInfo.data.list" var="name" status="st">
                        <tr>
                            <td><div><s:property value="#st.count"/></div></td>
                            <td><div><s:property value="#name.name"/></div></td>
                            <td><div><img src="<s:property value="#name.url"/>"></div></td>
                            <td><div><s:property value="#name.type"/></div></td>
                            <td><div><s:property value="#name.isSale"/></div></td>
                            <td><div>￥<s:property value="#name.price"/>/日</div></td>
                            <td><div><s:property value="#name.details" escapeHtml="false"/></div></td>
                            <td><div><a href="findCarById.do?isSale=1&id=<s:property value="#name.id"/>&page=userFunc"><button>下单</button></a></div></td>
                        </tr>
                    </s:iterator>
                </table>
                <div class="pageNum">
                    <ul>
                        <li><a href="findCarByPage.do?isSale=1&name=<s:property value="#condition.name"/>&page=userFunc">首页</a></li>
                        <li class="threeword"><a href="findCarByPage.do?isSale=1&currentPage=<s:property value="resultInfo.data.currentPage-1"/>&name=<s:property value="#condition.name"/>&page=userFunc">上一页</a></li>
                        <s:iterator value="new int[resultInfo.data.totalPage]" status="st">
                            <s:if test="resultInfo.data.currentPage == #st.count">
                                <li class="curPage"><a href="findCarByPage.do?isSale=1&currentPage=<s:property value="#st.count"/>&name=<s:property value="#condition.name"/>&page=userFunc"><s:property value="#st.count"/></a></li>
                            </s:if>
                            <s:if test="resultInfo.data.currentPage != #st.count">
                                <li><a href="findCarByPage.do?isSale=1&currentPage=<s:property value="#st.count"/>&name=<s:property value="#condition.name"/>&page=userFunc"><s:property value="#st.count"/></a></li>
                            </s:if>
                        </s:iterator>
                        <li class="threeword"><a href="findCarByPage.do?isSale=1&currentPage=<s:property value="resultInfo.data.currentPage+1"/>&total=<s:property value="resultInfo.data.totalPage"/>&name=<s:property value="#condition.name"/>&page=userFunc">下一页</a></li>
                        <li><a href="findCarByPage.do?isSale=1&currentPage=<s:property value="resultInfo.data.totalPage"/>&name=<s:property value="#condition.name"/>&page=userFunc">末页</a></li>
                    </ul>
                    共条<s:property value="resultInfo.data.totalCount"/>数据，共<s:property value="resultInfo.data.totalPage"/>页
                </div>
            </div>
        </div>
    </div>


    <div class="content1 con_one" id="con_one_2" style="display:none;">
        <div class="left-column">
            <div class="service">
                <h5>我的订单</h5>
            </div>
            <div class="tab2" id="tab2">
                <ul class="call">
                    <li id="colm1" onclick="setTab('colm',1)"><a href="findOrderByPage.do?isConfirm=0&page=userFunc">审核订单</a></li>
                    <li id="colm2" onclick="setTab('colm',2)"><a href="findOrderByPage.do?isConfirm=1&page=userFunc">通过订单</a></li>
                </ul>
            </div>
        </div>

        <div class="collection">
            <div class="right-content con_colm" id="con_colm_1" style="display:block">
                <form action="findOrderByPage.do" class="search">
                    <input type="hidden" name="isConfirm" value=0>
                    <input type="hidden" name="page" value="userFunc">
                    <input name="id" type="text" placeholder="订单号查询" class="search_input" autocomplete="off">
                    <button class="search-button">搜索</button>
                </form>
                <table>
                    <tr>
                        <th>编号</th>
                        <th>订单编号</th>
                        <th>车名</th>
                        <th>买主名</th>
                        <th>提交时间</th>
                        <th>租赁时间</th>
                        <th>订单状态</th>
                        <th>总价</th>
                        <th>取消订单</th>
                    </tr>
                    <s:iterator value="resultInfo.data.list" var="name" status="st">
                        <tr>
                            <td><div><s:property value="#st.count"/></div></td>
                            <td><div><s:property value="#name.id"/></div></td>
                            <td><div><s:property value="#name.car.name"/></div></td>
                            <td><div><s:property value="#name.user.userName"/></div></td>
                            <td><div><s:property value="#name.takeTime"/></div></td>
                            <td><div><s:property value="#name.days"/></div></td>
                            <td><div><s:property value="#name.isConfirm"/></div></td>
                            <td><div><s:property value="#name.totalPrice"/></div></td>
                            <td><div><a href="deleteOrder.do?id=<s:property value="#name.id"/>"><button>取消订单</button></a></div></td>
                        </tr>
                    </s:iterator>
                </table>
                <div class="pageNum">
                    <ul>
                        <li><a href="findOrderByPage.do?isConfirm=0&id=<s:property value="#condition.id"/>&page=userFunc">首页</a></li>
                        <li class="threeword"><a href="findOrderByPage.do?isConfirm=0&currentPage=<s:property value="resultInfo.data.currentPage-1"/>&id=<s:property value="#condition.id"/>&page=userFunc">上一页</a></li>
                        <s:iterator value="new int[resultInfo.data.totalPage]" status="st">
                            <s:if test="resultInfo.data.currentPage == #st.count">
                                <li class="curPage"><a href="findOrderByPage.do?isConfirm=0&currentPage=<s:property value="#st.count"/>&id=<s:property value="#condition.id"/>&page=userFunc"><s:property value="#st.count"/></a></li>
                            </s:if>
                            <s:if test="resultInfo.data.currentPage != #st.count">
                                <li><a href="findOrderByPage.do?isConfirm=0&currentPage=<s:property value="#st.count"/>&id=<s:property value="#condition.id"/>&page=userFunc"><s:property value="#st.count"/></a></li>
                            </s:if>
                        </s:iterator>
                        <li class="threeword"><a href="findOrderByPage.do?isConfirm=0&currentPage=<s:property value="resultInfo.data.currentPage+1"/>&total=<s:property value="resultInfo.data.totalPage"/>&id=<s:property value="#condition.id"/>&page=userFunc">下一页</a></li>
                        <li><a href="findOrderByPage.do?isConfirm=0&currentPage=<s:property value="resultInfo.data.totalPage"/>&id=<s:property value="#condition.id"/>&page=userFunc">末页</a></li>
                    </ul>
                    共条<s:property value="resultInfo.data.totalCount"/>数据，共<s:property value="resultInfo.data.totalPage"/>页
                </div>
            </div>
            <div class="right-content con_colm" id="con_colm_2" style="display:none">
                <form action="findOrderByPage.do" class="search">
                    <input type="hidden" name="isConfirm" value=1>
                    <input type="hidden" name="page" value="userFunc">
                    <input name="id" type="text" placeholder="订单号查询" class="search_input" autocomplete="off">
                    <button class="search-button">搜索</button>
                </form>
                <table>
                    <tr>
                        <th>编号</th>
                        <th>订单编号</th>
                        <th>车名</th>
                        <th>买主名</th>
                        <th>提交时间</th>
                        <th>租赁时间</th>
                        <th>订单状态</th>
                        <th>总价</th>
                    </tr>
                    <s:iterator value="resultInfo.data.list" var="name" status="st">
                        <tr>
                            <td><div><s:property value="#st.count"/></div></td>
                            <td><div><s:property value="#name.id"/></div></td>
                            <td><div><s:property value="#name.car.name"/></div></td>
                            <td><div><s:property value="#name.user.userName"/></div></td>
                            <td><div><s:property value="#name.takeTime"/></div></td>
                            <td><div><s:property value="#name.days"/></div></td>
                            <td><div><s:property value="#name.isConfirm"/></div></td>
                            <td><div><s:property value="#name.totalPrice"/></div></td>
                        </tr>
                    </s:iterator>
                </table>
                <div class="pageNum">
                    <ul>
                        <li><a href="findOrderByPage.do?isConfirm=1&id=<s:property value="#condition.id"/>&page=userFunc">首页</a></li>
                        <li class="threeword"><a href="findOrderByPage.do?isConfirm=1&currentPage=<s:property value="resultInfo.data.currentPage-1"/>&id=<s:property value="#condition.id"/>&page=userFunc">上一页</a></li>
                        <s:iterator value="new int[resultInfo.data.totalPage]" status="st">
                            <s:if test="resultInfo.data.currentPage == #st.count">
                                <li class="curPage"><a href="findOrderByPage.do?isConfirm=1&currentPage=<s:property value="#st.count"/>&id=<s:property value="#condition.id"/>&page=userFunc"><s:property value="#st.count"/></a></li>
                            </s:if>
                            <s:if test="resultInfo.data.currentPage != #st.count">
                                <li><a href="findOrderByPage.do?isConfirm=1&currentPage=<s:property value="#st.count"/>&id=<s:property value="#condition.id"/>&page=userFunc"><s:property value="#st.count"/></a></li>
                            </s:if>
                        </s:iterator>
                        <li class="threeword"><a href="findOrderByPage.do?isConfirm=1&currentPage=<s:property value="resultInfo.data.currentPage+1"/>&total=<s:property value="resultInfo.data.totalPage"/>&id=<s:property value="#condition.id"/>&page=userFunc">下一页</a></li>
                        <li><a href="findOrderByPage.do?isConfirm=1&currentPage=<s:property value="resultInfo.data.totalPage"/>&id=<s:property value="#condition.id"/>&page=userFunc">末页</a></li>
                    </ul>
                    共条<s:property value="resultInfo.data.totalCount"/>数据，共<s:property value="resultInfo.data.totalPage"/>页
                </div>
            </div>
        </div>
    </div>


    <div class="zhezhao" id="zhezhao01" style="display:none;">
        <div class="tankuang">
            <div class="headerX">
                <span>订单填写</span>
                <div class="headerX-right" onclick="hidder01()"><a href="findCarByPage.do?type=短租自驾&page=userFunc">x</a></div>
            </div>
            <div class="kuang">
                <form action="orderCar.do" class="form">
                    <div class="form-head" style="padding: 0px 0px;">
                        <h2>订单填写</h2>
                    </div>
                    <div class="form-body">
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆类型" name="car.type" readonly="readonly" value="<s:property value="resultInfo.data.type"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车名" name="car.name" readonly="readonly" value="<s:property value="resultInfo.data.name"/>">
                        </div>
                        <input type="hidden" placeholder="车辆编号" name="car.id" readonly="readonly" value="<s:property value="resultInfo.data.id"/>">
                        <input id="price1" type="hidden" placeholder="价格/日" name="car.price" readonly="readonly" value="<s:property value="resultInfo.data.price"/>">
                        <input type="hidden" placeholder="用户编号" name="user.id" readonly="readonly" value="${sessionScope.loginUserId}">
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="用户名" name="user.userName" readonly="readonly" value="${sessionScope.loginUser}">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input id="days1" type="text" placeholder="租期(单位：天)" name="days">
                        </div>
                        总价：<label id="totalPrice1"></label>
                        <button type="submit" class="ui-button ui-button--primary">提交</button>
                        <br/>
                        <s:property value="resultInfo.msg"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="zhezhao" id="zhezhao02" style="display:none;">
        <div class="tankuang">
            <div class="headerX">
                <span>订单填写</span>
                <div class="headerX-right" onclick="hidder02()"><a href="findCarByPage.do?type=长租服务&page=userFunc">x</a></div>
            </div>
            <div class="kuang">
                <form action="orderCar.do" class="form">
                    <div class="form-head" style="padding: 0px 0px;">
                        <h2>订单填写</h2>
                    </div>
                    <div class="form-body">
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆类型" name="car.type" readonly="readonly" value="<s:property value="resultInfo.data.type"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车名" name="car.name" readonly="readonly" value="<s:property value="resultInfo.data.name"/>">
                        </div>
                        <input type="hidden" placeholder="车辆编号" name="car.id" readonly="readonly" value="<s:property value="resultInfo.data.id"/>">
                        <input id="price2" type="hidden" placeholder="价格/日" name="car.price" readonly="readonly" value="<s:property value="resultInfo.data.price"/>">
                        <input type="hidden" placeholder="用户编号" name="user.id" readonly="readonly" value="${sessionScope.loginUserId}">
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="用户名" name="user.userName" readonly="readonly" value="${sessionScope.loginUser}">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input id="days2" type="text" placeholder="租期(单位：天)" name="days">
                        </div>
                        总价：<label id="totalPrice2"></label>
                        <button type="submit" class="ui-button ui-button--primary">提交</button>
                        <br/>
                        <s:property value="resultInfo.msg"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="zhezhao" id="zhezhao03" style="display:none;">
        <div class="tankuang">
            <div class="headerX">
                <span>订单填写</span>
                <div class="headerX-right" onclick="hidder03()"><a href="findCarByPage.do?type=企业租车&page=userFunc">x</a></div>
            </div>
            <div class="kuang">
                <form action="orderCar.do" class="form">
                    <div class="form-head" style="padding: 0px 0px;">
                        <h2>订单填写</h2>
                    </div>
                    <div class="form-body">
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆类型" name="car.type" readonly="readonly" value="<s:property value="resultInfo.data.type"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车名" name="car.name" readonly="readonly" value="<s:property value="resultInfo.data.name"/>">
                        </div>
                        <input type="hidden" placeholder="车辆编号" name="car.id" readonly="readonly" value="<s:property value="resultInfo.data.id"/>">
                        <input id="price3" type="hidden" placeholder="价格/日" name="car.price" readonly="readonly" value="<s:property value="resultInfo.data.price"/>">
                        <input type="hidden" placeholder="用户编号" name="user.id" readonly="readonly" value="${sessionScope.loginUserId}">
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="用户名" name="user.userName" readonly="readonly" value="${sessionScope.loginUser}">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input id="days3" type="text" placeholder="租期(单位：天)" name="days">
                        </div>
                        总价：<label id="totalPrice3"></label>
                        <button type="submit" class="ui-button ui-button--primary">提交</button>
                        <br/>
                        <s:property value="resultInfo.msg"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="zhezhao" id="zhezhao04" style="display:none;">
        <div class="tankuang">
            <div class="headerX">
                <span>订单填写</span>
                <div class="headerX-right" onclick="hidder04()"><a href="findCarByPage.do?type=顺风车站&page=userFunc">x</a></div>
            </div>
            <div class="kuang">
                <form action="orderCar.do" class="form">
                    <div class="form-head" style="padding: 0px 0px;">
                        <h2>订单填写</h2>
                    </div>
                    <div class="form-body">
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆类型" name="car.type" readonly="readonly" value="<s:property value="resultInfo.data.type"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车名" name="car.name" readonly="readonly" value="<s:property value="resultInfo.data.name"/>">
                        </div>
                        <input type="hidden" placeholder="车辆编号" name="car.id" readonly="readonly" value="<s:property value="resultInfo.data.id"/>">
                        <input id="price4" type="hidden" placeholder="价格/日" name="car.price" readonly="readonly" value="<s:property value="resultInfo.data.price"/>">
                        <input type="hidden" placeholder="用户编号" name="user.id" readonly="readonly" value="${sessionScope.loginUserId}">
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="用户名" name="user.userName" readonly="readonly" value="${sessionScope.loginUser}">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input id="days4" type="text" placeholder="租期(单位：天)" name="days">
                        </div>
                        总价：<label id="totalPrice4"></label>
                        <button type="submit" class="ui-button ui-button--primary">提交</button>
                        <br/>
                        <s:property value="resultInfo.msg"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="zhezhao" id="zhezhao05" style="display:none;">
        <div class="tankuang">
            <div class="headerX">
                <span>订单填写</span>
                <div class="headerX-right" onclick="hidder05()"><a href="findCarByPage.do?isSale=1&page=userFunc">x</a></div>
            </div>
            <div class="kuang">
                <form action="orderCar.do" class="form">
                    <div class="form-head" style="padding: 0px 0px;">
                        <h2>订单填写</h2>
                    </div>
                    <div class="form-body">
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆类型" name="car.type" readonly="readonly" value="<s:property value="resultInfo.data.type"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车名" name="car.name" readonly="readonly" value="<s:property value="resultInfo.data.name"/>">
                        </div>
                        <input type="hidden" placeholder="车辆编号" name="car.id" readonly="readonly" value="<s:property value="resultInfo.data.id"/>">
                        <input id="price5" type="hidden" placeholder="价格/日" name="car.price" readonly="readonly" value="<s:property value="resultInfo.data.price"/>">
                        <input type="hidden" placeholder="用户编号" name="user.id" readonly="readonly" value="${sessionScope.loginUserId}">
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="用户名" name="user.userName" readonly="readonly" value="${sessionScope.loginUser}">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input id="days5" type="text" placeholder="租期(单位：天)" name="days">
                        </div>
                        总价：<label id="totalPrice5"></label>
                        <button type="submit" class="ui-button ui-button--primary">提交</button>
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
