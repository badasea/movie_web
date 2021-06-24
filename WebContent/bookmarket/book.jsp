<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>
<%@ page errorPage="exceptionNoBookId.jsp"%>
<!DOCTYPE html>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />
<html>
<head>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<meta charset="EUC-KR">
<title>��ȭ ����</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("��ȭ�� �����Ͻðڽ��ϱ�?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">��ȭ ����</h1>
		</div>
	</div>
	<%
	String id = request.getParameter("id");
	BookRepository dao = BookRepository.getInstance();
	Book book = dao.getBookById(id);
	%>
	<div class="container">
		<div class="row" align="left">
			<div class="col-md-5">
				<img
					src="<%=request.getContextPath()%>/resources/images/<%=book.getFilename()%>"
					style="width: 100%">
			</div>
			<div class="col">
				<h3><%=book.getName()%></h3>
				<p><%=book.getDescription()%>
				<p>
					<b>��ȭ �ڵ� : </b><span class="badge badge-danger"> <%=book.getBookId()%></span>
				<p>
					<b>����</b> :
					<%=book.getAuthor()%>
				<p>
					<b>�⿬</b> :
					<%=book.getPublisher()%>
				<p>
					<b>��Ÿ��</b> :
					<%=book.getTotalPages()%>
				<p>
					<b>������</b> :
					<%=book.getReleaseDate()%>
				<h4><%=book.getUnitPrice()%>��
				</h4>
				<p>
				<form name="addForm" action="./movie.jsp?id=<%=book.getBookId()%>"
					method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()"> ��ȭ ����
						&raquo;</a> <a href="./cart.jsp" class="btn btn-warning"> ��ٱ���
						&raquo;</a> <a href="./books.jsp" class="btn btn-secondary"> ��ȭ ���
						&raquo;</a>
				</form>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>