package js4129.action;

import java.io.InputStream;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class DownAction extends ActionSupport {
	
	private String downloadFile;
	
	@Override
	public String execute() throws Exception {
		
		return SUCCESS;
	}

	public InputStream getTargetFile() {
		return ServletActionContext.getServletContext().getResourceAsStream(downloadFile);
	}

	public void setDownloadFile(String downloadFile) {
		this.downloadFile = downloadFile;
	}
}
