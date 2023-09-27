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
<%@include file="component/header.jsp"%>
<%@include file="component/nav.jsp"%>
<div  class="row my-5 justify-content-center">
<div class="col-md-4">
 <h1 class="text-center mb-3">게시판 글쓰기</h1>
<div id="section">
    <form action="/board/save" method="post" class="card p-3" enctype="multipart/form-data">
        <div class="input-group my-2">
        <span class="input-group-text">제 &nbsp; &nbsp; &nbsp;목</span>
        <input type="text" class="form-control" name="boardTitle" > <br>
        </div>
     <div class="input-group my-2">
            <span class="input-group-text">작 &nbsp;성 &nbsp;자</span>
           <input type="text" class="form-control" name="boardWriter" value="${sessionScope.loginEmail}"><br>
            </div>
      <div class="input-group my-2">
              <span class="input-group-text">글 &nbsp;쓰 &nbsp;기</span>
           <textarea name="boardContents" class="form-control" cols="30" rows="10"></textarea> <br>
            </div>
     <div class="input-group my-2">
       <input type="file"  class="form-control" name="boardFile" multiple> <br>
       </div>
       <div class="input-group my-3">
              <input type="submit"  class="form-control btn btn-Success mb-3" value="작성">
              </div>
      </form>
</div>
</div>
</div>
<%@include file="component/footer.jsp"%>
</body>
</html>