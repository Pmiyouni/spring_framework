<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <%-- ajax를 위한 jquery cdn 삽입 --%>
    <style>
        #section {
            margin: auto;
        }
    </style>
</head>
<body>
<%@include file="component/header.jsp"%>
<%@include file="component/nav.jsp"%>
<div id="section">
    <form action="/board/save" method="post" enctype="multipart/form-data">

   &nbsp; &nbsp;    <input type="text" name="boardWriter" placeholder="작성자"> <br>
   &nbsp; &nbsp;    <input type="text" name="boardPass" placeholder="비밀번호"> <br>
   &nbsp; &nbsp;    <input type="text" name="boardTitle" placeholder="글제목"> <br>
   &nbsp; &nbsp;    <textarea name="boardContents" col="30" rows="10"></textarea><br>
        <input type="file" name="boardFile"> <br>
        <input type="submit" value="작성">
    </form>
</div>
<%@include file="component/footer.jsp"%>

</body>
</html>