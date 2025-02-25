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
.category_title {
	display: flex;
	justify-content: space-between;

	align-items: flex-end;
    flex-wrap: wrap;
    
    max-width: 1080px;
    margin: 60px auto 40px;
    padding-bottom: 5px;
    border-bottom: 3px solid #333;
}

.product_group {
    max-width: 1080px;
    margin: 0 auto;
    overflow: hidden;
}

.product_search {
	position: relative;
    width: 240px;
    float: left;
    
    padding: 20px;
    border: 1px solid #e0e0e0;
}

.product_content {
	float: right;
    width: 840px;
    padding-left: 50px;
    
    padding: 20px;
    border: 1px solid #e0e0e0;
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
    	<h3 style="margin: 0px;">대여? 돼여!</h3>
	</div>
	
	<div style="display: flex; justify-content: center; margin-top: 30px;">
		<h2>카테고리</h2>
	</div>
	
	<!-- 카테고리 타이틀-->
    <div class="category_title" id="category_title">
    	<div>
        	<h2>카테고리 이름</h2>
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
	            <div class="search-box">
	                <input type="text" id="search-input" placeholder="상품 검색..." />
	                <button id="search-btn">검색</button>
	            </div>
        	</aside>
        	
			<div class="product_content">
		        <!-- 상품 리스트 -->
		        <section class="product-list">
        
            <div class="product-grid">
                <div class="product-item">
                    <img src="${pageContext.request.contextPath}/dist/images/noimage.png" alt="상품 1">
                    <h3>상품 1</h3>
                    <p>가격: 30,000원</p>
                    <button class="add-to-cart">장바구니</button>
                </div>
                <div class="product-item">
                    <img src="${pageContext.request.contextPath}/dist/images/noimage.png" alt="상품 2">
                    <h3>상품 2</h3>
                    <p>가격: 50,000원</p>
                    <button class="add-to-cart">장바구니</button>
                </div>
                <div class="product-item">
                    <img src="${pageContext.request.contextPath}/dist/images/noimage.png"alt="상품 3">
                    <h3>상품 3</h3>
                    <p>가격: 25,000원</p>
                    <button class="add-to-cart">장바구니</button>
                </div>
                <div class="product-item">
                    <img src="${pageContext.request.contextPath}/dist/images/noimage.png" alt="상품 4">
                    <h3>상품 4</h3>
                    <p>가격: 70,000원</p>
                    <button class="add-to-cart">장바구니</button>
                </div>
                <!-- 추가 상품 항목들 -->
            </div>
        </section>
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