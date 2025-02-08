<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>spring</title>

<jsp:include page="/WEB-INF/views/admin/layout/headerResources.jsp" />

<style type="text/css">
 
.body-title{
	margin-bottom : 20px;
}
.body-middle{
	display : flex;
	align-items: center;
	justify-content:space-between;
}

.left {
	font-size : 15px;
	display : flex;
	gap : 20px;
	margin-bottom : 20px;
}



.btn{
	background-color: white;
	color : black;
}

.product-info{
	display: flex;
    align-items: center; /* 이미지와 텍스트를 같은 높이로 정렬 */
}

.product-img{
	display : block;
}


.table th, .table td{
	text-align: center;
	vertical-align: middle;
}

.table td button {
	display : flex;
	justify-content: center;
	align-items: center;
	margin:0 auto;
}

.orderwatch {
	background-color: white;
	border: 1px solid black;
	padding : 2px;
}

.comment-info {
	text-align: center;
}

.btntype {
	display: flex;
}

.btntype button {
	padding: 5px;
	background-color: #333; /* 진한 회색 */
    color: white; /* 글씨는 흰색으로 가독성 높이기 */
}

.btntype button:hover {
    background-color: #666; /* 마우스 오버 시 색상 변경 */
}

.body-footer {
	text-align : right;
}

.favoriteBtn button{
	padding : 5px;
	color : white;
	background-color: #006AFF;
	border: 1px solid #006AFF;
}


</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/admin/layout/header.jsp" />

	<main>
		<jsp:include page="/WEB-INF/views/admin/layout/left.jsp" />
		<div class="wrapper" style="display: flex; justify-content: center;">
			<div class="body-container" style="width: 900px;">
				<div class="body-title">
					<h3>
						<i class="bi bi-app"></i> 상품관리
					</h3>
				</div>

				<div class="body-main">
					<div class="body-middle">
						<div class="left">
							<button class="btn BtnA"> 전체 </button>
							<button class="btn BtnB"> 진행중 </button>
							<button class="btn BtnC"> 구매성공 </button>
							<button class="btn BtnD"> 구매실패</button>										
						</div>		    
					</div>
					
					<table class="table table-hover board-list">
						<thead class="table-light">
							<tr>
								<th width="70">번호</th>
								<th width="120">공구기간</th>
								<th>상품명</th>
								<th width="100">목표수량</th>								
								<th width="100">판매수량</th>	
								<th width="160">비고</th>																
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<td> 136 </td>
								<td>
									<div>진행중</div>
									<div> 2024-05-06 ~ 2024-06-06 </div>
								<td>
									<div class="product-info">
										<img src="#" class="product-img" width="50" height="50">
										<div>나이키 운동화 <br> 판매가격 : 1000원</div>
									</div>
								</td>
								<td> 10개</td>
								<td>
									<div class="sell-info">
										<div>0개</div>
										<div><button class="orderwatch">주문보기</button></div>
									</div>
								</td>
								<td>
									<div class="comment-info">
										<div> 등록일 : 2017-07-28 </div>
										<div> 종료일 : 2017-08-28 </div>
										<div class="btntype">
											<button> 수정</button>
											<button> 삭제</button>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="body-footer">
						<div class="favoriteBtn">
							<button>관심상품등록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function () {
		const buttons = document.querySelectorAll(".left .btn");
		const defaultBtn = document.querySelector(".BtnA");
		
		if(defaultBtn) {
			defaultBtn.classList.add("active");
			defaultBtn.style.borderColor = "white";
			defaultBtn.style.color = "#006AFF";
		}
		
		buttons.forEach((button) => {
			button.addEventListener("click", function() {
				buttons.forEach(btn => {
					btn.classList.remove("active");
					btn.style.borderColor = "white";
					btn.style.color = "black";
				});
				
				this.classList.add("active");
				this.style.borderColor = "white";
				this.style.color = "#006AFF";
			});
		});
	});
	
	</script>

	<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp" />

	<jsp:include page="/WEB-INF/views/admin/layout/footerResources.jsp" />
</body>
</html>