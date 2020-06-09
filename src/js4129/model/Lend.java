package js4129.model;

import java.util.Date;

public class Lend {
	
	private String isbn;		//ISBN
	private String bookName;	//书名
	private String author;		//作者	
	private String publisher;	//出版社
	private float price;		//价格
	private String reader;		//借书人
	private Date lTime;			//借书时间
	
	
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float f) {
		this.price = f;
	}
	public String getReader() {
		return reader;
	}
	public void setReader(String reader) {
		this.reader = reader;
	}
	public Date getlTime() {
		return lTime;
	}
	public void setlTime(Date lTime) {
		this.lTime = lTime;
	}
	
}