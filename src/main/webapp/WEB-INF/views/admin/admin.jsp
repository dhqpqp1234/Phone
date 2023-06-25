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
    <h1 id="nav-title">MANAGER PAGE</h1>
    <!-- Title -->

    <!-- center content -->

    <div id="main-con" val="1" mx="4">
        <img id="img1" class="main-img" alt="" src="/png/GAL21.1.png">
        <img id="img2" class="main-img" alt="" src="/png/GAL21.2.png">
        <img id="img3" class="main-img" alt="" src="/png/GAL21.png">
        <img id="img4" class="main-img" alt="" src="/png/GAL21.1.png">
    </div>
    <!-- center content -->

    <!-- //footer -->
    <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
    <!-- footer -->
</div>
<!-- wrap -->
</body>
    <script type="text/javascript">
        imgslide();

        function imgslide(){
            var val = $("#main-con").attr("val"); //현재 이미지 번호 가져옴
            var mx = $("#main-con").attr("mx"); //총 이미지 개수를 가져옴

            console.log("val"+val);
            console.log("mx"+mx);

            $("#img" + val).hide(); //현재 이미지를 사라지게함
            if(val == mx){
                val = 1; //현재 이미지가 마지막 번호면 1번으로 되돌린다.
            }else{
                val ++; //마지막 번호가 아니라면 Count 증가
            }

            $("#img" + val).fadeIn(500); // 변경된 번호의 이미지영역을 나타나게 합니다.괄호 안에 숫자는 페이드인 되는 시간을 나타냅니다.
            $("#main-con").attr('val',val); //변경된 이미지영역의 번호를 부여합니다.
            setTimeout('imgslide()',2000); //1초 뒤에 다시 함수를 호출합니다.(숫자값 1000당 1초)
        }
    </script>
</html>
