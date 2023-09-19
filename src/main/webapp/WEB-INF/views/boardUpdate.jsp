<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div id="section">
    <form action="/board/update" method="post" name="updateForm" enctype="multipart/form-data">
        <input type="text" name="id" value="${board.id}"> <br>
        <input type="text" name="boardTitle" value="${board.boardTitle}" placeholder="제목을 입력하세요"> <br>
        <input type="text" name="boardWriter" value="${board.boardWriter}" placeholder="작성자를 입력하세요" readonly> <br>
        <textarea name="boardContents" cols="30" rows="10">${board.boardContents}</textarea> <br>
        <input type="file" name="boardFile" multiple> <br>
        <input type="submit" value="수정" >
    </form>
</div>
</body>

</html>
