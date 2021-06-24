package dao;

import java.util.ArrayList;

import dto.coupon;

public class couponRepository {
	private ArrayList<coupon> listOfBooks = new ArrayList<coupon>();
	private static couponRepository instance = new couponRepository();
	
	public static couponRepository getInstance() {
		return instance;
	}
	
	public couponRepository() {
		coupon c1 = new coupon("c1", "첫 결재 3천원 할인", -3000);
		c1.setDescription("첫 결재 3천원 할인 쿠폰");
		c1.setReleaseDate("2021-12-31");
		c1.setUnitsInStock(1000);
		c1.setFilename("C1.jpg");
				
		listOfBooks.add(c1);

	}
	public ArrayList<coupon> getAllcoupons() {
		return listOfBooks;
	}
	public coupon getBookById(String productId) {
		coupon bookById = null;
		
		for (int i=0; i<listOfBooks.size(); i++) {
			coupon book = listOfBooks.get(i);
			if (book != null && book.getBookId() != null && book.getBookId().equals(productId)) {
				bookById = book;
				break;
			}
		}
		return bookById;
	}
	public void addBook(coupon book) {
		listOfBooks.add(book);
	}
}