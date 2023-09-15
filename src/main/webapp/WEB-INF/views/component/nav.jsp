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
      <a href="/board/list">글목록</a>
    </li>

    <li class="menu-item">
      <a href="/board/sampleData">샘플데이터</a>
    </li>


    <%-- 로그인 계정이 admin일 경우에만 회원목록 링크가 보임 --%>
    <c:if test="${sessionScope.loginEmail == 'admin'}">
      <a href="member/members">관리자 화면</a> <br>
    </c:if>

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
          loginArea.innerHTML = "관리자 로그인 중!   "+
                      "<a href='/member/logout'>logout</a>"
      }else {
         loginArea.innerHTML = "<a href='/mypage'>" + loginEmail + "님 환영해요!</a>" +
              "<a href='/member/logout'>logout</a>"
      }
    } else {
    loginArea.innerHTML = "<a href='/member/login'>로그인</a>";
  }
</script>