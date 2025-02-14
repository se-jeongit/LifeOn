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
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/free.css" type="text/css">

</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/lounge2/layout/menu.jsp"/>
</header>
	
<main class="min-vh-100">
	<!-- 배너 -->
    <div class="body-title">
    	<h3 style="margin: 0px;">생활의 도움을 받아볼까?</h3>
	</div>
	
	<div class="body-container">
		<div class="body-content">
			<aside class="sidenav">
				<div class="leftBox">
					<p>❤️최신순❤️</p>
					<p>❤️조회순❤️</p>
					<p>❤️즐겨찾기순❤️</p>
				</div>
			</aside>
			
			<div class="main_content">
				<!-- 상단메뉴 -->
				<div class="main_menu">
					<div style="display: flex; justify-content: center; align-items: center; margin-bottom: 8px;">
					   	<p style="margin: 0;">총 게시글 ${dataCount}개 (${page} / ${total_page} 페이지)</p>
				   	</div>
					
					<div style="display: flex; justify-content: flex-end; align-items: center; margin-bottom: 8px;">
						<button class="btn" onclick="location.href='<c:url value='tip/write'/>'">글쓰기</button>
					</div>
				</div>
				
				<!-- 글리스트 -->
				<c:forEach var="dto" items="${list}" varStatus="status">
				<div class="tip_list">
			  		<div class="tip_container" onclick="location.href='<c:url value='${articleUrl}/${dto.psnum}?${query}'/>'">
						<h4 class="tip_subject">
						 	${dto.subject}
						</h4>
					        
				        <div class="tip_content">
							${dto.content}
				        </div>
				        
						<div class='tip_info'>
							<div>
								<span class='tip_userName'>${dto.nickname}</span>
								<span>&nbsp;·&nbsp;</span>
								<span>${dto.reg_date}</span>
							</div>
							<div>
								<i class="tip_icon bi bi-bookmark"></i>
								<span>${dto.boardLikeCount}&nbsp;&nbsp;</span>
								<i class="tip_icon bi bi-eye"></i>
								<span>${dto.hitCount}&nbsp;&nbsp;</span>
								<i class="tip_icon bi bi-chat-dots"></i>
								<span>${dto.replyCount}&nbsp;&nbsp;</span>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>

				<div class="page-navigation">
					${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
				</div>
				
			</div>
			
			<aside class="sidebar">
				<div class="rightBox">
					<p>❤️검색순위❤️</p>
					<button type="button" class="btn top_btn" onclick="location.href='<c:url value=''/>'">TOP</button>
				</div>
				<div style="display: flex; align-items: center; margin: 0 20px;">
					<!-- 검색상자 -->
					<input type="search" class="input-group searchBox">
					
					<!-- 검색버튼 -->
				   	<button class="input-group btn mybtn">검색</button>
				</div>
			</aside>
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