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
<h2 align="center">회원 리스트 </h2>
<div class="container">
    <div id="member-list">
        <table class="table table-bordered">
            <tr>
                <td>회원번호</td>
                <td>이메일</td>
                <td>이름</td>
                 <td>전화번호</td>
                <td>조회</td>
                 <td>삭제</td>
            </tr>
            <c:forEach items="${memberList}" var="member">
                <tr>
                    <td>${member.id}</td>
                    <td>${member.memberEmail}</td>
                    <td>${member.memberName}</td>
                    <td>${member.memberMobile}</td>
                    <td>
                    <button class="btn btn-info" onclick="detail_fn('${member.id}')">조회</button>
                     </td>
                    <td>
                        <button class="btn btn-danger" onclick="delete_fn('${member.id}')">삭제</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<%@include file="component/footer.jsp" %>
</body>
<script>
    const detail_fn = (id) => {
        location.href = "/member/member?id=" + id;
    }

    const delete_fn = (id) => {
        location.href = "/member/delete?id=" + id;
    }
</script>
</html>