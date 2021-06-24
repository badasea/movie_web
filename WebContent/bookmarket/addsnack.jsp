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

	ArrayList<Snack> goodsList = dao.getAllSnacks();
	Snack goods = new Snack();
	for (int i = 0; i < goodsList.size(); i++) {
		goods = goodsList.get(i);
		if (goods.getBookId().equals(id)) { 			
			break;
		}
	}
	
	ArrayList<Snack> list = (ArrayList<Snack>) session.getAttribute("cartlist7");
	if (list == null) { 
		list = new ArrayList<Snack>();
		session.setAttribute("cartlist7", list);
	}

	int cnt = 0;
	Snack goodsQnt = new Snack();
	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getBookId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}

	if (cnt == 0) { 
		goods.setQuantity(1);
		list.add(goods);
	}
	
	response.sendRedirect("cart.jsp");
%>