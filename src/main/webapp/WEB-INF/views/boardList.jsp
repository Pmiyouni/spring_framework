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
                <form action="/board/search" class="search-form" method="get">
                    <select class="search-option" name="key">
                        <option value="boardTitle" selected>글제목</option>
                        <option value="boardContents" >글내용</option>
                        <option value="boardWriter" >작성자</option>
                    </select>

                    <input type="text" name="query" class="search-input" type="text" value="">
                    <input type="submit" class="search-button" value="검색">
                </form>
            </tr>
         <tr>
            <td>번호</td>
            <td>작성자</td>
            <td>글제목</td>
            <td>글내용</td>
            <td>작성일시</td>
            <td>조회수</td>
            <td>조회</td>

            <c:forEach items="${boardList}" var="board">
                <tr>
                    <td>${board.id}</td>
                    <td>${board.boardWriter}</td>
                    <td>${board.boardTitle}</td>
                   <td>${board.boardContents}</td>
                   <td>${board.createdAt}</td>
                    <td>${board.boardHits}</td>
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