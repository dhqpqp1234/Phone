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
    <c:import url="/WEB-INF/views/includes/adminHeader.jsp"></c:import>
    <!-- header -->
    <br>

    <!-- nav -->
    <c:import url="/WEB-INF/views/includes/adminNav.jsp"></c:import>
    <!-- nev -->

    <!-- Title -->
    <h1 id="nav-title">MANAGEMENT</h1>
    <!-- Title -->

    <!-- center content -->
    <div id="boardWite">
        <table id="detailList">
            <thead>
            <tr>
                <th class="detailList" style="width: 150px; ">상품번호</th>
                <th class="detailList" style="width: 1080px;">${pMap.pDto.productNo}</th>
            </tr>
            <tr>
                <th class="detailList" style="width: 150px; ">상품명</th>
                <th class="detailList" style="width: 1080px;">${pMap.pDto.productNm}</th>
            </tr>
            <tr>
                <th class="detailList" style="width: 150px; ">분류</th>
                <th class="detailList" style="width: 1080px;">${pMap.pDto.categoryNm}</th>
            </tr>
            <tr>
                <th class="detailList" style="width: 150px; ">가격</th>
                <th class="detailList" style="width: 1080px;">${pMap.pDto.price}</th>
            </tr>
            <tr>
                <th class="detailList" style="width: 150px; ">내용</th>
                <th class="detailList" style="width: 1080px;">${pMap.pDto.content}</th>
            </tr>
            <tr>
                <th class="detailList" style="width: 150px; ">사진</th>
                <th class="detailList" style="width: 1080px;">
                    <c:forEach items="${pMap.fileList}" var="fileList">
                        <img style="width: 800px; height: 500px;" src="../upload/${fileList.saveName}"><br>
                    </c:forEach>
                </th>
            </tr>
            </thead>
        </table>
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
