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
    <div id="board-list">
        <table class="table table-bordered">
            <tr>
                <td>번호</td>
                <td>작성자</td>
                <td>글제목</td>
                <td>글내용</td>
                <td>조회</td>

            </tr>
            <c:forEach items="${boardList}" var="board">
                <tr>
                    <td>${board.id}</td>
                    <td>${board.boardWriter}</td>
                    <td>${board.boardTitle}</td>
                    <td>${board.boardContents}</td>
                    <td>
                        <button class="btn btn-info" onclick="detail_fn('${board.id}')">조회</button>

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
        location.href = "/board?id=" + id;
    }
</script>
</html>