<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LifeOn - 공동구매</title>

<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/forms.css" type="text/css">
<style>
    .product-card {
        border: 1px solid #ddd;
        padding: 15px;
        text-align: center;
        background: #fff;
        border-radius: 10px;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        height: 100%;
    }
    .product-card img {
        width: 100%;
        height: 250px;
        object-fit: cover;
        border-radius: 5px;
    }
    .product-info {
        font-size: 14px;
        color: #666;
        margin-top: 5px;
    }
    .product-price {
        font-weight: bold;
        color: black;
    }
    .product-discount {
        color: red;
        font-size: 16px;
        font-weight: bold;
    }
    .pagination .page-item.active .page-link {
        background-color: #007bff;
        border-color: #007bff;
        color: white;
    }
    .filter-section {
        background: #F7F9FA;
        padding: 15px;
        border-radius: 5px;
    }
    .filter-section h5 {
        font-weight: bold;
        margin-bottom: 10px;
    }
    .filter-category {
        list-style: none;
        padding: 0;
    }
    .filter-category li {
        margin-bottom: 5px;
    }
    .filter-category li a {
        text-decoration: none;
        color: #333;
    }
    .filter-category .subcategory {
        padding-left: 15px;
        color: blue;
    }
    .container {
        max-width: 1400px;
    }
    .product-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
    }
    
    .recently-viewed {
        background: #F7F9FA;
        padding: 15px;
        border-radius: 5px;
        text-align: center;
    }
    .recently-viewed h5 {
        font-weight: bold;
    }
</style>
</head>
<body>
<header>
    <jsp:include page="/WEB-INF/views/layout/header.jsp"/>
    <jsp:include page="/WEB-INF/views/market/layout/menu.jsp"/>
</header>
<main class="container d-flex flex-column min-vh-100 align-items-center" style="padding-top: 84px;">
    <div class="row w-100">
        <!-- Sidebar -->
        <aside class="col-md-3">
            <div class="filter-section mb-3">
                <h5>필터</h5>
                <ul class="filter-category">
                    <li><a href="#">전체</a></li>
                    <li><a href="#">패션의류/잡화</a></li>
                    <li><a href="#">생활용품</a></li>
                    <li><a href="#">홈인테리어</a></li>
                    <li><a href="#" class="subcategory">전자제품</a>
                        <ul class="filter-category subcategory">
                            <li><a href="#">노트북</a></li>
                            <li><a href="#">핸드폰</a></li>
                            <li><a href="#">이어폰</a></li>
                            <li><a href="#">기타</a></li>
                        </ul>
                    </li>
                </ul>
                <h5>검색 기간</h5>
                <input type="date" class="form-control mb-2" placeholder="시작일"> ~ 
                <input type="date" class="form-control" placeholder="종료일">
                <h5 class="mt-3">가격</h5>
                <input type="number" class="form-control mb-2" placeholder="최저가격"> ~ 
                <input type="number" class="form-control" placeholder="최고가격">
            </div>
        </aside>
        
        <!-- Main Content -->
        <section class="col-md-6">
            <h2>공동구매</h2>
            <div class="product-grid">
                <c:forEach var="i" begin="1" end="9">
                    <div class="product-card">
                        <img src="${pageContext.request.contextPath}/dist/images/profile.png" alt="상품 이미지">
                        <p class="mt-2 product-name"><strong>물품이름</strong></p>
                        <p class="product-price"><fmt:formatNumber value="23000" type="currency"/></p>
                        <p class="product-discount">13,000원</p>
                        <p class="product-info">시작일 : 2024-10-22 - 종료일 : 2024-12-22</p>
                        <p class="product-info">남은수량 : ${i * 10}개 | 예상 발송일 : 2025-01-03</p>
                        <p class="text-danger">구매 가능</p>
                    </div>
                </c:forEach>
            </div>
            
            <nav class="mt-4">
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                </ul>
            </nav>
        </section>
        
         <aside class="col-md-3">
            <div class="recently-viewed">
                <h5>즐겨찾기</h5>
                <h5>최근 본 상품</h5>
                <p>최근 본 상품이 없습니다</p>
            </div>
        </aside>
        
    </div>
</main>
<footer class="mt-auto py-2 text-center w-100" style="background: #F7F9FA;">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>
<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>
