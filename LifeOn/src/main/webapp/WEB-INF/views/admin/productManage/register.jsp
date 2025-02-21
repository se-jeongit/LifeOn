<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LifeOn - 공동구매 상품 등록</title>

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
        <h2>공동구매 상품 등록</h2>
        
        <form name="productForm" method="post">
           
            <div class="form-group">
                <label for="ptp">상품 원가</label>
                <input type="number" id="ptp" name="ptp" required>
            </div>
            
            <div class="form-group">
                <label for="ptsp">상품 할인가</label>
                <input type="number" id="ptsp" name="ptsp" required>
            </div>
           
           
           
            <div class="form-group">
                <label for="ptq">상품 수량</label>
                <input type="number" id="ptq" name="ptq" required>
            </div>

            <div class="form-group">
                <label for="ptsd">판매 시작일</label>
                <input type="date" id="ptsd" name="ptsd" required>
            </div>

            <div class="form-group">
                <label for="pted">판매 종료일</label>
                <input type="date" id="pted" name="pted" required>
            </div>

            <div class="form-group">
                <label for="ptdd">예상 발송일</label>
                <input type="date" id="ptdd" name="ptdd" required>
            </div>
			
			<input type="hidden" id="pnum" name="pnum" value="${pnum}">
			<input type="hidden" id="ptsq" name="ptsq" value="${ptsq}">  
			
            <button type="button" class="btn" onclick="productRegister();">상품 등록</button>
        </form>
    </div>
</main>

<footer>
    <jsp:include page="/WEB-INF/views/admin/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/admin/layout/footerResources.jsp"/>

<script type="text/javascript">
function productRegister(){
	const f = document.productForm;
	
    let stock = parseInt(document.getElementById("ptsq").value);  // 현재 재고량
    let quantity = parseInt(document.getElementById("ptq").value); // 입력된 공동구매 수량

    if (quantity > stock) {
        alert("공동구매 수량이 현재 재고보다 많을 수 없습니다.");
        quantityInput.focus();
    }
	
	
    f.action = '${pageContext.request.contextPath}/admin/productManage/register';
    f.submit();	
}

</script>


</body>
</html>
