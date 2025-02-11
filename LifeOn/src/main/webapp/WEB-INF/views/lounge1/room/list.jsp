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
.box-two {
border: 1px solid #E6E6E6;
box-sizing: border-box;
box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.1);
}

.proerty-th .proerty-item .item-thumb img {
    transition: all 0.2s linear 0s;
    display: block;
    position: relative;
    width: 100%;
    opacity: 0.7;
    min-height: 225px;
    max-height: 265px;
}

.pull-right {
     float: right; 
}
</style>

</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/lounge2/layout/menu.jsp"/>
</header>
	
<main class="d-flex flex-column min-vh-100 align-items-center" style="padding-top: 66px;">
    <div class="container">
		<button class="btn" onclick="location.href='${pageContext.request.contextPath}/lounge1/room/write';">글쓰기</button>
		            
		 <!-- property area -->
			<div class="row">
			    <div class="proerty-th">
			        <c:forEach var="post" items="${posts}">
			            <div class="col-sm-6 col-md-3 p0">
			                <div class="box-two proerty-item">
			                    <div class="item-thumb">
			                        <a href="postDetail?id=${post.id}">
			                            <img src="${pageContext.request.contextPath}/dist/images/room-test.jpg">
			                        </a>
			                    </div>
			                    <div class="item-entry overflow">
			                        <h5><a href="property-1.html">제목</a></h5>
			                        <div class="dot-hr"></div>
			                        <span class="pull-left">닉네임</span>
			                        <span class="pull-left2">좋아요</span>
			                        <span class="proerty-price pull-right">작성일</span>
			                        <span class="proerty-price pull-right2">조회수</span>
			                    </div>
			                </div>
			            </div>
			        </c:forEach>
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