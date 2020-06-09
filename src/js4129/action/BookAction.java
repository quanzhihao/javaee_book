package js4129.action;

import java.io.File;
import java.io.FileInputStream;
import java.sql.ResultSet;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

import js4129.db.JdbcUtils;
import js4129.model.Book;
import js4129.model.User;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BookAction extends ActionSupport {
	
	private User user;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	private void get() {
		Map session=ActionContext.getContext().getSession();
		user = (User)session.get("login");
	}
	
	@Override
	public String execute() throws Exception {
		
		get();
		return SUCCESS;
	}
//--------------------------------------------------	
	private Book book;
	private File photo;
	
	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public File getPhoto() {
		return photo;
	}

	public void setPhoto(File photo) {
		this.photo = photo;
	}

	public String insert() {
		
		get();
		try {
			String sql = "select * from book where `isbn`=?";
			ResultSet rs = JdbcUtils.executeQuery(sql, book.getIsbn());
			if(rs.next()) {
				this.addFieldError("msg", "ISBN已经存在！");
			}else{
				if(this.getPhoto()!=null) {
					FileInputStream fis = new FileInputStream(this.getPhoto());
					byte[]buffer = new byte[fis.available()];
					fis.read(buffer);
					book.setPhoto(buffer);
				}
				sql = "insert into book(`isbn`,`name`,`auth`,`pub`,`pric`,`num`,`sum`,`img`) values(?,?,?,?,?,?,?,?)";
				JdbcUtils.executeUpdate(sql,book.getIsbn(),book.getBookName(),book.getAuthor(),book.getPublisher(),book.getPrice(),book.getCnum(),book.getSummary(),book.getPhoto());
				this.addFieldError("msg", "添加成功！");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return SUCCESS;
	}
	//--------------------------------------------------
	public String delete() {
		
		get();
		try {
			String sql = "select * from book where `isbn`=?";
			ResultSet rs = JdbcUtils.executeQuery(sql, book.getIsbn());
			if(!rs.next()) {
				this.addFieldError("msg", "要删除的图书不存在！");
			}else{
				sql = "select * from lend where `bid`=?";
				rs = JdbcUtils.executeQuery(sql, rs.getInt("id"));
				if(rs.next()) {
					this.addFieldError("msg", "该图书已被借出，故不能删除！");
				}else {
					sql = "delete from book where `isbn`=?";
					JdbcUtils.executeUpdate(sql, book.getIsbn());
					this.addFieldError("msg", "删除成功！");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return SUCCESS;
	}
//--------------------------------------------------
	public String select() {
		
		get();
		try {
			Book onebook = new Book();
			String sql = "select * from book where `isbn`=?";
			ResultSet rs = JdbcUtils.executeQuery(sql, book.getIsbn());
			if(rs.next()) {
				onebook.setIsbn(rs.getString(2));
				onebook.setBookName(rs.getString(3));
				onebook.setAuthor(rs.getString(4));
				onebook.setPublisher(rs.getString(5));
				onebook.setPrice(rs.getFloat(6));
				onebook.setCnum(rs.getInt(7));
				onebook.setSummary(rs.getString(8));
				onebook.setPhoto(rs.getBytes(9));
				sql = "select count(*) as `x` from lend where bid=?";
				rs = JdbcUtils.executeQuery(sql, rs.getInt(1));
				rs.next();
				onebook.setSnum(onebook.getCnum()-rs.getInt("x"));
			}
			if(onebook==null) {
				this.addFieldError("msg", "不存在该图书！");
			}else {
				Map request=(Map)ActionContext.getContext().get("request");
				request.put("onebook", onebook);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return SUCCESS;
	}
//--------------------------------------------------
	public String update() {
			
		get();
		try {
			String sql = "select * from book where `isbn`=?";
			ResultSet rs = JdbcUtils.executeQuery(sql, book.getIsbn());
			if(!rs.next()) {
				this.addFieldError("msg", "要修改的图书不存在！");
			}else{
				book.setPhoto(rs.getBytes(9));
				if(this.getPhoto()!=null) {
					FileInputStream fis = new FileInputStream(this.getPhoto());
					byte[]buffer = new byte[fis.available()];
					fis.read(buffer);
					book.setPhoto(buffer);
				}
				sql = "update book set `name`=?,`auth`=?,`pub`=?,`pric`=?,`num`=?,`sum`=?,`img`=? where `isbn`=?";
				JdbcUtils.executeUpdate(sql,book.getBookName(),book.getAuthor(),book.getPublisher(),book.getPrice(),book.getCnum(),book.getSummary(),book.getPhoto(),book.getIsbn());
				this.addFieldError("msg", "修改成功！");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return SUCCESS;
	}
//--------------------------------------------------
	public String getResponse() {
		
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			String sql = "select * from book where `isbn`=?";
			ResultSet rs = JdbcUtils.executeQuery(sql, book.getIsbn());
			rs.next();
			byte[]photo = rs.getBytes(9);
			response.setContentType("image/jpeg");
			ServletOutputStream os = response.getOutputStream();
			if(photo!=null&&photo.length!=0) {
				for(int i=0;i<photo.length;i++) {
					os.write(photo[i]);
				}
				os.flush();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return NONE;
	}
}
