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
    <form action="/board/update" method="post" name="updateForm">
        <input type="hidden" name="id" value="${border.id}" readonly>
        <input type="text" name="boardPass" id="board-password" placeholder="비밀번호" > <br>
        <input type="text" name="boardWriter" value="${board.boardWriter}"  readonly> <br>
        <input type="text" name="boardTitle" value="${board.boardTitle}"  > <br>
        <textarea name="boardContents" col="30" rows="10">  ${board.boardContents}></textarea><br>
        <input type="button" value="수정" onclick="update_fn()">

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
        } else {
            alert("비밀번호가 일치하지 않습니다!");
        }
    }
</script>
</html>