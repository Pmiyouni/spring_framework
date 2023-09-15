<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="section">
    <form action="/board/update" method="post" name="updateForm">
        <input type="text" name="id" value="${board.id}"> <br>
        <input type="text" name="boardTitle" value="${board.boardTitle}" placeholder="제목을 입력하세요"> <br>
        <input type="text" name="boardWriter" value="${board.boardWriter}" placeholder="작성자를 입력하세요" readonly> <br>
        <textarea name="boardContents" cols="30" rows="10">${board.boardContents}</textarea> <br>
        <input type="submit" value="수정" >
    </form>
</div>
</body>

</html>
