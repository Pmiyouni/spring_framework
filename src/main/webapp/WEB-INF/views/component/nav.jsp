<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<br>
<div id="nav">
  <ul class="menu">
    <li class="menu-item">
      <a href="/">index</a>
    </li>
    <li class="menu-item">
      <a href="/member/save">회원가입</a>
    </li>

    <li class="menu-item">
     <c:if test="${sessionScope.loginEmail != null }">
     <a href="/board/list">글목록</a>
     </c:if>


    <li class="menu-item">
      <a href="/board/sampleData">샘플데이터</a>
    </li>

     <li class="menu-item">
      <c:choose>
                 <c:when test="${sessionScope.loginEmail == 'admin'}">
                      <a href="/member/members">관리자 화면</a>
                 </c:when>
                  <c:when test="${sessionScope.loginEmail != null}">
                    <a href="/member/mypage">My page</a>
                   </c:when>
             </c:choose>
     </li>

    <li class="menu-item" id="login-area">

    </li>
  </ul>
</div>
<script>
  const loginArea = document.getElementById("login-area");
  const loginEmail = '${sessionScope.loginEmail}';
  console.log(loginEmail.length);
  if (loginEmail.length != 0 ) {
      if (loginEmail == "admin"){
          loginArea.innerHTML ="<font color=yellow> 관리자 로그인중 </font>"+ "<a href='/member/logout'>logout</a>"
      }else {
         loginArea.innerHTML =  "<font color=yellow> loginEmail + 님 환영해요!   </font>"+
              "<a href='/member/logout'>  logout</a>"
      }
    } else {
    loginArea.innerHTML = "<a href='/member/login'>로그인</a>";
  }
</script>