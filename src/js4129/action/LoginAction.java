package js4129.action;

import java.sql.ResultSet;
import java.util.Map;

import js4129.db.JdbcUtils;
import js4129.model.User;

import com.opensymphony.xwork2.*;

public class LoginAction extends ActionSupport {
	
	private User user;

	@Override
	public String execute() throws Exception {
		
		String sql="select * from `user` where `id`=? and `pass`=md5(password(?))";
		ResultSet rs = JdbcUtils.executeQuery(sql, user.getId(),user.getPass());
		if(rs.next()){
			user.setName(rs.getString("name"));
			user.setRole(rs.getBoolean("role"));
			user.setAge(rs.getString("age"));
			user.setSid(rs.getString("sid"));
			user.setSzy(rs.getString("szy"));
			user.setCls(rs.getString("cls"));
			user.setTel(rs.getString("tel"));
			Map session=ActionContext.getContext().getSession();
			session.put("login", user);
			return SUCCESS;
		}else {
			this.addFieldError("msg", "抱歉，您输入用户名或密码不正确");
			this.addFieldError("msg", "index.html");
			this.addFieldError("msg", "点此返回");
			return ERROR;
		}
	}
	
	@Override
	public void validate() {
		if(user.getId()==null||user.getId().equals("")){
			this.addFieldError("Name", "User不为空！");
		}else if(user.getPass()==null||user.getPass().equals("")){
			this.addFieldError("Pass", "Pass不为空！");
		}
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
