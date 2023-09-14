<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<br>
<br>
<div id="footer">

</div>
<script>
    const date = new Date();
    console.log(date);
    console.log(date.getFullYear());
    const footer = document.getElementById("footer");
    const footer1 = document.querySelector("#footer");
    footer.innerHTML = "<p>&copy;  " + date.getFullYear() + "&nbsp; Pmiyouni All rights reserved. </p>";
</script>