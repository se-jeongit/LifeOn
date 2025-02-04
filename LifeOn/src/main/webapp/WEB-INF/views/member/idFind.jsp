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

<style>
    body {
        background: #f8f9fa;
        margin: 0;
        padding: 0;
    }
    header {
        position: relative;
        z-index: 1000;
        width: 100%;
        background: white;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    }
    main {
        position: relative;
        z-index: 1;
        width: 100%;
        max-width: 500px;
        margin: 0 auto;
        padding-top: 150px;
    }
    .find-wrapper {
        width: 100%;
        max-width: 360px;
        margin: 50px auto;
        padding: 20px;
        background: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    .tabs {
        display: flex;
        justify-content: center;
        margin-bottom: 15px;
        border-bottom: 1px solid #ddd;
        padding-bottom: 10px;
    }
    .tabs a {
        padding: 8px 15px;
        text-decoration: none;
        color: #888;
        font-size: 14px;
    }
    .tabs a.active {
        font-weight: bold;
        color: #007bff;
        border-bottom: 2px solid #007bff;
    }
    p {
        font-size: 14px;
        color: #333;
        margin-bottom: 15px;
    }
    .input-group {
        display: flex;
        justify-content: space-between;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
        padding: 5px;
        background: #f9f9f9;
    }
    .input-box {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        margin-bottom: 15px;
    }
    input[type="text"] {
        flex: 1;
        border: none;
        padding: 10px;
        background: transparent;
        outline: none;
    }
    .btn-check {
        padding: 10px 15px;
        border: none;
        background: #007bff;
        color: white;
        border-radius: 4px;
        cursor: pointer;
    }
    .btn-code {
        width: 100%;
        padding: 12px;
        border: none;
        background: #007bff;
        color: white;
        border-radius: 4px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
    }
    .help-text {
        margin-top: 15px;
        font-size: 12px;
        color: #666;
    }
    .help-text a {
        color: #007bff;
        text-decoration: none;
        font-weight: bold;
    }
</style>

</head>
<body>

<header>
    <jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>

<main class="d-flex flex-column align-items-center">
    <div class="find-wrapper">
        <div class="tabs">
            <a href="${pageContext.request.contextPath}/member/idFind" class="active">아이디찾기</a>
            <a href="${pageContext.request.contextPath}/member/pwdFind">비밀번호재설정</a>
        </div>
        
        <p>회원정보에 등록한 휴대전화를 입력해주세요.</p>
        
        <div class="input-group">
            <input type="text" placeholder="휴대전화번호" />
            <button class="btn-check">확인</button>
        </div>
        
        <button class="btn-code">인증코드 받기</button>
        
        <p class="help-text">회원가입 시 입력한 정보가 기억나지 않는다면? <a href="#">고객센터 문의하기</a></p>
    </div>
</main>

<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>
