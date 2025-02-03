<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<header class="container-fluid header-top fixed-top">
	<div class="container-fluid p-2">
		<div class="row">
			<div class="col-auto d-lg-none align-self-center">
				<button type="button" id="toggleMenu" class="toggle_menu">
					<i class="bi bi-list"></i>
				</button>
			</div>
			<div class="col align-self-center">
				<img class="fs-4" src="${pageContext.request.contextPath}/dist/images/logo.png" alt="logo" style="width: 150px; height: 60px; object-fit: cover;">
			</div>
			<div class="col-auto">
					<div class="col-3 align-self-center">
						<span class="img-person" style="background-image: url('${pageContext.request.contextPath}/dist/images/person.png');"></span>
					</div>
					<div class="col-auto text-end align-self-center ps-3">
						<div style="font-size: 14px;">
							<span>관리자 님</span>
							&nbsp;<a href="${pageContext.request.contextPath}/"><i class="bi bi-box-arrow-right"></i></a>
						</div>
				</div>
			</div>
		</div>
	</div>
</header>