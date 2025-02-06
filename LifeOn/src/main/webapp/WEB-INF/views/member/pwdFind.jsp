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
        padding-top: 150px; /* 헤더와 겹치지 않도록 충분한 여백 확보 */
    }
    .find-container {
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
    .tabs button {
        padding: 8px 15px;
        border: none;
        background: none;
        font-size: 14px;
        cursor: pointer;
        color: #888;
        transition: color 0.3s, background 0.3s;
    }
    .tabs button.active {
        font-weight: bold;
        color: #007bff;
        border-bottom: 2px solid #007bff;
    }
    .tabs button:hover {
        color: #0056b3;
        background: #e9f5ff;
        border-radius: 4px;
    }
    .input-wow {
        display: flex;
        justify-content: space-between;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
        padding: 5px;
        background: #f9f9f9;
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
        text-align: center;
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
	
<main class="d-flex flex-column min-vh-100 align-items-center" style="padding-top: 66px;">
    <div class="find-container">
        <div class="tabs">
            <button onclick="location.href='${pageContext.request.contextPath}/member/idFind'">아이디찾기</button>
            <button class="active" onclick="location.href='${pageContext.request.contextPath}/member/pwdFind'">비밀번호재설정</button>
        </div>
        
        <p>아이디를 입력해주세요.</p>
        <div class="input-wow">
        <input type="text" placeholder="아이디" />
        </div>
        <p>회원정보에 등록한 휴대전화를 입력해주세요.</p>
        <div class="input-wow">
            <input type="text" placeholder="휴대전화번호" />
            <button class="btn-check">확인</button>
        </div>
        
        <button class="btn-code">인증코드 받기</button>
        
        <p class="help-text">회원가입 시 입력한 정보가 기억나지 않는다면?</p>
		<p class="help-text"><a href="#">고객센터 문의하기</a></p>
    </div>
</main>

<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>
