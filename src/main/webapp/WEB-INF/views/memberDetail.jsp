<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
        table {
            margin: auto;
        }
    </style>
</head>
<body>
<%@include file="component/header.jsp" %>
<%@include file="component/nav.jsp" %>
<h2 class="text-center">회원 상세 조회 </h2>
<div class="container">
    <div id="member-detail">
        <table class="table table-bordered table-info">
            <tr>
                <td>회원번호</td>
                <td>이메일</td>
                <td>비밀번호</td>
                <td>이름</td>
                <td>전화번호</td>
                <td>프로필 사진</td>
            </tr>
            <tr>
                <td>${member.id}</td>
                <td>${member.memberEmail}</td>
                <td>${member.memberPassword}</td>
                <td>${member.memberName}</td>
                <td>${member.memberMobile}</td>

                <td>
                 <img src="${pageContext.request.contextPath}/upload1/${proFile.storedFileName}"
                   alt="" width="100" height="100">
                  </td>
            </tr>
        </table>
        <c:if test="${sessionScope.loginEmail == 'admin'}">
        <a href="/member/members">목록으로 돌아가기</a>
        </c:if>
    </div>
</div>
<br>
<%@include file="component/footer.jsp" %>
</body>
</html>