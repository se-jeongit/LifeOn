<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LifeOn - 상품 등록</title>

<jsp:include page="/WEB-INF/views/admin/layout/headerResources.jsp"/>
<style>
    .wrapper {
        display: flex;
    }
    .container {
        flex-grow: 1;
        padding: 20px;
    }
    .form-group {
        margin-bottom: 15px;
    }
    .form-group label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }
    .form-group input, .form-group select, .form-group textarea {
        width: 100%;
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 5px;
    }
    .btn {
        padding: 10px 15px;
        border: none;
        background-color: #007bff;
        color: white;
        cursor: pointer;
        border-radius: 5px;
    }
</style>
</head>
<body>

<header class="container-fluid header-top fixed-top px-4">
    <jsp:include page="/WEB-INF/views/admin/layout/header.jsp"/>
</header>
    
<main class="wrapper">
    <jsp:include page="/WEB-INF/views/admin/layout/left.jsp"/>
    <div class="container">
        <h2>신규 상품 등록</h2>
        
        <form action="product_register_ok.jsp" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="productSelect">상품 선택</label>
                <select id="productSelect" name="productId" required>
                    <option value="">상품을 선택하세요</option>
                    <c:forEach var="stock" items="${stockList}">
                        <option value="${stock.productId}" 
                                data-category-large="${stock.categoryLarge}"
                                data-category-small="${stock.categorySmall}">
                            ${stock.productName} (${stock.categoryLarge} / ${stock.categorySmall})
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="categoryLarge">카테고리 (대)</label>
                <input type="text" id="categoryLarge" name="categoryLarge" readonly>
            </div>

            <div class="form-group">
                <label for="categorySmall">카테고리 (소)</label>
                <input type="text" id="categorySmall" name="categorySmall" readonly>
            </div>

            <div class="form-group">
                <label for="productDesc">상품 설명</label>
                <textarea id="productDesc" name="productDesc" required></textarea>
            </div>

            <div class="form-group">
                <label for="thumbnailImage">썸네일 이미지</label>
                <input type="file" id="thumbnailImage" name="thumbnailImage" required>
            </div>

            <div class="form-group">
                <label for="productImage">상품 상세 이미지</label>
                <input type="file" id="productImage" name="productImage" required>
            </div>

            <div class="form-group">
                <label for="productQuantity">상품 수량</label>
                <input type="number" id="productQuantity" name="productQuantity" required>
            </div>

            <div class="form-group">
                <label for="startDate">판매 시작일</label>
                <input type="date" id="startDate" name="startDate" required>
            </div>

            <div class="form-group">
                <label for="endDate">판매 종료일</label>
                <input type="date" id="endDate" name="endDate" required>
            </div>

            <div class="form-group">
                <label for="expectedShippingDate">예상 발송일</label>
                <input type="date" id="expectedShippingDate" name="expectedShippingDate" required>
            </div>

            <button type="submit" id="submitBtn" class="btn">상품 등록</button>
        </form>
    </div>
</main>

<footer>
    <jsp:include page="/WEB-INF/views/admin/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/admin/layout/footerResources.jsp"/>
</body>
</html>
