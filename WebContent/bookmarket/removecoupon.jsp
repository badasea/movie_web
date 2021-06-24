<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.coupon"%>
<%@ page import="dao.couponRepository"%>

<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("books.jsp");
		return;
	}

	couponRepository dao = couponRepository.getInstance();
	
	coupon product = dao.getBookById(id);
	if (product == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}

	ArrayList<coupon> cartList1 = (ArrayList<coupon>) session.getAttribute("cartlist1");
	coupon goodsQnt = new coupon();
	for (int i = 0; i < cartList1.size(); i++) { // 상품리스트 하나씩 출력하기
		goodsQnt = cartList1.get(i);
		if (goodsQnt.getBookId().equals(id)) {
			cartList1.remove(goodsQnt);
		}
	}

	response.sendRedirect("cart.jsp");
%>