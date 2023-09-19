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
<%@include file="component/nav.jsp"%>
        <div class="row my-5">
                <div class="col">
                <h1 class="text-center mb-5">회원 리스트</h1>
                <div class="row">
                <form action="/member/list" method="get" name="frm" class="col-6 col-lg-3 col-md-4">
                <div class="input-group">
                <select class="form-select" name="type">
                <option value="id">회원번호</option>
                <option value="memberName" selected>회원이름</option>
                <option value="memberEmail">회원이메일</option>
                <option value="memberMobile">전화번호</option>
                <option value="mstatus">탈퇴여부</option>
                </select>&nbsp;
                <input type="text" name="q" placeholder="검색어를 입력하세요">
                <input type="submit" value="검색" class="btn btn-primary">
                </div>
                </form>
        </div>
        </div>
        </div>

<div class="container">
    <div id="member-list">
        <table class="table table-bordered text-center mb-5" >
            <tr>
                <td>회원번호</td>
                <td>이메일</td>
                <td>이름</td>
                 <td>전화번호</td>
                <td>비고</td>
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
                        <c:if test="${member.mstatus == 1}">
                            탈퇴회원
                        </c:if>
                    </td>

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
<%-- 페이지 번호 출력 부분 --%>
<div class="container">
    <ul class="pagination justify-content-center">
        <li class="page-item">
            <a class="page-link" href="/member/list?page=1&q=${q}&type=${type}">[처음]</a>
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
                    <a class="page-link" href="/member/list?page=${paging.page-1}&q=${q}&type=${type}">[이전]</a>
                </li>
            </c:otherwise>
        </c:choose>


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
                        <a class="page-link" href="/member/list?page=${i}&q=${q}&type=${type}">${i}</a>
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
                    <a class="page-link" href="/member/list?page=${paging.page+1}&q=${q}&type=${type}">[다음]</a>
                </li>
            </c:otherwise>
        </c:choose>
        <li class="page-item">
            <a class="page-link" href="/member/list?page=${paging.maxPage}&q=${q}&type=${type}">[마지막]</a>
        </li>
    </ul>
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