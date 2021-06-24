<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<title>Welcome</title>
</head>
<body>
<%@ include file="menu.jsp" %>
<%! String greeting = "영화관"; %>
<div class = "jumbotron">
	<div class = "container">
		<h1 class = "display-3">
			<%= greeting %>
		</h1>
	</div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>