<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">

    <style>
        #section {
            margin: auto;
        }
    </style>
</head>
<body>
<%@include file="component/header.jsp" %>
<%@include file="component/nav.jsp" %>
<div id="section">
    <form action="/update" method="post" name="updateForm">
        <input type="hidden" name="id" value="${border.id}">
        <input type="text" name="boardPass" id="board-password" placeholder="비밀번호" > <br>
        <input type="text" name="boardWriter" value="${board.boardWriter}" placeholder="작성자" readonly> <br>
        <input type="text" name="boardTitle" value="${board.boardTitle}" placeholder="글제목" > <br>
        <textarea name="boardContents">  ${board.boardContents}></textarea><br>
        <input type="button" value="수정" onclick="update_fn()">
        <%--        <button onclick="fun1()">함수호출</button>  이렇게 버튼으로 하면 바로 써밋 되므로 주의할것 함수를 호출하려면 위의 방법으로 --%>
    </form>
</div>
<%@include file="component/footer.jsp" %>
</body>
<script>
    const update_fn = () => {
        const passInput = document.getElementById("board-password").value;
        const passDB = '${board.boardPass}';
        if (passInput == passDB) {
            document.updateForm.submit();
         <%-- 현재 문장의 폼태그이름(updateForm)을 써밋하라고 제어함--%>
        } else {
            alert("비밀번호가 일치하지 않습니다!");
        }
    }
</script>
</html>