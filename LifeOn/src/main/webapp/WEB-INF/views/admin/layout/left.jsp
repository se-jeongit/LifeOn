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

    	$('nav ul>.menu--item__has_sub_menu ul>li>a').each(function() {
    		if ($(this).attr('href') === '#' || ! $(this).attr('href').trim()) return true;
    		
    		let preUrl = url.substring(0, url.lastIndexOf('/'));
    		if (this.href.endsWith(preUrl)) {
    			$(this).addClass('active_menu');
    			return false;
    		}
    	});
        if($('nav ul>li>a').hasClass('active_menu')) return false;
    	
    	$('nav ul>.menu--item__has_sub_menu ul>li>a').each(function() {
    		if ($(this).attr('href') === '#' || ! $(this).attr('href').trim()) return true;
    		
    		let preUrl = url.substring(0, url.lastIndexOf('/'));
    		if(preUrl.lastIndexOf('/') === -1) return false;
    		preUrl = preUrl.substring(0, preUrl.lastIndexOf('/'));
    		
    		if ($(this).attr('href').startsWith(preUrl)) {
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
		<li class="menu--item" style="height: 400px; padding: 20px; margin-bottom: 10px; background: #006AFF;">
			<div class="profile" style="width: 150px; height: 150px; border-radius: 70%; position: relative; overflow: hidden;">
				<img src="${pageContext.request.contextPath}/dist/images/profile.png" class="profileImage" style="width: 100%; height: 100%; object-fit: cover;" name="profileImage" id="profileImage" alt="프로필">
			</div>
			
			<div style="color: #FFF;">
				<h5>관리자님</h5>
				<p>안녕하세요!</p><i class="bi bi-pen"></i>
				<span>최근접속일자</span>
				<p>2025-01-23 16:02:34</p>
			</div>
		</li>
		

		<li class="menu--item">
			<a href="<c:url value='/admin' />" class="menu--link" title="관리자홈">
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