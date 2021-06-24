package dao;

import java.util.ArrayList;

import dto.Book;

public class BookRepository {
	private ArrayList<Book> listOfBooks = new ArrayList<Book>();
	private static BookRepository instance = new BookRepository();
	
	public static BookRepository getInstance() {
		return instance;
	}
	
	public BookRepository() {
		Book html = new Book("P1234", "크루엘라", 15000);
		html.setDescription("처음부터 난 알았어. 내가 특별하단 걸\r\n"
				+ " 그게 불편한 인간들도 있겠지만 모두의 비위를 맞출 수는 없잖아?\r\n"
				+ " 그러다 보니 결국, 학교를 계속 다닐 수가 없었지\r\n"
				+ " \r\n"
				+ " 우여곡절 런던에 오게 된 나, 에스텔라는 재스퍼와 호레이스를 운명처럼 만났고\r\n"
				+ " 나의 뛰어난 패션 감각을 이용해 완벽한 변장과 빠른 손놀림으로 런던 거리를 싹쓸이 했어\r\n"
				+ " \r\n"
				+ " 도둑질이 지겹게 느껴질 때쯤, 꿈에 그리던 리버티 백화점에 낙하산(?)으로 들어가게 됐어\r\n"
				+ " 거리를 떠돌았지만 패션을 향한 나의 열정만큼은 언제나 진심이었거든\r\n"
				+ " \r\n"
				+ " 근데 이게 뭐야, 옷에는 손도 못 대보고 하루 종일 바닥 청소라니\r\n"
				+ " 인내심에 한계를 느끼고 있을 때, 런던 패션계를 꽉 쥐고 있는 남작 부인이 나타났어\r\n"
				+ " 천재는 천재를 알아보는 법! 난 남작 부인의 브랜드 디자이너로 들어가게 되었지\r\n"
				+ " \r\n"
				+ " 꿈을 이룰 것 같았던 순간도 잠시, 세상에 남작 부인이 ‘그런 사람’이었을 줄이야…\r\n"
				+ " \r\n"
				+ " 그래서 난 내가 누군지 보여주기로 했어\r\n"
				+ " 잘가, 에스텔라\r\n"
				+ " \r\n"
				+ " 난 이제 크루엘라야!");
		html.setCategory("드라마, 범죄, 코미디");
		html.setPublisher("엠마 스톤");
		html.setTotalPages(133);
		html.setCondition("New");
		html.setReleaseDate("2021-05-26");
		html.setAuthor("크레이그 질레스피");
		html.setFilename("P1234.jpg");
		
		Book popcon = new Book("P13", "팝콘", 7000);
		popcon.setFilename("P13.jpg");
		
		Book coke = new Book("P2", "콜라", 3000);
		coke.setFilename("P2.jpg");
		

		Book java = new Book("P1235", "루카", 15000);
		java.setDescription("바다 밖은 위험해?! 아니, 궁금해!\r\n"
				+ "이탈리아 리비에라의 아름다운 해변 마을,\r\n"
				+ " 바다 밖 세상이 궁금하지만, 두렵기도 한 호기심 많은 소년 '루카'\r\n"
				+ " \r\n"
				+ " 자칭 인간세상 전문가 ‘알베르토’와 함께 모험을 감행하지만,\r\n"
				+ " 물만 닿으면 바다 괴물로 변신하는 비밀 때문에 아슬아슬하기만 하다.\r\n"
				+ " \r\n"
				+ " 새로운 친구 ‘줄리아’와 함께 젤라또와 파스타를 실컷 먹고\r\n"
				+ " 스쿠터 여행을 꿈꾸는 여름은 그저 즐겁기만 한데…\r\n"
				+ " \r\n"
				+ " 과연 이들은 언제까지 비밀을 감출 수 있을까?\r\n"
				+ " \r\n"
				+ " 함께라서 행복한 여름,\r\n"
				+ " 우리들의 잊지 못할 모험이 시작된다!");
		java.setCategory("애니메이션, 모험, 코미디");
		java.setPublisher("제이콥 트렘블레이");
		java.setTotalPages(95);
		java.setCondition("New");
		java.setReleaseDate("2021-06-17");
		java.setAuthor("엔리코 카사로사");
		java.setFilename("P1235.jpg");
		
		Book spring = new Book("P1236", "캐시트럭", 15000);
		spring.setDescription("캐시트럭을 노리는 무장 강도에 의해 아들을 잃은 H(제이슨 스타뎀).\r\n"
				+ " 분노에 휩싸인 그는 아들을 죽인 범인의 단서를 찾기 위해\r\n"
				+ " 현금 호송 회사에 위장 취업한다.\r\n"
				+ " \r\n"
				+ " 첫 임무부터 백발백중 사격 실력을 자랑하며,\r\n"
				+ " 단숨에 에이스로 급부상한 H.\r\n"
				+ " 캐시트럭을 노리는 자들을 하나 둘 처리하며,\r\n"
				+ " 아들을 죽인 범인들과 점점 가까워지는데…\r\n"
				+ " \r\n"
				+ " 자비는 없다, 분노에 가득 찬 응징만이 남았다.\r\n"
				+ " \r\n"
				+ " 그의 분노가 폭발한다!");
		spring.setCategory("액션");
		spring.setPublisher("제이슨 스타뎀");
		spring.setTotalPages(119);
		spring.setCondition("New");
		spring.setReleaseDate("2021-06-09");
		spring.setAuthor("가이 리치");
		spring.setFilename("P1239.jpg");
		
		listOfBooks.add(html);
		listOfBooks.add(java);
		listOfBooks.add(spring);
		listOfBooks.add(popcon);
		listOfBooks.add(coke);
	}
	public ArrayList<Book> getAllBooks() {
		return listOfBooks;
	}
	public Book getBookById(String productId) {
		Book bookById = null;
		
		for (int i=0; i<listOfBooks.size(); i++) {
			Book book = listOfBooks.get(i);
			if (book != null && book.getBookId() != null && book.getBookId().equals(productId)) {
				bookById = book;
				break;
			}
		}
		return bookById;
	}
	public void addBook(Book book) {
		listOfBooks.add(book);
	}
}