<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>경매장</title>

    <jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>

</head>
<body>

<header>
    <jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>

<main>
    <div class="d-flex flex-column min-vh-100 align-items-center">
        <div class="inner-page">
            경매장 화면 입니다.
        </div>
    </div>
</main>

<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
<%--
  Created by IntelliJ IDEA.
  User: lmj
  Date: 25. 2. 4.
  Time: 오후 2:15
  To change this template use File | Settings | File Templates.
--%>