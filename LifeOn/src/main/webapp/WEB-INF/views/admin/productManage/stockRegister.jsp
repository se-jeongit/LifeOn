<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LifeOn - 상품 및 재고 등록</title>

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
        <h2>상품 및 재고 등록</h2>
		
		<hr>
        <form action="/product-stock/register" method="post" enctype="multipart/form-data">
            <h4>📌 상품 정보 입력</h4>

            <div class="form-group">
                <label for="productName">상품명</label>
                <input type="text" id="productName" name="productName" required>
            </div>


            <div class="form-group">
                <label for="categoryLarge">카테고리 (대)</label>
                <select id="categoryLarge" name="categoryLarge" required>
                    <option value="">카테고리를 선택하세요</option>
                    <c:forEach var="large" items="${categoryLargeList}">
                        <option value="${large.categoryId}">${large.categoryName}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="categorySmall">카테고리 (소)</label>
                <select id="categorySmall" name="categorySmall" required disabled>
                    <option value="">먼저 대분류를 선택하세요</option>
                </select>
            </div>

            <div class="form-group">
                <label for="productDesc">상품 설명</label>
                <textarea id="productDesc" name="productDesc" required></textarea>
            </div>

            <div class="form-group">
                <label for="thumbnailImage">대표 이미지</label>
                <input type="file" id="thumbnailImage" name="thumbnailImage" required>
            </div>
            
            <div class="form-group">
                <label for="thumbnailImage">상품 이미지</label>
                <input type="file" id="Image" name="Image" required>
            </div>
            

            <h4>📌 재고 정보 입력</h4>

            <div class="form-group">
                <label for="supplier">업체명</label>
                <input type="text" id="supplier" name="supplier" required>
            </div>

            <div class="form-group">
                <label for="stockQuantity">재고 수량</label>
                <input type="number" id="stockQuantity" name="stockQuantity" required min="1">
            </div>

            <input type="hidden" name="productType" value="공동구매">
            <input type="hidden" name="stockType" value="상품등록">

            <button type="submit" class="btn">상품 및 재고 등록</button>
        </form>
    </div>
</main>

<footer>
    <jsp:include page="/WEB-INF/views/admin/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/admin/layout/footerResources.jsp"/>

<script>
document.getElementById("categoryLarge").addEventListener("change", function() {
    let categoryId = this.value;
    let categorySmallSelect = document.getElementById("categorySmall");

    if (!categoryId) {
        categorySmallSelect.innerHTML = "<option value=''>먼저 대분류를 선택하세요</option>";
        categorySmallSelect.disabled = true;
        return;
    }

    fetch(`/categories/small?largeCategoryId=${categoryId}`)
        .then(response => response.json())
        .then(data => {
            categorySmallSelect.innerHTML = "<option value=''>소분류를 선택하세요</option>";
            data.forEach(category => {
                categorySmallSelect.innerHTML += `<option value="${category.categoryId}">${category.categoryName}</option>`;
            });
            categorySmallSelect.disabled = false;
        });
});
</script>

</body>
</html>
