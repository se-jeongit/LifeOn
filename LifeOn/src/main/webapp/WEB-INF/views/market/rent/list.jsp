<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LifeOn</title>

<style type="text/css">
.category_tab {
	display: flex;
	justify-content: space-between;

    flex-wrap: wrap;
    
    max-width: 1280px;
    margin: 60px auto 40px;
}

.category-nav {
	min-width: 1280px;
	
	display: flex;
  	justify-content: space-between;
  	padding: 8px;
}

.category-nav ul {
	padding: 0;
	margin: 0;
	
	display: flex;
	list-style: none;
}

.category {
	width: 150px;

	flex: 1;
	text-align: center;
	padding: 10px;
	border: 1px solid #e0e0e0;
	border-left: none;
	cursor: pointer;
}

.category:first-child {
	border-left: 1px solid #e0e0e0;
}

.category:hover {
	background-color: #99c3ff;
	color: #fff;
	text-shadow: 2px 2px 3px rgba(0, 0, 0, 0.1);
}

.subcategory {
	margin-top: 10px;
	background-color: #99c3ff;
	width: 100%;
	top: 100%;
	left: 0;
	display: flex;
}

.subcategory li {
	padding: 8px;
	border-bottom: 1px solid #e0e0e0;
}

.subcategory li:last-child {
	border-bottom: none;
}

.category_title {
	display: flex;
	justify-content: space-between;

	align-items: flex-end;
    flex-wrap: wrap;
    
    max-width: 1280px;
    margin: 60px auto 40px;
    padding-bottom: 5px;
    border-bottom: 2px solid #999;
}

.search_input {
	width: 110px;
	height: 40px;
	padding: 8px 15px;
	border: 1px solid #e0e0e0;
	border-right: none;
}

.search_btn {
	height: 40px;
	background: #fff;
	color: #333;
	padding: 6px 8px;
	border: 1px solid #e0e0e0;
}

.product_group {
	display: flex;
    max-width: 1280px;
    margin: 0 auto;
}

.product_search {
	position: relative;
    width: 200px;
    min-height: 425.67px;
    
    padding: 20px;
    margin-bottom: 50px;
    border: 1px solid #e0e0e0;
}

.product_content {
    width: 920px;
    min-height: 425.67px;
    
   	margin: 0 20px;
   	margin-bottom: 50px;
    
    padding: 20px;
    border: 1px solid #e0e0e0;
}

.product-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
    
/*     grid-template-columns: repeat(4, 200px);
    justify-content: space-between;  */
}

.product-item {
    border: 1px solid #e0e0e0;
    background-color: #fff;
    text-align: center;
}

.product_img {
    width: 100%;
    height: 200px;
    object-fit: cover;
}

.product_info {
	padding: 20px;
}

.product_Viewe {
    width: 120px;
	position: sticky;
    top: 120px;
    align-self: flex-start;
    margin-left: auto;
}

.view_item {
    background-color: #FBFBFB;
    border: 1px solid #D9D9D9;
   	padding: 15px 10px 10px 10px; 
}

.view_img {
	width: 100px;
	height: 100px;
	object-fit: cover;
	margin-bottom: 5px;
}

.top_btn {
	width: 120px;
	padding: 8px;
	border: 1px solid #e0e0e0;
	border-top: none;
	background: #FBFBFB;
}

.top_btn:hover {
	background: #f7f7f7;
}
</style>

<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/forms.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/free.css" type="text/css">

</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/market/layout/menu.jsp"/>
</header>
	
<main class="min-vh-100">
	<!-- 배너 -->
    <div class="body-title">
    	<em style="font-size: 30px; font-weight: 800; text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);">대여? 돼요!</em>
	</div>
	
	<div class="category_tab" id="category_tab">
		<nav class="category-nav">
			<ul class="category-sub">
				<li data-id=0 class="category">전체</li>
				<li data-id=1 class="category">전자제품
					<ul class="subcategory" style="display: none;">
						<li>하위 항목 1</li>
						<li>하위 항목 2</li>
					</ul>
				</li>
				<li data-id=2 class="category">도서
					<ul class="subcategory" style="display: none;">
						<li>하위 항목 1</li>
						<li>하위 항목 2</li>
					</ul>
				</li>
				<li data-id=3 class="category">생활/주방
					<ul class="subcategory" style="display: none;">
						<li>하위 항목 1</li>
						<li>하위 항목 2</li>
					</ul>
				</li>
				<li data-id=4 class="category">스포츠/야외활동
					<ul class="subcategory" style="display: none;">
						<li>하위 항목 1</li>
						<li>하위 항목 2</li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
	
	<!-- 카테고리 타이틀-->
    <div class="category_title" id="category_title">
    	<div>
        	<h2 style="margin: 0">전체</h2>
		</div>
        <div>
            <span>
            	<em>27,376</em> 개의 상품이 있습니다.
            </span>
		</div>
    </div>
	
	<div class="body-container">
		<div class="product_group">
			<aside class="product_search" id="product_search">
	            <!-- 검색 기능 -->
	            <div class="search_box" style="display: flex;">
	                <input type="text" class="search_input" id="search_input" placeholder="물품검색">
	                <button class="search_btn" id="search_btn">검색</button>
	            </div>
        	</aside>
        	
			<div class="product_content">
		        <!-- 상품 리스트 -->
	            <div class="product-grid">
	                <div class="product-item">
	                    <img class="product_img" src="${pageContext.request.contextPath}/dist/images/noimage.png">
	                    <div class="product_info">
		                    <h3 style="text-align: left;">상품명</h3>
		                    <div style="display: flex; justify-content: space-between; align-items: baseline; padding-bottom: 5px;">
		                    	<div>
		                    		<span style="font-size: 28px; font-weight: bold;">1,000 </span>
		                    		<span style="font-size: 24px; font-weight: 600;">원</span>
		                    		<span> /일</span>
		                    	</div>
		                    	<h5 style="margin: 0;">대여가능</h5>
		                    </div>
		                    <div style="text-align: left; padding-bottom: 5px;"><h5 style="margin: 0;">보증금 : 5,000 원</h5></div>
							<div style="text-align: left;">서울시 마포구&nbsp;·&nbsp;1일전</div>
	                	</div>
	                </div>
	                
	                <div class="product-item">
	                    <img class="product_img" src="${pageContext.request.contextPath}/dist/images/noimage.png">
	                    <div class="product_info">
		                    <h3 style="text-align: left;">상품명</h3>
		                    <div style="display: flex; justify-content: space-between; align-items: baseline; padding-bottom: 5px;">
		                    	<div>
		                    		<span style="font-size: 28px; font-weight: bold;">1,000 </span>
		                    		<span style="font-size: 24px; font-weight: 600;">원</span>
		                    		<span> /일</span>
		                    	</div>
		                    	<h5 style="margin: 0;">대여가능</h5>
		                    </div>
		                    <div style="text-align: left; padding-bottom: 5px;"><h5 style="margin: 0;">보증금 : 5,000 원</h5></div>
							<div style="text-align: left;">서울시 마포구&nbsp;·&nbsp;1일전</div>
	                	</div>
	                </div>

	            </div>
    		</div>
    		
    		<!-- 최근 본 상품 목록 -->
	        <div class="product_Viewe">
			   	<div class="view_item" style="border-bottom: none;">
			    	<p style="margin: 0">최근 본 상품</p>
			    </div>
	  
			  	<div class="view_item">
		  			<img class="view_img" src="${pageContext.request.contextPath}/dist/images/noimage.png">
		  			<img class="view_img" src="${pageContext.request.contextPath}/dist/images/noimage.png">
		  			<img class="view_img" src="${pageContext.request.contextPath}/dist/images/noimage.png">
				</div>
				<button type="button" class="top_btn" onclick="location.href='<c:url value=''/>'"><i class="bi bi-chevron-up"></i></button>
	   		</div>
		</div>
		
		<div class="page-navigation" style="display: table-footer-group;">
			${dataCount == 0 ? "등록된 상품이 없습니다." : paging}
		</div>
    </div>
</main>

<script type="text/javascript">
document.querySelectorAll('.category').forEach(function(category) {
	category.addEventListener('click', function() {
	const subcategory = category.querySelector('.subcategory');
	
	// 모든 하위 메뉴를 숨김
	document.querySelectorAll('.subcategory').forEach(function(sub) {
		if (sub !== subcategory) {
			sub.style.display = 'none';
		}
	});
	
	// 클릭한 카테고리의 하위 메뉴 토글
	if (subcategory.style.display === 'block') {
		subcategory.style.display = 'none';
	} else {
		subcategory.style.display = 'block';
		}
	});
});
</script>

<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>