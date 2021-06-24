<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>
<%@ page import="dto.coupon"%>
<%@ page import="dao.couponRepository"%>
<%@ page import="dto.coupon2"%>
<%@ page import="dao.coupon2Repository"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<%
String cartId = session.getId();
%>
<title>���� ��� ������</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("������ ����Ͻðڽ��ϱ�?")) {
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
			<h1 class="display-3">���� ����</h1>
		</div>
	</div>

	<%
		couponRepository dao = couponRepository.getInstance();
		ArrayList<coupon> listOfcoupons = dao.getAllcoupons();
	%>

	<div class="container">
		<div class="col" align="left">
			<%
			for (int i = 0; i < listOfcoupons.size(); i++) {
				coupon book = listOfcoupons.get(i);
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
					| ���Ⱓ :
				<p>
					<%=book.getReleaseDate()%>
					����
			</div>
			<div align="right">
				<p>
				<form name="addForm"
					action="./addcoupon.jsp?id=<%=book.getBookId()%>" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()"> ���� ���
						�ϱ� &raquo;</a>
				</form>
			</div>
			<%
			}
			%>
		<jsp:include page="coupon2.jsp" />
		</div>
		<hr>
	</div>
	<div class="container">
		<a href="./cart.jsp" class="btn btn-secondary"> &laquo; ��ٱ��Ϸ� ���ư���</a>
	</div>
	<hr>
	<jsp:include page="footer.jsp" />
</body>
</html>