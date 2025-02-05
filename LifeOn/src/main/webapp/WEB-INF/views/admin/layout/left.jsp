<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<nav class="vertical_nav">
	<ul id="js-menu" class="menu">
		<li class="menu--item" style="height: 380px; padding: 25px; background: #006AFF;">
			<div class="profile" style="width: 150px; height: 150px; border-radius: 70%; position: relative; overflow: hidden;">
				<img src="${pageContext.request.contextPath}/dist/images/profile.png" class="profileImage" style="width: 100%; height: 100%; object-fit: cover;" name="profileImage" id="profileImage" alt="프로필">
			</div>
			
			<div style="color: #FFF; padding: 30px 10px 10px 10px; line-height: 2;">
				<p style="font-size: 18px; font-weight: 600; margin: 0px;">관리자 님</p>
    			<p style="margin-bottom: 30px; font-size: 16px;">
    				안녕하세요!&emsp;
    				<a class="iconUpdate" href="" title="정보수정"><i class="bi bi-pencil-square"></i></a>
    			</p>
				<span>최근접속일자</span><br>
				<span style="font-size: 11px;">2025-01-23 16:02:34</span>
			</div>
		</li>

		<li class="menu--item">
			<a href="<c:url value='/admin' />" aria-current="page" class="menu--link" title="관리자홈">
				<span class="menu--label">관리자홈</span>
			</a>
		</li>
	
		<li class="menu--item">
	        <a href="<c:url value='/admin' />" class="menu--link" title="회원관리">
				<span class="menu--label">회원관리</span>
			</a>
		</li>
	
		<li class="menu--item">
	        <a href="#" class="menu--link" title="신고관리">
				<span class="menu--label">신고관리</span>
			</a>
		</li>
		
		<li class="menu--item">
	        <a href="#" class="menu--link" title="게시글관리">
				<span class="menu--label">게시글관리</span>
			</a>
		</li>
	
		<li class="menu--item">
	        <a href="#" class="menu--link" title="상품관리">
				<span class="menu--label">상품관리</span>
			</a>
		</li>
	
		<li class="menu--item">
	        <a href="#" class="menu--link" title="고객문의">
				<span class="menu--label">고객문의</span>
			</a>
		</li>
	</ul>
</nav>