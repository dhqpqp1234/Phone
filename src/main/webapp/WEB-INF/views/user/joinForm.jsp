<%--
  Created by IntelliJ IDEA.
  User: dhqpq
  Date: 2023-03-28
  Time: 오후 2:46
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
      <h1 id="log-title">회원가입</h1>
      <!-- Title -->
      <!-- join content -->
      <div class="layer_fix layer_unfix pop_login pop_mem_reserve" id="join-content">
        <section id="login-input">
            <div class="join-id">
              <!-- focus / err -->
              <label class="join-label">아이디</label>
              <input type="text" id="input-id" name="custId" placeholder="아이디를 입력해 주세요." onfocus="this.placeholder = ''"
                     onblur="this.placeholder='아이디를 입력해 주세요.'">
              <button type="button" class="reset_val" id="idCheck" style='cursor:pointer;'>중복체크</button>
            </div>
            <div class="join-pw">
              <label class="join-label">비밀번호</label>
              <input type="password" id="input-pw" name="custPw" placeholder="비밀번호를 입력해 주세요." onfocus="this.placeholder = ''"
                     onblur="this.placeholder='비밀번호를 입력해 주세요.'">
            </div>
            <div class="join-name">
              <label class="join-label">이름</label>
              <input type="text" id="input-name" name="custName" placeholder="이름을 입력해 주세요." onfocus="this.placeholder = ''"
                     onblur="this.placeholder='이름을 입력해 주세요.'">
            </div>
            <div class="join-eMail">
              <label class="join-label">이메일</label>
              <input type="text" name="custEmail" id="input-eMail" placeholder="이메일를 입력해 주세요."
                     onfocus="this.placeholder = ''" onblur="this.placeholder='이메일을 입력해 주세요.'">
              <select id="mailSelec">
                <option value="@naver.com">@naver.com</option>
                <option value="@daum.net">@daum.net</option>
                <option value="@gmail.com">@gmail.com</option>
                <option value="직접입력">직접입력</option>
              </select>
            </div>
            <div>
              <input type="text" id="certification" placeholder="인증번호를 입력해 주세요." onfocus="this.placeholder = ''"
                     onblur="this.placeholder='인증번호를 입력해 주세요.'">
            </div>
            <button type="button" id="eMailCheck" class="reset_val" style='cursor:pointer;'>본인인증</button>
            <div id="joinForm" class="join-phone" style="width: auto;">
              <label class="join-label">전화번호</label>
              <input type="text" name="custPh" id="input-ph" placeholder="전화번호를 입력해 주세요." onfocus="this.placeholder = ''"
                     onblur="this.placeholder='전화번호를 입력해 주세요.'">
              <button type="button" id="phCheck" class="reset_val" style='cursor:pointer;'>중복체크</button>
            </div>
            <div id="joinBtns" class="joBtn">
              <button class="log-btn" type="button">
                <a href="" style="color : black;">로그인</a>
              </button>
              <button id="joinBtn" class="log-btn" type="button" style='cursor:pointer;'>
                <span>회원가입</span>
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
        //Id 중복체크
        $("#idCheck").on("click",function (){

            var custId = $("#input-id").val();
            var pattern = /[a-z]/;
            console.log("Id중복체크" + custId)

            //Id입력시 경고문구
            if(custId == '' || custId == null){
                alert("아이디를 입력해주세요.");
                return false;
            }else if(custId.length <= 5){
                alert("6글자 이상 입력해 주세요.");
                return false;
            }else if(!pattern.test(custId)){
                alert("영문으로 입력해 주세요.")
                return false;
            }else{
                $.ajax({
                    url : "${pageContext.request.contextPath}/idCheck",
                    type : "post",
                    data : JSON.stringify({"custId" : custId}),
                    contentType : "application/json",
                    dataType : "json",
                    success : function(result) {
                        console.log(result + "result")
                        if(result != 0){
                            alert("사용중인 Id입니다.")
                            return false;
                        }else{
                            alert("사용 가능한 Id입니다.")
                        }

                    },
                    error : function(XHR, status, error) {
                        console.error(status + " : " + error);
                    }

                });
            }

        });

        //전화번호 중복체크
        $("#phCheck").on("click",function (){
            console.log("phCheck")

            var custPh = $("#input-ph").val();

            $.ajax({
                url : "${pageContext.request.contextPath}/phCheck",
                type : "post",
                data : JSON.stringify({"custPh" : custPh}),
                contentType : "application/json",
                dataType : "json",
                success : function(result) {
                    if(result != 0){
                        alert("사용중인 전화번호 입니다.");
                        return false;
                    }else{
                        alert("사용가능한 전화번호 입니다.");
                    }
                },
                error : function(XHR, status, error) {
                    console.error(status + " : " + error);
                }

            });

        });

        $("#eMailCheck").on("click",function (){
            console.log("eMailCheck");

            var custeMailId = $("#input-eMail").val();
            var custeMailJu = $("#mailSelec").val();

            console.log(custeMailId);
            console.log(custeMailJu);

            var custEmail = custeMailId + custeMailJu;

            console.log(custEmail);

            $.ajax({
                url : "${pageContext.request.contextPath}/emailCheck",
                type : "post",
                data : JSON.stringify({"custEmail" : custEmail}),
                contentType : "application/json",
                dataType : "text",
                success : function(data) {
                    alert("인증번호 전송 했어.");
                    console.log(data+"datatata")

                },
                error : function(XHR, status, error) {
                    console.error(status + " : " + error);
                }

            });

        });

        //회원가입
        $("#joinBtn").on("click",function(){
            console.log("joinBtn")

            var custId = $("#input-id").val();
            var custPw = $("#input-pw").val();
            var custNm = $("#input-name").val();
            var custEmail = $("#input-eMail").val();
            var custPh = $("#input-ph").val();
            var custEmailT = $("#certification").val();

            userDto = {
                custId : custId,
                custPw : custPw,
                custNm : custNm,
                custEmail : custEmail,
                custPh : custPh
            }

            console.log(userDto)
            console.log(custEmailT + "custEmailT")
            if(custId == '' || custId == null){
                alert("아이디를 입력해 주세요.");
                return false;
            }else if(custPw == '' || custPw == null){
                alert("비밀번호를 입력해 주세요.");
                return false;
            }else if(custNm == '' || custNm == null){
                alert("이름을 입력해 주세요.");
                return false;
            }else if(custEmail == '' || custEmail == null){
                alert("이메일을 입력해 주세요.");
                return false;
            }else if(custEmailT == '' || custEmailT == null){
                alert("이메일 인증번호를 입력해 주세요.");
                return false;
            }else if(custPh == '' || custPh == null) {
                alert("전화번호를 입력해 주세요.");
                return false;
            }else{
                $.ajax({
                    url : "${pageContext.request.contextPath}/userInsert",
                    type : "post",
                    data : JSON.stringify(userDto),
                    contentType : "application/json",
                    dataType : "json",
                    success : function(userDto) {
                        alert("가입 되었습니다.");
                        window.location.href = "${pageContext.request.contextPath}/joinOk"

                    },
                    error : function(XHR, status, error) {
                        console.error(status + " : " + error);
                    }

                });
            }



        });
    </script>
</html>
