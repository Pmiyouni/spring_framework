<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
        #section {
            margin: auto;
        }
    </style>
</head>
<body>
<%@include file="component/header.jsp" %>
<%@include file="component/nav.jsp" %>
<div id="section" class="row my-5 justify-content-center">
    <div class="col-md-4">
        <h1 class="text-center mb-3">회원가입</h1>

        <form  action="/member/save" method="post" enctype="multipart/form-data" class="card p-3">

            <div class="input-group my-2">
                <span class="input-group-text">이 &nbsp;메 &nbsp;일</span>
                <input type="text" class="form-control" name="memberEmail" id="member-email" onkeyup="email_dup_check()" > <br>
            </div>
            <p id="email-dup-check-result"></p>

            <div class="input-group my-2">
                <span class="input-group-text">비밀번호&nbsp;</span>
                <input type="text" class="form-control" name="memberPassword" id="password"
                placeholder="영문,숫자,특수문자 조합하여 8자~16자" maxlength="16" onkeyup="pass_check()">
            </div>
            <p id="password-check-result"></p>

            <div class="input-group my-2">
                <span class="input-group-text">이 &nbsp; &nbsp; &nbsp; 름</span>
                <input type="text" class="form-control" name="memberName">
            </div>
            <div class="input-group my-2">
                <span class="input-group-text">전화번호&nbsp;</span>
                <input type="text" class="form-control" name="memberMobile" id="m_phoneNum"
                       placeholder="ooo-oooo-oooo 형식으로 입력하세요"  onkeyup="mobile_check()">
            </div>
            <p id="mobile-check-result"></p>


            <div class="input-group my-2">
                <span class="input-group-text">프로필사진</span><br>
                <input type="file" name="memberProfile" multiple>
            </div>
            <div class="text-center mt-3">
                <input type="submit" class="btn btn-primary" value="회원가입">
            </div>
        </form>
    </div>
    <br>
    <%@include file="component/footer.jsp"%>
</body>
<script>
    const pass_check = () => {
        const pwdCheck= /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
        const password = document.getElementById("password").value;
        const result = document.getElementById("password-check-result");


        if (password == ""){
            result.innerHTML = "필수정보예요.";
            result.style.color = "green";
            result.style.fontSize = "14px";
            password.focus();
            return false;
        }
        else if (!pwdCheck.test(password)) {
            result.innerHTML = "비밀번호는 영문+숫자+특수문자 조합하여 8~16자리를 사용해야 합니다";
            result.style.color = "red"
            result.style.fontSize = "14px";
            password.focus();
            return false;
        }else {
            result.innerHTML = "안전한 비밀번호 입니다.입력가능합니다";
            result.style.color = "blue";
            result.style.fontSize = "14px";
            return true;
        }
    }
    const mobile_check = () => {
        const mobileCheck =/^\d{3}-?\d{3,4}-?\d{4}$/;
        const m_phoneNum = document.getElementById("m_phoneNum").value;
        const result = document.getElementById("mobile-check-result");


        if (m_phoneNum == ""){
            result.innerHTML = "필수정보예요.";
            result.style.color = "green";
            result.style.fontSize = "14px";
            m_phoneNum.focus();
            return false;
        }
        else if (!mobileCheck.test(m_phoneNum)) {
            result.innerHTML = "올바른 휴대전화 형식이 아닙니다";
            result.style.color = "red";
            result.style.fontSize = "14px";
            m_phoneNum.focus();
            return false;
        }else {
            result.innerHTML = "입력가능합니다";
            result.style.color = "blue";
            result.style.fontSize = "14px";
            return true;
        }
    }

    const email_dup_check = () => {
        const email = document.getElementById("member-email").value;
        const result = document.getElementById("email-dup-check-result");
        $.ajax({
            type: "post",
            url: "/member/duplicate-check",
            data: {
                memberEmail: email
            },
            success: function () {
                result.innerHTML = "사용가능한 이메일입니다.";
                result.style.color = "green";
            },
            error: function () {
                result.innerHTML = "이미 사용 중인 이메일입니다.";
                result.style.color = "red";
            }
        });
    }
</script>
</html>