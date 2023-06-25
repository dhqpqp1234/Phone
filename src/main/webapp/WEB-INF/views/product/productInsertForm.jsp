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
    <h1 id="nav-title">PRODUCT REGISTRATION</h1>
    <!-- Title -->

    <!-- center content -->

    <div id="boardWite">
        <form action="${pageContext.request.contextPath}/productInsert" method="post" enctype="multipart/form-data" >
            <div id="writeTitle">
                <h1>상품등록</h1>
            </div>
            <div id="writeSubTitle">
                <h2>상품정보</h2>
            </div>
            <!-- 상품등록 -->
                <!-- 등록 전체 -->
                <div>
                    <!-- 이미지등록 -->
                    <ul id="img-ul">
                        <li class="UPAMp" style="border-bottom: none;">
                            <div>
                                상품이미지
                                <span style="color: rgb(255, 80, 88);">*</span>
                                <small>(0/12)</small>
                            </div>
                            <div>
                                <ul class="juHAat">
                                    <li class="gADNYc">
                                        이미지 등록
                                        <input type="file" name="file" id="inputFile" accept="image/*, .png, .jpg" multiple="multiple" onchange="setThumbnail(event);">
                                    </li>
                                    <!-- 선택한사진 -->
                                    <li class="" id="img-preview">
                                    </li>
                                    <!-- 선택한사진 -->
                                </ul>
                            </div>
                        </li>

                        <div style="padding-bottom : 18px;  border-bottom: 1px solid rgb(220, 219, 228); font-size: 17px; font-weight: normal;" class="exXLwK">
                            <b>* 상품 이미지는 640x640에 최적화 되어 있습니다.</b>
                            <br>
                            - 이미지는 상품 등록 시 정사각형으로 잘려서 등록됩니다.
                            <br>
                            - 이미지를 클릭할 경우 원본 이미지를 확인할 수 있습니다.
                            <br>
                            - 이미지를 클릭 후 이동하여 등록순서를 변경할 수 있습니다.
                            <br>
                            - 큰 이미지일 경우 이미지가 깨지는 경우가 발생할 수 있습니다.
                            <br>
                            최대 지원 사이즈인 640 X 640으로 리사이즈 해서 올려주세요.(개당 이미지 최대 10M)
                        </div>
                        <!-- 이미지 등록 -->

                        <!-- 상품명 -->
                        <li class="UPAMp">
                            <div>
                                상품명
                                <span style="color: rgb(255, 80, 88);">*</span>
                            </div>
                            <div id="itemTitle">
                                <input type="text" name="productNm" value="" placeholder="상품명을 입력해 주세요.">
                            </div>
                        </li>
                        <!-- 상품명 -->

                        <!-- 상품 카테고리 -->
                        <li class="UPAMp">
                            <div id="categoryNm">
                                카테고리
                                <span style="color: rgb(255, 80, 88);">*</span>
                            </div>
                            <div id="cateCheck">
                                <input type="checkbox" name="category" value="CT001"><span class="checkSpan">Phone</span>
                                <input type="checkbox" name="category" value="CT002"><span class="checkSpan">NoteBook</span>
                                <input type="checkbox" name="category" value="CT003"><span class="checkSpan">Tv</span>
                                <input type="checkbox" name="category" value="CT004"><span class="checkSpan">SALE</span>
                            </div>
                        </li>
                        <!-- 상품 카테고리 -->

                        <!-- 가격 -->
                        <li class="UPAMp">
                            <div id="priceNm">
                                가격
                                <span style="color: rgb(255, 80, 88);">*</span>
                            </div>
                            <div id="priceDiv">
                                <input id="priceInput" type="text" name="price" value="" placeholder="가격을 입력해 주세요."><span class="checkSpan">원</span>
                            </div>
                        </li>
                        <!-- 가격 -->

                        <!-- 설명 -->
                        <li class="UPAMp">
                            <div id="ContenNm">
                                설명
                                <span style="color: rgb(255, 80, 88);">*</span>
                            </div>
                            <div id="ContenDiv">
                                <textarea id="ContenTxt" name="content" rows="" cols=""></textarea>
                            </div>
                        </li>
                        <!-- 설명 -->

                        <!-- 수량 -->
                        <li class="UPAMp">
                            <div>
                                수량
                                <span style="color: rgb(255, 80, 88);">*</span>
                            </div>
                            <div>
                                <input type="text" id="input-count" name="itCount" value="" placeholder="수량을 입력해 주세요."><span class="checkSpan">개</span>
                            </div>
                        </li>
                        <!-- 수량 -->
                    </ul>
                </div>
                <!-- 등록 전체 -->
                <button id="writeBtn" type="submit" style='cursor:pointer;'>등록하기</button>
            <!-- 상품등록 -->
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
        function setThumbnail(event) {
            for (var image of event.target.files) {
                var reader = new FileReader();

                reader.onload = function(event) {
                    var img = document.createElement("img");
                    img.className = 'imgNo';
                    img.width = 200;
                    img.height = 200;
                    img.style.position = "relative";
                    var deleteBtn = document.createElement("button");
                    deleteBtn.className = 'deleteBtn';
                    deleteBtn.style.position = "absolute";


                    img.setAttribute("src", event.target.result);
                    document.querySelector("li#img-preview").appendChild(img);
                    document.querySelector("li#img-preview").appendChild(deleteBtn);
                };

                console.log(image);
                reader.readAsDataURL(image);
            }
        }
    </script>
</html>
