package js4129.action;

import java.sql.ResultSet;
import java.util.Map;

import js4129.db.JdbcUtils;
import js4129.model.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Reader extends ActionSupport {
	
	private User user;
	private int uid;
	
	@Override
	public String execute() throws Exception {
		
		Map session=ActionContext.getContext().getSession();
		user = (User)session.get("login");
		String sql = "select * from user where `id`=?";
		ResultSet rs;
		if(!user.isRole()){
			uid=user.getId();	
		}
		rs = JdbcUtils.executeQuery(sql, uid);
		rs.next();
		user.setId(rs.getInt("id"));
		user.setName(rs.getString("name"));
		user.setAge(rs.getString("age"));
		user.setSid(rs.getString("sid"));
		user.setSzy(rs.getString("szy"));
		user.setCls(rs.getString("cls"));
		user.setTel(rs.getString("tel"));
		user.setOff(rs.getInt("off"));
		
		return SUCCESS;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
}
