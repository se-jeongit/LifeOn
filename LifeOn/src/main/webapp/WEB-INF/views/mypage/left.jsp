<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
// 메뉴 활성화
$(function(){
    var url = window.location.pathname;
    var urlRegExp = new RegExp(url.replace(/\/$/, '') + "$");
    
    try {
        $('nav ul>li>a').each(function() {
            if (urlRegExp.test(this.href.replace(/\/$/, ''))) {
                $(this).addClass('active_menu');
                return false;
            }
        });
        if ($('nav ul>li>a').hasClass('active_menu')) return false;

        var parent = url.replace(/\/$/, '').substring(0, url.replace(/\/$/, '').lastIndexOf('/'));
        if (!parent) parent = '/';
        var urlParentRegExp = new RegExp(parent);
        
        $('nav ul>li>a').each(function() {
            if ($(this).attr('href') === '#' || ! $(this).attr('href').trim()) return true;

            var phref = this.href.replace(/\/$/, '').substring(0, this.href.replace(/\/$/, '').lastIndexOf('/'));

            if (urlParentRegExp.test(phref)) {
                $(this).addClass('active_menu');
                return false;
            }
        });
        
        if($('nav ul>li>a').hasClass('active_menu')) return false;
        
    }catch(e) {
    }
});
</script>

<nav class="vertical_nav">
	<ul id="js-menu" class="menu">
		<li class="menu--item" style="height: 380px; padding: 25px; background: #006AFF;">
			<div class="profile" style="width: 150px; height: 150px; border-radius: 70%; position: relative; overflow: hidden;">
				<img src="${sessionScope.member.profile_image}" class="profileImage" style="width: 100%; height: 100%; object-fit: cover;" name="profileImage" id="profileImage" alt="프로필">
			</div>
			
			<div style="color: #FFF; padding: 30px 10px 10px 10px; line-height: 2;">
				<p style="font-size: 18px; font-weight: 600; margin: 0px;">${sessionScope.member.nickName} 님</p>
    			<p style="margin-bottom: 30px; font-size: 16px;">
    				안녕하세요!&emsp;
    				<a class="iconUpdate" href="<c:url value='/member/pwd'/>" title="정보수정"><i class="bi bi-pencil-square"></i></a>
    			</p>
				<span>최근접속일자</span><br>
				<span style="font-size: 11px;">${sessionScope.member.last_login}</span>
			</div>
		</li>

		<li class="menu--item">
			<a href="<c:url value='/point/mypage' />" aria-current="page" class="menu--link" title="포인트내역">
				<span class="menu--label">포인트내역</span>
			</a>
		</li>
	
		<li class="menu--item">
	        <a href="<c:url value='#' />" class="menu--link" title="주문/배송">
				<span class="menu--label">주문/배송</span>
			</a>
		</li>
	
		<li class="menu--item">
	        <a href="<c:url value='/mypage/seller/info' />" class="menu--link" title="판매관리">
				<span class="menu--label">판매관리</span>
			</a>
		</li>
		
		<li class="menu--item">
	        <a href="#" class="menu--link" title="관심상품">
				<span class="menu--label">관심상품</span>
			</a>
		</li>
	
		<li class="menu--item">
	        <a href="#" class="menu--link" title="즐겨찾기">
				<span class="menu--label">즐겨찾기</span>
			</a>
		</li>
	
		<li class="menu--item">
	        <a href="#" class="menu--link" title="오픈톡">
				<span class="menu--label">오픈톡</span>
			</a>
		</li>
		<li class="menu--item">
	        <a href="#" class="menu--link" title="나의문의">
				<span class="menu--label">나의문의</span>
			</a>
		</li>
	</ul>
</nav>