package js4129.action;

import java.sql.ResultSet;
import java.util.Date;

import js4129.db.JdbcUtils;

import com.opensymphony.xwork2.ActionSupport;

public class Index extends ActionSupport {
	
	@Override
	public String execute() throws Exception {
		
		String sql = "select * from lend where datediff(sysdate(),time) > 30;";
		ResultSet rs = JdbcUtils.executeQuery(sql);
		while(rs.next()) {
			int bid = rs.getInt("bid");
			int uid = rs.getInt("uid");
			sql = "update user set `off`=`off`+1 where `id`=?";
			JdbcUtils.executeUpdate(sql,uid);
			sql = "update lend set `time`=? where `bid`=? and `uid`=?";
			JdbcUtils.executeUpdate(sql,new Date(),bid,uid);
		}
		
		return SUCCESS;
	}

}
