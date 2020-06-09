package js4129.action;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import js4129.db.JdbcUtils;
import js4129.model.Book;
import js4129.model.User;
import js4129.tool.Pager;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class StartAction extends ActionSupport {
	
	private User user;
	private String books;
	
	private int pageNow = 1;	//初始页面为第1页
	private int pageSize = 5;	//每页显示4条记录
	
	@Override
	public String execute() throws Exception {
		
		Map session=ActionContext.getContext().getSession();
		Map request=(Map)ActionContext.getContext().get("request");
		user = (User)session.get("login");
		String sql;
		if(books==null||books.equals("")) {
			sql = "select * from book order by `id` desc limit ?,?";
		}else {
			sql = "select * from book where `name` like '%"+books+"%' order by `id` desc limit ?,?";
		}
		ResultSet rs = JdbcUtils.executeQuery(sql,pageSize*(pageNow-1),pageSize);
		List<Book>list = new ArrayList<Book>();
		while(rs.next()) {
			Book book = new Book();
			book.setIsbn(rs.getString("isbn"));
			book.setBookName(rs.getString("name"));
			book.setAuthor(rs.getString("auth"));
			book.setPublisher(rs.getString("pub"));
			book.setPrice(rs.getFloat("pric"));
			book.setCnum(rs.getInt("num"));
			sql = "select count(*) as `x` from lend where bid=?";
			ResultSet s = JdbcUtils.executeQuery(sql,rs.getInt("id"));
			s.next();
			book.setSnum(rs.getInt("num")-s.getInt("x"));
			list.add(book);
		}
		if(books==null||books.equals("")) {
			sql = "select count(*) as `total` from book";
		}else {
			sql = "select count(*) as `total` from book where `name` like '%"+books+"%'";
		}
		ResultSet x = JdbcUtils.executeQuery(sql);
		x.next();
		Pager page = new Pager(pageNow, x.getInt("total"));
		request.put("list", list);
		request.put("page", page);
		request.put("books", books);
		return SUCCESS;
	}
	
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}

	public String getBooks() {
		return books;
	}

	public void setBooks(String books) {
		this.books = books;
	}

	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}
	
}