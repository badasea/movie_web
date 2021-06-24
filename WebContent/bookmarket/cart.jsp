<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>
<%@ page import="dto.coupon"%>
<%@ page import="dao.couponRepository"%>
<%@ page import="dto.coupon2"%>
<%@ page import="dao.coupon2Repository"%>
<%@ page import="dto.Snack"%>
<%@ page import="dao.SnackRepository"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<%
	String cartId = session.getId();
%>
<title>장바구니</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a></td>
					<td align="right"><a href="./Snack.jsp?<%= cartId %>" class="btn btn-success">팝콘</a></td>					
					<td align="right"><a href="./coupon.jsp?<%= cartId %>" class="btn btn-success">쿠폰</a></td>					
					<td align="right"><a href="./shippingInfo.jsp?cartId=<%= cartId %>" class="btn btn-success">예매하기</a></td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>영화</th>
					<th>가격</th>
					<th>인원</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				
				<!-- 팝콘 콜라 -->
				<%				
						int sum7 = 0;
						ArrayList<Snack> cartList7 = (ArrayList<Snack>) session.getAttribute("cartlist7");
						if (cartList7 == null)
							cartList7 = new ArrayList<Snack>();

						for (int i = 0; i < cartList7.size(); i++) { // 상품리스트 하나씩 출력하기
							Snack product7 = cartList7.get(i);
							int total7 = product7.getUnitPrice() * product7.getQuantity();
							sum7 = sum7 + total7;
				%>
				<tr>
					<td><%=product7.getName()%></td>
					<td><%=product7.getUnitPrice()%></td>
					<td><%=product7.getQuantity()%></td>
					<td><%=total7%></td>
					<td><a href="./removeSnack.jsp?id=<%=product7.getBookId()%>" class="badge badge-danger">삭제</a></td>
				</tr>
				<%
					}
				%>
				
				<!-- 20퍼센트 할인 쿠폰 -->				
				<%				
						long sum2 = 1;
						ArrayList<coupon2> cartList3 = (ArrayList<coupon2>) session.getAttribute("cartlist3");
						if (cartList3 == null)
							cartList3 = new ArrayList<coupon2>();

						for (int i = 0; i < cartList3.size(); i++) { // 상품리스트 하나씩 출력하기
							coupon2 product2 = cartList3.get(i);
							int total2 = product2.getUnitPrice() * product2.getQuantity();
							sum2 = sum2 + (long)((100 - total2)*0.1) - 1;
				%>
				<tr>
					<td><%=product2.getName()%></td>
					<td><%=product2.getUnitPrice()%>%</td>
					<td><%=product2.getQuantity()%></td>
					<td><%=total2%>%</td>
					<td><a href="./removecoupon2.jsp?id=<%=product2.getBookId()%>" class="badge badge-danger">삭제</a></td>
				</tr>
				<%
					}
				%>
				
				<!-- 3천원 할인 쿠폰 -->
				<%				
						int sum1 = 0;
						ArrayList<coupon> cartList1 = (ArrayList<coupon>) session.getAttribute("cartlist1");
						if (cartList1 == null)
							cartList1 = new ArrayList<coupon>();

						for (int i = 0; i < cartList1.size(); i++) { // 상품리스트 하나씩 출력하기
							coupon product1 = cartList1.get(i);
							int total1 = product1.getUnitPrice() * product1.getQuantity();
							sum1 = sum1 + total1;
				%>
				<tr>
					<td><%=product1.getName()%></td>
					<td><%=product1.getUnitPrice()%></td>
					<td><%=product1.getQuantity()%></td>
					<td><%=total1%></td>
					<td><a href="./removecoupon.jsp?id=<%=product1.getBookId()%>" class="badge badge-danger">삭제</a></td>
				</tr>
				<%
					}
				%>
				<!-- 영화 추가 리스트 -->
				<%				
					int sum = 0;
					ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
					if (cartList == null)
						cartList = new ArrayList<Book>();

					for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
						Book product = cartList.get(i);
						int total = product.getUnitPrice() * product.getQuantity();
						sum = sum + total;
				%>
				<tr>
					<td><%=product.getName()%></td>
					<td><%=product.getUnitPrice()%></td>
					<td><%=product.getQuantity()%></td>
					<td><%=total%></td>
					<td><a href="./removeCart.jsp?id=<%=product.getBookId()%>" class="badge badge-danger">삭제</a></td>
				</tr>
				<%
					}
				%>			
				<tr>
				<%
					long res = 0;
					if (sum2 == 1)
					{
						res = sum+sum1+sum7;
					}
					else
					{
						res = ((sum+sum1+sum7)*sum2)/10; 
					}
				%>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=res%></th>
					<th></th>
				</tr>
			</table>
			<a href="./books.jsp" class="btn btn-secondary"> &laquo; 영화 목록 돌아가기</a>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>