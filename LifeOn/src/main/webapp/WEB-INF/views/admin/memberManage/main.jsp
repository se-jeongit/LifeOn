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

.right {
	display:flex;
	gap : 10px;
}

.nav-link:hover{
	color: #006AFF;
}

.nav-link{
	border-color : white;
	color :black;
}

.nav-link.active{
	border-color : white;
	color:#006AFF;
}

.btn{
	background-color: #006AFF;
	color : white;
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

</style>

</head>
<body>


	<header class="container-fluid header-top fixed-top px-4">
		<jsp:include page="/WEB-INF/views/admin/layout/header.jsp"/>
	</header>

	<main>
		<jsp:include page="/WEB-INF/views/admin/layout/left.jsp" />
		<div class="wrapper" style="display: flex; justify-content: center;">
			<div class="body-container" style="width: 900px;">
				<div class="body-title">
					<h3>
						<i class="bi bi-app"></i> 회원관리
					</h3>
				</div>

				<div class="body-main">
					<div class="body-middle">
						<div class="left">
							<button class="nav-link navA">전체</button>
							<button class="nav-link navB">회원</button>
							<button class="nav-link navC">관리자</button>					
						</div>
						
						<div class="right">
							<select id="authority" name="authority">
								<option value="entire">전체</option>
								<option value="member">회원</option>
								<option value="administrator">관리자</option>				
							</select>
							<input type="search" placeholder="검색어를 입력하세요">
						</div>						
					</div>
					
					<table class="table table-hover board-list">
						<thead class="table-light">
							<tr>
								<th width="100">아이디</th>
								<th width="100">이름</th>
								<th width="100">그룹(역할)</th>
								<th width="100">활성화</th>								
								<th width="100">수정일자</th>	
								<th width="100"></th>																
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<td> admin </td>
								<td> 관리자 </td>
								<td> 관리자 </td>
								<td><i class="bi bi-circle"></i></td>
								<td> 2023-07-21 16:00:00</td>
								<td><button class="btn">정보수정</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
	
	<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
		const buttons = document.querySelectorAll(".left .nav-link");
		const defaultBtn = document.querySelector(".navA");
		
		if(defaultBtn) {
			defaultBtn.classList.add("active");
		}
		
		buttons.forEach((button) => {
			button.addEventListener("click", (event) => {
				const targetBtn = event.target.closest(".nav-link");
				if(!targetBtn) return;
				
				buttons.forEach((btn) => btn.classList.remove("active"));
				targetBtn.classList.add("active");
			});
		});
	});
	
	</script>

	<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp" />

	<jsp:include page="/WEB-INF/views/admin/layout/footerResources.jsp" />
</body>
</html>