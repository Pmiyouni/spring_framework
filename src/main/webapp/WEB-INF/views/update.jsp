<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
     <h3>update.jsp</h3>
      <form action ="/update" method= "post">
           번호: ${student.id}<br>
           학번: ${student.studentNumber}<br>
           이름: ${student.studentName}<br>
           학과: ${student.studentMajor}<br>
           전화번호: ${student.studentMobile}<br>


                 수정할 학과는?<br>
                <input type="text" name="studentMajor"><br>
                수정할 전화번호는?<br>
                <input type="text" name="studentMobile"><br>
       <input type="submit" value="수정">
   </form>








     <!-- <form action ="/update" method= "post">
           수정할 아이디는?<br>
         <input type="text" name="id"><br>
         수정할 학과는?<br>
         <input type="text" name="studentMajor"><br>
         수정할 전화번호는?<br>
         <input type="text" name="studentMobile"><br>
          <input type="submit" value="수정">
     </form> -->







</body>
</html>
