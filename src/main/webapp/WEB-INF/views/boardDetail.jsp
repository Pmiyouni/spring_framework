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

<div class="row" id="section">
<div class="col">

	<h1 class="text-center">게시글 조회</h1>

	<br>
    <table  class="table table-striped" style="width:50%">
        <tr>
            <th>번호</th>
            <td>${board.id}</td>
        <tr>
            <th>작성자</th>
            <td>${board.boardWriter}</td>
        </tr>
        <tr>
            <th>작성일시</th>
            <td>${board.createdAt}</td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${board.boardHits}</td>
        </tr>
        <tr>
            <th>글제목</th>
            <td>${board.boardTitle}</td>
        </tr>
        <tr>
            <th>글내용</th>
            <td>${board.boardContents}</td>
        </tr>
        <c:if test="${board.fileAttached == 1}">
            <tr>
                <th>첨부파일</th>
                <td>
                    <c:forEach items="${boardFileList}" var="boardFile">
                        <img src="${pageContext.request.contextPath}/upload/${boardFile.storedFileName}"
                             alt="" width="100" height="100">
                    </c:forEach>
                </td>
            </tr>
        </c:if>
    </table>
    <div class="row">
    <div class="col text-end"  style=" height: auto; width: 300px;">
        <button  class="btn btn-outline-info" id="count"> 좋아요!! 클릭</button>
        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" id="like" class="bi bi-emoji-heart-eyes-fill" viewBox="0 0 16 16">
                <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zM4.756 4.566c.763-1.424 4.02-.12.952 3.434-4.496-1.596-2.35-4.298-.952-3.434zm6.559 5.448a.5.5 0 0 1 .548.736A4.498
                4.498 0 0 1 7.965 13a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .548-.736h.005l.017.005.067.015.252.055c.215.046.515.108.857.169.693.124
                1.522.242 2.152.242.63 0 1.46-.118 2.152-.242a26.58 26.58 0 0 0 1.109-.224l.067-.015.017-.004.005-.002zm-.07-5.448c1.397-.864 3.543 1.838-.953 3.434-3.067-3.554.19-4.858.952-3.434z"/>
            </svg>
    	<span id="fcnt-result">  </span>
   	</div>
        <div class="col text-start"  style=" height: auto; width: 300px;">
            <button  class="btn btn-outline-warning" id="count2"> 싫어요!! 클릭</button>
          <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" id="notlike" class="bi bi-emoji-frown-fill" viewBox="0 0 16 16">
              <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm-2.715 5.933a.5.5 0 0 1-.183-.683A4.498 4.498
               0 0 1 8 9.5a4.5 4.5 0 0 1 3.898 2.25.5.5 0 0 1-.866.5A3.498 3.498 0 0 0 8 10.5a3.498 3.498 0 0 0-3.032 1.75.5.5 0 0 1-.683.183zM10 8c-.552 0-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5S10.552 8 10 8z"/>
          </svg>
            <span id="ncnt-result"> </span>
        </div>
    <br>
    <br>
    <div class="text-center">
    <c:if test="${board.boardWriter == sessionScope.loginEmail}">
        <button  class="btn btn-primary" onclick="board_update()">수정</button>
        <button  class="btn btn-danger"  onclick="board_delete()">삭제</button>
    </c:if>

    <c:if test="${sessionScope.loginEmail == 'admin'}">
        <button onclick="board_delete()">삭제</button>
    </div>
    </c:if>
    <br>
    <div id="comment-write-area" class="text-center">
        <input type="hidden" id="member-id" value="${sessionScope.memberId}"><br>
        <input type="text" id="comment-writer" size="30"  value="${sessionScope.loginEmail}"><br>
        <input type="text" id="comment-contents" size="30" placeholder="내용 입력"><br>
         <button class="btn btn-primary" onclick="comment_write()">댓글작성</button>
    </div>

    <div id="comment-list-area" class="text-center mt-5">
        <c:choose>
            <c:when test="${commentList == null}">
              <br>  <h4>작성된 댓글이 없습니다.</h4>
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
                            <td>${comment.createAt}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</div>
</div>
</body>
<script>
        const comment_write = () => {
        const commentWriter = document.getElementById("comment-writer").value;
        const commentContents = document.querySelector("#comment-contents").value;
        const boardId = '${board.id}';
        const cid = document.getElementById("member-id").value;

        const result = document.getElementById("comment-list-area");

        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                commentWriter: commentWriter,
                commentContents: commentContents,
                boardId: boardId,
                cid: cid
            },
            success: function(res) {
                console.log("리턴값: ", res);
                let output = "<table  id=\"comment-list\">\n" +
                    "    <tr>\n" +
                    "        <th>작성자</th>\n" +
                    "        <th>내용</th>\n" +
                    "        <th>작성시간</th>\n" +
                    "    </tr>\n";
                for (let i in res) {
                    output += "    <tr>\n";
                    output += "        <td>" + res[i].commentWriter + "</td>\n";
                    output += "        <td>" + res[i].commentContents + "</td>\n";
                    output += "        <td>" + res[i].createAt + "</td>\n";
                    output += "    </tr>\n";
                }
                output += "</table>";
                result.innerHTML = output;
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
        const id = '${board.id}';
        location.href = "/board/delete?id=" + id;
    }


    //좋아요 추가
        $("#count").on("click",  function(){

            const fid = '${board.id}'
            const result = document.getElementById("fcnt-result");
            if(confirm("좋아요! 추가하실래요?")){
                $.ajax({
                    type:"get",
                    url:"/favorite/like",
                    data:{
                        fid : fid
                    },
                    success:function(data){
                        if(data.ckcnt !== 1) {
                            alert("좋아요 중복체크 불가")
                        }
                            result.innerHTML = data.fcnt;
                    }
                });
            }
        });


        //싫어요 추가
    $("#count2").on("click", function(){
         const nid = '${board.id}';
        const result = document.getElementById("ncnt-result");
		if(confirm("싫어요! 추가하실래요?")){
		$.ajax({
        					type:"get",
        					url:"/favorite/notlike",
        					data:{
        					nid : nid
        					},
        					success:function(data){
        						if(data.ckcnt2 !== 1) {
                                    alert("싫어요 중복체크 불가");
                                }
                                    result.innerHTML = data.ncnt;
                                }
        				});
        			}
        	});
</script>
</html>