package js4129.db;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import java.sql.PreparedStatement;

public class JdbcUtils {
	private static Properties prop = null;
	private static Connection con = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs  = null;
	static{
		//获取配置文件中的参数
		try {
			InputStream in  = JdbcUtils.class.getClassLoader().getResourceAsStream("property.properties");
			prop = new Properties();
			prop.load(in);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
		//加载数据库驱动
		try {
			Class.forName(prop.getProperty("driver"));
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			con = DriverManager.getConnection(prop.getProperty("driverManager"),
					prop.getProperty("username"),
					prop.getProperty("password"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
	
	}
	
	
	//获取连接
	public static Connection getConnection()
	{
		try {
			con = DriverManager.getConnection(prop.getProperty("driverManager"),
					prop.getProperty("username"),
					prop.getProperty("password"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
		return con;
	}
	
	
	
	
	//执行sql查询语句
	public static ResultSet executeQuery(String sql)
	{
		try {
			pstmt = con.prepareStatement(sql);
			return pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
	}
	//执行带参数的Sql查询语句
	public static ResultSet executeQuery(String sql,Object... params)
	{
		 try {
			pstmt = con.prepareStatement(sql);
			initParams(pstmt,params);//给参数赋值
			return pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("查询异常"+e);
		}
	}
	
	//执行insert,update,delete语句
	public static void executeUpdate(String sql,Object... params)
	{
		try {
			pstmt = con.prepareStatement(sql);
			initParams(pstmt, params);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		} 
	}
	
	
	//给参数赋值
	private static void initParams(PreparedStatement pstmt,Object... params)
	{
		try {
			for(int i=0;i<params.length;i++)
			{
				pstmt.setObject(i+1,params[i]);
			}
		} catch (SQLException e) {
				// TODO Auto-generated catch block
				throw new RuntimeException(e);
			} 
	}
}
