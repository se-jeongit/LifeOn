<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LifeOn</title>

<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu3.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/menu2.js"></script>

</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>
	
<main class="d-flex flex-column min-vh-100" style="padding-top: 84px;">
	<jsp:include page="/WEB-INF/views/mypage/left.jsp"/>
    <div class="wrapper">
   	<!-- 메뉴 토글 사용 시 -->
   	<!--
		<button type="button" id="toggleMenu" class="toggle_menu">
			<i class="bi bi-person-lines-fill"></i>
		</button>
	-->
			마이페이지

    </div>
</main>

<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>