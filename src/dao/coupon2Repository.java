package dao;

import java.util.ArrayList;

import dto.coupon2;

public class coupon2Repository {
	private ArrayList<coupon2> listOfBooks = new ArrayList<coupon2>();
	private static coupon2Repository instance = new coupon2Repository();
	
	public static coupon2Repository getInstance() {
		return instance;
	}
	
	public coupon2Repository() {
		coupon2 c2 = new coupon2("c2", "20% 할인 쿠폰", 20);
		c2.setDescription("20% 할인 쿠폰");
		c2.setReleaseDate("2021-07-01");
		c2.setUnitsInStock(1000);
		c2.setFilename("C2.jpg");
				
		listOfBooks.add(c2);

	}
	public ArrayList<coupon2> getAllcoupons() {
		return listOfBooks;
	}
	public coupon2 getBookById(String productId) {
		coupon2 bookById = null;
		
		for (int i=0; i<listOfBooks.size(); i++) {
			coupon2 book = listOfBooks.get(i);
			if (book != null && book.getBookId() != null && book.getBookId().equals(productId)) {
				bookById = book;
				break;
			}
		}
		return bookById;
	}
	public void addBook(coupon2 book) {
		listOfBooks.add(book);
	}
}