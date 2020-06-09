package js4129.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import com.opensymphony.xwork2.ActionSupport;

public class UploadAction extends ActionSupport{
	private  File upload;        		   		 		  	//�ϴ��ļ�
	private String uploadFileName;							//�ϴ����ļ���
	//����upload��get/set����
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String execute() throws Exception {
		InputStream is=new FileInputStream(getUpload());	//�����ϴ����ļ��õ�������
		OutputStream os=new FileOutputStream("g:\\"+uploadFileName);	//ָ���������ַ
		byte buffer[]=new byte[1024];   
		int count=0;
		while((count=is.read(buffer))>0){
			os.write(buffer,0,count);    			   		//���ļ�д��ָ��λ�õ��ļ���
		}
		os.close();											//�ر�
		is.close();
		this.addFieldError("msg", "�ϴ��ɹ�");
		this.addFieldError("msg", "javascript:history.back(-1);");
		this.addFieldError("msg", "�������");
		return SUCCESS;                         	 		//����
	}
	//����uploadFileName��get/set����
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
}
