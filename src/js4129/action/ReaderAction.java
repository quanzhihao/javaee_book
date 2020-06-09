package js4129.action;

import java.util.Map;
import js4129.db.JdbcUtils;
import js4129.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ReaderAction extends ActionSupport {

	private User user;
	private int uid;
	
	
	@Override
	public String execute() throws Exception {
		
		Map session=ActionContext.getContext().getSession();
		User s = (User)session.get("login");
		uid=s.getId();
		if(user.getName()==null||user.getName().equals("")){
			user.setName(s.getName());
		}else if(user.getAge()==null||user.getAge().equals("")){
			user.setAge(s.getAge());
		}else if(user.getSid()==null||user.getSid().equals("")){
			user.setSid(s.getSid());
		}else if(user.getSzy()==null||user.getSzy().equals("")){
			user.setSzy(s.getSzy());
		}else if(user.getCls()==null||user.getCls().equals("")){
			user.setCls(s.getCls());
		}else if(user.getTel()==null||user.getTel().equals("")){
			user.setTel(s.getTel());
		}
		// uid���û����е�id��ָ��ͬһ������
		String sql = "update user set `name`=?,`age`=?,`sid`=?,`szy`=?,`cls`=?,`tel`=?,`off`=? where `id`=?";
		JdbcUtils.executeUpdate(sql, user.getName(),user.getAge(),user.getSid(),user.getSzy(),user.getCls(),user.getTel(),user.getOff(),uid);
		this.addFieldError("msg", "�޸ĳɹ�");
		this.addFieldError("msg", "reader.html?uid="+uid);
		this.addFieldError("msg", "��˷���");
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
