﻿<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>spring</title>

<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>

<style type="text/css">
.body-container {
	max-width: 850px;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/boot-board.css" type="text/css">

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

    f.action = '${pageContext.request.contextPath}/tip/${mode}';
    
    return true;
}
</script>
</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>
	
<main>
	<div class="container">
		<div class="body-container">	
			<div class="body-title">
				<h3><i class="bi bi-app"></i> 게시판 </h3>
			</div>
			
			<div class="body-main">

				<form name="boardForm" method="post" enctype="multipart/form-data">
					<table class="table mt-5 write-form">
						<tr>
							<td class="bg-light col-sm-2" scope="row">제 목</td>
							<td>
								<input type="text" name="subject" maxlength="100" class="form-control" value="${dto.subject}">
							</td>
						</tr>
	        
						<tr>
							<td class="bg-light col-sm-2" scope="row">작성자명</td>
	 						<td>
								<p class="form-control-plaintext">${sessionScope.member.userName}</p>
							</td>
						</tr>
	
						<tr>
							<td class="bg-light col-sm-2" scope="row">내 용</td>
							<td>
								<textarea name="content" id="ir1" class="form-control" style="width: 99%; height: 300px;">${dto.content}</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="bg-light col-sm-2" scope="row">첨 부</td>
							<td>
								<input type="file" name="selectFile" class="form-control">
							</td>
						</tr>
						
						<c:if test="${mode == 'update'}">
							<tr>
								<td class="bg-light col-sm-2" scope="row">첨부된파일</td>
								<td>
									<p class="form-control-plaintext">
										<c:if test="${not empty dto.saveFilename}">
											<a href="javascript:deleteFile('${dto.num}')"><i class="bi bi-trash"></i></a>
											${dto.originalFilename}
										</c:if>
										&nbsp;
									</p>
								</td>
							</tr>
						</c:if>
						
					</table>
					
					<table class="table table-borderless">
	 					<tr>
							<td class="text-center">
								<button type="button" class="btn btn-dark" onclick="submitContents(this.form);">${mode == "update" ? "수정완료" : "등록완료"}&nbsp;<i class="bi bi-check2"></i></button>
								<button type="reset" class="btn btn-light">다시입력</button>
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/bbs/list';">${mode == "update" ? "수정취소" : "등록취소"}&nbsp;<i class="bi bi-x"></i></button>
							
								<c:if test="${mode == 'update'}">
									<input type="hidden" name="num" value="${dto.num}">
									<input type="hidden" name="saveFilename" value="${dto.saveFilename}">
									<input type="hidden" name="originalFilename" value="${dto.originalFilename}">
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
			
			let url = '${pageContext.request.contextPath}/bbs/deleteFile?num=' + num + '&page=${page}';
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

<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>