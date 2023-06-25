<%--
  Created by IntelliJ IDEA.
  User: dhqpq
  Date: 2023-03-27
  Time: 오전 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="css/main.css">
  <link rel="stylesheet" type="text/css" href="css/includes.css">
  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  <title>SAMSUNG</title>
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
  <h1 id="nav-title">Phone</h1>
  <!-- Title -->

  <!-- center content -->
    <div id="grid" class="swiper">
        <c:forEach items="${pMap.phoneList}" var="phoneList" varStatus="status">
        <c:if test="${status.first}"><ul class="swiper-wrapper"></c:if>
            <c:choose>
                <c:when test="${status.count % 5 == 0}">
                    <li>
                        <!-- 상품 전체 div -->
                        <div class="mun-prd-list-cover">
                          <!-- 상품사진 div -->
                              <div class="mun-prd-thumb">
                                <a href="">
                                  <img id="set-img" src="../upload/${phoneList.saveName}">
                                </a>
                              </div>
                              <!-- 상품사진 div -->
                              <!-- 상품가격정보 -->
                              <div class="mun-prd-info">
                                <a href="" class="menuFont" style="color: black;">
                                  <span>${phoneList.productNm}<br>${phoneList.price}원</span>
                                </a>
                              </div>
                          <!-- 상품가격정보 -->
                        </div>
                        <!-- 상품 전체 div -->
                    </li>
            </ul>
            <ul class="swiper-wrapper">
            </c:when>
            <c:otherwise>
                <li>
                    <!-- 상품 전체 div -->
                    <div class="mun-prd-list-cover">
                        <!-- 상품사진 div -->
                        <div class="mun-prd-thumb">
                            <a href="">
                                <img id="set-img" src="../upload/${phoneList.saveName}">
                            </a>
                        </div>
                        <!-- 상품사진 div -->
                        <!-- 상품가격정보 -->
                        <div class="mun-prd-info">
                            <a href="" class="menuFont" style="color: black;">
                                <span>${phoneList.productNm}<br>${phoneList.price}원</span>
                            </a>
                        </div>
                        <!-- 상품가격정보 -->
                    </div>
                    <!-- 상품 전체 div -->
                </li>
            </c:otherwise>
        </c:choose>
        <c:if test="${status.last}"></ul></c:if>
    </c:forEach>
    </div>
  <!-- center content -->


    <!-- //footer -->
  <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
  <!-- footer -->
</div>
<!-- wrap -->
</body>
    <script type="text/javascript">

    </script>
</html>
