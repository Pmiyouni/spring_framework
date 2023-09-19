<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <style>
        #section {
            margin: auto;
        }
    </style>
</head>
<body>
<%@include file="component/header.jsp" %>
<%@include file="component/nav.jsp" %>
<div  class="row my-5 justify-content-center">
<div class="col-md-4">
 <h1 class="text-center mb-3">회원 수정</h1>
 <div id="section">
    <form action="/member/mypage" method="post" name="updateForm" class="card p-3">
     <input type="hidden" name="id" value="${member.id}">
    <div class="input-group my-2">
            <span class="input-group-text">이메일 &nbsp;</span>
         <input class="form-control" type="text" name="memberEmail" value="${member.memberEmail}" placeholder="이메일"
                        readonly> <br>
            </div>
  <div class="input-group my-2">
             <span class="input-group-text">비밀번호</span>
         <input type="text" name="memberPassword" id="member-password" placeholder="비밀번호"> <br>
             </div>
             <div class="input-group my-2">
             <span class="input-group-text">이 &nbsp;  &nbsp; 름</span>
         <input type="text" name="memberName" value="${member.memberName}" placeholder="이름"> <br>
          </div>
            <div class="input-group my-2">
                 <span class="input-group-text">전화번호</span>
             <input type="text" name="memberMobile" value="${member.memberMobile}" placeholder="전화번호"><br>
              </div>

        <input type="button" class="btn btn-primary mb-3" value="수정" onclick="update_fn()">
    </form>

    <input type="button" class=" btn btn-danger mb-3" value="회원탈퇴하기" onclick="deleteId_fn()">
</div>
<br>
<%@include file="component/footer.jsp" %>
</body>
<script>
    const update_fn = () => {
        const passInput = document.getElementById("member-password").value;
        const passDB = '${member.memberPassword}';
        if (passInput == passDB) {
            document.updateForm.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다!");
        }
    }
    const deleteId_fn = () => {
        const passInput = document.getElementById("member-password").value;
        const passDB = '${member.memberPassword}';
        if (passInput == passDB) {
            if(window.confirm("탈퇴하시겠습니까?")){
                const id = '${member.id}';
                location.href ="/member/remove?id=" + id;
            }
        } else {
            alert("비밀번호가 일치하지 않습니다!");
        }
    }



</script>
</html>