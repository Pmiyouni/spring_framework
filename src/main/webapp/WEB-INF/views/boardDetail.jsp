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
<div class="container" >
    <div id="board-detail">
        <table class="table table-bordered">
            <tr> <td>번호</td> <td>${board.id}</td></tr>
            <tr> <td>작성자</td> <td>${board.boardWriter}</td></tr>
             <tr><td>글제목</td>  <td>${board.boardTitle}</td></tr>
            <tr><td>글내용</td> <td>${board.boardContents}</td></tr>
            <tr> <td>작성일시</td><td>${board.createdAt}</td></tr>
            <tr>  <td>조회수</td><td>${board.boardHits}</td></tr>

            <c:if test="${board.fileAttached == 1}">
            <tr>
                <th>image</th>
                <td>
                    <img src="${pageContext.request.contextPath}/upload/${boardFile.storedFileName}"
                         alt="" width="100" height="100">
                </td>
            </tr>
            </c:if>


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


            <div id="section">
                <form action="/comment/save" method="post">

                    &nbsp; &nbsp;    <input type="text" name="commentWriter" placeholder="작성자"> <br>
                    &nbsp; &nbsp;    <input type="text" name="commentContents" placeholder="내용"> <br>
                    &nbsp; &nbsp;    <textarea name="boardContents" col="30" rows="10"></textarea><br>
                    &nbsp; &nbsp; <button class="btn btn-info" onclick="commentWrite()">댓글 작성</button>
                </form>
            </div>


<div id="comment-list">
    <table>
        <tr>
            <th>댓글번호</th>
            <th>작성자</th>
            <th>내용</th>
            <th>작성시간</th>
        </tr>
        <c:forEach items="${commentList}" var="comment">
            <tr>
                <td>${comment.id}</td>
                <td>${comment.commentWriter}</td>
                <td>${comment.commentContents}</td>
                <td>${comment.commentCreatedTime}</td>
            </tr>
        </c:forEach>
    </table>
</div>
 </div>
</div>
<%@include file="component/footer.jsp" %>
</body>

<script>
    const update_fn = (id) => {
        location.href = "/board/update?id=" + id;
    }

    const delete_fn = (id) => {
        location.href = "/board/delete?id=" + id;
    }


    <%--const commentWrite() = () => {--%>
    <%--    const writer = document.getElementById("commentWriter").value;--%>
    <%--    const contents = document.getElementById("commentContents").value;--%>
    <%--    const board = '${board.id}';--%>
    <%--    $.ajax({--%>
    <%--        type: "post",--%>
    <%--        url: "/comment/save",--%>
    <%--        data: {--%>
    <%--            commentWriter: writer,--%>
    <%--            commentContents: contents,--%>
    <%--            boardId: board--%>
    <%--        },--%>
    <%--        dataType: "json",--%>
    <%--        success: function(commentList) {--%>
    <%--            console.log("작성완료");--%>
    <%--            console.log(commentList);--%>
    <%--            let output = "<table>";--%>
    <%--            output += "<tr><th>댓글번호</th>";--%>
    <%--            output += "<th>작성자</th>";--%>
    <%--            output += "<th>내용</th>";--%>
    <%--            output += "<th>작성시간</th></tr>";--%>
    <%--            for(let i in commentList){--%>
    <%--                output += "<tr>";--%>
    <%--                output += "<td>"+commentList[i].id+"</td>";--%>
    <%--                output += "<td>"+commentList[i].commentWriter+"</td>";--%>
    <%--                output += "<td>"+commentList[i].commentContents+"</td>";--%>
    <%--                output += "<td>"+commentList[i].commentCreatedDate+"</td>";--%>
    <%--                output += "</tr>";--%>
    <%--            }--%>
    <%--            output += "</table>";--%>
    <%--            document.getElementById('comment-list').innerHTML = output;--%>
    <%--            document.getElementById('commentWriter').value='';--%>
    <%--            document.getElementById('commentContents').value='';--%>
    <%--        },--%>
    <%--        error: function() {--%>
    <%--            console.log("아직 작성된 댓글이 없습니다");--%>
    <%--        }--%>
    <%--    });--%>
    <%--}--%>

</script>
</html>