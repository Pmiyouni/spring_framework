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
<div  class="row my-5 justify-content-center">
<div class="col-md-4">
 <h1 class="text-center mb-3">게시판 글수정</h1>
<div id="section">
    <form action="/board/update" method="post" name="updateForm" class="card p-3" enctype="multipart/form-data">
          <div class="input-group my-2">
                <input type="text" name="id" value="${board.id}"> <br>
                </div>
         <div class="input-group my-2">
                <input type="text" name="boardTitle" value="${board.boardTitle}" placeholder="제목을 입력하세요"> <br>
                         </div>
         <div class="input-group my-2">
      <input type="text" name="boardWriter" value="${board.boardWriter}" placeholder="작성자를 입력하세요" readonly> <br>
                               </div>
          <div class="input-group my-2">
        <textarea name="boardContents" cols="30" rows="10">${board.boardContents}</textarea> <br>
            </div>
      <div class="input-group my-2">
        <input type="file" name="boardFile" multiple> <br>
          </div>
          <div class="input-group my-2">
                <input type="submit" class="form-control btn btn-Success mb-3" value="수정" >
                    </div>

    </form>
</div>
</body>

</html>
