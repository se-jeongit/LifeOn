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
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/forms.css" type="text/css">

<style>
    .order-button {
        font-size: 20px;
        font-weight: bold;
        color: white;
        background-color: blue;
        border: none;
        padding: 15px 30px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .order-button:hover {
        background-color: darkblue;
    }

    .cancel-button {
        font-size: 20px;
        font-weight: bold;
        color: white;
        background-color: gray;
        border: none;
        padding: 15px 30px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
        margin-left: 10px;
    }

    .cancel-button:hover {
        background-color: darkgray;
    }

    .order-form {
        width: 50%;
        margin: auto;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
        background: #f9f9f9;
    }

    .form-group {
        margin-bottom: 15px;
    }

    label {
        font-weight: bold;
    }

    input, select {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .price-display {
        font-size: 18px;
        font-weight: bold;
        color: red;
    }
</style>
</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/market/layout/menu.jsp"/>
</header>
	
<main class="d-flex flex-column min-vh-100 align-items-center" style="padding-top: 84px;">
    <div class="container">
        <h2>상품 주문</h2>

        <form name="orderForm" method="post">
            <!-- 상품 정보 -->
            <input type="hidden" name="pnum" value="${dto2.pnum}">
            <input type="hidden" name="odp" value="${dto2.ptsp}">

            <!-- 사용자 정보 -->
            <input type="hidden" name="num" value="${dto1.num}">

            <!-- 상품명 표시 -->
            <div class="form-group">
                <label>상품명:</label>
                <span>${dto2.pname}</span>
            </div>

            <!-- 수량 선택 -->
            <div class="form-group">
                <label for="quantity">구매 수량:</label>
                <input type="number" id="odq" name="odq" value="1" min="1" max="${dto2.ptq}" required onchange="updateTotalPrice()">
            </div>

            <!-- 상품 가격 -->
            <div class="form-group">
                <label>상품 가격:</label>
                <span class="price-display">
                    <fmt:formatNumber value="${dto2.ptsp}" type="currency"/>
                </span>
            </div>

            <!-- 총 결제 금액 -->
            <div class="form-group">
                <label>총 결제 금액:</label>
                <span class="price-display" id="totalPrice">
                    <fmt:formatNumber value="${dto2.ptsp}" type="currency"/>
                </span>
            </div>
			<input type="hidden" id="totalPriceInput" name="op" value="${dto2.ptsp}">
            
            <!-- 결제 정보 -->
            <div class="form-group">
                <label>결제 방법:</label>
                <input type="hidden" name="payment_method" value="포인트">
                <span>포인트</span>
            </div>
			
            <!-- 주문하기 & 주문취소 버튼 -->
            <div class="text-end mt-3">
                <button type="button" class="order-button" onclick="productOk();">주문하기</button>
                <button type="button" class="cancel-button" onclick="history.back();">주문취소</button>
            </div>
        </form>
    </div>
</main>

<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>

<script type="text/javascript">
	function productOk(){
		const f = document.orderForm;
	    f.action = '${pageContext.request.contextPath}/market/order/payment';
	    f.submit();
	}

    function updateTotalPrice() {
        let price = parseFloat(${dto2.ptsp});  // 상품 가격
        let quantityInput = document.getElementById("odq");
        let quantity = parseInt(quantityInput.value);  // 선택된 수량
        let maxQuantity = parseInt(quantityInput.max);  // 최대 구매 가능 수량 (남은 재고량)

        // 🚨 재고보다 많은 수량 입력 방지
        if (quantity > maxQuantity) {
            alert("남은 재고보다 많은 수량을 입력할 수 없습니다.");
            quantityInput.value = maxQuantity;  // 최대값으로 설정
            quantity = maxQuantity;
        }

        // 🚨 1보다 작은 수량 입력 방지
        if (quantity < 1) {
            alert("구매 수량은 최소 1개 이상이어야 합니다.");
            quantityInput.value = 1;  // 최소값으로 설정
            quantity = 1;
        }

        // 총 결제 금액 계산
        let totalPrice = price * quantity;

        // 화면에 표시 (천 단위 콤마 적용)
        document.getElementById("totalPrice").innerText = new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(totalPrice);

        // hidden input에도 적용하여 서버로 전송
        document.getElementById("totalPriceInput").value = totalPrice;
    }
</script>




</body>
</html>
