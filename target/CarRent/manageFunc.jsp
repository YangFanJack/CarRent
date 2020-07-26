<%--
  Created by IntelliJ IDEA.
  User: 11445
  Date: 2020/5/1
  Time: 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员模块</title>
    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/page-manageFunc.css" type="text/css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/script.js"></script>
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
            //验证码
            var img = document.getElementsByClassName("checkCode");
            img.onclick = function () {
                var date = new Date().getTime();
                img.src = "checkCode.do?signal="+date;
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
            // alert(Xpath);
            if(spath === "userRegister.do"){
                none();
                setTab('one',4);
                setTab('colu',1);
                tan01();
            }
            if(spath === "addManager.do"){
                none();
                setTab('one',4);
                setTab('colu',2);
                tan02();
            }
            if(spath === "findUserByPage.do" || spath === "deleteUser.do"){
                none();
                setTab('one',4);
                setTab('colu',1);
            }
            if(spath === "findManagerByPage.do" || spath === "deleteManager.do"){
                none();
                setTab('one',4);
                setTab('colu',2);
            }
            if(spath === "findRentByPage.do" || spath === "deleteRent.do"){
                none();
                setTab('one',5);
                setTab('colx',1);
            }

            if(spath === "addRent.do"){
                none();
                setTab('one',5);
                setTab('colx',1);
                tan13();
            }
            if(spath === "updateRent.do" || spath === "findRentById.do"){
                none();
                setTab('one',5);
                setTab('colx',1);
                tan14();
            }
            if((spath === "findCarByPage.do" && Xpath === "del=x")){
                none();
                setTab('one',1);
                setTab('colum',1);
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
            if(spath === "addCar.do"){
                if(Xpath === "type=短租自驾"){
                    none();
                    setTab('one',1);
                    setTab('colum',1);
                    tan03();
                }
                if(Xpath === "type=长租服务"){
                    none();
                    setTab('one',1);
                    setTab('colum',2);
                    tan04();
                }
                if(Xpath === "type=企业租车"){
                    none();
                    setTab('one',1);
                    setTab('colum',3);
                    tan05();
                }
                if(Xpath === "type=顺风车站"){
                    none();
                    setTab('one',1);
                    setTab('colum',4);
                    tan06();
                }
                if(Xpath === "isSale=1"){
                    none();
                    setTab('one',1);
                    setTab('colum',5);
                    tan07();
                }
            }
            if(spath === "findCarById.do" || spath === "updateCar.do"){
                // alert(Xpath);
                if(Xpath === "type=短租自驾"){

                    none();
                    setTab('one',1);
                    setTab('colum',1);
                    tan08();
                }
                if(Xpath === "type=长租服务"){
                    none();
                    setTab('one',1);
                    setTab('colum',2);
                    tan09();
                }
                if(Xpath === "type=企业租车"){
                    none();
                    setTab('one',1);
                    setTab('colum',3);
                    tan10();
                }
                if(Xpath === "type=顺风车站"){
                    none();
                    setTab('one',1);
                    setTab('colum',4);
                    tan11();
                }
                if(Xpath === "isSale=1"){
                    none();
                    setTab('one',1);
                    setTab('colum',5);
                    tan12();
                }
            }

            if(spath === "findMessageByPage.do" && Xpath === "isRead=0"  ||  spath === "readMessage.do" && Xpath === "isRead=0"){
                none();
                setTab('one',3);
                setTab('coln',1);
            }
            if(spath === "findMessageByPage.do" && Xpath === "isRead=1"  ||  spath === "readMessage.do" && Xpath === "isRead=1"){
                none();
                setTab('one',3);
                setTab('coln',2);
            }
            if(spath === "findMessageById.do" && Xpath === "isRead=0"){
                none();
                setTab('one',3);
                setTab('coln',1);
                tan15();
            }
            if(spath === "findMessageById.do" && Xpath === "isRead=1"){
                none();
                setTab('one',3);
                setTab('coln',2);
                tan16();
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
            }

            if(spath === "confirmOrder.do"){
                none();
                setTab('one',2);
                setTab('colm',1);
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
                    <a href="findCarByPage.do?type=短租自驾"><img src="img/4.png">
                        <p>车辆管理</p>
                    </a>
                </li>
                <li id="one2" onclick="none();setTab('one',2)">
                    <a href="findOrderByPage.do?isConfirm=0"><img src="img/5.png">
                        <p>查看订单</p>
                    </a>
                </li>
                <li id="one3" onclick="none();setTab('one',3)">
                    <a href="findMessageByPage.do?isRead=0"><img src="img/6.png">
                        <p>查看留言</p>
                    </a>
                </li>
                <li id="one4" onclick="none();setTab('one',4)">
                    <a href="findUserByPage.do"><img src="img/7.png">
                        <p>人员管理</p>
                    </a>
                </li>
                <li id="one5" onclick="none();setTab('one',5)">
                    <a href="findRentByPage.do?page=manageFunc"><img src="img/8.png">
                        <p>资讯管理</p>
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
                <h5>车辆管理</h5>
            </div>
            <div class="tab1" id="tab1">
                <ul class="call">
                    <li id="colum1" onclick="setTab('colum',1)"><a href="findCarByPage.do?type=短租自驾">短租自驾</a></li>
                    <li id="colum2" onclick="setTab('colum',2)"><a href="findCarByPage.do?type=长租服务">长租服务</a></li>
                    <li id="colum3" onclick="setTab('colum',3)"><a href="findCarByPage.do?type=企业租车">企业租车</a></li>
                    <li id="colum4" onclick="setTab('colum',4)"><a href="findCarByPage.do?type=顺风车站">顺风车站</a></li>
                    <li id="colum5" onclick="setTab('colum',5)"><a href="findCarByPage.do?isSale=1">特价车型</a></li>
                </ul>
            </div>
        </div>

        <div class="collection">
            <div class="right-content con_colum" id="con_colum_1" style="display:block">
                <form action="findCarByPage.do" class="search">
                    <input type="hidden" name="type" value="短租自驾">
                    <input name="name" type="text" placeholder="关键词" class="search_input" autocomplete="off">
                    <button class="search-button">搜索</button>
                </form>
                <button class="add" onclick="tan03()">添加车辆</button>
                <table>
                    <tr>
                        <th>编号</th>
                        <th>车名</th>
                        <th>展示</th>
                        <th>类型</th>
                        <th>特价</th>
                        <th>价格</th>
                        <th>详情</th>
                        <th>修改</th>
                        <th>删除</th>
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
                            <td><div><a href="findCarById.do?type=短租自驾&id=<s:property value="#name.id"/>"><button>修改</button></a></div></td>
                            <td><div><a href="deleteCar.do?type=短租自驾&id=<s:property value="#name.id"/>"><button>删除</button></a></div></td>
                        </tr>
                    </s:iterator>
                </table>
                <div class="pageNum">
                    <ul>
                        <li><a href="findCarByPage.do?type=短租自驾&name=<s:property value="#condition.name"/>">首页</a></li>
                        <li class="threeword"><a href="findCarByPage.do?type=短租自驾&currentPage=<s:property value="resultInfo.data.currentPage-1"/>&name=<s:property value="#condition.name"/>">上一页</a></li>
                        <s:iterator value="new int[resultInfo.data.totalPage]" status="st">
                            <s:if test="resultInfo.data.currentPage == #st.count">
                                <li class="curPage"><a href="findCarByPage.do?type=短租自驾&currentPage=<s:property value="#st.count"/>&name=<s:property value="#condition.name"/>"><s:property value="#st.count"/></a></li>
                            </s:if>
                            <s:if test="resultInfo.data.currentPage != #st.count">
                                <li><a href="findCarByPage.do?type=短租自驾&currentPage=<s:property value="#st.count"/>&name=<s:property value="#condition.name"/>"><s:property value="#st.count"/></a></li>
                            </s:if>
                        </s:iterator>
                        <li class="threeword"><a href="findCarByPage.do?type=短租自驾&currentPage=<s:property value="resultInfo.data.currentPage+1"/>&total=<s:property value="resultInfo.data.totalPage"/>&name=<s:property value="#condition.name"/>">下一页</a></li>
                        <li><a href="findCarByPage.do?type=短租自驾&currentPage=<s:property value="resultInfo.data.totalPage"/>&name=<s:property value="#condition.name"/>">末页</a></li>
                    </ul>
                    共条<s:property value="resultInfo.data.totalCount"/>数据，共<s:property value="resultInfo.data.totalPage"/>页
                </div>
            </div>
            <div class="right-content con_colum" id="con_colum_2" style="display:none">
                <form action="findCarByPage.do" class="search">
                    <input type="hidden" name="type" value="长租服务">
                    <input name="name" type="text" placeholder="关键词" class="search_input" autocomplete="off">
                    <button class="search-button">搜索</button>
                </form>
                <button class="add" onclick="tan03()">添加车辆</button>
                <table>
                    <tr>
                        <th>编号</th>
                        <th>车名</th>
                        <th>展示</th>
                        <th>类型</th>
                        <th>特价</th>
                        <th>价格</th>
                        <th>详情</th>
                        <th>修改</th>
                        <th>删除</th>
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
                            <td><div><a href="findCarById.do?type=长租服务&id=<s:property value="#name.id"/>"><button>修改</button></a></div></td>
                            <td><div><a href="deleteCar.do?type=长租服务&id=<s:property value="#name.id"/>"><button>删除</button></a></div></td>
                        </tr>
                    </s:iterator>
                </table>
                <div class="pageNum">
                    <ul>
                        <li><a href="findCarByPage.do?type=长租服务&name=<s:property value="#condition.name"/>">首页</a></li>
                        <li class="threeword"><a href="findCarByPage.do?type=长租服务&currentPage=<s:property value="resultInfo.data.currentPage-1"/>&name=<s:property value="#condition.name"/>">上一页</a></li>
                        <s:iterator value="new int[resultInfo.data.totalPage]" status="st">
                            <s:if test="resultInfo.data.currentPage == #st.count">
                                <li class="curPage"><a href="findCarByPage.do?type=长租服务&currentPage=<s:property value="#st.count"/>&name=<s:property value="#condition.name"/>"><s:property value="#st.count"/></a></li>
                            </s:if>
                            <s:if test="resultInfo.data.currentPage != #st.count">
                                <li><a href="findCarByPage.do?type=长租服务&currentPage=<s:property value="#st.count"/>&name=<s:property value="#condition.name"/>"><s:property value="#st.count"/></a></li>
                            </s:if>
                        </s:iterator>
                        <li class="threeword"><a href="findCarByPage.do?type=长租服务&currentPage=<s:property value="resultInfo.data.currentPage+1"/>&total=<s:property value="resultInfo.data.totalPage"/>&name=<s:property value="#condition.name"/>">下一页</a></li>
                        <li><a href="findCarByPage.do?type=长租服务&currentPage=<s:property value="resultInfo.data.totalPage"/>&name=<s:property value="#condition.name"/>">末页</a></li>
                    </ul>
                    共条<s:property value="resultInfo.data.totalCount"/>数据，共<s:property value="resultInfo.data.totalPage"/>页
                </div>
            </div>
            <div class="right-content con_colum" id="con_colum_3" style="display:none">
                <form action="findCarByPage.do" class="search">
                    <input type="hidden" name="type" value="企业租车">
                    <input name="name" type="text" placeholder="关键词" class="search_input" autocomplete="off">
                    <button class="search-button">搜索</button>
                </form>
                <button class="add" onclick="tan03()">添加车辆</button>
                <table>
                    <tr>
                        <th>编号</th>
                        <th>车名</th>
                        <th>展示</th>
                        <th>类型</th>
                        <th>特价</th>
                        <th>价格</th>
                        <th>详情</th>
                        <th>修改</th>
                        <th>删除</th>
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
                            <td><div><a href="findCarById.do?type=企业租车&id=<s:property value="#name.id"/>"><button>修改</button></a></div></td>
                            <td><div><a href="deleteCar.do?type=企业租车&id=<s:property value="#name.id"/>"><button>删除</button></a></div></td>
                        </tr>
                    </s:iterator>
                </table>
                <div class="pageNum">
                    <ul>
                        <li><a href="findCarByPage.do?type=企业租车&name=<s:property value="#condition.name"/>">首页</a></li>
                        <li class="threeword"><a href="findCarByPage.do?type=企业租车&currentPage=<s:property value="resultInfo.data.currentPage-1"/>&name=<s:property value="#condition.name"/>">上一页</a></li>
                        <s:iterator value="new int[resultInfo.data.totalPage]" status="st">
                            <s:if test="resultInfo.data.currentPage == #st.count">
                                <li class="curPage"><a href="findCarByPage.do?type=企业租车&currentPage=<s:property value="#st.count"/>&name=<s:property value="#condition.name"/>"><s:property value="#st.count"/></a></li>
                            </s:if>
                            <s:if test="resultInfo.data.currentPage != #st.count">
                                <li><a href="findCarByPage.do?type=企业租车&currentPage=<s:property value="#st.count"/>&name=<s:property value="#condition.name"/>"><s:property value="#st.count"/></a></li>
                            </s:if>
                        </s:iterator>
                        <li class="threeword"><a href="findCarByPage.do?type=企业租车&currentPage=<s:property value="resultInfo.data.currentPage+1"/>&total=<s:property value="resultInfo.data.totalPage"/>&name=<s:property value="#condition.name"/>">下一页</a></li>
                        <li><a href="findCarByPage.do?type=企业租车&currentPage=<s:property value="resultInfo.data.totalPage"/>&name=<s:property value="#condition.name"/>">末页</a></li>
                    </ul>
                    共条<s:property value="resultInfo.data.totalCount"/>数据，共<s:property value="resultInfo.data.totalPage"/>页
                </div>
            </div>
            <div class="right-content con_colum" id="con_colum_4" style="display:none">
                <form action="findCarByPage.do" class="search">
                    <input type="hidden" name="type" value="顺风车站">
                    <input name="name" type="text" placeholder="关键词" class="search_input" autocomplete="off">
                    <button class="search-button">搜索</button>
                </form>
                <button class="add" onclick="tan03()">添加车辆</button>
                <table>
                    <tr>
                        <th>编号</th>
                        <th>车名</th>
                        <th>展示</th>
                        <th>类型</th>
                        <th>特价</th>
                        <th>价格</th>
                        <th>详情</th>
                        <th>修改</th>
                        <th>删除</th>
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
                            <td><div><a href="findCarById.do?type=顺风车站&id=<s:property value="#name.id"/>"><button>修改</button></a></div></td>
                            <td><div><a href="deleteCar.do?type=顺风车站&id=<s:property value="#name.id"/>"><button>删除</button></a></div></td>
                        </tr>
                    </s:iterator>
                </table>
                <div class="pageNum">
                    <ul>
                        <li><a href="findCarByPage.do?type=顺风车站&name=<s:property value="#condition.name"/>">首页</a></li>
                        <li class="threeword"><a href="findCarByPage.do?type=顺风车站&currentPage=<s:property value="resultInfo.data.currentPage-1"/>&name=<s:property value="#condition.name"/>">上一页</a></li>
                        <s:iterator value="new int[resultInfo.data.totalPage]" status="st">
                            <s:if test="resultInfo.data.currentPage == #st.count">
                                <li class="curPage"><a href="findCarByPage.do?type=顺风车站&currentPage=<s:property value="#st.count"/>&name=<s:property value="#condition.name"/>"><s:property value="#st.count"/></a></li>
                            </s:if>
                            <s:if test="resultInfo.data.currentPage != #st.count">
                                <li><a href="findCarByPage.do?type=顺风车站&currentPage=<s:property value="#st.count"/>&name=<s:property value="#condition.name"/>"><s:property value="#st.count"/></a></li>
                            </s:if>
                        </s:iterator>
                        <li class="threeword"><a href="findCarByPage.do?type=顺风车站&currentPage=<s:property value="resultInfo.data.currentPage+1"/>&total=<s:property value="resultInfo.data.totalPage"/>&name=<s:property value="#condition.name"/>">下一页</a></li>
                        <li><a href="findCarByPage.do?type=顺风车站&currentPage=<s:property value="resultInfo.data.totalPage"/>&name=<s:property value="#condition.name"/>">末页</a></li>
                    </ul>
                    共条<s:property value="resultInfo.data.totalCount"/>数据，共<s:property value="resultInfo.data.totalPage"/>页
                </div>
            </div>
            <div class="right-content con_colum" id="con_colum_5" style="display:none">
                <form action="findCarByPage.do" class="search">
                    <input type="hidden" name="isSale" value=1>
                    <input name="name" type="text" placeholder="关键词" class="search_input" autocomplete="off">
                    <button class="search-button">搜索</button>
                </form>
                <button class="add" onclick="tan03()">添加车辆</button>
                <table>
                    <tr>
                        <th>编号</th>
                        <th>车名</th>
                        <th>展示</th>
                        <th>类型</th>
                        <th>特价</th>
                        <th>价格</th>
                        <th>详情</th>
                        <th>修改</th>
                        <th>删除</th>
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
                            <td><div><a href="findCarById.do?isSale=1&id=<s:property value="#name.id"/>"><button>修改</button></a></div></td>
                            <td><div><a href="deleteCar.do?isSale=1&id=<s:property value="#name.id"/>"><button>删除</button></a></div></td>
                        </tr>
                    </s:iterator>
                </table>
                <div class="pageNum">
                    <ul>
                        <li><a href="findCarByPage.do?isSale=1&name=<s:property value="#condition.name"/>">首页</a></li>
                        <li class="threeword"><a href="findCarByPage.do?isSale=1&currentPage=<s:property value="resultInfo.data.currentPage-1"/>&name=<s:property value="#condition.name"/>">上一页</a></li>
                        <s:iterator value="new int[resultInfo.data.totalPage]" status="st">
                            <s:if test="resultInfo.data.currentPage == #st.count">
                                <li class="curPage"><a href="findCarByPage.do?isSale=1&currentPage=<s:property value="#st.count"/>&name=<s:property value="#condition.name"/>"><s:property value="#st.count"/></a></li>
                            </s:if>
                            <s:if test="resultInfo.data.currentPage != #st.count">
                                <li><a href="findCarByPage.do?isSale=1&currentPage=<s:property value="#st.count"/>&name=<s:property value="#condition.name"/>"><s:property value="#st.count"/></a></li>
                            </s:if>
                        </s:iterator>
                        <li class="threeword"><a href="findCarByPage.do?isSale=1&currentPage=<s:property value="resultInfo.data.currentPage+1"/>&total=<s:property value="resultInfo.data.totalPage"/>&name=<s:property value="#condition.name"/>">下一页</a></li>
                        <li><a href="findCarByPage.do?isSale=1&currentPage=<s:property value="resultInfo.data.totalPage"/>&name=<s:property value="#condition.name"/>">末页</a></li>
                    </ul>
                    共条<s:property value="resultInfo.data.totalCount"/>数据，共<s:property value="resultInfo.data.totalPage"/>页
                </div>
            </div>
        </div>
    </div>


    <div class="content1 con_one" id="con_one_2" style="display:none;">
        <div class="left-column">
            <div class="service">
                <h5>查看订单</h5>
            </div>
            <div class="tab2" id="tab2">
                <ul class="call">
                    <li id="colm1" onclick="setTab('colm',1)"><a href="findOrderByPage.do?isConfirm=0">待审订单</a></li>
                    <li id="colm2" onclick="setTab('colm',2)"><a href="findOrderByPage.do?isConfirm=1">历史订单</a></li>
                </ul>
            </div>
        </div>

        <div class="collection">
            <div class="right-content con_colm" id="con_colm_1" style="display:block">
                <form action="findOrderByPage.do" class="search">
                    <input type="hidden" name="isConfirm" value=0>
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
                        <th>确认</th>
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
                            <td><div><a href="confirmOrder.do?isConfirm=0&id=<s:property value="#name.id"/>"><button>确认订单</button></a></div></td>
                        </tr>
                    </s:iterator>
                </table>
                <div class="pageNum">
                    <ul>
                        <li><a href="findOrderByPage.do?isConfirm=0&orderId=<s:property value="#condition.orderId"/>">首页</a></li>
                        <li class="threeword"><a href="findOrderByPage.do?isConfirm=0&currentPage=<s:property value="resultInfo.data.currentPage-1"/>&orderId=<s:property value="#condition.orderId"/>">上一页</a></li>
                        <s:iterator value="new int[resultInfo.data.totalPage]" status="st">
                            <s:if test="resultInfo.data.currentPage == #st.count">
                                <li class="curPage"><a href="findOrderByPage.do?isConfirm=0&currentPage=<s:property value="#st.count"/>&orderId=<s:property value="#condition.orderId"/>"><s:property value="#st.count"/></a></li>
                            </s:if>
                            <s:if test="resultInfo.data.currentPage != #st.count">
                                <li><a href="findOrderByPage.do?isConfirm=0&currentPage=<s:property value="#st.count"/>&orderId=<s:property value="#condition.orderId"/>"><s:property value="#st.count"/></a></li>
                            </s:if>
                        </s:iterator>
                        <li class="threeword"><a href="findOrderByPage.do?isConfirm=0&currentPage=<s:property value="resultInfo.data.currentPage+1"/>&total=<s:property value="resultInfo.data.totalPage"/>&orderId=<s:property value="#condition.orderId"/>">下一页</a></li>
                        <li><a href="findOrderByPage.do?isConfirm=0&currentPage=<s:property value="resultInfo.data.totalPage"/>&orderId=<s:property value="#condition.orderId"/>">末页</a></li>
                    </ul>
                    共条<s:property value="resultInfo.data.totalCount"/>数据，共<s:property value="resultInfo.data.totalPage"/>页
                </div>
            </div>
            <div class="right-content con_colm" id="con_colm_2" style="display:none">
                <form action="findOrderByPage.do" class="search">
                    <input type="hidden" name="isConfirm" value=1>
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
                        <li><a href="findOrderByPage.do?isConfirm=1&orderId=<s:property value="#condition.orderId"/>">首页</a></li>
                        <li class="threeword"><a href="findOrderByPage.do?isConfirm=1&currentPage=<s:property value="resultInfo.data.currentPage-1"/>&orderId=<s:property value="#condition.orderId"/>">上一页</a></li>
                        <s:iterator value="new int[resultInfo.data.totalPage]" status="st">
                            <s:if test="resultInfo.data.currentPage == #st.count">
                                <li class="curPage"><a href="findOrderByPage.do?isConfirm=1&currentPage=<s:property value="#st.count"/>&orderId=<s:property value="#condition.orderId"/>"><s:property value="#st.count"/></a></li>
                            </s:if>
                            <s:if test="resultInfo.data.currentPage != #st.count">
                                <li><a href="findOrderByPage.do?isConfirm=1&currentPage=<s:property value="#st.count"/>&orderId=<s:property value="#condition.orderId"/>"><s:property value="#st.count"/></a></li>
                            </s:if>
                        </s:iterator>
                        <li class="threeword"><a href="findOrderByPage.do?isConfirm=1&currentPage=<s:property value="resultInfo.data.currentPage+1"/>&total=<s:property value="resultInfo.data.totalPage"/>&orderId=<s:property value="#condition.orderId"/>">下一页</a></li>
                        <li><a href="findOrderByPage.do?isConfirm=1&currentPage=<s:property value="resultInfo.data.totalPage"/>&orderId=<s:property value="#condition.orderId"/>">末页</a></li>
                    </ul>
                    共条<s:property value="resultInfo.data.totalCount"/>数据，共<s:property value="resultInfo.data.totalPage"/>页
                </div>
            </div>
        </div>
    </div>


    <div class="content1 con_one" id="con_one_3" style="display:none;">
        <div class="left-column">
            <div class="service">
                <h5>查看留言</h5>
            </div>
            <div class="tab3" id="tab3">
                <ul class="call">
                    <li id="coln1" onclick="setTab('coln',1)"><a href="findMessageByPage.do?isRead=0">待读留言</a></li>
                    <li id="coln2" onclick="setTab('coln',2)"><a href="findMessageByPage.do?isRead=1">已读留言</a></li>
                </ul>
            </div>
        </div>

        <div class="collection">
            <div class="right-content con_coln" id="con_coln_1" style="display:block">
                <form action="findMessageByPage.do" class="search">
                    <input type="hidden" name="isRead" value=0>
                    <input name="messageContent" type="text" placeholder="留言内容关键词" class="search_input" autocomplete="off">
                    <button class="search-button">搜索</button>
                </form>
                <table>
                    <tr>
                        <th>留言编号</th>
                        <th>留言姓名</th>
                        <th>留言邮箱</th>
                        <th>留言主题</th>
                        <th>留言时间</th>
                        <th>是否阅读</th>
                        <th>留言内容</th>
                        <th>确认已读</th>
                    </tr>
                    <s:iterator value="resultInfo.data.list" var="name" status="st">
                        <tr>
                            <td><div><s:property value="#st.count"/></div></td>
                            <td><div><s:property value="#name.name"/></div></td>
                            <td><div><s:property value="#name.mail"/></div></td>
                            <td><div><s:property value="#name.messageItem"/></div></td>
                            <td><div><s:property value="#name.time"/></div></td>
                            <td><div><s:property value="#name.isRead"/></div></td>
                            <td><div><a href="findMessageById.do?isRead=0&id=<s:property value="#name.id"/>"><button>查看内容</button></a></div></td>
                            <td><div><a href="readMessage.do?isRead=0&id=<s:property value="#name.id"/>"><button>确认阅读</button></a></div></td>
                        </tr>
                    </s:iterator>
                </table>
                <div class="pageNum">
                    <ul>
                        <li><a href="findMessageByPage.do?isRead=0&messageContent=<s:property value="#condition.messageContent"/>">首页</a></li>
                        <li class="threeword"><a href="findMessageByPage.do?isRead=0&currentPage=<s:property value="resultInfo.data.currentPage-1"/>&messageContent=<s:property value="#condition.messageContent"/>">上一页</a></li>
                        <s:iterator value="new int[resultInfo.data.totalPage]" status="st">
                            <s:if test="resultInfo.data.currentPage == #st.count">
                                <li class="curPage"><a href="findMessageByPage.do?isRead=0&currentPage=<s:property value="#st.count"/>&messageContent=<s:property value="#condition.messageContent"/>"><s:property value="#st.count"/></a></li>
                            </s:if>
                            <s:if test="resultInfo.data.currentPage != #st.count">
                                <li><a href="findMessageByPage.do?isRead=0&currentPage=<s:property value="#st.count"/>&messageContent=<s:property value="#condition.messageContent"/>"><s:property value="#st.count"/></a></li>
                            </s:if>
                        </s:iterator>
                        <li class="threeword"><a href="findMessageByPage.do?isRead=0&currentPage=<s:property value="resultInfo.data.currentPage+1"/>&total=<s:property value="resultInfo.data.totalPage"/>&messageContent=<s:property value="#condition.messageContent"/>">下一页</a></li>
                        <li><a href="findMessageByPage.do?isRead=0&currentPage=<s:property value="resultInfo.data.totalPage"/>&messageContent=<s:property value="#condition.messageContent"/>">末页</a></li>
                    </ul>
                    共条<s:property value="resultInfo.data.totalCount"/>数据，共<s:property value="resultInfo.data.totalPage"/>页
                </div>
            </div>
            <div class="right-content con_coln" id="con_coln_2" style="display:none">
                <form action="findMessageByPage.do" class="search">
                    <input type="hidden" name="isRead" value=1 hidden>
                    <input name="messageContent" type="text" placeholder="留言内容关键词" class="search_input" autocomplete="off">
                    <button class="search-button">搜索</button>
                </form>
                <table>
                    <tr>
                        <th>留言编号</th>
                        <th>留言姓名</th>
                        <th>留言邮箱</th>
                        <th>留言主题</th>
                        <th>留言时间</th>
                        <th>是否阅读</th>
                        <th>留言内容</th>
                    </tr>
                    <s:iterator value="resultInfo.data.list" var="name" status="st">
                        <tr>
                            <td><div><s:property value="#st.count"/></div></td>
                            <td><div><s:property value="#name.name"/></div></td>
                            <td><div><s:property value="#name.mail"/></div></td>
                            <td><div><s:property value="#name.messageItem"/></div></td>
                            <td><div><s:property value="#name.time"/></div></td>
                            <td><div><s:property value="#name.isRead"/></div></td>
                            <td><div><a href="findMessageById.do?isRead=1&id=<s:property value="#name.id"/>"><button>查看内容</button></a></div></td>
                        </tr>
                    </s:iterator>
                </table>
                <div class="pageNum">
                    <ul>
                        <li><a href="findMessageByPage.do?isRead=1&messageContent=<s:property value="#condition.messageContent"/>">首页</a></li>
                        <li class="threeword"><a href="findMessageByPage.do?isRead=1&currentPage=<s:property value="resultInfo.data.currentPage-1"/>&messageContent=<s:property value="#condition.messageContent"/>">上一页</a></li>
                        <s:iterator value="new int[resultInfo.data.totalPage]" status="st">
                            <s:if test="resultInfo.data.currentPage == #st.count">
                                <li class="curPage"><a href="findMessageByPage.do?isRead=1&currentPage=<s:property value="#st.count"/>&messageContent=<s:property value="#condition.messageContent"/>"><s:property value="#st.count"/></a></li>
                            </s:if>
                            <s:if test="resultInfo.data.currentPage != #st.count">
                                <li><a href="findMessageByPage.do?isRead=1&currentPage=<s:property value="#st.count"/>&messageContent=<s:property value="#condition.messageContent"/>"><s:property value="#st.count"/></a></li>
                            </s:if>
                        </s:iterator>
                        <li class="threeword"><a href="findMessageByPage.do?isRead=1&currentPage=<s:property value="resultInfo.data.currentPage+1"/>&total=<s:property value="resultInfo.data.totalPage"/>&messageContent=<s:property value="#condition.messageContent"/>">下一页</a></li>
                        <li><a href="findMessageByPage.do?isRead=1&currentPage=<s:property value="resultInfo.data.totalPage"/>&messageContent=<s:property value="#condition.messageContent"/>">末页</a></li>
                    </ul>
                    共条<s:property value="resultInfo.data.totalCount"/>数据，共<s:property value="resultInfo.data.totalPage"/>页
                </div>
            </div>
        </div>
    </div>


    <div class="content1 con_one" id="con_one_4" style="display:none;">
        <div class="left-column">
            <div class="service">
                <h5>人员管理</h5>
            </div>
            <div class="tab4" id="tab4">
                <ul class="call">
                    <li id="colu1" onclick="setTab('colu',1)"><a href="findUserByPage.do">用户管理</a></li>
                    <li id="colu2" onclick="setTab('colu',2)"><a href="findManagerByPage.do">管理员管理</a></li>
                </ul>
            </div>
        </div>

        <div class="collection">
            <div class="right-content con_colu" id="con_colu_1" style="display:block">
                <form class="search">
                    <input name="userName" type="text" placeholder="用户名查询" class="search_input" autocomplete="off">
                    <button href="findUserByPage.do?currentPage=1&pageSize=5" class="search-button">搜索</button>
                </form>
                <button class="add" onclick="tan01()">添加用户</button>
                <table>
                    <tr>
                        <th>用户编号</th>
                        <th>用户名</th>
                        <th>用户密码</th>
                        <th>删除用户</th>
                    </tr>
                    <s:iterator value="resultInfo.data.list" var="name" status="st">
                        <tr>
                            <td><div><s:property value="#st.count"/></div></td>
                            <td><div><s:property value="#name.userName"/></div></td>
                            <td><div><s:property value="#name.password"/></div></td>
                            <td><div><a href="deleteUser.do?userName=<s:property value="#name.userName"/>"><button>删除用户</button></a></div></td>
                        </tr>
                    </s:iterator>
                </table>
                <div class="pageNum">
                    <ul>
                        <li><a href="findUserByPage.do?currentPage=1&userName=<s:property value="#condition.userName"/>">首页</a></li>
                        <li class="threeword"><a href="findUserByPage.do?currentPage=<s:property value="resultInfo.data.currentPage-1"/>&userName=<s:property value="#condition.userName"/>">上一页</a></li>
                        <s:iterator value="new int[resultInfo.data.totalPage]" status="st">
                            <s:if test="resultInfo.data.currentPage == #st.count">
                                <li class="curPage"><a href="findUserByPage.do?currentPage=<s:property value="#st.count"/>&userName=<s:property value="#condition.userName"/>"><s:property value="#st.count"/></a></li>
                            </s:if>
                            <s:if test="resultInfo.data.currentPage != #st.count">
                                <li><a href="findUserByPage.do?currentPage=<s:property value="#st.count"/>&userName=<s:property value="#condition.userName"/>"><s:property value="#st.count"/></a></li>
                            </s:if>
                        </s:iterator>
                        <li class="threeword"><a href="findUserByPage.do?currentPage=<s:property value="resultInfo.data.currentPage+1"/>&total=<s:property value="resultInfo.data.totalPage"/>&userName=<s:property value="#condition.userName"/>">下一页</a></li>
                        <li><a href="findUserByPage.do?currentPage=<s:property value="resultInfo.data.totalPage"/>&userName=<s:property value="#condition.userName"/>">末页</a></li>
                    </ul>
                    共条<s:property value="resultInfo.data.totalCount"/>数据，共<s:property value="resultInfo.data.totalPage"/>页
                </div>
            </div>
            <div class="right-content con_colu" id="con_colu_2" style="display:none">
                <form class="search">
                    <input name="userName" type="text" placeholder="用户名查询" class="search_input" autocomplete="off">
                    <button href="findManagerByPage.do?currentPage=1&pageSize=5" class="search-button">搜索</button>
                </form>
                <button class="add" onclick="tan02()">添加管理员</button>
                <table>
                    <tr>
                        <th>管理员编号</th>
                        <th>管理员名字</th>
                        <th>管理员名</th>
                        <th>管理员密码</th>
                        <th>删除用户</th>
                    </tr>
                    <s:iterator value="resultInfo.data.list" var="name" status="st">
                        <tr>
                            <td><div><s:property value="#st.count"/></div></td>
                            <td><div><s:property value="#name.name"/></div></td>
                            <td><div><s:property value="#name.userName"/></div></td>
                            <td><div><s:property value="#name.password"/></div></td>
                            <td><div><a href="deleteManager.do?userName=<s:property value="#name.userName"/>"><button>删除管理员</button></a></div></td>
                        </tr>
                    </s:iterator>
                </table>
                <div class="pageNum">
                    <ul>
                        <li><a href="findManagerByPage.do?currentPage=1&userName=<s:property value="#condition.userName"/>">首页</a></li>
                        <li class="threeword"><a href="findManagerByPage.do?currentPage=<s:property value="resultInfo.data.currentPage-1"/>&userName=<s:property value="#condition.userName"/>">上一页</a></li>
                        <s:iterator value="new int[resultInfo.data.totalPage]" status="st">
                            <s:if test="resultInfo.data.currentPage == #st.count">
                                <li class="curPage"><a href="findManagerByPage.do?currentPage=<s:property value="#st.count"/>&userName=<s:property value="#condition.userName"/>"><s:property value="#st.count"/></a></li>
                            </s:if>
                            <s:if test="resultInfo.data.currentPage != #st.count">
                                <li><a href="findManagerByPage.do?currentPage=<s:property value="#st.count"/>&userName=<s:property value="#condition.userName"/>"><s:property value="#st.count"/></a></li>
                            </s:if>
                        </s:iterator>
                        <li class="threeword"><a href="findManagerByPage.do?currentPage=<s:property value="resultInfo.data.currentPage+1"/>&total=<s:property value="resultInfo.data.totalPage"/>&userName=<s:property value="#condition.userName"/>">下一页</a></li>
                        <li><a href="findManagerByPage.do?currentPage=<s:property value="resultInfo.data.totalPage"/>&userName=<s:property value="#condition.userName"/>">末页</a></li>
                    </ul>
                    共条<s:property value="resultInfo.data.totalCount"/>数据，共<s:property value="resultInfo.data.totalPage"/>页
                </div>
            </div>
        </div>
    </div>


    <div class="content1 con_one" id="con_one_5" style="display:none;">
        <div class="left-column">
            <div class="service">
                <h5>资讯管理</h5>
            </div>
            <div class="tab5" id="tab5">
                <ul class="call">
                    <li id="colx1" onclick="setTab('colx',1)"><a href="findRentByPage.do?page=manageFunc">资讯管理</a></li>
                </ul>
            </div>
        </div>

        <div class="collection">
            <div class="right-content con_colx" id="con_colx_1" style="display:block">
                <form class="search">
                    <input name="content" type="text" placeholder="内容关键词" class="search_input" autocomplete="off">
                    <button href="findRentByPage.do" class="search-button">搜索</button>
                </form>
                <button class="add" onclick="tan13()">添加资讯</button>
                <table>
                    <tr>
                        <th>资讯编号</th>
                        <th>资讯标题</th>
                        <th>修改内容</th>
                        <th>删除资讯</th>
                    </tr>
                    <s:iterator value="resultInfo.data.list" var="name" status="st">
                        <tr>
                            <td><div><s:property value="#st.count"/></div></td>
                            <td><div><s:property value="#name.item"/></div></td>
                            <td><div><a href="findRentById.do?id=<s:property value="#name.id"/>"><button>修改内容</button></a></div></td>
                            <td><div><a href="deleteRent.do?id=<s:property value="#name.id"/>"><button>删除资讯</button></a></div></td>
                        </tr>
                    </s:iterator>
                </table>
                <div class="pageNum">
                    <ul>
                        <li><a href="findRentByPage.do?page=manageFunc&content=<s:property value="#condition.content"/>">首页</a></li>
                        <li class="threeword"><a href="findRentByPage.do?page=manageFunc&currentPage=<s:property value="resultInfo.data.currentPage-1"/>&content=<s:property value="#condition.content"/>">上一页</a></li>
                        <s:iterator value="new int[resultInfo.data.totalPage]" status="st">
                            <s:if test="resultInfo.data.currentPage == #st.count">
                                <li class="curPage"><a href="findRentByPage.do?page=manageFunc&currentPage=<s:property value="#st.count"/>&content=<s:property value="#condition.content"/>"><s:property value="#st.count"/></a></li>
                            </s:if>
                            <s:if test="resultInfo.data.currentPage != #st.count">
                                <li><a href="findRentByPage.do?page=manageFunc&currentPage=<s:property value="#st.count"/>&content=<s:property value="#condition.content"/>"><s:property value="#st.count"/></a></li>
                            </s:if>
                        </s:iterator>
                        <li class="threeword"><a href="findRentByPage.do?page=manageFunc&currentPage=<s:property value="resultInfo.data.currentPage+1"/>&total=<s:property value="resultInfo.data.totalPage"/>&content=<s:property value="#condition.content"/>">下一页</a></li>
                        <li><a href="findRentByPage.do?page=manageFunc&currentPage=<s:property value="resultInfo.data.totalPage"/>&content=<s:property value="#condition.content"/>">末页</a></li>
                    </ul>
                    共条<s:property value="resultInfo.data.totalCount"/>数据，共<s:property value="resultInfo.data.totalPage"/>页
                </div>
            </div>
        </div>
    </div>


    <div class="zhezhao" id="zhezhao01" style="display:none;">
        <div class="tankuang">
            <div class="headerX">
                <span>用户注册</span>
                <div class="headerX-right" onclick="hidder01()"><a href="findUserByPage.do">x</a></div>
            </div>
            <div class="kuang">
                <form action="userRegister.do" class="form">
                    <div class="form-head">
                        <h2>用户注册</h2>
                    </div>
                    <div class="form-body">
                        <input type="hidden" name="page" value="manageFunc">
                        <div class="ui-input">
                            <input type="text" placeholder="帐号" name="userName">
                        </div>
                        <div class="ui-input">
                            <input type="password" placeholder="密码，6-16位，区分大小写" name="password">
                        </div>
                        <div class="ui-input narrow-input">
                            <input type="text" placeholder="验证码" name="checkCode">
                            <img style="float: right;margin-right: 30px;;width: 80px;height: 30px" class="checkCode" src="checkCode.do">
                        </div>
                        <button class="ui-button ui-button--primary">注册</button>
                        <s:property value="resultInfo.msg"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="zhezhao" id="zhezhao02" style="display:none;">
        <div class="tankuang">
            <div class="headerX">
                <span>添加管理员</span>
                <div class="headerX-right" onclick="hidder02()"><a href="findManagerByPage.do">x</a></div>
            </div>
            <div class="kuang">
                <form action="addManager.do" class="form">
                    <div class="form-head">
                        <h2>添加管理员</h2>
                    </div>
                    <div class="form-body">
                        <div class="ui-input">
                            <input type="text" placeholder="帐号" name="userName">
                        </div>
                        <div class="ui-input">
                            <input type="text" placeholder="姓名" name="name">
                        </div>
                        <div class="ui-input">
                            <input type="password" placeholder="密码" name="password">
                        </div>
                        <div class="ui-input narrow-input">
                            <input type="text" placeholder="验证码" name="checkCode">
                            <img style="float: right;margin-right: 30px;;width: 80px;height: 30px" class="checkCode" src="checkCode.do">
                        </div>
                        <button class="ui-button ui-button--primary">添加</button>
                        <s:property value="resultInfo.msg"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="zhezhao" id="zhezhao03" style="display:none;">
        <div class="tankuang">
            <div class="headerX">
                <span>添加车辆</span>
                <div class="headerX-right" onclick="hidder03()"><a href="findCarByPage.do?type=短租自驾&currentPage=<s:property value="resultInfo.data.currentPage"/>">x</a></div>
            </div>
            <div class="kuang">
                <form action="addCar.do" class="form">
                    <div class="form-head" style="padding: 0px 0px;">
                        <h2>添加车辆</h2>
                    </div>
                    <div class="form-body">
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆类型" name="type">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车名" name="name">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="价格" name="price">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="是否打折(0/1)" name="isSale">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆图片链接" name="url">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆简介" name="brief">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <textarea placeholder="车辆详细介绍" rows="10" cols="37" name="details" style="resize: none;"></textarea>
                        </div>
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
                <span>添加车辆</span>
                <div class="headerX-right" onclick="hidder04()"><a href="findCarByPage.do?type=长租服务&currentPage=<s:property value="resultInfo.data.currentPage"/>">x</a></div>
            </div>
            <div class="kuang">
                <form action="addCar.do" class="form">
                    <div class="form-head" style="padding: 0px 0px;">
                        <h2>添加车辆</h2>
                    </div>
                    <div class="form-body">
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆类型" name="type">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车名" name="name">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="价格" name="price">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="是否打折(0/1)" name="isSale">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆图片链接" name="url">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆简介" name="brief">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <textarea placeholder="车辆详细介绍" rows="10" cols="37" name="details" style="resize: none;"></textarea>
                        </div>
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
                <span>添加车辆</span>
                <div class="headerX-right" onclick="hidder05()"><a href="findCarByPage.do?type=企业租车&currentPage=<s:property value="resultInfo.data.currentPage"/>">x</a></div>
            </div>
            <div class="kuang">
                <form action="addCar.do" class="form">
                    <div class="form-head" style="padding: 0px 0px;">
                        <h2>添加车辆</h2>
                    </div>
                    <div class="form-body">
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆类型" name="type">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车名" name="name">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="价格" name="price">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="是否打折(0/1)" name="isSale">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆图片链接" name="url">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆简介" name="brief">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <textarea placeholder="车辆详细介绍" rows="10" cols="37" name="details" style="resize: none;"></textarea>
                        </div>
                        <button type="submit" class="ui-button ui-button--primary">提交</button>
                        <br/>
                        <s:property value="resultInfo.msg"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="zhezhao" id="zhezhao06" style="display:none;">
        <div class="tankuang">
            <div class="headerX">
                <span>添加车辆</span>
                <div class="headerX-right" onclick="hidder06()"><a href="findCarByPage.do?type=顺风车站&currentPage=<s:property value="resultInfo.data.currentPage"/>">x</a></div>
            </div>
            <div class="kuang">
                <form action="addCar.do" class="form">
                    <div class="form-head" style="padding: 0px 0px;">
                        <h2>添加车辆</h2>
                    </div>
                    <div class="form-body">
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆类型" name="type">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车名" name="name">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="价格" name="price">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="是否打折(0/1)" name="isSale">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆图片链接" name="url">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆简介" name="brief">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <textarea placeholder="车辆详细介绍" rows="10" cols="37" name="details" style="resize: none;"></textarea>
                        </div>
                        <button type="submit" class="ui-button ui-button--primary">提交</button>
                        <br/>
                        <s:property value="resultInfo.msg"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="zhezhao" id="zhezhao07" style="display:none;">
        <div class="tankuang">
            <div class="headerX">
                <span>添加车辆</span>
                <div class="headerX-right" onclick="hidder07()"><a href="findCarByPage.do?isSale=1&currentPage=<s:property value="resultInfo.data.currentPage"/>">x</a></div>
            </div>
            <div class="kuang">
                <form action="addCar.do" class="form">
                    <div class="form-head" style="padding: 0px 0px;">
                        <h2>添加车辆</h2>
                    </div>
                    <div class="form-body">
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆类型" name="type">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车名" name="name">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="价格" name="price">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="是否打折(0/1)" name="isSale">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆图片链接" name="url">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆简介" name="brief">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <textarea placeholder="车辆详细介绍" rows="10" cols="37" name="details" style="resize: none;"></textarea>
                        </div>
                        <button type="submit" class="ui-button ui-button--primary">提交</button>
                        <br/>
                        <s:property value="resultInfo.msg"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="zhezhao" id="zhezhao08" style="display:none;">
        <div class="tankuang">
            <div class="headerX">
                <span>修改车辆</span>
                <div class="headerX-right" onclick="hidder08()"><a href="findCarByPage.do?type=短租自驾&currentPage=<s:property value="resultInfo.data.currentPage"/>">x</a></div>
            </div>
            <div class="kuang">
                <form action="updateCar.do" class="form">
                    <div class="form-head" style="padding: 0px 0px;">
                        <h2>修改车辆</h2>
                    </div>
                    <div class="form-body">
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆类型" name="type" readonly="readonly" value="<s:property value="resultInfo.data.type"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车名" name="name" readonly="readonly" value="<s:property value="resultInfo.data.name"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="价格" name="price" value="<s:property value="resultInfo.data.price"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="是否打折(0/1)" name="isSale" value="<s:property value="resultInfo.data.isSale"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆图片链接" name="url" value="<s:property value="resultInfo.data.url"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆简介" name="brief" value="<s:property value="resultInfo.data.brief"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <textarea style="resize: none;" placeholder="车辆详细介绍" rows="10" cols="37" name="details"><s:property value="resultInfo.data.details"/></textarea>
                        </div>
                        <button type="submit" class="ui-button ui-button--primary">提交</button>
                        <br/>
                        <s:property value="resultInfo.msg"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="zhezhao" id="zhezhao09" style="display:none;">
        <div class="tankuang">
            <div class="headerX">
                <span>修改车辆</span>
                <div class="headerX-right" onclick="hidder09()"><a href="findCarByPage.do?type=长租服务&currentPage=<s:property value="resultInfo.data.currentPage"/>">x</a></div>
            </div>
            <div class="kuang">
                <form action="updateCar.do" class="form">
                    <div class="form-head" style="padding: 0px 0px;">
                        <h2>修改车辆</h2>
                    </div>
                    <div class="form-body">
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆类型" name="type" readonly="readonly" value="<s:property value="resultInfo.data.type"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车名" name="name" readonly="readonly" value="<s:property value="resultInfo.data.name"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="价格" name="price" value="<s:property value="resultInfo.data.price"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="是否打折(0/1)" name="isSale" value="<s:property value="resultInfo.data.isSale"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆图片链接" name="url" value="<s:property value="resultInfo.data.url"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆简介" name="brief" value="<s:property value="resultInfo.data.brief"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <textarea style="resize: none;" placeholder="车辆详细介绍" rows="10" cols="37" name="details"><s:property value="resultInfo.data.details"/></textarea>
                        </div>
                        <button type="submit" class="ui-button ui-button--primary">提交</button>
                        <br/>
                        <s:property value="resultInfo.msg"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="zhezhao" id="zhezhao10" style="display:none;">
        <div class="tankuang">
            <div class="headerX">
                <span>修改车辆</span>
                <div class="headerX-right" onclick="hidder10()"><a href="findCarByPage.do?type=企业租车&currentPage=<s:property value="resultInfo.data.currentPage"/>">x</a></div>
            </div>
            <div class="kuang">
                <form action="updateCar.do" class="form">
                    <div class="form-head" style="padding: 0px 0px;">
                        <h2>修改车辆</h2>
                    </div>
                    <div class="form-body">
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆类型" name="type" readonly="readonly" value="<s:property value="resultInfo.data.type"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车名" name="name" readonly="readonly" value="<s:property value="resultInfo.data.name"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="价格" name="price" value="<s:property value="resultInfo.data.price"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="是否打折(0/1)" name="isSale" value="<s:property value="resultInfo.data.isSale"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆图片链接" name="url" value="<s:property value="resultInfo.data.url"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆简介" name="brief" value="<s:property value="resultInfo.data.brief"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <textarea style="resize: none;" placeholder="车辆详细介绍" rows="10" cols="37" name="details"><s:property value="resultInfo.data.details"/></textarea>
                        </div>
                        <button type="submit" class="ui-button ui-button--primary">提交</button>
                        <br/>
                        <s:property value="resultInfo.msg"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="zhezhao" id="zhezhao11" style="display:none;">
        <div class="tankuang">
            <div class="headerX">
                <span>修改车辆</span>
                <div class="headerX-right" onclick="hidder11()"><a href="findCarByPage.do?type=顺风车站&currentPage=<s:property value="resultInfo.data.currentPage"/>">x</a></div>
            </div>
            <div class="kuang">
                <form action="updateCar.do" class="form">
                    <div class="form-head" style="padding: 0px 0px;">
                        <h2>修改车辆</h2>
                    </div>
                    <div class="form-body">
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆类型" name="type" readonly="readonly" value="<s:property value="resultInfo.data.type"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车名" name="name" readonly="readonly" value="<s:property value="resultInfo.data.name"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="价格" name="price" value="<s:property value="resultInfo.data.price"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="是否打折(0/1)" name="isSale" value="<s:property value="resultInfo.data.isSale"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆图片链接" name="url" value="<s:property value="resultInfo.data.url"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆简介" name="brief" value="<s:property value="resultInfo.data.brief"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <textarea style="resize: none;" placeholder="车辆详细介绍" rows="10" cols="37" name="details"><s:property value="resultInfo.data.details"/></textarea>
                        </div>
                        <button type="submit" class="ui-button ui-button--primary">提交</button>
                        <br/>
                        <s:property value="resultInfo.msg"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="zhezhao" id="zhezhao12" style="display:none;">
        <div class="tankuang">
            <div class="headerX">
                <span>修改车辆</span>
                <div class="headerX-right" onclick="hidder12()"><a href="findCarByPage.do?isSale=1&currentPage=<s:property value="resultInfo.data.currentPage"/>">x</a></div>
            </div>
            <div class="kuang">
                <form action="updateCar.do" class="form">
                    <div class="form-head" style="padding: 0px 0px;">
                        <h2>修改车辆</h2>
                    </div>
                    <div class="form-body">
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆类型" name="type" readonly="readonly" value="<s:property value="resultInfo.data.type"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车名" name="name" readonly="readonly" value="<s:property value="resultInfo.data.name"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="价格" name="price" value="<s:property value="resultInfo.data.price"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="是否打折(0/1)" name="isSale" value="<s:property value="resultInfo.data.isSale"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆图片链接" name="url" value="<s:property value="resultInfo.data.url"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <input type="text" placeholder="车辆简介" name="brief" value="<s:property value="resultInfo.data.brief"/>">
                        </div>
                        <div class="ui-input" style="padding: 5px 0px;">
                            <textarea style="resize: none;" placeholder="车辆详细介绍" rows="10" cols="37" name="details"><s:property value="resultInfo.data.details"/></textarea>
                        </div>
                        <button type="submit" class="ui-button ui-button--primary">提交</button>
                        <br/>
                        <s:property value="resultInfo.msg"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="zhezhao" id="zhezhao13" style="display:none;">
        <div class="tankuang">
            <div class="headerX">
                <span>添加资讯</span>
                <div class="headerX-right" onclick="hidder13()"><a href="findRentByPage.do?page=manageFunc&currentPage=<s:property value="resultInfo.data.currentPage"/>">x</a></div>
            </div>
            <div class="kuang">
                <form action="addRent.do" class="form">
                    <div class="form-head">
                        <h2>添加资讯</h2>
                    </div>
                    <div class="form-body">
                        <div class="ui-input">
                            <input type="text" placeholder="题目" name="item">
                        </div>
                        <div class="ui-input">
                            <textarea style="resize: none;" placeholder="车辆详细介绍" rows="10" cols="50" name="content"></textarea>
                        </div>
                        <button type="submit" class="ui-button ui-button--primary">提交</button>
                        <br/>
                        <s:property value="resultInfo.msg"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="zhezhao" id="zhezhao14" style="display:none;">
        <div class="tankuang">
            <div class="headerX">
                <span>修改资讯</span>
                <div class="headerX-right" onclick="hidder14()"><a href="findRentByPage.do?page=manageFunc&currentPage=<s:property value="resultInfo.data.currentPage"/>">x</a></div>
            </div>
            <div class="kuang">
                <form action="updateRent.do" class="form">
                    <div class="form-head">
                        <h2>修改资讯</h2>
                    </div>
                    <div class="form-body">
                        <div class="ui-input">
                            <input type="text" placeholder="资讯标题" name="item" readonly="readonly" value="<s:property value="resultInfo.data.item"/>">
                        </div>
                        <div class="ui-input">
                            <textarea style="resize: none;" placeholder="资讯内容" rows="10" cols="50" name="content"><s:property value="resultInfo.data.content"/></textarea>
                        </div>
                        <button type="submit" class="ui-button ui-button--primary">提交</button>
                        <br/>
                        <s:property value="resultInfo.msg"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="zhezhao" id="zhezhao15" style="display:none;">
        <div class="tankuang">
            <div class="headerX">
                <span>留言内容</span>
                <div class="headerX-right" onclick="hidder15()"><a href="findMessageByPage.do?isRead=0&currentPage=<s:property value="resultInfo.data.currentPage"/>">x</a></div>
            </div>
            <div class="kuang">
                <form class="form">
                    <div class="form-head">
                        <h2>留言内容</h2>
                    </div>
                    <div class="form-body">
                        <div class="ui-input">
                            <input type="text" placeholder="留言标题" readonly="readonly" value="<s:property value="resultInfo.data.messageItem"/>">
                        </div>
                        <div class="ui-input">
                            <textarea style="resize: none;" placeholder="留言内容" rows="10" cols="50"><s:property value="resultInfo.data.messageContent"/></textarea>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="zhezhao" id="zhezhao16" style="display:none;">
        <div class="tankuang">
            <div class="headerX">
                <span>留言内容</span>
                <div class="headerX-right" onclick="hidder16()"><a href="findMessageByPage.do?isRead=1&currentPage=<s:property value="resultInfo.data.currentPage"/>">x</a></div>
            </div>
            <div class="kuang">
                <form class="form">
                    <div class="form-head">
                        <h2>留言内容</h2>
                    </div>
                    <div class="form-body">
                        <div class="ui-input">
                            <input type="text" placeholder="留言标题" readonly="readonly" value="<s:property value="resultInfo.data.messageItem"/>">
                        </div>
                        <div class="ui-input">
                            <textarea style="resize: none;" placeholder="留言内容" rows="10" cols="50"><s:property value="resultInfo.data.messageContent"/></textarea>
                        </div>
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