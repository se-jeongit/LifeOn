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
	width: 100%;
	height: 150px;
	background: #222;
	color: #FFF;
	margin-bottom: 60px;
	
	display: flex;
	justify-content: center;
	align-items: center;
}

.body-container {
 	display: flex;
    flex-direction: column;
    text-align: center;
}

@media screen and (max-width: 520px) {
  .body-top {
    flex-direction: column;
  }
  .sidenav {
    width: 100%;
  }
  .main_content {
    width: 100%;
  }
  .sidebar {
    width: 100%;
  }
}

.body-content {
	display: flex;
	flex-direction: row;
	height: 100vh;
}

.sidenav {
	width: 30%;
}

.main_content {
	width: 60%;
}

.main_menu {
	padding: 0 20px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	flex-wrap: wrap;
}

.sidebar {
	width: 30%;
}

.rightBox {
	width: 200px;
	padding: 30px;
	border-radius: 8px;
	border: 1px solid #e0e0e0;
	margin-top: 60px;
	margin-left: 20px;
	
	position: fixed;
}

.selectSearch {
	padding: 6px 10px;
	border: 1px solid #e0e0e0;
	border-radius: 4px;
	margin-left: 3px;
}

.searchBox {
	padding: 5px 10px;
	border: 1px solid #e0e0e0;
	border-radius: 4px;
	margin-left: 3px;
}

.tip_list {
	margin: 20px;
}

.tip_container {
    padding: 30px 30px 20px 30px;
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
    font-weight: 600;
    color: #222;
    margin-bottom: 30px;
    text-align: left;
}

.tip_content {
    color: #333;
    margin-bottom: 30px;
    font-size: 16px;
    text-align: left;
    
    display: inline-block;
  	width: 100%;
 	white-space: nowrap;
  	overflow: hidden;
  	text-overflow: ellipsis;
}

.tip_info {
	margin: 0;
	color: #777;
	
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.tip_icon {
	font-size: 16px;
}

.mybtn {
	border-radius: 4px;
	border: 1px solid #e0e0e0;
}

.mybb {
	border-radius: 30px;
	border: 1px solid #e0e0e0;
	margin-right: 3px;
}

.top_btn {
	border-radius: 40px;
	border: 1px solid #e0e0e0;
	margin-right: 3px;
}


</style>

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
			</aside>
			
			<div class="main_content">
				<!-- 상단메뉴 -->
				<div class="main_menu">
					<div style="display: flex; justify-content: flex-start; align-items: center; margin-bottom: 8px;">
					   	<button class="btn mybb">최근순</button>
					   	<button class="btn mybb">조회순</button>
					   	<button class="btn mybb">즐겨찾기순</button>
						<p style="margin: 0; margin-left: 10px;">총 게시글 1개 (1 / 1 페이지)</p>
				   	</div>
						
					<div style="display: flex; justify-content: flex-end; align-items: center; margin-bottom: 8px;">
						<!-- 검색옵션 -->
					    <select class="selectSearch">
					      <option value="all" selected>전체</option>
					      <option value="subjcet" >제목</option>
					      <option value="content" >내용</option>
					      <option value="nickname" >작성자</option>
					      <option value="reg_date" >등록일</option>
					    </select>
				    
						<!-- 검색상자 -->
						<input type="search" class="searchBox">
						<!-- 검색버튼 -->
					   	<button class="btn mybtn">검색</button>
				   	</div>
			   	</div>
			
				<!-- 글리스트 -->
				<div class="tip_list">
			  		<div class="tip_container" onclick="location.href='<c:url value='room'/>'">
						<h4 class="tip_subject">
						  제목입니다.
						</h4>
					        
				        <p class="tip_content">
				        	내용입니다.
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
				<div class="tip_list">
			  		<div class="tip_container" onclick="location.href='<c:url value='room'/>'">
						<h4 class="tip_subject">
						  제목입니다.
						</h4>
					        
				        <p class="tip_content">
				        	내용입니다.
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
			</div>
			
			<div class="page-navigation">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>
			
			<aside class="sidebar">
				<div class="rightBox">
					❤️BEST 생활팁❤️
					<button type="button" class="btn top_btn" onclick="location.href='<c:url value=''/>'">TOP</button>
				</div>
			</aside>
		</div>
    </div>
</main>

<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>