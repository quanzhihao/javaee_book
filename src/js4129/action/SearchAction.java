package js4129.action;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import js4129.db.JdbcUtils;
import js4129.model.Lend;
import js4129.model.User;
import js4129.tool.Pager;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SearchAction extends ActionSupport {
	
	private User user;
	private int pageNow = 1;	//初始页面为第1页
	private int pageSize = 5;	//每页显示4条记录
	
	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	@Override
	public String execute() throws Exception {
		
		Map session=ActionContext.getContext().getSession();
		Map request=(Map)ActionContext.getContext().get("request");
		user = (User)session.get("login");
		String sql="select count(*) as x from user where `id`=?";
		ResultSet rs = JdbcUtils.executeQuery(sql, l.getReader());
		try {
			rs.next();
			if(l.getReader()==null||l.getReader().equals("")){
				l.setReader(user.getId().toString());
			}else if(rs.getString("x").equals("0")){
				l.setReader(user.getId().toString());
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		sql = "select `isbn`,book.`name` as `bame`,`auth`,`pub`,`pric`,user.`name` as `uame`,`time` from lend,user,book where `uid`=? and lend.`uid`=user.`id` and lend.`bid`=book.`id` order by `time` desc limit ?,?";
		rs = JdbcUtils.executeQuery(sql, l.getReader(),pageSize*(pageNow-1),pageSize);
		List<Lend>list = new ArrayList<Lend>();
		while(rs.next()) {
			Lend lend = new Lend();
			lend.setIsbn(rs.getString("isbn"));
			lend.setBookName(rs.getString("bame"));
			lend.setAuthor(rs.getString("auth"));
			lend.setPublisher(rs.getString("pub"));
			lend.setPrice(rs.getFloat("pric"));
			lend.setReader(rs.getString("uame"));
			lend.setlTime(rs.getDate("time"));
			list.add(lend);
		}
		sql = "select count(*) as `total` from lend where `uid`=?";
		ResultSet x = JdbcUtils.executeQuery(sql, l.getReader());
		x.next();
		Pager page = new Pager(pageNow, x.getInt("total"));
		request.put("list", list);
		request.put("page", page);
		request.put("rid", l.getReader());
		return SUCCESS;
	}
	
	private Lend l;

	public Lend getL() {
		return l;
	}

	public void setL(Lend l) {
		this.l = l;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
