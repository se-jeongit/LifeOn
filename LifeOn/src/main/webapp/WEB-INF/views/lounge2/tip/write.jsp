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
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/free.css" type="text/css">

</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/lounge2/layout/menu.jsp"/>
</header>
	
<script type="text/javascript">
function check() {
    const f = document.freeForm;
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

    f.action = '${pageContext.request.contextPath}/lounge2/tip/${mode}';
    f.submit();
    // return true;
}
</script>
	
<main class="min-vh-100">
	<!-- 배너 -->
    <div class="body-title">
    	<h3 style="margin: 0px;">생활의 도움을 받아볼까?</h3>
	</div>
	
	<div class="body-container">
		<div class="body-content">
			<aside class="sidenav">
				<div class="leftBox">
					<p>❤️최신순❤️</p>
					<p>❤️조회순❤️</p>
					<p>❤️즐겨찾기순❤️</p>
				</div>
			</aside>
			
			<div class="main_content" style="margin-top: 60px;">
				<form name="freeForm" class="freeForm" method="post" enctype="multipart/form-data">
					<table class="table write-form">
						<tr>
							<td scope="row" style="vertical-align: middle;">제&emsp;목</td>
							<td>
								<input type="text" name="subject" maxlength="100" class="free-control" placeholder="제목을 작성해주세요." value="${dto.subject}">
								<input type="hidden" class="form-control-plaintext" value="${sessionScope.member.nickName}">
							</td>
						</tr>
	
						<tr>
							<td scope="row" style="padding-top: 20px;">내&emsp;용</td>
							<td>
								<textarea name="content" placeholder="내용을 작성해주세요." class="free-control" style="height: 200px;">${dto.content}</textarea>
							</td>
						</tr>
						
						<tr>
							<td scope="row" style="vertical-align: middle;">이미지</td>
							<td>
								<div class="img-grid"><img class="item img-add rounded" src="${pageContext.request.contextPath}/dist/images/add_photo.png"></div>
								<input type="file" name="selectFile" accept="image/*" multiple style="display: none;" class="free-control">
							</td>
						</tr>
						
						<c:if test="${mode=='update'}">
							<tr>
								<td class="bg-light col-sm-2" scope="row">등록이미지</td>
								<td> 
									<div class="img-box">
										<c:forEach var="dto" items="${list}">
											<img src="${pageContext.request.contextPath}/uploads/tip/${dto.ssfname}"
												class="delete-img"
												data-fileNum="${dto.fnum}">
										</c:forEach>
									</div>
								</td>
							</tr>
						</c:if>
					</table>
					
					<table class="table table-borderless">
	 					<tr>
							<td class="text-center">
								<button type="button" class="btn" onclick="check();">${mode=='update'?'수정완료':'등록완료'}&nbsp;<i class="bi bi-check2"></i></button>
								<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/lounge2/tip';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
								<c:if test="${mode=='update'}">
									<input type="hidden" name="num" value="${dto.num}">
									<input type="hidden" name="psnum" value="${dto.psnum}">
									<input type="hidden" name="page" value="${page}">
								</c:if>
							</td>
						</tr>
					</table>
				</form>
			</div>
			
			<aside class="sidebar">
				<div class="rightBox">
					<p>❤️검색순위❤️</p>
					<button type="button" class="btn top_btn" onclick="location.href='<c:url value=''/>'">TOP</button>
				</div>
				<div style="display: flex; align-items: center; margin: 0 20px;">
					<!-- 검색상자 -->
					<input type="search" class="input-group searchBox">
					
					<!-- 검색버튼 -->
				   	<button class="input-group btn mybtn">검색</button>
				</div>
			</aside>
		</div>
	</div>
				
	<c:if test="${mode=='update'}">
		<script type="text/javascript">
			$(function(){
				$('.delete-img').click(function(){
					if(! confirm('이미지를 삭제 하시겠습니까 ?')) {
						return false;
					}
					
					let $img = $(this);
					let fileNum = $img.attr('data-fileNum');
					let url = '${pageContext.request.contextPath}/lounge2/tip/deleteFile';
	
					$.ajaxSetup({ beforeSend: function(e) { e.setRequestHeader('AJAX', true); } });
					$.post(url, {fileNum:fileNum}, function(data){
						$img.remove();
					}, 'json').fail(function(jqXHR){
						console.log(jqXHR.responseText);
					});
	
				});
			});
		</script>
	</c:if>

<script type="text/javascript">
window.addEventListener('DOMContentLoaded', evt => {
	var sel_files = [];
	
	const viewerEL = document.querySelector('.write-form .img-grid');
	const imgAddEL = document.querySelector('.write-form .img-add');
	const inputEL = document.querySelector('form[name=freeForm] input[name=selectFile]');
	
	imgAddEL.addEventListener('click', ev => {
		inputEL.click();
	});
	
	inputEL.addEventListener('change', ev => {
		if(! ev.target.files) {
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			document.freeForm.selectFile.files = dt.files;
			
	    	return;
	    }
		
        for(let file of ev.target.files) {
        	sel_files.push(file);
        	
        	let node = document.createElement('img');
        	node.classList.add('item', 'img-item');
        	node.setAttribute('data-filename', file.name);

        	const reader = new FileReader();
            reader.onload = e => {
            	node.setAttribute('src', e.target.result);
            };
			reader.readAsDataURL(file);
        	
			viewerEL.appendChild(node);
        }
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		
		document.freeForm.selectFile.files = dt.files;		
	});
	
	viewerEL.addEventListener('click', (e)=> {
		if(e.target.matches('.img-item')) {
			if(! confirm('선택한 파일을 삭제 하시겠습니까 ?')) {
				return false;
			}
			
			let filename = e.target.getAttribute('data-filename');
			
		    for(let i = 0; i < sel_files.length; i++) {
		    	if(filename === sel_files[i].name){
		    		sel_files.splice(i, 1);
		    		break;
				}
		    }
		
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			document.freeForm.selectFile.files = dt.files;
			
			e.target.remove();
		}
	});	
});
</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/dist/vendor/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
/*
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: 'ir1',
	sSkinURI: '${pageContext.request.contextPath}/dist/vendor/se2/SmartEditor2Skin.html',
	fCreator: 'createSEditor2',
	fOnAppLoad: function(){
		// 로딩 완료 후
		oEditors.getById['ir1'].setDefaultFont('돋음', 12);
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
*/
</script>
</main>

<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>