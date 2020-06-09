package js4129.action;

import java.sql.ResultSet;

import js4129.db.JdbcUtils;
import js4129.model.User;

import com.opensymphony.xwork2.ActionSupport;

public class ZhuCeAction extends ActionSupport {
	
	private User user;
	
	@Override
	public String execute() throws Exception {
		
		String sql = "insert into user(`name`,`pass`,`role`,`sex`,`age`,`sid`,`szy`,`cls`,`tel`) values(?,md5(password(?)),?,?,?,?,?,?,?)";
		JdbcUtils.executeUpdate(sql, user.getName(),user.getPass(),"false",user.getSex(),user.getAge(),user.getSid(),user.getSzy(),user.getCls(),user.getTel());
		sql="select `id` from user where `name`=? and `pass`=md5(password(?)) and `sex`=? and `age`=? and `sid`=? and `szy`=? and `cls`=? and `tel`=? order by `id` desc";
		ResultSet rs = JdbcUtils.executeQuery(sql, user.getName(),user.getPass(),user.getSex(),user.getAge(),user.getSid(),user.getSzy(),user.getCls(),user.getTel());
		rs.next();
		this.addFieldError("msg", "注册成功,您的借书证号为 "+rs.getString("id"));
		this.addFieldError("msg", "index.html");
		this.addFieldError("msg", "返回登录");
		return "ok";
	}
	
	@Override
	public void validate() {
		if(user.getPass()==null||user.getPass().equals("")){
			this.addFieldError("Pass", "密码不为空！");
		}else if(user.getRepass()==null||user.getRepass().equals("")){
			this.addFieldError("Repass", "密码不为空！");
		}else if(!user.getPass().equals(user.getRepass())){
			this.addFieldError("Repass", "两次输入不同！");
		}else if(user.getName()==null||user.getName().equals("")){
			this.addFieldError("Name", "名字不为空！");
		}else if(user.getAge()==null||user.getAge().equals("")){
			this.addFieldError("Age", "年龄不为空！");
		}else if(user.getAge().length()!=2){
			this.addFieldError("Age", "输入不正确！");
		}else if(user.getSid()==null||user.getSid().equals("")){
			this.addFieldError("Sid", "学号不为空！");
		}else if(user.getSid().length()!=12){
			this.addFieldError("Sid", "格式不正确！");
		}else if(user.getSzy()==null||user.getSzy().equals("")){
			this.addFieldError("Szy", "专业不为空！");
		}else if(user.getCls()==null||user.getCls().equals("")){
			this.addFieldError("Cls", "班级不为空！");
		}else if(user.getTel()==null||user.getTel().equals("")){
			this.addFieldError("Tel", "电话不为空！");
		}else if(user.getTel().length()!=11){
			this.addFieldError("Tel", "格式不正确！");
		}
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
