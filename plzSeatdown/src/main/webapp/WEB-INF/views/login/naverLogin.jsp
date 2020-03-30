<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<style>
@font-face {
	font-family: 'Handon3gyeopsal300g';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/Handon3gyeopsal300g.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'Handon3gyeopsal300g', '삼겹살체 300g';
}
</style>
<title>PLEASE SEATDOWN</title>
<meta charset="UTF-8">
</head>
<body>
	<div id="naver_id_login" style="text-align:center"><a id="naver_login" href="${url}"></a></div>
	<br>
</body>
<script>
	$("#naver_login").get(0).click();
</script>
</html>