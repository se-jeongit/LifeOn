<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

	<style type="text/css">
	.category-list ul { padding: 0; }
	.category-list li { list-style: none; }
	
	.menu-item { border-radius: 3px; background-color: #fff; border: 1px solid #ddd; margin-bottom: -1px; }
	.menu-link { display: block; color: #666; font-weight: 500px; cursor: pointer; padding: 10px 15px; }
	.menu-link:hover { color: #000; background: #e9e9e9; }
	.menu-item .opened { color: #fff; font-weight: 500; background-color: #337ab7; border-color: #337ab7; 
			border-bottom: 1px solid #ddd; border-color: #d5d5d5; border-radius: 3px; }
	
	.sub-menu { display: none; }
	.sub-menu .active { color: #000; }
	.sub-menu-item { cursor: pointer; padding: 10px 20px; background: #f8f9fa; }
	.sub-menu-link { font-weight: 500; color: #666; }
	.sub-menu-item:hover, .sub-menu-link:hover { color: #000; text-decoration: none; }
	</style>

	<script type="text/javascript">
		$(function(){
			$('ul.condition>li>a').click(function(){
				$('ul.condition>li>a').removeClass('text-danger');
				$(this).addClass('text-danger');
				
				$(this).closest('form[name=headerSearchForm]').find('input[name=searchField]').val($(this).attr('data-condition'));
				$(this).closest('div').find('button').text($(this).text());
			});
		});
	</script>
	
	<div class="container-fluid bg-light header-top">
		<div class="container">
			<div class="row align-items-center p-2">
				<div class="col">
					<div class="p-2">
						<i class="bi bi-telephone-inbound-fill"></i> +82-1234-1234
					</div>
				</div>

				<form name="headerSearchForm" class="col-6">
					<div class="input-group input-group-sm p-2">
						<button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">통합검색</button>
						<ul class="dropdown-menu condition">
							<li><a class="dropdown-item text-danger" href="#" data-condition="all">통합검색</a></li>
							<li><a class="dropdown-item" href="#" data-condition="best">베스트</a></li>
							<li><a class="dropdown-item" href="#" data-condition="special">기획전</a></li>
						</ul>
  
						<input type="text" name="searchWord" class="form-control me-1" placeholder="검색어를 입력하세요" aria-describedby="basic-addon1">
						<span class="input-group-text rounded" id="basic-addon1"><i class="bi bi-search"></i></span>
						<input type="hidden" name="searchField" value="all">
					</div>
				</form>
				
				<div class="col">
					<div class="d-flex justify-content-end">
						<div class="p-2">
							<a href="javascript:recentProductView();" title="최근 본 상품"><i class="bi bi-view-stacked"></i></a>
						</div>
						<div class="p-2">
							<a href="<c:url value='/'/>" title="장바구니"><i class="bi bi-cart"></i></a>
						</div>					
						<c:choose>
							<c:when test="${empty sessionScope.member}">
								<div class="p-2">
									<a href="javascript:dialogLogin();" title="로그인"><i class="bi bi-lock"></i></a>
								</div>
								<div class="p-2">
									<a href="<c:url value='/'/>" title="회원가입"><i class="bi bi-person-plus"></i></a>
								</div>	
							</c:when>
							<c:otherwise>
								<div class="p-2">
									<a href="<c:url value='/'/>" title="로그아웃"><i class="bi bi-unlock"></i></a>
								</div>					
								<div class="p-2">
									<a href="#" title="알림"><i class="bi bi-bell"></i></a>
								</div>
								<c:if test="${sessionScope.member.userLevel>50}">
									<div class="p-2">
										<a href="<c:url value='/admin'/>" title="관리자"><i class="bi bi-gear"></i></a>
									</div>					
								</c:if>
							</c:otherwise>
						</c:choose>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
	<nav class="navbar navbar-expand-lg navbar-light">
		<div class="container">
			<a class="navbar-brand" href="<c:url value='/'/>"><i class="bi bi-app-indicator"></i></a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
				
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto flex-nowrap">
					<li class="nav-item">
						<a class="nav-link" aria-current="page" href="<c:url value='/'/>">홈</a>
					</li>
					
					<li class="nav-item">
						<a class="nav-link" data-bs-toggle="offcanvas" href="#offcanvasCategory" aria-controls="offcanvasCategory">카테고리</a>
					</li>
	
					<li class="nav-item">
						<a class="nav-link" href="#">베스트</a>
					</li>

					<li class="nav-item">
						<a class="nav-link" href="#">오늘의 특가</a>
					</li>

					<li class="nav-item">
						<a class="nav-link" href="#">기획전</a>
					</li>
	
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							혜택
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">쿠폰</a></li>
							<li><a class="dropdown-item" href="#">이벤트</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">당첨자발표</a></li>
						</ul>
					</li>
					
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							고객센터
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">자주하는질문</a></li>
							<li><a class="dropdown-item" href="#">공지사항</a></li>
							<li><a class="dropdown-item" href="#">1:1문의</a></li>
							<li><a class="dropdown-item" href="#">고객의 소리</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">실시간 채팅 문의</a></li>
						</ul>
					</li>
					
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							마이페이지
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">주문내역/배송</a></li>
							<li><a class="dropdown-item" href="#">보유포인트</a></li>
							<li><a class="dropdown-item" href="#">쿠폰</a></li>
							<li><a class="dropdown-item" href="#">찜</a></li>
							<li><a class="dropdown-item" href="#">쪽지</a></li>
							<li><a class="dropdown-item" href="#">리뷰/Q&amp;A</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">정보수정</a></li>
						</ul>
					</li>
					
				</ul>
			</div>
			
		</div>
	</nav>
	
	<!-- Login Modal -->
	<script type="text/javascript">
		function dialogLogin() {
		    $('form[name=modelLoginForm] input[name=userId]').val('');
		    $('form[name=modelLoginForm] input[name=userPwd]').val('');
		    
			$('#loginModal').modal('show');	
			
		    $('form[name=modelLoginForm] input[name=userId]').focus();
		}
	
		function sendModelLogin() {
		    var f = document.modelLoginForm;
			var str;
			
			str = f.userId.value;
		    if(!str) {
		        f.userId.focus();
		        return;
		    }
		
		    str = f.userPwd.value;
		    if(!str) {
		        f.userPwd.focus();
		        return;
		    }
		
		    f.action = '${pageContext.request.contextPath}/';
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

	<div class="modal fade" id="loginModal" tabindex="-1"
			data-bs-backdrop="static" data-bs-keyboard="false" 
			aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="loginViewerModalLabel">Login</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
	                <div class="p-3">
	                    <form name="modelLoginForm" action="" method="post" class="row g-3">
	                    	<div class="mt-0">
	                    		 <p class="form-control-plaintext">계정으로 로그인 하세요</p>
	                    	</div>
	                        <div class="mt-0">
	                            <input type="text" name="userId" class="form-control" placeholder="아이디">
	                        </div>
	                        <div>
	                            <input type="password" name="userPwd" class="form-control" autocomplete="off" placeholder="패스워드">
	                        </div>
	                        <div>
	                            <div class="form-check">
	                                <input class="form-check-input" type="checkbox" id="rememberMeModel">
	                                <label class="form-check-label" for="rememberMeModel"> 아이디 저장</label>
	                            </div>
	                        </div>
	                        <div>
	                            <button type="button" class="btn btn-primary w-100" onclick="sendModelLogin();">Login</button>
	                        </div>
	                        <div>
	                    		 <p class="form-control-plaintext text-center">
	                    		 	<a href="#" class="text-decoration-none me-2">패스워드를 잊으셨나요 ?</a>
	                    		 </p>
	                    	</div>
	                    </form>
	                    <hr class="mt-3">
	                    <div>
	                        <p class="form-control-plaintext mb-0">
	                        	아직 회원이 아니세요 ?
	                        	<a href="${pageContext.request.contextPath}/" class="text-decoration-none">회원가입</a>
	                        </p>
	                    </div>
	                </div>
	        
				</div>
			</div>
		</div>
	</div>
	
	<!-- 좌측 카테고리 오프캔버스 -->
	<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasCategory" aria-labelledby="offcanvasCategoryLabel">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title" id="offcanvasCategoryLabel"><i class="bi bi-list-ul"></i> 상품 카테고리</h5>
			<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<div class="d-flex flex-column bd-highlight mt-3 mx-0 px-4">
				<ul class="category-list px-0"></ul>
			</div>
		</div>
	</div>
	
	<!-- 최근본 상품 목록 -->
	<style>
		.recentProduct-img { height: 150px; width: 150px; cursor: pointer; }
	</style>

	<div class="modal fade" id="recentProductViewModal" tabindex="-1" aria-labelledby="recentProductViewModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="recentProductViewModalLabel">최근본상품목록</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body modal-recentProductView">
	      	최근에 본 상품 목록이 없습니다.
	      </div>
	    </div>
	  </div>
	</div>
	
	<script type="text/javascript">
		function recentProductView() {
			// 최근본 상품 목록
		}
	</script>
		