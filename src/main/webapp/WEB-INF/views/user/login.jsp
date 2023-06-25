<%--
  Created by IntelliJ IDEA.
  User: dhqpq
  Date: 2023-03-28
  Time: 오후 2:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/includes.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
      <h1 id="log-title">로그인</h1>
      <!-- Title -->

      <!-- login content -->
      <div class="layer_fix layer_unfix pop_login pop_mem_reserve" id="log-content">
        <section id="login-input">
          <div class="login-id">
              <!-- focus / err -->
              <input type="email" name="userId" id="log-id" placeholder="아이디를 입력해 주세요." onfocus="this.placeholder = ''" onblur="this.placeholder='아이디를 입력해 주세요.'">
            </div>
            <div class="login-pw">
              <input type="password" name="passward" id="log-pw" placeholder="비밀번호를 입력해 주세요." onfocus="this.placeholder = ''" onblur="this.placeholder='비밀번호를 입력해 주세요.'">
            </div>
            <div id="logBtn">
              <button class="log-btn" type="button" id="loginBtn" style='cursor:pointer;'>
                <span>로그인</span>
              </button>
              <button class="log-btn" type="button" >
                <a href="${pageContext.request.contextPath}/joinForm" style="color: black;">회원가입</a>
              </button>

            </div>
        </section>
      </div>
      <!-- login content -->

      <!-- //footer -->
      <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
      <!-- footer -->
    </div>
<!-- wrap -->
</body>
<script type="text/javascript">
    $("#loginBtn").on("click",function (){
        console.log("loginBtn")

        var custId = $("#log-id").val();
        var custPw = $("#log-pw").val();

        console.log(custId);
        console.log(custPw);

        var userDto = {
            custId : custId,
            custPw : custPw
        }

        console.log(userDto)

        $.ajax({
            url : "${pageContext.request.contextPath}/login",
            type : "post",
            data : JSON.stringify(userDto),
            contentType : "application/json",
            dataType : "text",
            success : function(result) {

                if(result == "ok"){
                    window.location.href="${pageContext.request.contextPath}/main"
                }else{
                    alert("아이디 비밀번호를 확인해 주세요.");
                }

            },
            error : function(XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    });

    $("#idReset").on("click",function (){
        console.log("idReset");

        var idInput = $("#log-id").val();
        console.log(idInput)
        idInput.value = "";
    });

    $("#pwReset").on("click",function (){
        console.log("pwReset");
    });
</script>
</html>
