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

<style type="text/css">
.body-title{
	width: 80%;
	max-width: 900px;
	margin : auto;
	margin-top: 40px;
}

.write-form{
	width: 80%;
	max-width: 900px;
	margin : auto;
}

td[scope="row"] {
	text-align : center;
	vertical-align: middle;
	background-color:#FBFBFB;
}
</style>
</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>
	
<main class="d-flex flex-column min-vh-100 align-items-center" style="padding-top: 66px;">
    <div class="container">
		<div class="body-container">
			<div class="body-title">
				<h3><i class="bi bi-app"></i> 정책정보</h3>
			</div>
			
			<div class="body-main">
				<form name="boardForm" method="post">
					<table class="table mt-3 write-form">
						<tr>
							<td class="col-sm-2" scope="row">제 목</td>
							<td>
								<input type="text" name="subject" maxlength="100" class="form-control">
							</td>
						</tr>
						
						<tr>
							<td class="col-sm-2" scope="row"> 작성자명 </td>
							<td>
								<p class="form-control-plaintext"></p>
							</td>
						</tr>
						
						<tr>
							<td class="col=sm-2" scope="row">내 용</td>
							<td>
								<textarea name="content" class="form-control"></textarea>
							</td>
						</tr>
						
						<tr>
							<td class="col-sm-2" scope="row">첨 부</td>
							<td>
								<input type="file" name="selectFile" class="form-control">			
							</td>
						</tr>
						
						<tr>
							<td class="col-sm-2" scope="row">첨부된파일</td>
							<td>
								<p class="form-control-plaintext">&nbsp;
							</td>
						</tr>
					</table>
					<table class="table table-borderless">
						<tr>
							<td class="text-center">
								<button type="reset" class="btn">다시 입력</button>
								<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/policy/list';"><i class="bi bi-x"></i>등록</button>
							</td>
						</tr>
					</table>
				</form>
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