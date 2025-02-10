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
.body-container {
	display: flex;
	flex-wrap: wrap;
}

.body-title {
	width: 100%;
	height: 100px;
	background: #222;
	color: #FFF;
	margin-bottom: 30px;
	
	display: flex;
	justify-content: center;
	align-items: center;
}

.search_right {
	width: 300px;
    padding: 30px;
    border-radius: 8px;
    border: 1px solid #e0e0e0;
    margin: 20px;
}
.selectSearch {

}

.searchBox {

}

.tip_list {
	margin: 20px;
}

.tip_container {
	width: 700px;
    padding: 30px;
    border-radius: 8px;
    border: 1px solid #e0e0e0;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    cursor: pointer;
}

.tip_container:hover {
    transform: translateY(-2px);
    box-shadow: 3px 3px rgba(0, 0, 0, 0.1);
}

/* 제목 스타일 */
.tip_subject {
    font-size: 20px;
    font-weight: 600;
    color: #222;
    margin-bottom: 30px;
}

.tip_content {
    color: #333;
    margin-bottom: 30px;
}

.tip_info {
	margin: 0;
	color: #777;
}


</style>

</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/lounge/layout/menu.jsp"/>
</header>
	
<main class="d-flex flex-column min-vh-100 align-items-center">
    <div class="body-title">
    	생활의 도움을 받아볼까?
	</div>
	
    <div class="body-container">
		<aside class="search_right">
			<!-- 검색옵션 -->
		    <select class="selectSearch">
		      <option value="recent" selected>최신순</option>
		      <option value="comment" >댓글많은순</option>
		      <option value="recommend" >즐겨찾기순</option>
		    </select>
			<!-- 검색상자 -->
			<input type="search" class="searchBox">
			<!-- 글쓰기 버튼 -->
		   	<button class="btn">글쓰기</button>
		</aside>
		   
		<!-- 글리스트 -->
		<div class="tip_list">
	  		<div class="tip_container" onclick="location.href='<c:url value='room'/>'">
			<h3 class="tip_subject">
			  제목입니다.
			</h3>
		        
	        <p class="tip_content">
	        	내용입니다....
	        </p>
		        
			<p class='tip_info'>
				<span class='tip_userName'>관리자</span>
				<span>&nbsp;·&nbsp;</span>
				<span>19시간 전</span>
				<span>&emsp;&emsp;&emsp;</span>
				<i class="bi bi-bookmark"></i>
				<span>1&nbsp;&nbsp;</span>
				<i class="bi bi-eye"></i>
				<span>1&nbsp;&nbsp;</span>
				<i class="bi bi-chat-dots"></i>
				<span>1&nbsp;&nbsp;</span>
			</p>
			</div>
		</div>
		
		<div class="page-navigation">
			${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
		</div>
		
    </div>
</main>

<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>