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
/* 검색 옵션 스타일 */
.selectSearch {
    width: 200px;
    padding: 8px;
    font-size: 14px;
    border-radius: 5px;
    border: 1px solid #ddd;
}

/* 검색 상자 스타일 */
.searchBox {
    width: 300px;
    padding: 8px;
    font-size: 14px;
    border-radius: 5px;
    border: 1px solid #ddd;
    margin-left: 15px;
}

/* 글쓰기 버튼 */
.btn {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.btn:hover {
    background-color: #0056b3;
}

/* 글리스트 스타일 */
.tip-list {
    margin-top: 30px;
}

.tip-container {
    background-color: #f9f9f9;
    padding: 20px;
    border-radius: 8px;
    border: 1px solid #e0e0e0;
    margin-bottom: 15px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    cursor: pointer;
}

.tip-container:hover {
    transform: translateY(-5px);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

/* 제목 스타일 */
.tip-subject {
    font-size: 18px;
    font-weight: bold;
    color: #333;
    margin-bottom: 10px;
}

/* 내용 스타일 */
.tip_content {
    font-size: 14px;
    color: #555;
    margin-bottom: 10px;
}

/* 게시물 정보 스타일 */
.tip__info {
    font-size: 12px;
    color: #777;
}

.tip__info i {
    margin-right: 5px;
    color: #888;
}

.tip__info span {
    margin-right: 10px;
}

/* 페이지네이션 */
.page-navigation {
    text-align: center;
    margin-top: 30px;
}

.page-navigation a {
    color: #007bff;
    text-decoration: none;
    padding: 8px 15px;
    border-radius: 5px;
    margin: 0 5px;
    font-size: 14px;
    border: 1px solid #007bff;
    transition: background-color 0.3s ease;
}

.page-navigation a:hover {
    background-color: #007bff;
    color: white;
}

.page-navigation .disabled {
    color: #ccc;
    pointer-events: none;
}
</style>

</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/lounge/layout/menu.jsp"/>
</header>
	
<main class="d-flex flex-column min-vh-100 align-items-center">
    <div class="container">
	    <div class="nav">
	    생활의 도움을 받아볼까?
		</div>
		
		<div class="topGroup">
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
		</div>
		   
		   <!-- 글리스트 -->
		   <div class="tip-list">
		  		<div class="tip-container" onclick="location.href='<c:url value='room'/>'">
				<h3 class="tip-subject">
				  제목입니다.
				</h3>
			        
		        <p class="tip_content">
		        	내용입니다....
		        </p>
			        
				<p class='tip__info'>
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