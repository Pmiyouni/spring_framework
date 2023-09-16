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
<div id="section">
    <form action="/member/save" method="post" enctype="multipart/form-data">

        <input type="text" name="memberEmail" id="member-email" onkeyup="email_dup_check()" placeholder="이메일"> <br>
        <%-- onkeyup는 눌렀다 뗐을때, onblur는 포커스해제 즉 입력창을 벗어났을때 p 태그에 결과보여줌 --%>
        <p id="email-dup-check-result"></p>
        <input type="text" name="memberPassword" placeholder="비밀번호"> <br>
        <input type="text" name="memberName" placeholder="이름"> <br>
        <input type="text" name="memberMobile" placeholder="전화번호"> <br>
        <input type="file" name="memberProfile" multiple> <br>
        <input type="submit" value="회원가입">
    </form>
</div>
<br>
<%@include file="component/footer.jsp"%>
</body>
<script>
//이메일 입력값을 가져오고
//입력값을 서버로 전송하고 똑같은 이메일이 있는지 체크한 후
//사용 가능여부를 이메일 입력창 아래에 표시
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