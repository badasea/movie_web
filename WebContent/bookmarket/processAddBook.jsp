<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>

<%
	request.setCharacterEncoding("UTF-8");

	String filename = "";
	String realFolder = "c:\\upload";	// 웹 애플리케이션 절대 경로
	int maxSize = 5 * 1024 * 1024;		// 최대 업로드될 파일의 크기 5MB
	String encType = "utf-8";			// 인코딩 유형
	
	MultipartRequest multi = new MultipartRequest(request, realFolder,
	maxSize, encType, new DefaultFileRenamePolicy());

	String bookId = multi.getParameter("bookId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	String author = multi.getParameter("author");
	String publisher = multi.getParameter("publisher");
	String totalPages = multi.getParameter("totalPages");
	String releaseDate = multi.getParameter("releaseDate");

	Integer price;

	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);

	long stock;

	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);
	
	long pages;

	if (totalPages.isEmpty())
		pages = 0;
	else
		pages = Long.valueOf(totalPages);

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	BookRepository dao = BookRepository.getInstance();

	Book newBook = new Book();
	newBook.setBookId(bookId);
	newBook.setName(name);
	newBook.setUnitPrice(price);
	newBook.setDescription(description);
	newBook.setCategory(category);
	newBook.setUnitsInStock(stock);
	newBook.setCondition(condition);
	newBook.setAuthor(author);
	newBook.setPublisher(publisher);
	newBook.setTotalPages(pages);
	newBook.setReleaseDate(releaseDate);
	newBook.setFilename(filename);

	dao.addBook(newBook);

	response.sendRedirect("books.jsp");
%>
