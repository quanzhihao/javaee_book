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
		this.addFieldError("msg", "ע��ɹ�,���Ľ���֤��Ϊ "+rs.getString("id"));
		this.addFieldError("msg", "index.html");
		this.addFieldError("msg", "���ص�¼");
		return "ok";
	}
	
	@Override
	public void validate() {
		if(user.getPass()==null||user.getPass().equals("")){
			this.addFieldError("Pass", "���벻Ϊ�գ�");
		}else if(user.getRepass()==null||user.getRepass().equals("")){
			this.addFieldError("Repass", "���벻Ϊ�գ�");
		}else if(!user.getPass().equals(user.getRepass())){
			this.addFieldError("Repass", "�������벻ͬ��");
		}else if(user.getName()==null||user.getName().equals("")){
			this.addFieldError("Name", "���ֲ�Ϊ�գ�");
		}else if(user.getAge()==null||user.getAge().equals("")){
			this.addFieldError("Age", "���䲻Ϊ�գ�");
		}else if(user.getAge().length()!=2){
			this.addFieldError("Age", "���벻��ȷ��");
		}else if(user.getSid()==null||user.getSid().equals("")){
			this.addFieldError("Sid", "ѧ�Ų�Ϊ�գ�");
		}else if(user.getSid().length()!=12){
			this.addFieldError("Sid", "��ʽ����ȷ��");
		}else if(user.getSzy()==null||user.getSzy().equals("")){
			this.addFieldError("Szy", "רҵ��Ϊ�գ�");
		}else if(user.getCls()==null||user.getCls().equals("")){
			this.addFieldError("Cls", "�༶��Ϊ�գ�");
		}else if(user.getTel()==null||user.getTel().equals("")){
			this.addFieldError("Tel", "�绰��Ϊ�գ�");
		}else if(user.getTel().length()!=11){
			this.addFieldError("Tel", "��ʽ����ȷ��");
		}
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
