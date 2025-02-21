<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/forms.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/board.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/boot-board.css" type="text/css">

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

<script type="text/javascript">
function check() {
    const f = document.boardForm;
    let str;
	
    str = f.subject.value.trim();
    if( !str ) {
        alert('제목을 입력하세요. ');
        f.subject.focus();
        return false;
    }

    str = f.content.value.trim();
    if( !str || str === '<p><br></p>') {
        alert('내용을 입력하세요. ');
        f.content.focus();
        return false;
    }

    f.action =  '${pageContext.request.contextPath}/lounge1/${bdtype}/write';
    
    return true;
}
</script>
<!--  
<c:if test="${empty sessionScope.member}">
    <script type="text/javascript">
        alert('로그인 후 이용해 주세요.');
        location.href = '${pageContext.request.contextPath}/login';  // 로그인 페이지로 리디렉션
    </script>
</c:if>
-->
</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>
	
<main class="d-flex flex-column min-vh-100 align-items-center" style="padding-top: 66px;">
    <div class="container">
		<div class="body-container">
		  <div class="body-title">
			<i class="bi bi-app"></i> 
			<c:choose>
				<c:when test="${bdtype == 'room'}">인테리어</c:when> 
				<c:when test="${bdtype == 'recipe'}">자취 레시피</c:when> 
			</c:choose>
			</div>
			
			<div class="body-main">
				<form name="boardForm" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/lounge1/write/${bdtype}">
					<table class="table mt-3 write-form">
						<tr>
							<td class="col-sm-2" scope="row">제 목</td>
							<td>
								<input type="text" name="subject" maxlength="100" class="form-control" value="${dto.subject}">
							</td>
						</tr>
						
						<tr>
							<td class="col-sm-2" scope="row"> 작성자명 </td>
							<td>
								<p class="form-control-plaintext">${sessionScope.member.nickName}</p>
							</td>
						</tr>
						
						<tr>
							<td class="col=sm-2" scope="row">내 용</td>
							<td>
								<textarea name="content" id="ir1" class="form-control">${dto.content}</textarea>
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
								<p class="form-control-plaintext">
								<c:if test="${not empty dto.ssfname}">
									<a href="javascript:deleteFile('${dto.num}')"><i class="bi bi-trash"></i></a>
									${dto.cpfname}
								</c:if>
								&nbsp;
								</p>
							</td>
						</tr>
					</table>
					<table class="table table-borderless">
						<tr>
							<td class="text-center">
								<button type="button" class="btn btn-dark" onclick="submitContents(this.form);">${mode == "update" ? "수정완료" : "등록완료"}</button>
								<button type="reset" class="btn btn-light">다시입력</button>
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/#';">${mode == "update" ? "수정취소" : "등록취소"}</button>
							
								<c:if test="${mode == 'update'}">
									<input type="hidden" name="num" value="${dto.num}">
									<input type="hidden" name="saveFilename" value="${dto.ssfname}">
									<input type="hidden" name="originalFilename" value="${dto.cpfname}">
									<input type="hidden" name="page" value="${page}">
								</c:if>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
    </div>
</main>

<c:if test="${mode == 'update'}">
	<script type="text/javascript">
		function deleteFile(num) {
			if (! confirm('파일을 삭제 하시겠습니까?')) {
				return;
			}
			
			let url = '${pageContext.request.contextPath}/lounge/${bdtype}/deleteFile?num=' + num + '&page=${page}';
			location.href = url;
		}
	</script>
</c:if>

<script type="text/javascript" src="${pageContext.request.contextPath}/dist/vendor/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: 'ir1',
	sSkinURI: '${pageContext.request.contextPath}/dist/vendor/se2/SmartEditor2Skin.html',
	fCreator: 'createSEditor2',
	fOnAppLoad: function(){
		// 로딩 완료 후
		oEditors.getById['ir1'].setDefaultFont('돋움', 12);
	},
});

function submitContents(elClickedObj) {
	 oEditors.getById['ir1'].exec('UPDATE_CONTENTS_FIELD', []);
	 try {
		if(! check()) {
			return;
		}
		
		elClickedObj.submit();
		
	} catch(e) {
	}
}
</script>


<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>