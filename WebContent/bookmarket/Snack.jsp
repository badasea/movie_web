<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>
<%@ page import="dto.Snack"%>
<%@ page import="dao.SnackRepository"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<%
String cartId = session.getId();
%>
<title>간식 페이지</title>
<script type="text/javascript">
	function addToCart7() {
		if (confirm("해당 상품을 구매하시겠습니까?")) {
			document.addForm7.submit();
		} else {
			document.addForm7.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">팝콘</h1>
		</div>
	</div>

	<%
		SnackRepository dao = SnackRepository.getInstance();
		ArrayList<Snack> listOfBooks = dao.getAllSnacks();
	%>

	<div class="container">
		<div class="col" align="left">
			<%
			for (int i = 0; i < listOfBooks.size(); i++) {
				Snack book = listOfBooks.get(i);
			%>

			<hr>
			<div class="col-log">
				<h3><%=book.getName()%></h3>
			</div>
			<div class="row">
				<div class="col-md-5">
					<img
						src="<%=request.getContextPath()%>/resources/images/<%=book.getFilename()%>"
						style="width: 100%">
				</div>
				<p><%=book.getDescription()%>
					|
				<p>
					<%=book.getUnitPrice()%>
					원
			</div>
			<div align="right">
				<p>
				<form name="addForm7"
					action="./addsnack.jsp?id=<%=book.getBookId()%>" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart7()"> 구매 하기
						하기 &raquo;</a>
				</form>
			</div>
			<%
			}
			%>
		</div>
		<hr>
	</div>
	<div class="container">
		<a href="./cart.jsp" class="btn btn-secondary"> &laquo; 장바구니로 돌아가기</a>
	</div>
	<hr>
	<jsp:include page="footer.jsp" />
</body>
</html>