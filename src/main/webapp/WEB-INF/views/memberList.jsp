<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        table {
            margin: auto;
        }
    </style>
</head>
<body>
<%@include file="component/header.jsp" %>
<%@include file="component/nav.jsp" %>
<div class="container">
    <div id="member-list">
        <table class="table table-bordered">
            <tr>
                <td>번호</td>
                <td>이메일</td>
                <td>이름</td>
                <td>전화번호</td>
                <td>프로필 사진</td>
                <td>수정</td>
                <td>삭제</td>
            </tr>
            <c:forEach items="${memberList}" var="member">
                <tr>
                    <td>${member.id}</td>
                    <td>${member.memberEmail}</td>
                    <td>${member.memberName}</td>
                    <td>${member.memberMobile}</td>
                    <td>${member.memberMobile}</td>

                    <td>
                        <button class="btn btn-info" onclick="detail_fn('${member.id}')">조회</button>
                        <a href="/member?id=${member.id}">수정/a>
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
        location.href = "/member?id=" + id;
    }

    const delete_fn = (id) => {
        location.href = "/delete?id=" + id;
    }
</script>
</html>