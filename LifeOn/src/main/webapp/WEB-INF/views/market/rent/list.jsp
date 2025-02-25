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
/* 메인 콘텐츠 스타일 */
.main-container {
    display: flex;
    justify-content: space-between;
    margin: 20px;
}

/* 좌측 사이드바 스타일 */
.sidebar {
    width: 20%;
    background-color: #fff;
    padding: 20px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.sidebar h2 {
    margin-top: 0;
}

.category-list {
    list-style-type: none;
    padding: 0;
}

.category-list li {
    margin: 10px 0;
}

.category-list li a {
    text-decoration: none;
    color: #333;
}

.category-list li a:hover {
    color: #007BFF;
}

.search-box {
    margin-top: 30px;
}

.search-box input {
    width: 80%;
    padding: 10px;
    margin-right: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
}

.search-box button {
    padding: 10px;
    background-color: #007BFF;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.search-box button:hover {
    background-color: #0056b3;
}

/* 상품 리스트 스타일 */
.product-list {
    width: 75%;
    background-color: #fff;
    padding: 20px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.product-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 20px;
}

.product-item {
    background-color: #f9f9f9;
    padding: 20px;
    border-radius: 8px;
    text-align: center;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.product-item img {
    width: 100%;
    height: auto;
    border-radius: 8px;
}

.product-item h3 {
    margin: 15px 0 10px;
    font-size: 18px;
}

.product-item p {
    margin: 10px 0;
    font-size: 16px;
    color: #333;
}

.product-item .add-to-cart {
    padding: 10px 20px;
    background-color: #28a745;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.product-item .add-to-cart:hover {
    background-color: #218838;
}
</style>

<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/forms.css" type="text/css">

</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/market/layout/menu.jsp"/>
</header>
	
<main class="d-flex flex-column min-vh-100 align-items-center" style="padding-top: 84px;">
    <div class="container">
		<div class="main-container">
        <!-- 좌측 사이드바 -->
        <aside class="sidebar">
            <h2>카테고리</h2>
            <ul class="category-list">
                <li><a href="#">전체</a></li>
                <li><a href="#">패션</a></li>
                <li><a href="#">가전</a></li>
                <li><a href="#">가구</a></li>
                <li><a href="#">스포츠</a></li>
                <li><a href="#">도서</a></li>
            </ul>

            <!-- 검색 기능 -->
            <div class="search-box">
                <input type="text" id="search-input" placeholder="상품 검색..." />
                <button id="search-btn">검색</button>
            </div>
        </aside>

        <!-- 상품 리스트 -->
        <section class="product-list">
            <h1>상품 리스트</h1>
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
</main>

<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>