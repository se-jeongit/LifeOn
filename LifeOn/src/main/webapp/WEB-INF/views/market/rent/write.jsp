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
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/market.css" type="text/css">

<script type="text/javascript">
function check() {
    const f = document.rentForm;
    let str;
    
    str = f.pname.value.trim();
    if(! str) {
        alert('물품명을 입력하세요.');
        f.pname.focus();
        return false;
    }
    
    oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", [])
    str = f.pct.value.trim();
    if(! str || str === '<p><br></p>') {
        alert('물품상세설명을 입력하세요.');
        oEditors.getById["ir1"].exec("FOCUS")
        return false;
    }
	
    str = f.pphFile.value;
    if(! f.pphFile.value) {
        alert('썸네일 이미지를 등록해주세요.');
        f.pphFile.focus();
        return false;
    }

    f.action = '${pageContext.request.contextPath}/market/rent/${mode}';
    
    return true;
}
</script>
</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/market/layout/menu.jsp"/>
</header>
	
<main class="min-vh-100">
	<!-- 배너 -->
    <div class="body-title">
    	<em style="font-size: 30px; font-weight: 800; text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);">방치되고 있는 물건을 빌려주세요!</em>
	</div>
	
	<div class="body-container">
		<div class="rent_container">
			<form name="rentForm" class="rentForm" method="post" enctype="multipart/form-data">
				<table class="table rent_table">
					<tr>
						<td scope="row">물품명</td>
						<td colspan="2">
							<div>
								<input type="text" name="pname" maxlength="100" class="rent-control" placeholder="물품명을 입력해주세요" value="${dto.pname}">
								<input type="hidden" class="form-control-plaintext" value="${sessionScope.member.num}">
	                        </div>
						</td>
						
	                   	<td>
	                        <div style="display: flex; justify-content: flex-start;">
		                        <select class="rent-select">
			                    	<option value="" disabled selected>대분류 선택</option>
		                        	<c:forEach var="main" items="${listCategory}">
			                            <option value="">${main.cbc}</option>
			                    	</c:forEach>
	                        	</select>
		                        <select class="rent-select">
		                            <option value="" disabled selected>소분류 선택</option>
		                            <c:forEach var="main" items="${listCategory}">
		                          		<c:forEach var="sub" items="${main.listSub}">
		                            		<option value="">${sub.csc}</option>
		                            	</c:forEach>
		                            </c:forEach>
		                        </select>
	                        </div>
						</td>
					</tr>

					<tr>
						<td scope="row" style="vertical-align: top; padding-top: 20px;">상세설명</td>
						<td colspan="3">
							<textarea name="pct" id="ir1" placeholder="물품상세설명을 작성해주세요." class="form-control" style="width: 100%; height: 400px;">${dto.pct}</textarea>
						</td>
					</tr>
					
					<tr>
						<td scope="row" style="vertical-align: top; padding-top: 20px;">썸네일이미지</td>
						<td width="10%" style="vertical-align: top;">
							<div class="thumbnail-wrap">
								<div class="thumbnail">
								 	<img src=""  class="thumbnailImage" name="thumbnailImage" id="thumbnailImage" alt="썸네일">
			                        <input type="file" name="pphFile" id="pphFile" accept="image/*" style="display: none;">
								</div>
							</div>
						</td>
						<td scope="row" width="15%" style="vertical-align: top; padding-top: 20px;">추가이미지</td>
						<td colspan="3">
							<div class="img-grid"><img class="item img-add rounded" src="${pageContext.request.contextPath}/dist/images/add_photo.png"></div>
							<input type="file" name="selectFile" accept="image/*" multiple style="display: none;" class="rent-control">
						</td>
					</tr>
					
					<tr>
					</tr>
					
					<c:if test="${mode=='update'}">
						<tr>
							<td scope="row">등록이미지</td>
							<td colspan="3"> 
								<div class="img-box">
									<c:forEach var="vo" items="${listFile}">
										<img src="${pageContext.request.contextPath}/uploadPath/rent/${vo.ppp}"
											class="delete-img"
											data-fileNum="${vo.ppnum}">
									</c:forEach>
								</div>
							</td>
						</tr>
					</c:if>
					
				</table>
				
				<table class="table table-borderless">
					<tr>
						<td class="text-center" colspan="3">
							<button type="button" class="ssbtn" onclick="check();">${mode=='update'?'수정완료':'등록완료'}&nbsp;<i class="bi bi-check2"></i></button>
							<button type="button" class="ssbtn" onclick="location.href='${pageContext.request.contextPath}/market/rent/main';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
	
							<c:if test="${mode == 'update'}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="psnum" value="${dto.psnum}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</main>

<c:if test="${mode=='update'}">
	<script type="text/javascript">
		$(function(){
			$('.delete-img').click(function(){
				if(! confirm('이미지를 삭제 하시겠습니까 ?')) {
					return false;
				}
				
				let $img = $(this);
				let ppnum = $img.attr('data-fileNum');
				let url = '${pageContext.request.contextPath}/market/rent/deleteFile';

				$.ajaxSetup({ beforeSend: function(e) { e.setRequestHeader('AJAX', true); } });
				$.post(url, {ppnum:ppnum}, function(data){
					$img.remove();
				}, 'json').fail(function(jqXHR){
					console.log(jqXHR.responseText);
				});

			});
		});
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

<script type="text/javascript">
$(function() {
    let imgName = '${dto.ppnum}';
    
    // 초기 썸네일 설정
    if (imgName) {
        let imgSrc = '${pageContext.request.contextPath}/uploadPath/rent/${vo.ppp}';
        $('#thumbnailImage').attr('src', imgSrc);  // img 태그의 src 속성으로 이미지 설정
    } else {
        $('#thumbnailImage').attr('src', '${pageContext.request.contextPath}/dist/images/add_photo.png');
    }
    
    // 이미지 클릭 시 파일 선택 창 열기
    $('#thumbnailImage').click(function(){
        $('form[name=rentForm] input[name=pphFile]').trigger('click');
    });
    
    // 파일 선택 후 이미지 변경
    $('form[name=rentForm] input[name=pphFile]').change(function(){
        let file = this.files[0];
        
        // 파일이 없으면 초기 이미지
        if (! file) {
            $('#thumbnailImage').attr('src', '${pageContext.request.contextPath}/dist/images/add_photo.png');
            return false;
        }
        
        // 이미지 파일만 처리
        if (! file.type.match('image.*')) {
            this.focus();
            return false;
        }
        
        // 선택된 파일을 미리보기로 설정
        let reader = new FileReader();
        reader.onload = function(e) {
            $('#thumbnailImage').attr('src', e.target.result);  // 미리보기 이미지로 설정
        }
        reader.readAsDataURL(file);
    });
});

window.addEventListener('load', () => {
	const dateELS = document.querySelectorAll('form input[type=date]');
	dateELS.forEach( inputEL => inputEL.addEventListener('keydown', e => e.preventDefault()) );
});
  
window.addEventListener('DOMContentLoaded', evt => {
	var sel_files = [];
	
	const viewerEL = document.querySelector('.rent_table .img-grid');
	const imgAddEL = document.querySelector('.rent_table .img-add');
	const inputEL = document.querySelector('form[name=rentForm] input[name=selectFile]');
	
	imgAddEL.addEventListener('click', ev => {
		inputEL.click();
	});
	
	inputEL.addEventListener('change', ev => {
		if(! ev.target.files) {
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			document.rentForm.selectFile.files = dt.files;
			
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
		
		document.rentForm.selectFile.files = dt.files;		
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
			document.rentForm.selectFile.files = dt.files;
			
			e.target.remove();
		}
	});	
});
</script>

<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>