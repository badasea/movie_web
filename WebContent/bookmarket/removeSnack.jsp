<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Snack"%>
<%@ page import="dao.SnackRepository"%>

<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("books.jsp");
		return;
	}

	SnackRepository dao = SnackRepository.getInstance();
	
	Snack product = dao.getBookById(id);
	if (product == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}

	ArrayList<Snack> cartList = (ArrayList<Snack>) session.getAttribute("cartlist7");
	Snack goodsQnt = new Snack();
	for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
		goodsQnt = cartList.get(i);
		if (goodsQnt.getBookId().equals(id)) {
			cartList.remove(goodsQnt);
		}
	}

	response.sendRedirect("cart.jsp");
%>