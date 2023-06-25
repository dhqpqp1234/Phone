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
      <c:import url="/WEB-INF/views/includes/adminHeader.jsp"></c:import>
      <!-- header -->
      <br>

      <!-- nav -->
      <c:import url="/WEB-INF/views/includes/adminNav.jsp"></c:import>
      <!-- nev -->
      <!-- Title -->
      <h1 id="log-title">관리자 회원가입</h1>
      <!-- Title -->
      <!-- join content -->
      <div class="layer_fix layer_unfix pop_login pop_mem_reserve" id="join-content">
        <section id="login-input">
            <div class="join-id">
              <!-- focus / err -->
              <label class="join-label">아이디</label>
              <input type="text" id="input-id" name="buyerId" placeholder="아이디를 입력해 주세요." onfocus="this.placeholder = ''"
                     onblur="this.placeholder='아이디를 입력해 주세요.'">
              <button type="button" class="reset_val" id="adminIdCheck" style='cursor:pointer;'>중복체크</button>
            </div>
            <div class="join-pw">
              <label class="join-label">비밀번호</label>
              <input type="password" id="input-pw" name="buyerPw" placeholder="비밀번호를 입력해 주세요." onfocus="this.placeholder = ''"
                     onblur="this.placeholder='비밀번호를 입력해 주세요.'">
            </div>
            <div class="join-name">
              <label class="join-label">이름</label>
              <input type="text" id="input-name" name="buyerNm" placeholder="이름을 입력해 주세요." onfocus="this.placeholder = ''"
                     onblur="this.placeholder='이름을 입력해 주세요.'">
            </div>
            <div class="join-eMail">
              <label class="join-label">이메일</label>
              <input type="text" name="buyerEmail" id="input-eMail" placeholder="이메일를 입력해 주세요."
                     onfocus="this.placeholder = ''" onblur="this.placeholder='이메일을 입력해 주세요.'">
                <button type="button" id="emailOk" style='cursor:pointer;'>인증번호 확인</button>
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
              <input type="text" name="buyerPh" id="input-ph" placeholder="전화번호를 입력해 주세요." onfocus="this.placeholder = ''"
                     onblur="this.placeholder='전화번호를 입력해 주세요.'">
              <button type="button" id="phCheck" class="reset_val" style='cursor:pointer;'>본인인증</button>
                <input type="text" id="input-phOk" placeholder="인증번호를 입력해 주세요." onfocus="this.placeholder = ''"
                       onblur="this.placeholder='인증번호를 입력해 주세요.'">
              <button type="button" id="phCheckOk" class="reset_val" style='cursor:pointer;'>인증번호 확인</button>
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


        $("#adminIdCheck").on("click",function (){
            console.log("managerIdCheck")

            var buyerId = $("#input-id").val();

            console.log(buyerId + "buyerId")

            $.ajax({
                url : "${pageContext.request.contextPath}/adminIdCheck",
                type : "post",
                data : JSON.stringify({"buyerId" : buyerId}),
                contentType : "application/json",
                dataType : "text",
                success : function(result) {
                    if(result != 0){
                        alert("사용중인 ID입니다.")
                    }else{
                        alert("사용가능한 ID입니다.")
                    }

                },
                error : function(XHR, status, error) {
                    console.error(status + " : " + error);
                }
            });
        });

        // eMail인증
        $("#eMailCheck").on("click",function (){
            console.log("이메일인증 버튼")
            var buyerEmailId = $("#input-eMail").val();
            var emailJu = $("#mailSelec").val();

            console.log("buyerEmailId" + buyerEmailId)
            console.log("emailJu" + emailJu)

            var buyerEmail = buyerEmailId + emailJu;

            console.log("buyerEmail" + buyerEmail)

            $.ajax({
                url : "${pageContext.request.contextPath}/adminEmailCheck",
                type : "post",
                data : JSON.stringify({"buyerEmail" : buyerEmail}),
                async:false,
                contentType : "application/json",
                dataType : "text",
                success : function(data) {
                    alert("인증번호가 발송 되었습니다.")
                    da = data;
                },
                error : function(XHR, status, error) {
                    console.error(status + " : " + error);
                }
            });

        });

        //이메일 인증번호 확인
        $("#emailOk").on("click",function (){

            var emailData = $("#certification").val();

            if(emailData != da){
                alert("인증번호를 확인해주세요.")
                return false;
            }else{
                alert("인증 확인 되었습니다.")
            }
            console.log("이메일 인증확인" + da);
        });

        //전화번호 인증
        $("#phCheck").on("click",function (){
            console.log("전화번호 인증")

            var buyerPh = $("#input-ph").val();

            console.log("ph" + buyerPh)

            $.ajax({
                url : "${pageContext.request.contextPath}/adminPhCheck",
                type : "post",
                data : JSON.stringify({"buyerPh" : buyerPh}),
                async:false,
                contentType : "application/json",
                dataType : "text",
                success : function(phData) {
                    alert("인증번호 전송")
                    phoneNum = phData;
                },
                error : function(XHR, status, error) {
                    console.error(status + " : " + error);
                }
            });

        });

        $("#phCheckOk").on("click",function (){
            console.log("인증번호 확인창");
            var phNumOk = $("#input-phOk").val();
            console.log(phNumOk);

            if(phNumOk != phoneNum){
                alert("인증번호를 확인 해주세요.")
                return false;
            }else{
                alert("인증 되었습니다.")
            }

        });

        $("#joinBtn").on("click",function (){
            console.log("가입버튼")
            var buyerId = $("#input-id").val();
            var buyerPw = $("#input-pw").val();
            var buyerNm = $("#input-name").val();
            var buyerEmailId = $("#input-eMail").val();
            var emailJu = $("#mailSelec").val();
            var buyerEmail = buyerEmailId + emailJu;
            var buyerPh = $("#input-ph").val();
            var phNumOk = $("#input-phOk").val();
            var emailData = $("#certification").val();

            var adminDto = {
                buyerId : buyerId,
                buyerPw : buyerId,
                buyerNm : buyerNm,
                buyerEmail : buyerEmail,
                buyerPh: buyerPh
            }

            console.log(adminDto);

            if(buyerId == null || buyerId == ''){
                alert("아이디를 입력해 주세요.")
                return false;
            }else if(buyerPw == null || buyerPw == ''){
                alert("비밀번호를 입력해 주세요.")
                return false;
            }else if(buyerNm == null || buyerNm == ''){
                alert("이름을 입력해 주세요.")
                return false;
            }else if(buyerEmailId == null || buyerEmailId == ''){
                alert("이메일을 입력해 주세요.")
                return false;
            }else if(buyerPh == null || buyerPh == ''){
                alert("전화번호를 입력해 주세요.")
                return false;
            }else if(phNumOk == null || phNumOk == ''){
                alert("휴대폰 인증번호를 입력해 주세요.")
                return false;
            }else if(emailData == '' || emailData == null){
                alert("이메일 인증번호를 입력해 주세요.")
                return false;
            }else if(phNumOk != phoneNum){
                alert("휴대폰 인증번호를 확인해주세요.")
                return false;
            }else if(emailData != da){
                alert("이메일 인증번호를 확인해주세요.")
                return false;
            }else{

                $.ajax({
                    url : "${pageContext.request.contextPath}/adminInsert",
                    type : "post",
                    data : JSON.stringify(adminDto),
                    contentType : "application/json",
                    dataType : "text",
                    success : function(count) {
                        alert("회원가입 되었습니다.")
                        window.location.href="${pageContext.request.contextPath}/admin"

                    },
                    error : function(XHR, status, error) {
                        console.error(status + " : " + error);
                    }
                });

            }

        });
    </script>
</html>
