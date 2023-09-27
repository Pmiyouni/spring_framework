<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

</head>
<body>
<%@include file="component/header.jsp"%>
<%@include file="component/nav.jsp"%>
<div  class="row my-5 justify-content-center">
<div class="col-md-4">
 <h1 class="text-center mb-3">로그인</h1>
 <div id="section">
<form action="/member/login" method="post" class="card p-3">
<div class="input-group my-2">
        <span class="input-group-text">이메일 &nbsp;</span>
       <input type="text" name="memberEmail"> <br>
        </div>
<div class="input-group my-2">
        <span class="input-group-text">비밀번호</span>
        <input type="text" maxlangth="16" name="memberPassword"> <br>
        </div>
<div class="input-group my-2">
          <input type="submit" value="로그인" class="form-control btn btn-Success mb-3">
                </div>
</form>
 </div>
  </div>
 </div>
<%@include file="component/footer.jsp"%>

</body>
</html>