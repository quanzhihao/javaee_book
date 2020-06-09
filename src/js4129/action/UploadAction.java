package js4129.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import com.opensymphony.xwork2.ActionSupport;

public class UploadAction extends ActionSupport{
	private  File upload;        		   		 		  	//上传文件
	private String uploadFileName;							//上传的文件名
	//属性upload的get/set方法
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String execute() throws Exception {
		InputStream is=new FileInputStream(getUpload());	//根据上传的文件得到输入流
		OutputStream os=new FileOutputStream("g:\\"+uploadFileName);	//指定输出流地址
		byte buffer[]=new byte[1024];   
		int count=0;
		while((count=is.read(buffer))>0){
			os.write(buffer,0,count);    			   		//把文件写到指定位置的文件中
		}
		os.close();											//关闭
		is.close();
		this.addFieldError("msg", "上传成功");
		this.addFieldError("msg", "javascript:history.back(-1);");
		this.addFieldError("msg", "点击返回");
		return SUCCESS;                         	 		//返回
	}
	//属性uploadFileName的get/set方法
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
}
