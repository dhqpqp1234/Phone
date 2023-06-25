<%--
  Created by IntelliJ IDEA.
  User: dhqpq
  Date: 2023-04-02
  Time: 오후 3:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>SAMSUNG</title>
  <link rel="stylesheet" type="text/css" href="css/main.css">
  <link rel="stylesheet" type="text/css" href="css/includes.css">
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
      <!-- wrap -->
      <div id="wrap" class="wrap show">
        <!-- header -->
        <c:import url="/WEB-INF/views/includes/userHeader.jsp"></c:import>
        <!-- header -->
        <br>

        <!-- nav -->
        <c:import url="/WEB-INF/views/includes/nav.jsp"></c:import>
        <!-- nev -->

        <!-- Title -->
        <h1 id="log-title">가입 완료 되었습니다.</h1>
        <!-- Title -->

        <!-- login button -->
        <div class="joBtn">
          <button class="joinok-btn" type="button" id="joinokLogBtn">
            <a href="${pageContext.request.contextPath}/login" style="color : black;">로그인</a>
          </button>
        </div>
        <!-- login button -->

        <!-- //footer -->
        <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
        <!-- footer -->
      </div>
      <!-- wrap -->
</body>
</html>
