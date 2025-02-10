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
						<i class="bi bi-app"></i> 신고관리
					</h3>
				</div>

				<div class="body-main">
					<div class="body-middle">
						<div class="left">
							<p>	신고목록 | 전체 0건											
						</div>		
					</div>
					
					<table class="table table-hover board-list">
						<thead class="table-light">
							<tr>
								<th width="70">번호</th>
								<th width="100">신고일</th>
								<th>신고 내용</th>
								<th width="100">신고자</th>								
								<th width="100">처리일</th>	
								<th width="100">처리 여부</th>																
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<td> 1 </td>
								<td> 24-05-05 </td>
								<td><a href="#">사이트 너무 맘에안들어요</a></td>
								<td> 홍길동</td>
								<td> 2023-07-21 16:00:00</td>
								<td> 처리 완료</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>

	<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp" />

	<jsp:include page="/WEB-INF/views/admin/layout/footerResources.jsp" />
</body>
</html>