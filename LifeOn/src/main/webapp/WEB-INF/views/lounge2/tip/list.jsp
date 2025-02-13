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
				</div>
			</aside>
			
			<div class="main_content">
				<!-- 상단메뉴 -->
					<div class="main_menu">
						<div style="display: flex; justify-content: center; align-items: center; margin-bottom: 8px;">
						   	<p style="margin: 0;">총 게시글 1개 (1 / 1 페이지)</p>
					   	</div>
						
						<div style="display: flex; align-items: center;">
							<div style="display: flex; justify-content: flex-end; align-items: center; margin-bottom: 8px;">
								<!-- 검색옵션 -->
							    <select class="input-group selectSearch">
									<option value="all" selected>전체</option>
									<option value="subjcet" >제목</option>
									<option value="content" >내용</option>
									<option value="nickname" >작성자</option>
									<option value="reg_date" >등록일</option>
							    </select>
						    
								<!-- 검색상자 -->
								<input type="search" class="input-group searchBox">
								
								<!-- 검색버튼 -->
							   	<button class="input-group btn mybtn">검색</button>
							   	<button class="btn" onclick="location.href='<c:url value='tip/write'/>'">글쓰기</button>
				   			</div>
						</div>
					</div>
				
					<!-- 글리스트 -->
					<div class="tip_list">
				  		<div class="tip_container" onclick="location.href='<c:url value='${articleUrl}/${dto.num}?${query}'/>'">
							<h4 class="tip_subject">
							 	${dto.subject}
							</h4>
						        
					        <p class="tip_content">
								${dto.content}
					        </p>
						        
							<div class='tip_info'>
								<div>
									<span class='tip_userName'>관리자</span>
									<span>&nbsp;·&nbsp;</span>
									<span>19시간 전</span>
								</div>
								<div>
									<i class="tip_icon bi bi-bookmark"></i>
									<span>1&nbsp;&nbsp;</span>
									<i class="tip_icon bi bi-eye"></i>
									<span>1&nbsp;&nbsp;</span>
									<i class="tip_icon bi bi-chat-dots"></i>
									<span>1&nbsp;&nbsp;</span>
								</div>
							</div>
						</div>
					</div>

				<div class="page-navigation">
					${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
				</div>
				
			</div>
			
			<aside class="sidebar">
				<div class="rightBox">
					<p>❤️최신순❤️</p>
					<p>❤️조회순❤️</p>
					<p>❤️즐겨찾기순❤️</p>
					<button type="button" class="btn top_btn" onclick="location.href='<c:url value=''/>'">TOP</button>
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