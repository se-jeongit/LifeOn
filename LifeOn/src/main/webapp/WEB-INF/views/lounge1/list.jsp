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
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/photo.css" type="text/css">

<style type="text/css">
.box-two {
border: 1px solid #E6E6E6;
box-sizing: border-box;
box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.1);
}

.proerty-th .proerty-item .phlist img {
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
	
<main class="min-vh-100">

	<div class="body-container">
		<div class="body-content">
			
			<div class="main_content">
				<!-- 상단메뉴 -->
				<div class="main_menu">
					<div style="display: flex; justify-content: center; align-items: center; margin-bottom: 8px;">
					   	<p style="margin: 0;">총 게시글 ${dataCount}개 (${page} / ${total_page} 페이지)</p>
				   	</div>
					
					<div style="display: flex; justify-content: flex-end; align-items: center; margin-bottom: 8px;">
						<button class="btn" onclick="location.href='${pageContext.request.contextPath}/lounge1/${bdtype}/write';">글쓰기</button>
					</div>
				</div>
				
				<!-- 글리스트 -->
				<div class="row">
			    <div class="proerty-th">
				<c:forEach var="dto" items="${list}" varStatus="status">
			  	<div class="phlist">
				<div class="box-two proerty-item" onclick="location.href='${pageContext.request.contextPath}/${bdtype}/article?${query}&psnum=${dto.psnum}'">
						<h4 class="ph_subject">
						 	${dto.subject}
						</h4>
					        
				        <div class="ph_content">
							${dto.content}
				        </div>
				        
						<div class='ph_info'>
							<div>
								<span class='ph_userName'>${dto.nickname}</span>
								<span>&nbsp;·&nbsp;</span>
								<span>${dto.reg_date}</span>
							</div>
							<div>
								<i class="ph_icon bi bi-bookmark"></i>
								<span>${dto.boardLikeCount}&nbsp;&nbsp;</span>
								<i class="ph_icon bi bi-eye"></i>
								<span>${dto.hitCount}&nbsp;&nbsp;</span>
								<i class="ph_icon bi bi-chat-dots"></i>
								<span>${dto.replyCount}&nbsp;&nbsp;</span>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
				<div class="page-navigation">
					${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
				</div>
				
			</div>
			
			<aside class="sidebar">
				
				<div style="display: flex; align-items: center; margin: 0 20px;">
					<!-- 검색상자 -->
					<input type="search" class="input-group searchBox">
					
					<!-- 검색버튼 -->
				   	<button class="input-group btn mybtn">검색</button>
				</div>
			</aside>
		</div>
    </div>
 </div>
</main>

<script type="text/javascript">
/*
$(window).scroll(function() {
	$(".sidebar").css("margin-top",Math.max(-220,0-$(this).scrollTop()));
});
 */
</script>


<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>