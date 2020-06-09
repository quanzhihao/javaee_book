package js4129.action;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import js4129.db.JdbcUtils;
import js4129.model.User;
import js4129.tool.Pager;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {
	
	private User user;
	private int off;

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
		List<User>list = new ArrayList<User>();
		String sql;
		if(off==3) {
			sql = "select * from user where `off`>2 order by `off` limit ?,?";
		}else {
			sql = "select * from user limit ?,?";
		}
		ResultSet rs = JdbcUtils.executeQuery(sql,pageSize*(pageNow-1),pageSize);
		while(rs.next()) {
			User s = new User();
			s.setId(rs.getInt("id"));
			s.setName(rs.getString("name"));
			s.setSex(rs.getString("sex"));
			s.setAge(rs.getString("age"));
			s.setSid(rs.getString("sid"));
			s.setSzy(rs.getString("szy"));
			s.setCls(rs.getString("cls"));
			s.setTel(rs.getString("tel"));
			s.setOff(rs.getInt("off"));
			list.add(s);
		}
		if(off==3) {
			sql = "select count(*) as `total` from user where `off`>2";
		}else {
			sql = "select count(*) as `total` from user";
		}
		ResultSet x = JdbcUtils.executeQuery(sql);
		x.next();
		Pager page = new Pager(pageNow, x.getInt("total"));
		request.put("list", list);
		request.put("page", page);
		return SUCCESS;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getOff() {
		return off;
	}

	public void setOff(int off) {
		this.off = off;
	}
}
