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
        font-size: 12px;
        color: #666;
        margin-top: 5px; 
        text-align: left; 
    }
    .product-header {
	    display: flex;
	    align-items: center;
	    justify-content: space-between;
	}
	
	.product-price{
	    margin: 0;
	    margin-left: 10px; 
	}
	
	.purchase-status {
	    font-size: 20px;
	    font-weight: bold;
	    color: blue;
	}
	.closed-status {
    	color: red;
	}
    .product-discount {
        color: red;
        font-size: 20px;
        font-weight: bold;
        text-align: left; 
    	margin-left: 8px; 
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
        <aside class="col-md-2">
            <div class="filter-section mb-3">
                <h5>필터</h5>
								
				<div class="form-group">
				    <label for="bigCategory" style="font-size:17px">[[카테고리]]</label>
				    <ul class="filter-category" id="bigCategoryList">
				        <c:forEach var="dto" items="${bigCategory}">
				            <li class="category">
				                <a href="#" class="subcategory-toggle" data-category-id="${dto.cbn}">${dto.cbc}</a>
				                <ul class="filter-category subcategory" id="smallCategory-${dto.cbn}" style="display:none;">
				                    <!-- 소분류 항목이 여기에 동적으로 들어감 -->
				                </ul>
				            </li>
				        </c:forEach>
				    </ul>
				</div>

                <h5>검색 기간</h5>
                <input type="date" class="form-control mb-2" placeholder="시작일"> ~ 
                <input type="date" class="form-control" placeholder="종료일">
                <h5 class="mt-3">가격</h5>
                <input type="number" class="form-control mb-2" placeholder="최저가격"> ~ 
                <input type="number" class="form-control" placeholder="최고가격">
            </div>
        </aside>
        
        <!-- Main Content -->
        <section class="col-md-8">
            <h2>공동구매</h2>
            <div class="product-grid">
                <c:forEach var="dto" items="${list}">
	                    <div class="product-card">
                			<a href="${articleUrl}?pnum=${dto.pnum}" class="product-card-link">
	                        <img src="${pageContext.request.contextPath}/uploads/product/${dto.pph}" alt="상품 이미지">
			            	</a>
	                        <p class="mt-2 product-name"><strong>${dto.pname}</strong></p>
	                        <div class="product-header">
							    <p class="product-price"><del><fmt:formatNumber value="${dto.ptp}" type="currency"/></del></p>
							    <p class="purchase-status ${dto.status eq '마감' ? 'closed-status' : ''}">${dto.status}</p>
							</div>
	    					<p class="product-discount"><fmt:formatNumber value="${dto.ptsp}" type="currency"/></p>
	                        <p class="product-info">시작일 : ${dto.ptsd} - 종료일 : ${dto.pted}</p>
	                        <p class="product-info">남은수량 : ${dto.ptq}개 &nbsp;&nbsp;&nbsp;예상 발송일 : ${dto.ptdd}</p>
	                    </div>
                </c:forEach>
            </div>
            
	        <div class="page-navigation">
				${dataCount == 0 ? "상품목록이 없습니다." : paging}
			</div>
        </section>
        
         <aside class="col-md-2">
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
