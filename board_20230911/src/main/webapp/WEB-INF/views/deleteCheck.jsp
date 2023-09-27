<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">

</head>
<body>
<%@include file="component/header.jsp"%>
<%@include file="component/nav.jsp"%>

<form action="/board/delete" method="post" name="deleteForm">
<button onclick="delete_fn()">삭제</button>

<div id="pass-check" style="display:none;">
    <input type="hidden" name="id" value="${board.id}" readonly>
    <input type="text" id="board-pass" placeholder="비밀번호 입력하세요"> <br>
    <input type="button" onclick="pass_check()" value="확인">
</div>
</form>
<%@include file="component/footer.jsp"%>

</body>
<script>

    const delete_fn = () => {
        const passArea = document.getElementById("board-pass");
        passArea.style.display = "block";
    }
    const pass_check = () =>{
    const inputPass = document.getElementById("board-pass").value;
    const passDB = '${board.boardPass}';
    const id = '${board.id}';
        if (inputPass == passDB) {
            document.deleteForm.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다!!");
        }
    }
</script>
</html>