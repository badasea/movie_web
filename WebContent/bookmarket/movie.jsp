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
<title>영화관 자리 선택</title>
</head>
<script type="text/javascript">
	var cells = [ [ 0, 0, 0 ], [ 0, 0, 0 ], [ 0, 0, 0 ] ];
	
	function addToCart10() {
		if (confirm("해당 좌석을 선택하였습니다.")) {
			document.addForm10.submit();
		}
		else {
			document.addForm10.reset();
		}
	}

	function clickCell(row, col) {
		if (cells[row][col] > 0) {
			document.getElementById("N" + row + col).innerHTML = "<img src = 'blank.jpg' height='100' width='100'>";
			cells[row][col] = 0;
		}
		else {
			document.getElementById("N" + row + col).innerHTML = "<img src = 'X.gif' height='100' width='100'>";
			cells[row][col] = 1;
			addToCart10();
		}
	}
</script>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">원하는 좌석을 선택해주세요.</h1>
		</div>
	</div>
	<!--  -->

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
					style="width: 25%">
			</div>
			<div class="col">


			</div>
		</div>
		<hr>
	</div>
	<!--  -->
	<table width="100%">
		<tr>
			<td align="right"><a href="./cart.jsp" class="btn btn-success">예매하기</a></td>
		</tr>
	</table>
	<!--  -->
	<form name="addForm10" action="./addpeople.jsp?id=<%=book.getBookId()%>" method="post">
	<table>
		<td>
			<table border=1>
				<tr>
					<td id="N00" onClick="JavaScript:clickCell(0,0);" src=blank.jpg
						border=0 height=100 width=100></td>
					<td id="N01" onClick="JavaScript:clickCell(0,1);" src=blank.jpg
						border=0 height=100 width=100></td>
					<td id="N02" onClick="JavaScript:clickCell(0,2);" src=blank.jpg
						border=0 height=100 width=100></td>
				</tr>
				<tr>
					<td id="N10" onClick="JavaScript:clickCell(1,0);" src=blank.jpg
						border=0 height=100 width=100></td>
					<td id="N11" onClick="JavaScript:clickCell(1,1);" src=blank.jpg
						border=0 height=100 width=100></td>
					<td id="N12" onClick="JavaScript:clickCell(1,2);" src=blank.jpg
						border=0 height=100 width=100></td>
				</tr>
				<tr>
					<td id="N20" onClick="JavaScript:clickCell(2,0);" src=blank.jpg
						border=0 height=100 width=100></td>
					<td id="N21" onClick="JavaScript:clickCell(2,1);" src=blank.jpg
						border=0 height=100 width=100></td>
					<td id="N22" onClick="JavaScript:clickCell(2,2);" src=blank.jpg
						border=0 height=100 width=100></td>
				</tr>
			</table>
		</td>
		<td></td>
	</table>
	</form>
	<!--  -->
	<jsp:include page="footer.jsp" />
</body>
</html>