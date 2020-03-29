<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>메세지 확인</title>
<meta charset="UTF-8">
</head>
<body>
<form action="replyForm">
<c:if test="${!empty message}">
${message.senderNickname}
${message.receiverNickname}
${message.messageContent}
</c:if>

<button type="submit">답장하기
</button>



</form>
</body>
</html>
