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
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu3.css" type="text/css">
<!-- <script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/menu2.js"></script> -->
<style>
    .sejin-container {
        max-width: 1300px;
        margin: auto;
        padding: 30px;
        background: white;
        border-radius: 12px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    }
    .sejin-title {
        font-size: 1.8rem;
        font-weight: bold;
        margin-bottom: 20px;
        text-align: left;
    }
    .sejin-point-box {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background: #F7F9FA;
        padding: 20px;
        border-radius: 8px;
        margin-bottom: 20px;
        font-size: 1.2rem;
    }
    .sejin-filter {
        display: flex;
        justify-content: flex-end;
        align-items: center;
        margin-bottom: 15px;
    }
    .sejin-table-container {
        width: 100%;
        overflow-x: auto;
        background: white;
        padding: 20px;
        border-radius: 10px;
    }
    .sejin-table {
        width: 1000px;
        border-collapse: collapse;
        background: white;
        font-size: 1.1rem;
    }
    .sejin-table th, .sejin-table td {
        padding: 15px;
        border-bottom: 1px solid #ddd;
        text-align: left;
    }
    .sejin-table th {
        background: #EAEAEA;
        font-size: 1.2rem;
    }
    .sejin-dropdown {
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 5px;
        background: white;
        cursor: pointer;
        font-size: 1rem;
    }
</style>

</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>
	
<main class="d-flex flex-column min-vh-100" style="padding-top: 84px; padding-left: 210px;">
    <jsp:include page="/WEB-INF/views/mypage/left.jsp"/>
    <div class="container d-flex flex-column align-items-center">
        <div class="sejin-container">
            <div class="sejin-title">포인트 내역</div>
            <div class="sejin-point-box">
                <div>나의 포인트 <strong>1,000P</strong></div>
                <button class="btn btn-primary btn-sm">충전하기</button>
            </div>
            
            <div class="sejin-filter">
                <label for="sejin-filter-select">포인트 유형&emsp;:&emsp;</label>
                <select id="sejin-filter-select" class="sejin-dropdown">
                    <option value="all">전체</option>
                    <option value="earn">적립</option>
                    <option value="use">사용</option>
                    <option value="expire">소멸</option>
                </select>
            </div>
            
            <div class="sejin-table-container">
                <table class="sejin-table">
                    <thead>
                        <tr>
                            <th>포인트유형</th>
                            <th>발생일자</th>
                            <th>발생내용</th>
                            <th>소멸유효기간</th>
                            <th>발생포인트</th>
                            <th>잔여포인트</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="dto" items="${list}" varStatus="status">
                    		<tr>
                    			<td>${dataCount - (page-1) * size - status.index}</td>
                    			<td>${dto.pret}</td>
                    			<td>${dto.prepd}</td>
                    			<td>${dto.prec}</td>
                    			<td>${dto.prep}</td>
                    			<td>${dto.prept}</td>                   			
                    		</tr>
                    	</c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="page-navigation">
					${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
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