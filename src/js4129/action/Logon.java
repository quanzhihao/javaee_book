package js4129.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Logon extends ActionSupport {
	
	@Override
	public String execute() throws Exception {
		
		Map session=ActionContext.getContext().getSession();
		session.put("login", null);
		return SUCCESS;
	}

}
