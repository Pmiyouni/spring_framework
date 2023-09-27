<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<br>
<br>
<div class="row">
    <div class="col">
        <hr>
        <div id="footer" class="row my-5 text-center">

        </div>
    </div>
</div>
<script>
    const date = new Date();
    console.log(date);
    console.log(date.getFullYear());
    const footer = document.getElementById("footer");
    const footer1 = document.querySelector("#footer");
    footer.innerHTML = "<p>&copy;  " + date.getFullYear() + "&nbsp; 인천일보아카데미  Pmiyouni All rights reserved. </p>";
</script>