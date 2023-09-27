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
            .page-link{
            color: gray;
            }
        </style>
</head>
<body>
<%@include file="component/header.jsp"%>
<%@include file="component/nav.jsp"%>

 <div class="row my-5" d="section" >
        <div class="col">
        <h1 class="text-center mb-5"> 게시판 </h1>
    <br>

   <%-- 검색 창 --%>
       <div class="container" id="search-area">

           <form action="/board/list" method="get" class="col-4">
           <div class="input-group">
               <select class="form-select" name="type">
                   <option value="boardTitle">제목</option>
                   <option value="boardWriter">작성자</option>
               </select>
               <input type="text" class="form-control"   name="q" placeholder="검색어를 입력하세요">
        </div>
               <select  class="form-select" name="ord">
                   <option value="createdAt">작성일시(최근)순</option>
                   <option value="boardHits">높은조회수순</option>
               </select>

               <input type="submit" value="검색조회" class=" form-control btn btn-primary">
           </form>
       </div>
 </div>
  </div>
    <br>
    <div class="container" id="list">
        <table class="table table-striped table-hover text-center">
            <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일자</th>
                <th>조회수</th>
            </tr>
            <c:forEach items="${boardList}" var="board">
                <tr>
                    <td>${board.id}</td>
                    <td><a href="/board?id=${board.id}&page=${paging.page}&q=${q}&type=${type}&ord=${ord}">${board.boardTitle}</a></td>
                    <td>${board.boardWriter}</td>
                    <td>${board.createdAt}</td>
                    <td>${board.boardHits}</td>

                </tr>
            </c:forEach>
        </table>
    </div>


    <div class="text-center">
     <button class="btn btn-warning" onclick="board_save()">글 작성</button>
     </div>

        <br>
            <%-- 페이지 번호 출력 부분 --%>
    <div class="container">
        <ul class="pagination justify-content-center">
            <li class="page-item">
              <a class="page-link" href="/board/list?page=1&q=${q}&type=${type}&ord=${ord}">[처음]</a>
            </li>
            <c:choose>
                <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌 --%>
                <c:when test="${paging.page<=1}">
                    <li class="page-item disabled">
                        <a class="page-link">[이전]</a>
                    </li>
                </c:when>
                <%-- 1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청 --%>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/board/list?page=${paging.page-1}&q=${q}&type=${type}&ord=${ord}">[이전]</a>
                    </li>
                </c:otherwise>
            </c:choose>

            <%--  for(int i=startPage; i<=endPage; i++)      --%>
            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                <c:choose>
                    <%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 --%>
                    <c:when test="${i eq paging.page}">
                        <li class="page-item active">
                            <a class="page-link">${i}</a>
                        </li>
                    </c:when>

                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="/board/list?page=${i}&q=${q}&type=${type}&ord=${ord}">${i}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:choose>
                <c:when test="${paging.page>=paging.maxPage}">
                    <li class="page-item disabled">
                        <a class="page-link">[다음]</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/board/list?page=${paging.page+1}&q=${q}&type=${type}&ord=${ord}">[다음]</a>
                    </li>
                </c:otherwise>
            </c:choose>
             <li class="page-item">
                   <a class="page-link" href="/board/list?page=${paging.maxPage}&q=${q}&type=${type}&ord=${ord}">[마지막]</a>
              </li>
        </ul>
    </div>
</div>
</body>

<script>
    const board_save = () => {
        location.href = "/board/save";
    }
    const board_order = () => {
        const page = '${page}';
        const q = 'order';
        const type = '${type}';
        const  ord = '${ord}';
        location.href = "/board/list?page=" + page + "&q=" + q + "&type=" + type + "&ord=" + ord;
    }

</script>
</html>