<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>list.jsp</h2>
    <table>
    <tr>
        <td>id</td>
        <td>학번</td>
        <td>이름</td>
        <td>학과</td>
        <td>전화번호</td>
        <td>수정</td>
        <td>삭제</td>
    </tr>
    <c:forEach items="${studentList}" var="student">
    <tr>
        <td>
            <a href="/detail?id=${student.id}">${student.id}</a>
        </td>
        <td>${student.studentNumber}</td>
        <td>${student.studentName}</td>
        <td>${student.studentMajor}</td>
        <td>${student.studentMobile}</td>
        <!-- 수정, 삭제 버튼을 클릭하면 각각 /update, /delete 주소를 요청하면서 id값을
            StudentController로 보냄(javascript 함수 정의해야 함)
            수정버튼을 클릭하면 update.jsp화면으로 이동하며, 기존 등록한 학생의 정보가 input 태그에
            작성되어 있으며, 학번, 이름은 수정이 불가능하고, 학과, 전화번호만 수정할 수 있음.
            학과, 전화번호를 수정할 값으로 입력 후 버튼을 클릭하면 수정처리를 진행함.

            삭제버튼을 클릭하면 DB에서 해당 학생에 대한 삭제 처리를 진행하고 삭제처리가 끝나면
            index.jsp를 출력함.
        -->
        <td>
            <button onclick="update_fn('${student.id}')">수정</button>
        </td>
        <td>
            <button onclick="delete_fn('${student.id}')">삭제</button>
        </td>
    </tr>
    </c:forEach>
    </table>
</body>
<script>
    const update_fn = (id) => {
        location.href="/update?id="+id;
    }

    const delete_fn = (id) => {
        location.href="/delete?id="+id;
    }
</script>
</html>