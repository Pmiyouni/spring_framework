<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
     <h1>save.jsp</h1>
     <form action ="/save" method= "post">
         학번: <input type="text" name="studentNumber"><br>
         이름: <input type="text" name="studentName"><br>
         학과: <input type="text" name="studentMajor"><br>
         전화번호: <input type="text" name="studentMobile"><br>
         <input type="submit" value="등록">
     </form>
</body>
</html>
