package js4129.action;

import java.sql.ResultSet;
import java.util.Date;
import java.util.Map;

import js4129.db.JdbcUtils;
import js4129.model.Lend;
import js4129.model.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LendAction extends ActionSupport {
	
	private Lend lend;
	
	public Lend getLend() {
		return lend;
	}

	public void setLend(Lend lend) {
		this.lend = lend;
	}

	@Override
	public String execute() throws Exception {
		
		Map session=ActionContext.getContext().getSession();
		User s = (User)session.get("login");
		
		try {
			String sql = "select distinct * from book where `isbn`=? or `name`=?";
			ResultSet rs = JdbcUtils.executeQuery(sql,lend.getIsbn(),lend.getBookName());
			if((lend.getIsbn()==null||lend.getIsbn().equals(""))&&(lend.getBookName()==null||lend.getBookName().equals(""))) {
				this.addFieldError("msg", "ISBN��������Ϊ��");
			}else if(!rs.next()) {
				this.addFieldError("msg", "�����ڸ�ISBN������");
			}else {
				int bid = rs.getInt("id");
				sql = "select `num`-count(bid) as `x` from book,lend where book.id=? and book.id=lend.bid";
				rs = JdbcUtils.executeQuery(sql, bid);
				rs.next();
				if(rs.getInt("x")<1) {
					this.addFieldError("msg", "��ISBN��ͼ��û�п��");
				}else {
					sql = "select * from lend where bid=? and uid=?";
					rs = JdbcUtils.executeQuery(sql, bid, s.getId());
					if(rs.next()) {
						this.addFieldError("msg", "�����ظ�����");
					}else {
						sql = "select * from user where id=?";
						rs = JdbcUtils.executeQuery(sql, s.getId());
						rs.next();
						if(rs.getInt("off")>2) {
							this.addFieldError("msg", "ΥԼ����>2,���������");
						}else {
							sql = "insert into lend(`bid`,`uid`,`time`) values(?,?,?)";
							JdbcUtils.executeUpdate(sql, bid, s.getId(),new Date());
							this.addFieldError("msg", "����ɹ�");
						}
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		this.addFieldError("msg", "selectBook.html?l.reader="+s.getId());
		this.addFieldError("msg", "��˷���");
		
		return SUCCESS;
		
	}
}
