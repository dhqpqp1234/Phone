<%--
  Created by IntelliJ IDEA.
  User: dhqpq
  Date: 2023-03-28
  Time: 오후 1:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/includes.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <title>SAMSUNG</title>
</head>
<body>
  <div id="header" class="clearfix recommend_header">
     <div id="section" class="clearfix">
          <h1 id="main-title">
              <a href="${pageContext.request.contextPath}/admin"><span id="mainTitle" style="color: black;">SAMSUNG</span><br><p id="title-sub" style="color: black;">Galaxy</p></a>
          </h1>
         <ul class="clearfix gnb_pc" id="title-ul">
              <li><a href="${pageContext.request.contextPath}/productInsertForm" class="color-sub" style="font-size: 27px; color: black;">상품등록</a></li>
              <li><a href="${pageContext.request.contextPath}/manageMent" class="color-sub" style="font-size: 27px; color: black;">상품관리</a></li>
              <li><a href="" class="color-sub" style="font-size: 27px; color: black;">구매/판매 내역</a></li>
              <li><a href="" class="color-sub" style="font-size: 27px; color: black;">고객센터</a></li>

             <c:choose>
                 <c:when test="${autherUser == null}">
                     <li><a href="${pageContext.request.contextPath}/adminLoginForm" style=" color: black; font-family: 'TTCrownMychewR'; font-size: 27px;">로그인</a></li>
                 </c:when>
                 <c:otherwise>
                     <a href="${pageContext.request.contextPath}/adminLogout"><button type="button" class="logoutBtn" style=" cursor:pointer; color: black; border : 0px solid #fff; font-family: 'TTCrownMychewR'; font-size: 27px;">로그아웃</button></a>
                     <a href="" style=" margin-left : 10px; color: grey; font-family: 'TTCrownMychewR'; font-size: 27px;">${autherUser.buyerNm}님</a>
                 </c:otherwise>
             </c:choose>
         </ul>
      </div>
  </div>
</body>
    <script type="text/javascript">

    </script>
</html>
