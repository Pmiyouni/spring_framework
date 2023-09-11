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
<div class="container" text=>
    <div id="board-detail">
        <table class="table table-bordered">
            <tr> <td>번호</td> <td>${board.id}</td></tr>
            <tr> <td>작성자</td> <td>${board.boardWriter}</td></tr>
             <tr><td>글제목</td>  <td>${board.boardTitle}</td></tr>
            <tr><td>글내용</td> <td>${board.boardContents}</td></tr>
               <tr> <td>작성일시</td><td>${board.createdAt}</td></tr>
              <tr>  <td>조회수</td><td>${board.boardHits}</td></tr>
              <tr>  <td>첨부파일</td><td>${board.fileAttached}</td></tr>
             <tr>   <td>수정</td>
              <td>
                     <button class="btn btn-primary" onclick="update_fn('${board.id}')">수정</button>
              </td>
              </tr>
              <tr>    <td>삭제</td>
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