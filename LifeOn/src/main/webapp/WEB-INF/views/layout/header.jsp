<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<style type="text/css">
    @font-face {
        font-family: 'NEXON Lv1 Gothic OTF';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }

    * {
        font-family: 'NEXON Lv1 Gothic OTF', sans-serif;
    }

    .category-list ul {
        padding: 0;
    }

    .category-list li {
        list-style: none;
    }

    .menu-item {
        border-radius: 3px;
        background-color: #fff;
        border: 1px solid #ddd;
        margin-bottom: -1px;
    }

    .menu-link {
        display: block;
        color: #666;
        font-weight: 500;
        cursor: pointer;
        padding: 10px 15px;
    }

    .menu-link:hover {
        color: #000;
        background: #e9e9e9;
    }

    .menu-item .opened {
        color: #fff;
        font-weight: 500;
        background-color: #337ab7;
        border-color: #337ab7;
        border-bottom: 1px solid #ddd;
        border-color: #d5d5d5;
        border-radius: 3px;
    }

    .sub-menu {
        display: none;
    }

    .sub-menu .active {
        color: #000;
    }

    .sub-menu-item {
        cursor: pointer;
        padding: 10px 20px;
        background: #f8f9fa;
    }

    .sub-menu-link {
        font-weight: 500;
        color: #666;
    }

    .sub-menu-item:hover, .sub-menu-link:hover {
        color: #000;
        text-decoration: none;
    }

    .custom-input {
        border-color: #006AFF !important;
    }

</style>

<script type="text/javascript">
    $(function () {
        $('ul.condition>li>a').click(function () {
            $('ul.condition>li>a').removeClass('text-danger');
            $(this).addClass('text-danger');

            $(this).closest('form[name=headerSearchForm]').find('input[name=searchField]').val($(this).attr('data-condition'));
            $(this).closest('div').find('button').text($(this).text());
        });
    });

    window.addEventListener('load', () => {
        const inputEL = document.querySelector('form input[name=searchWord]');
        inputEL.addEventListener('keydown', function (evt) {
            if (evt.key === 'Enter') {
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

<nav class="navbar navbar-expand-lg navbar-light" style="box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);">
    <div class="container">
        <div class="">
            <div>
                <img src="${pageContext.request.contextPath}/dist/images/logo.png" alt="logo" height="40">
            </div>
        </div>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto flex-nowrap" style="margin-left: 40px;">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="<c:url value='/'/>">홈</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="offcanvas" href="#offcanvasCategory"
                       aria-controls="offcanvasCategory">라운지</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/display/best'/>">마켓</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/display/special/200'/>"> 지역정보</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/display/special/300'/>">정책정보</a>
                </li>
            </ul>
        </div>
        <form name="headerSearchForm" class="col-3">
            <div class="input-group input-group-sm p-2">
                <input type="text" name="searchWord" class="form-control me-1 custom-input" placeholder="검색어를 입력하세요"
                       aria-describedby="basic-addon1" value="${searchWord}">
                <span class="input-group-text rounded" id="basic-addon1" onclick="searchHeader()"><i
                        class="bi bi-search"></i></span>
                <input type="hidden" name="searchField" value="all">
            </div>
        </form>
        <div class="col">
            <div class="d-flex justify-content-end">
                <c:choose>
                    <c:when test="${empty sessionScope.member}">
                        <div class="p-2">
                            <a href="javascript:dialogLogin();" title="로그인">로그인</a>
                        </div>
                        <div class="p-2">
                            <a href="<c:url value='/member/account'/>" title="회원가입">회원가입</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="p-2">
                            <a href="<c:url value='/myPage/cart'/>" title="장바구니"><i class="bi bi-cart"></i></a>
                        </div>
                        <div class="p-2">
                            <a href="<c:url value='/myPage/cart'/>" title="좋아요"><i class="bi bi-cart"></i></a>
                        </div>
                        <div class="p-2">
                            <a href="#" title="프로필"></a>
                        </div>
                        <div class="p-2">
                            <a href="<c:url value='/member/logout'/>" title="로그아웃"><i class="bi bi-unlock"></i></a>
                        </div>
                        <div class="p-2">
                            <a href="#" title="채팅?"><i class="bi bi-bell"></i></a>
                        </div>
                        <c:if test="${sessionScope.member.userLevel>50}">
                            <div class="p-2">
                                <a href="<c:url value='/admin'/>" title="관리자"><i class="bi bi-gear"></i></a>
                            </div>
                        </c:if>
                    </c:otherwise>
                </c:choose>
                <div class="p-2">
                    <a href="#" title="고객센터">고객센터</a>
                </div>
            </div>
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
        if (!str) {
            f.userId.focus();
            return;
        }

        str = f.userPwd.value;
        if (!str) {
            f.userPwd.focus();
            return;
        }

        f.action = '${pageContext.request.contextPath}/member/login';
        f.submit();
    }

    $(function () {
        $('#loginModal').on('hide.bs.modal', function () {
            $('button, input, select, textarea').each(function () {
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
                            <input type="password" name="userPwd" class="form-control" autocomplete="off"
                                   placeholder="패스워드">
                        </div>
                        <div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="rememberMeModel">
                                <label class="form-check-label" for="rememberMeModel"> 아이디 저장</label>
                            </div>
                        </div>
                        <div>
                            <button type="button" class="btn btn-primary w-100" onclick="sendModelLogin();">Login
                            </button>
                        </div>
                        <div>
                            <p class="form-control-plaintext text-center">
                                <a href="${pageContext.request.contextPath}/member/pwdFind"
                                   class="text-decoration-none me-2">패스워드를 잊으셨나요 ?</a>
                            </p>
                        </div>
                    </form>
                    <hr class="mt-3">
                    <div>
                        <p class="form-control-plaintext mb-0">
                            아직 회원이 아니세요 ?
                            <a href="${pageContext.request.contextPath}/member/account" class="text-decoration-none">회원가입</a>
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
<style type="text/css">
    .recentProduct-img {
        height: 150px;
        width: 150px;
        cursor: pointer;
    }
</style>

<div class="modal fade" id="recentProductViewModal" tabindex="-1" aria-labelledby="recentProductViewModalLabel"
     aria-hidden="true">
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
    // 좌측 카테고리 오프캔버스 : 상품 카테고리
    $(function () {
        const myOffcanvas = document.getElementById('offcanvasCategory');
        myOffcanvas.addEventListener('shown.bs.offcanvas', function () {
            let url = '${pageContext.request.contextPath}/products/listAllCategory';

            $.get(url, null, function (data) {
                let out = '';
                let listUrl = '${pageContext.request.contextPath}/products/main?categoryNum=';

                let listMain = data.listMain;
                let listAll = data.listAll;

                $(listMain).each(function (index, item) {
                    let categoryNum = item.categoryNum;
                    let categoryName = item.categoryName;

                    let opened = index === 0 ? 'opened' : '';

                    out += '<li class="menu-item">';
                    out += '<label class="menu-link ' + opened + '">';
                    out += '<span class="menu-label">' + categoryName + "</span>";
                    out += '</label>';
                    out += '<ul class="sub-menu">';

                    $(listAll).each(function (index, item) {
                        let subNum = item.categoryNum;
                        let subName = item.categoryName;
                        let parentNum = item.parentNum;

                        if (categoryNum === parentNum) {
                            out += '<li class="sub-menu-item"><a href="' + listUrl + subNum
                                + '" class="sub-menu-link">' + subName + '</a></li>';
                        }
                    });

                    out += '</ul>';
                    out += '</li>';
                });

                $('.category-list').html(out);
                // $('.category-list .opened').siblings('.sub-menu').show();
                // $('.category-list .opened').siblings('.sub-menu').first().find('a').first().addClass('active');

            }, 'json');
        });

        $('.category-list').on('click', '.menu-item', function () {
            const $menu = $(this);
            $('.category-list .menu-link').removeClass('opened');
            $('.category-list .sub-menu').hide();
            $menu.find('.menu-link').addClass('opened');
            $menu.find('.sub-menu').fadeIn(500);
        });
    });

    // 최근본 상품 목록
    function recentProductView() {
        $('.modal-recentProductView').empty();

        let product = JSON.parse(localStorage.getItem('product')) || [];
        let out = '';

        out += '<div class="row row-cols-3 g-3">';

        for (let item of product) {
            out += '<div class="col p-1">';
            out += '<div class="card">';
            out += '<img src="${pageContext.request.contextPath}/resources/images/product/' + item.productImg + '" class="card-img-top recentProduct-img" alt="' + item.productName + '" data-productnum="' + item.productNum + '">';
            out += '<div class="card-body">';
            out += '<h5 class="card-title">' + item.productName + '</h5>';
            out += '<p class="card-text text-danger">' + item.productPrice + '원</p>';
            out += '</div>';
            out += '</div>';
            out += '</div>';
        }

        out += '</div>';


        $('#recentProductViewModal').modal('show');


    }

    $(function () {
        $('#recentProductViewModal').on('hide.bs.modal', function () {
            $('button, input, select, textarea, div').each(function () {
                $(this).blur();
            });
        });
    });
</script>
		