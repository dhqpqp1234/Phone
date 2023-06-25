<%--
  Created by IntelliJ IDEA.
  User: dhqpq
  Date: 2023-03-28
  Time: 오후 1:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SAMSUNG</title>
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/includes.css">
</head>
<body>
    <!-- nav -->
    <div id="nav-menu">
        <ul id="nav-ul">
            <li class="nav-li"><a href="${pageContext.request.contextPath}/productInsertForm" class="nav-a">상품등록</a></li>
            <li class="nav-li"><a href="${pageContext.request.contextPath}/manageMent" class="nav-a">상품관리</a></li>
            <li class="nav-li"><a href="" class="nav-a">구매/판매 내역</a></li>
            <li class="nav-li"><a href="" class="nav-a">고객센터</a></li>
        </ul>
    </div>
    <!-- nav -->
</body>
</html>
