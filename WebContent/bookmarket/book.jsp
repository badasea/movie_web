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
<title>영화 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("영화를 예매하시겠습니까?")) {
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
			<h1 class="display-3">영화 정보</h1>
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
					<b>영화 코드 : </b><span class="badge badge-danger"> <%=book.getBookId()%></span>
				<p>
					<b>감독</b> :
					<%=book.getAuthor()%>
				<p>
					<b>출연</b> :
					<%=book.getPublisher()%>
				<p>
					<b>런타임</b> :
					<%=book.getTotalPages()%>
				<p>
					<b>개봉일</b> :
					<%=book.getReleaseDate()%>
				<h4><%=book.getUnitPrice()%>원
				</h4>
				<p>
				<form name="addForm" action="./movie.jsp?id=<%=book.getBookId()%>"
					method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()"> 영화 예매
						&raquo;</a> <a href="./cart.jsp" class="btn btn-warning"> 장바구니
						&raquo;</a> <a href="./books.jsp" class="btn btn-secondary"> 영화 목록
						&raquo;</a>
				</form>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>