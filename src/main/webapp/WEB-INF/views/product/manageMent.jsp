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
        <table id="writeList">
            <thead>
            <tr>
                <th class="productList" style="width: 150px; ">상품번호</th>
                <th class="productList" style="width: 503px;">상품명</th>
                <th class="productList" style="width: 200px; ">분류</th>
                <th class="productList" style="width: 200px;">가격</th>
                <th class="productList" style="width: 200px;">등록일</th>
                <th class="productList" style="width: 120px;">관리</th>
            </tr>
            </thead>
        <c:forEach items="${pMap.pList}" var="pList">
            <tbody>
                <tr>
                    <td class="pNo" id="proNo" class="product-content">${pList.productNo}</td>
                    <td class="product-content"><a href="${pageContext.request.contextPath}/detail?productNo=${pList.productNo}" data-num="${pList.productNo}" class="productNm" id="productNm-a">${pList.productNm}</a></td>
                    <td class="product-content">${pList.categoryNm}</td>
                    <td class="product-content">${pList.price}원</td>
                    <td class="product-content">${pList.regDttm}</td>
                    <td class="product-content" name="delBtn" id="delBtn"><a data-no="${pList.productNo}" style="color: grey; cursor: pointer;" class="productDelete">삭제</a></td>
                </tr>
            </tbody>
        </c:forEach>
        </table>
        <!-- 페이징 -->
        <div id="paging">
            <div>Total : ${total}</div>
            <div>
                <c:forEach var="pageNum" begin="1" end="${totalPage}">
                    <a style="color: black;" href="${pageContext.request.contextPath}/manageMent?pageNum=${pageNum}">${pageNum}</a>
                </c:forEach>
            </div>
        </div>
        <!-- 페이징 -->
        <form action="${pageContext.request.contextPath}/manageMent">
            <div id="hostSearch">
                <select name="searchType" id="searchSelBox">
                    <option value="searchTitle">상품명</option>
                    <option value="searchCate">분류</option>
                </select>
                <input type="text" id="keyword" name="keyword">
                <button type="submit" id="searchBtn">검색</button>
            </div>
        </form>
    </div>
    <!-- center content -->

    <!-- //footer -->
    <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
    <!-- footer -->
</div>
<!-- wrap -->
</body>
    <script type="text/javascript">
        //삭제
        $(".productDelete").on("click",function (){
            var productNo = $(this).data('no');
            console.log('delBtn'+productNo)

            $.ajax({
                url : "${pageContext.request.contextPath}/delete",
                type : "post",
                data : JSON.stringify({'productNo' : productNo}),
                contentType : "application/json",
                dataType : "text",
                success : function(count) {
                alert('삭제 되었습니다.')
                window.location.href='${pageContext.request.contextPath}/manageMent'
                },
                error : function(XHR, status, error) {
                    console.error(status + " : " + error);
                }
            });

        });
      /*function detail(){

            var productNo = $(this).data('num');
            alert('상세보기버튼'+productNo)
            //window.location.href='${pageContext.request.contextPath}/detail'
        }*/
        /*$(".productNm").on("click",function (){
            console.log('상품명 클릭시 이벤트')

            var productNo = $(this).data('num');
            alert('productNo'+productNo);
            window.location.href='${pageContext.request.contextPath}/detailForm?productNo='+productNo

        });*/

    </script>
</html>
