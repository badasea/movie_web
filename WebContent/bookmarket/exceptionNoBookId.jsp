<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<meta charset="EUC-KR">
<title>���� ���̵� ����</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h2 class="alert alert-danger">��û�Ͻ� �������� ã�� �� �����ϴ�.</h2>
		</div>
	</div>
	<div class="container">
		<p><%=request.getRequestURL()%>?<%=request.getQueryString()%>
		<p> <a href="books.jsp" class="btn btn-secondary" > ���� ���
		&raquo;</a>	
	
	</div>
</body>
</html>