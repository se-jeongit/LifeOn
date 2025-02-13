<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공동구매 - LifeOn</title>

<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>

<style>
    /* 전체 페이지 스타일 */
    .group-container {
        display: flex;
        justify-content: space-between;
        max-width: 1200px;
        width: 100%;
        margin: 20px auto;
    }

    /* 필터 스타일 */
    .filter-section {
        width: 250px;
        padding: 15px;
        background: #f9f9f9;
        border-radius: 5px;
    }

    .filter-title {
        font-size: 16px;
        font-weight: bold;
        margin-bottom: 10px;
    }

    /* 카테고리 대분류 */
    .category-main {
        font-weight: bold;
        cursor: pointer;
        margin: 10px 0;
    }

    /* 소분류 숨김 처리 */
    .category-sub {
        display: none;
        margin-left: 15px;
        font-size: 14px;
        color: #555;
    }

    /* 중앙 검색 & 정렬 */
    .search-sort-bar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 15px;
    }

    .search-bar {
        display: flex;
        align-items: center;
        border: 1px solid #ddd;
        padding: 5px;
        border-radius: 5px;
        background: #fff;
        width: 250px;
    }

    .search-bar input {
        border: none;
        outline: none;
        padding: 5px;
        flex: 1;
    }

    .search-bar button {
        background: none;
        border: none;
        cursor: pointer;
    }

    .sort-options {
        border: 1px solid #ddd;
        padding: 5px;
        border-radius: 5px;
        background: #fff;
    }

    /* 상품 리스트 (포토 게시판 스타일, 9개씩 3x3) */
    .product-list {
        flex: 1;
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
        padding: 0 20px;
    }

    .product-card {
        background: #fff;
        border: 1px solid #ddd;
        border-radius: 5px;
        padding: 15px;
        text-align: center;
    }

    .product-card img {
        width: 100%;
        height: 180px;
        object-fit: cover;
        border-radius: 5px;
    }

    .product-title {
        font-size: 14px;
        font-weight: bold;
        margin: 10px 0;
    }

    .product-price {
        font-size: 16px;
        color: red;
        font-weight: bold;
    }

    .product-status {
        font-size: 14px;
        color: #555;
    }

    /* 오른쪽 사이드바 (즐겨찾기 & 최근 본 상품) */
    .sidebar {
        width: 250px;
    }

    .recent-section, .bookmark-section {
        padding: 15px;
        background: #f9f9f9;
        border-radius: 5px;
        margin-bottom: 15px;
        text-align: center;
    }
</style>

</head>
<body>

<header>
    <jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>

<main class="d-flex flex-column min-vh-100 align-items-center" style="padding-top: 66px;">
    <div class="group-container">
        <!-- 왼쪽 필터 -->
        <aside class="filter-section">
            <div class="filter-title">필터</div>
            <div class="category-main" onclick="toggleCategory('category1')">전자제품 ▼</div>
            <ul id="category1" class="category-sub">
                <li>노트북</li>
                <li>태블릿</li>
                <li>이어폰</li>
            </ul>
            <div class="category-main" onclick="toggleCategory('category2')">생활용품 ▼</div>
            <ul id="category2" class="category-sub">
                <li>청소기</li>
                <li>주방가전</li>
            </ul>
        </aside>

        <!-- 중앙 상품 리스트 -->
        <section class="main-content">
            <div class="search-sort-bar">
                <div class="search-bar">
                    <input type="text" placeholder="검색어를 입력하세요">
                    <button><i class="bi bi-search"></i></button>
                </div>
                <select class="sort-options">
                    <option>인기순</option>
                    <option>최신순</option>
                </select>
            </div>

            <section class="product-list">
                <c:forEach var="product" items="${products}" begin="0" end="8">
                    <div class="product-card">
                        <img src="${product.image}" alt="상품 이미지">
                        <div class="product-title">${product.name}</div>
                        <div class="product-price">
                            <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₩"/>
                        </div>
                        <div class="product-status">${product.status}</div>
                    </div>
                </c:forEach>
                <c:if test="${empty products}">
                    <c:forEach begin="1" end="9">
                        <div class="product-card">
                            <img src="${pageContext.request.contextPath}/images/no-image.jpg" alt="상품 없음">
                            <div class="product-title">상품 없음</div>
                            <div class="product-price">-</div>
                            <div class="product-status">등록된 상품이 없습니다.</div>
                        </div>
                    </c:forEach>
                </c:if>
            </section>
        </section>

        <!-- 오른쪽 최근 본 상품 + 즐겨찾기 -->
        <aside class="sidebar">
            <div class="bookmark-section">
                <div class="filter-title">즐겨찾기</div>
                <p>즐겨찾기한 상품이 없습니다.</p>
            </div>
            <div class="recent-section">
                <div class="filter-title">최근 본 상품</div>
                <p>최근 본 상품이 없습니다.</p>
            </div>
        </aside>
    </div>
</main>

<footer class="mt-auto py-2 text-center w-100">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<script>
    function toggleCategory(id) {
        let category = document.getElementById(id);
        category.style.display = category.style.display === 'block' ? 'none' : 'block';
    }
</script>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>
