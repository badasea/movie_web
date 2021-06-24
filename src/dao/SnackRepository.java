package dao;

import java.util.ArrayList;

import dto.Snack;

public class SnackRepository {
	private ArrayList<Snack> listOfBooks = new ArrayList<Snack>();
	private static SnackRepository instance = new SnackRepository();
	
	public static SnackRepository getInstance() {
		return instance;
	}
	
	public SnackRepository() {
		
		Snack popcon = new Snack("P13", "카라멜 팝콘", 7000);
		popcon.setDescription("달콤한 카라멜 팝콘");
		popcon.setFilename("P13.jpg");
			
		listOfBooks.add(popcon);
	}
	public ArrayList<Snack> getAllSnacks() {
		return listOfBooks;
	}
	public Snack getBookById(String productId) {
		Snack bookById = null;
		
		for (int i=0; i<listOfBooks.size(); i++) {
			Snack book = listOfBooks.get(i);
			if (book != null && book.getBookId() != null && book.getBookId().equals(productId)) {
				bookById = book;
				break;
			}
		}
		return bookById;
	}
	public void addBook(Snack book) {
		listOfBooks.add(book);
	}
}