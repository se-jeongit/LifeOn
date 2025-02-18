<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LifeOn - 상품관리</title>

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
    .btn-edit {
        background-color: #007bff;
        color: white;
    }
    .btn-delete {
        background-color: #dc3545;
        color: white;
    }
    .btn-order {
        background-color: #28a745;
        color: white;
    }
    .sidebar {
        width: 250px;
        background: #007bff;
        color: white;
        padding: 20px;
    }
    .status-tabs {
        display: flex;
        gap: 15px;
        margin-bottom: 20px;
        font-size: 18px;
        font-weight: bold;
    }
    .status-tabs a {
        text-decoration: none;
        color: black;
        padding: 5px 10px;
        border-radius: 5px;
    }
    .status-tabs a.active {
        background-color: #007bff;
        color: white;
    }
    h2 {
        font-size: 24px;
        margin-bottom: 15px;
    }
</style>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const tabs = document.querySelectorAll(".status-tabs a");
        tabs.forEach(tab => {
            tab.addEventListener("click", function(e) {
                e.preventDefault();
                tabs.forEach(t => t.classList.remove("active"));
                this.classList.add("active");
            });
        });
    });
</script>
</head>
<body>

<header class="container-fluid header-top fixed-top px-4">
    <jsp:include page="/WEB-INF/views/admin/layout/header.jsp"/>
</header>
    
<main class="wrapper">
    <jsp:include page="/WEB-INF/views/admin/layout/left.jsp"/>
    <div class="container">
        <h2>상품목록</h2>
        
        <div class="status-tabs">
            <a href="#" class="active">전체</a>
            <a href="#">진행중</a>
            <a href="#">구매성공</a>
            <a href="#">구매실패</a>
        </div>
        
        <table class="table">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>공구기간</th>
                    <th>상품명</th>
                    <th>목표수량</th>
                    <th>판매수량</th>
                    <th>비고</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>196</td>
                    <td>진행중<br>2017-11-15</td>
                    <td>
                        <img src="${pageContext.request.contextPath}/dist/images/profile.png" alt="상품 이미지" style="width:100px; height:100px;">
                        나이키 운동화<br>
                        판매가격 : 1,000원
                    </td>
                    <td>10개</td>
                    <td>0개</td>
                    <td>
                        등록일 : 2016-07-28<br>
                        종료일 : 2017-11-15<br>
                        <button class="btn btn-order">주문보기</button>
                        <button class="btn btn-edit">수정</button>
                        <button class="btn btn-delete">삭제</button>
                    </td>
                </tr>
                <tr>
                    <td>17</td>
                    <td>[공동구매실패]</td>
                    <td>
                        <img src="${pageContext.request.contextPath}/dist/images/profile.png" alt="이미지 준비중" style="width:100px; height:100px;">
                        test<br>
                        판매가격 : 8,000원
                    </td>
                    <td>1개</td>
                    <td>0개</td>
                    <td>
                        등록일 : 2011-03-01<br>
                        종료일 : 2016-12-29<br>
                        <button class="btn btn-order">주문보기</button>
                        <button class="btn btn-edit">수정</button>
                        <button class="btn btn-delete">삭제</button>
                    </td>
                </tr>
            </tbody>
        </table>
        <button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/productManage/register'" class="btn btn-primary mt-3">신규상품등록</button>
    </div>
</main>

<footer>
    <jsp:include page="/WEB-INF/views/admin/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/admin/layout/footerResources.jsp"/>
</body>
</html>
