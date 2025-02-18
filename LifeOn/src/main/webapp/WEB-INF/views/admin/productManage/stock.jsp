<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LifeOn - 재고관리</title>

<jsp:include page="/WEB-INF/views/admin/layout/headerResources.jsp"/>
<style>
    .wrapper {
        display: flex;
    }
    .container {
        flex-grow: 1;
        padding: 20px;
    }
    .table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    .table th, .table td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;
    }
    .table th {
        background-color: #f4f4f4;
    }
    .btn {
        padding: 5px 10px;
        border: none;
        cursor: pointer;
        border-radius: 5px;
    }
    .low-stock {
        color: red;
        font-weight: bold;
    }
    .thumbnail {
        width: 50px;
        height: 50px;
        object-fit: cover;
        border-radius: 5px;
    }
    h2 {
        font-size: 24px;
        margin-bottom: 15px;
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
        <h2>재고 관리</h2>
        
        <table class="table">
            <thead>
                <tr>
                    <th>썸네일</th>
                    <th>상품명</th>
                    <th>업체명</th>
                    <th>카테고리 (대 / 소)</th>
                    <th>현재 재고</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><img src="${pageContext.request.contextPath}/dist/images/profile.png" alt="상품 이미지" class="thumbnail"></td>
                    <td>유기농 사과</td>
                    <td>자연농원</td>
                    <td>과일 / 사과</td>
                    <td class="">20 개</td>
                </tr>
                <tr>
                    <td><img src="${pageContext.request.contextPath}/dist/images/profile.png" class="thumbnail"></td>
                    <td>신선한 딸기</td>
                    <td>베리팜</td>
                    <td>과일 / 딸기</td>
                    <td class="low-stock">3 개</td>
                </tr>
                <tr>
                    <td><img src="${pageContext.request.contextPath}/dist/images/profile.png" class="thumbnail"></td>
                    <td>무항생제 계란</td>
                    <td>청정농장</td>
                    <td>유제품 / 계란</td>
                    <td>50 개</td>
                </tr>
            </tbody>
        </table>
    </div>
</main>

<footer>
    <jsp:include page="/WEB-INF/views/admin/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/admin/layout/footerResources.jsp"/>
</body>
</html>
