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
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/forms.css" type="text/css">

<style type="text/css">
.body-title {
	margin-top: 70px;
}

.tab {
	margin-top: 20px;
	font-size: 18px;
}

.tab a{
	display: inline-block;
	padding-left: 5px;
}

.tab a.active {
        font-weight: bold;
        color: #007bff;  
}

</style>


</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>
	
<main class="d-flex flex-column min-vh-100 align-items-center" style="padding-top: 66px;">
    <div class="container">
		<div class="body-title">
			<h3>
				<i class="bi bi-app"></i> 고객센터
			</h3>	
		</div>
		
		<div class="body-main">
			<div class="tab">
				<a href="${pageContext.request.contextPath}/help">자주묻는질문</a>
				<a class="active" href="${pageContext.request.contextPath}/chat">1:1채팅상담</a>
			</div>
			
			<div>
				<h2> 채팅창 </h2>
			</div>
			
		</div>
    </div>
</main>

<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>