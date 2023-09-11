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
    <div id="board-detail">
        <table class="table table-bordered">
            <tr>
                <td>번호</td>
                <td>작성자</td>
                <td>글제목</td>
                <td>글내용</td>
                <td>수정</td>
                <td>삭제</td>
            </tr>
            <tr>
                <td>${board.id}</td>
                <td>${board.boardWriter}</td>
                <td>${board.boardTitle}</td>
                <td>${board.boardContents}</td>
                <td>
                    <button class="btn btn-primary" onclick="update_fn('${board.id}')">수정</button>

                </td>
                <td>
                    <button class="btn btn-danger" onclick="delete_fn('${board.id}')">삭제</button>
                </td>
            </tr>
        </table>

    </div>
</div>

<%@include file="component/footer.jsp" %>
</body>
<script>
    const update_fn = (id) => {
        location.href = "/board/update?id=" + id;
    }

    const delete_fn = (id) => {
        location.href = "/board/delete?id=" + id ;
    }
</script>
</html>