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
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/forms.css" type="text/css">

<style type="text/css">
.body-title {
	margin-top: 70px;
}

.tab {
	margin-top: 20px;
	font-size: 18px;
}

.tab a{
	display: inline-block;
	padding-left: 5px;
}

.tab a.active {
        font-weight: bold;
        color: #007bff;  
}

.chat-msg-container { display: flex; flex-direction:column; height: 310px; overflow-y: scroll; }
.chat-connection-list { height: 355px; overflow-y: scroll; }
.chat-connection-list span { display: block; cursor: pointer; margin-bottom: 3px; }
.chat-connection-list span:hover { color: #0d6efd }

</style>


</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>
	
<main class="d-flex flex-column min-vh-100 align-items-center" style="padding-top: 66px;">
    <div class="container">
		<div class="body-title">
			<h3>
				<i class="bi bi-app"></i> 고객센터
			</h3>	
		</div>
		
		<div class="body-head">
			<div class="tab">
				<a href="${pageContext.request.contextPath}/help">자주묻는질문</a>
				<a class="active" href="${pageContext.request.contextPath}/chat">1:1채팅상담</a>
			</div>
		</div>
			
		<div class="body-main content-frame">
			<div class="row">
				<div class="col-8">
					<p class="form-control-plaintext fs-6"><i class="bi bi-chevron-double-right"></i> 채팅 메시지</p>
					<div class="border p-3 chat-msg-container"></div>
					<div class="mt-2">
						<input type="text" id="chatMsg" class="form-control"
							placeholder="채팅 메세지를 입력하세요..">
					</div>
				</div>
				<div class="col-4">
					<p class="form-control-plaintext fs-6"><i class="bi bi-chevron-double-right"></i> 접속자 리스트 </p>
					<div class="border p-3 chat-connection-list"></div> 
				</div>
			</div>		
		</div>
			
    </div>
</main>

<script type="text/javascript">
$(function() {
	var socket = null;
	var host = '${wsURL}';
	
	if('WebSocket' in window) {
		socket = new WebSocket(host);
	} else if('MozWebSocket' in window) {
		socket = new MozWebSocket(host);
	} else {
		showMessage('<div class="chat-info"> 사용하신 브라우저는 채팅이 불가능합니다.</div>');
		return false;
	}
	
	socket.onopen = function(evt) { onOpen(evt); };
	
	
	function onOpen(evt) {
		// 서버에 접속이 성공한 경우
		let uid = '${sessionScope.member.num}';
		let nickName = '${sessionScope.member.nickName}';
		if(! uid ) {
			location.href = '${pageContext.request.contextPath}/member/login';
			return;
		}
		
		showMessage('<div class="msg-right">채팅방에 입장했습니다.</div>');
		// 서버 접속이 성공하면 아이디와 이름을 JSON 으로 서버에 전송
		let obj = {};
		obj.type = 'connect';
		obj.uid = uid;
		obj.nickName = nickName;
		
		let jsonStr = JSON.stringify(obj);
		socket.send(jsonStr);
		
	}
	
});

function showMessage(message) {
	const $EL = $('.chat-msg-container');
	$EL.append(message);
	
	// 스크롤바를 최하단으로 이동
	$EL.scrollTop($EL.prop('scrollHeight'));
}



</script>

<footer class="mt-auto py-2 text-center w-100" style="left: 0px; bottom: 0px; background: #F7F9FA;">
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>