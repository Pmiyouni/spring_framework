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
<%@include file="component/header.jsp"%>
<%@include file="component/nav.jsp"%>
<div id="section">
    <table>
        <tr>
            <th>id</th>
            <td>${board.id}</td>
        <tr>
            <th>writer</th>
            <td>${board.boardWriter}</td>
        </tr>
        <tr>
            <th>date</th>
            <td>${board.createdAt}</td>
        </tr>
        <tr>
            <th>hits</th>
            <td>${board.boardHits}</td>
        </tr>
        <tr>
            <th>title</th>
            <td>${board.boardTitle}</td>
        </tr>
        <tr>
            <th>contents</th>
            <td>${board.boardContents}</td>
        </tr>
        <c:if test="${board.fileAttached == 1}">
            <tr>
                <th>image</th>
                <td>
                    <c:forEach items="${boardFileList}" var="boardFile">
                        <img src="${pageContext.request.contextPath}/upload/${boardFile.storedFileName}"
                             alt="" width="100" height="100">
                    </c:forEach>
                </td>
            </tr>
        </c:if>
    </table>
    <br>
    <div class="text-center">
    <c:if test="${board.boardWriter == sessionScope.loginEmail}">

        <button onclick="board_update()">수정</button>
        <button onclick="board_delete()">삭제</button>
    </c:if>
    </div>
    <br>
    <div id="pass-check" style="display: none;">

        <input type="text" id="board-pass" placeholder="비밀번호 입력하세요">
        <input type="button" onclick="pass_check()" value="확인">
    </div>

    <div id="comment-write-area" class="text-center">
        <input type="hidden" id="member-id" value="${sessionScope.memberId}"><br>
        <input type="text" id="comment-writer" value="${sessionScope.loginEmail}"><br>
        <input type="text" id="comment-contents" placeholder="내용 입력"><br>

        <button onclick="comment_write()">댓글작성</button>
    </div>
    <div id="comment-list-area" class="text-center">
        <c:choose>
            <c:when test="${commentList == null}">
                <h3>작성된 댓글이 없습니다.</h3>
            </c:when>
            <c:otherwise>
                <table id="comment-list">
                    <tr>
                        <th>작성자</th>
                        <th>내용</th>
                        <th>작성시간</th>
                    </tr>
                    <c:forEach items="${commentList}" var="comment">
                        <tr>
                            <td>${comment.commentWriter}</td>
                            <td>${comment.commentContents}</td>
                            <td>${comment.createdAt}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>
<script>
    const comment_write = () => {
        const commentWriter = document.getElementById("comment-writer").value;
        const commentContents = document.querySelector("#comment-contents").value;
        const boardId = '${board.id}';
        const cId = document.getElementById("member-id").value;

        const result = document.getElementById("comment-list-area");

        $.ajax({
            type: "post",
            url: "/commnet/save",
            data: {
                commentWriter: commentWriter,
                commentContents: commentContents,
                boardId: boardId,
                cId: cId
            },
            success: function(res) {
                console.log("리턴값: ", res);
                let output = "<table id=\"comment-list\">\n" +
                    "    <tr>\n" +
                    "        <th>작성자</th>\n" +
                    "        <th>내용</th>\n" +
                    "        <th>작성시간</th>\n" +
                    "    </tr>\n";
                for (let i in res) {
                    output += "    <tr>\n";
                    output += "        <td>" + res[i].commentWriter + "</td>\n";
                    output += "        <td>" + res[i].commentContents + "</td>\n";
                    output += "        <td>" + res[i].createdAt + "</td>\n";
                    output += "    </tr>\n";
                }
                output += "</table>";
                result.innerHTML = output;
                document.getElementById("comment-writer").value = "";
                document.getElementById("comment-contents").value = "";
            },
            error: function () {
                console.log("댓글 작성 실패");
            }
        });
    }
    const board_list = () => {
        const page = '${page}';
        const q = '${q}';
        const type = '${type}';
        location.href = "/board/list?page=" + page + "&q=" + q + "&type=" + type;
    }
    const board_update = () => {
        const id = '${board.id}';
        location.href = "/board/update?id=" + id;
    }
    const board_delete = () =>{
        const id = '${board.id};
        location.href = "/board/delete?id=" + id;
    }



</script>
</html>