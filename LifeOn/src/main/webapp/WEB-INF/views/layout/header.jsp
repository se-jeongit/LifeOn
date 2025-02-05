<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<script type="text/javascript">
	$(function(){
		$('ul.condition>li>a').click(function(){
			$('ul.condition>li>a').removeClass('text-danger');
			$(this).addClass('text-danger');
			
			$(this).closest('form[name=headerSearchForm]').find('input[name=searchField]').val($(this).attr('data-condition'));
			$(this).closest('div').find('button').text($(this).text());
		});
	});
	
	window.addEventListener('load', () => {
		const inputEL = document.querySelector('form input[name=searchWord]'); 
		inputEL.addEventListener('keydown', function (evt) {
		    if(evt.key === 'Enter') {
		    	evt.preventDefault();
		    	
		    	searchHeader();
		    }
		});
	});
		
	function searchHeader() {
		const f = document.headerSearchForm;
		
		const formData = new FormData(f);
		let requestParams = new URLSearchParams(formData).toString();

		let url = '${pageContext.request.contextPath}/search';
		location.href = url + '?' + requestParams;
	}		
</script>

<nav class="navbar navbar-expand-lg navbar-light fixed-top">
	<div class="container">
	
		<!-- 로고 이미지 -->
		<a class="navbar-brand" href="<c:url value='/'/>">
			<img src="${pageContext.request.contextPath}/dist/images/logo.png" alt="logo" style="width: 100px; height: 40px; object-fit: cover;">
		</a>
		
		<!-- 네비게이션 토글 -->
		<button class="navbar-toggler" style="text-align: left;" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<!-- 카테고리 메뉴 -->
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav flex-nowrap">
				<li class="nav-item">
					<a class="nav-link" aria-current="page" href="#">홈</a>
				</li>
				
				<li class="nav-item">
					<a class="nav-link" href="<c:url value='/'/>">라운지</a>
				</li>

				<li class="nav-item">
					<a class="nav-link" href="<c:url value='/'/>">마켓</a>
				</li>

				<li class="nav-item">
					<a class="nav-link" href="<c:url value='/'/>">지역정보</a>
				</li>

				<li class="nav-item">
					<a class="nav-link" href="<c:url value='/'/>">정책정보</a>
				</li>
			</ul>
		</div>
			
		<div class="d-flex justify-content-end" style="align-items: center;">
			<!-- 검색창 -->
			<form name="headerSearchForm">
				<div class="input-group input-group-sm py-2 me-4">
					<input type="text" name="searchWord" style="height: 30px; border: 2px solid #006AFF; border-right: none; border-top-left-radius: 7px; border-bottom-left-radius: 7px; padding: 7px; padding: 7px; font-size: 12px;" placeholder="검색어를 입력하세요" aria-describedby="basic-addon1" value="${searchWord}">
					<span class="input-group-text" style="height: 30px; background: #FFF; border: 2px solid #006AFF; border-left: none; border-top-right-radius: 7px; border-bottom-right-radius: 7px; padding: 7px; cursor: pointer;" id="basic-addon1" onclick="searchHeader();"><i class="bi bi-search"></i></span>
					<input type="hidden" name="searchField" value="all">
				</div>
			</form>
			
			<c:choose>
				<c:when test="${empty sessionScope.member}">
					<div class="p-2">
						<a href="javascript:dialogLogin()"  style="text-decoration: none;">로그인</a>
					</div>
					<div class="p-2">
						<a href="<c:url value='/member/join'/>" style="text-decoration: none;">회원가입</a>
					</div>	
					<div class="p-2">
						<a href="<c:url value='/help'/>" style="text-decoration: none;">고객센터</a>
					</div>	
				</c:when>
				<c:otherwise>
					<div class="p-2">
						<a href="<c:url value='/'/>" title="즐겨찾기"><i class="bi bi-bookmark"></i></a>
					</div>	
					<div class="p-2">
						<a href="<c:url value='/'/>" title="관심상품"><i class="bi bi-heart"></i></a>
					</div>
					
					<form name="profileForm" method="post" enctype="multipart/form-data">
						<div class="p-2 profile">
							<a href="<c:url value='/member/mypage'/>">
								<img src="#"  class="profileImage" name="profileImage" id="profileImage" alt="프로필">
							</a>
						</div>	
					</form>
						
					<div class="p-2">
						<a href="<c:url value='/member/logout'/>" style="text-decoration: none;">로그아웃</a>
					</div>	
					<div class="p-2">
						<a href="<c:url value='/'/>" style="text-decoration: none;">고객센터</a>
					</div>	
								
					<c:if test="${sessionScope.member.grade >= 1}">
						<div class="p-2">
							<a href="<c:url value='/admin'/>" title="관리자페이지"><i class="bi bi-gear"></i></a>
						</div>					
					</c:if>
				</c:otherwise>
			</c:choose>
			
		</div>
	</div>
</nav>
	
<!-- 로그인 모달 -->
<script type="text/javascript">
	function dialogLogin() {
	    $('form[name=modelLoginForm] input[name=id]').val('');
	    $('form[name=modelLoginForm] input[name=pwd]').val('');
	    
		$('#loginModal').modal('show');	
		
	    $('form[name=modelLoginForm] input[name=id]').focus();
	}

	function sendModelLogin() {
	    var f = document.modelLoginForm;
		var str;
		
		str = f.id.value;
	    if(!str) {
	        f.id.focus();
	        return;
	    }
	
	    str = f.pwd.value;
	    if(!str) {
	        f.pwd.focus();
	        return;
	    }
	
	    f.action = '${pageContext.request.contextPath}/member/login';
	    f.submit();
	}

	$(function(){
		$('#loginModal').on('hide.bs.modal', function() {
			$('button, input, select, textarea').each(function(){
				$(this).blur();
			});

			
		});
	});
		
</script>

<div class="modal fade" id="loginModal" tabindex="-1" data-bs-backdrop="false" aria-labelledby="loginModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header" style="padding-left: 70px; border: none;">
				<div class="modal-title" id="loginViewerModalLabel">
					<img src="${pageContext.request.contextPath}/dist/images/logo.png" alt="logo" style="width: 150px; height: 60px; object-fit: cover;">
				</div>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="p-3">
					<form name="modelLoginForm" action="" method="post" class="row g-3">
						<div class="mt-0">
							<input type="text" name="id" class="form-control" placeholder="아이디">
						</div>
						<div style="margin-top: 7px;">
							<input type="password" name="pwd" class="form-control" autocomplete="off" placeholder="비밀번호">
						</div>
						<div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="rememberMeModel">
								<label class="form-check-label" style="font-size: 12px;" for="rememberMeModel"> 아이디 저장</label>
							</div>
						</div>
						<div>
							<button type="button" class="btn w-100" style="background: #006AFF; color: #fff;" onclick="sendModelLogin();">로그인</button>
						</div>
						<div>
							<p class="form-control-plaintext text-center">
								<a href="${pageContext.request.contextPath}/member/idFind" class="text-decoration-none" style="font-size: 12px;">아이디찾기</a> |
								<a href="${pageContext.request.contextPath}/member/pwdFind" class="text-decoration-none" style="font-size: 12px;">비밀번호재설정</a> |
								<a href="${pageContext.request.contextPath}/member/join" class="text-decoration-none" style="font-size: 12px;">회원가입</a>
							</p>
							<p class="form-control-plaintext text-center">
								<a href="${pageContext.request.contextPath}/member/faq" class="text-decoration-none" style="font-size: 12px; color: #7F7F7F;">로그인에 문제가 있으신가요?</a>
							</p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>