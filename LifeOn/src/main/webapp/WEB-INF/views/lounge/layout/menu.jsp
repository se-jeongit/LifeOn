<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.nav-scroller {
	display: flex;
	align-items: center;
	justify-content: flex-start;
	
	margin-top: 66px;
	height: 60px;
	color: #222;
	border-top: 1px solid #D9D9D9;
	border-bottom: 1px solid #D9D9D9;
}
.nav-link {
	color: #222;
}

.nav-link:hover, .nav-link.active {
	color: #006AFF;
	text-decoration: none;
}

</style>

<script type="text/javascript">
$(function(){
    var url = window.location.pathname;
    var urlRegExp = new RegExp(url.replace(/\/$/, '') + "$");

    try {
        $('nav .nav-link').each(function() {
            if (urlRegExp.test(this.href.replace(/\/$/, ''))) {
                $(this).addClass('active');
                return false;
            }
        });

        if (!$('nav .nav-link').hasClass('active')) {
            var parent = url.replace(/\/$/, '').substring(0, url.replace(/\/$/, '').lastIndexOf('/'));
            if (!parent) parent = '/';
            var urlParentRegExp = new RegExp(parent);
            
            $('nav .nav-link').each(function() {
                if ($(this).attr('href') === '#' || !$(this).attr('href').trim()) return true;
                var phref = this.href.replace(/\/$/, '').substring(0, this.href.replace(/\/$/, '').lastIndexOf('/'));
                if (urlParentRegExp.test(phref)) {
                    $(this).addClass('active');
                    return false;
                }
            });
        }
        
    } catch (e) {
        console.error(e);
    }

    $('nav .nav-link').on('click', function() {
        $('nav .nav-link').removeClass('active');
        $(this).addClass('active');
    });
});
</script>

<div class="nav-scroller">
	<nav class="container nav" aria-label="navigation">
		<a class="nav-link" aria-current="page" href="<c:url value='room'/>">인테리어</a>
		<a class="nav-link" href="<c:url value='recipe'/>">자취요리</a>
		<a class="nav-link" href="<c:url value='tip'/>">생활팁</a>
		<a class="nav-link" href="<c:url value='daily'/>">일상</a>
	</nav>
</div>