package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;



public class DBConnected_MySQL {
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/lvu?useUnicode=true&characterEcoding=utf-8";
	private static final String USER = "root";
	private static final String PASSWORD = "12345";
	
	private static DBConnected_MySQL dbConnected = null;
	private static Connection connection = null;
	
	static {
		try {
			Class.forName(DRIVER);
		} catch (Exception e) {
			e.printStackTrace();			
		}
	}

	/**
	 * 私有构造方法，只创建一个实例，外部不能创建，直接用此实例即可
	 * @throws Exception
	 */
	private DBConnected_MySQL() throws Exception {
		connection = DriverManager.getConnection(URL, USER,PASSWORD);
	}
	
	/**
	 * 对外公开调用方法，通过此方法可以连接数据库
	 * @return
	 * @throws Exception
	 */
	public static DBConnected_MySQL getDBConnected() throws Exception{
		if (dbConnected == null) {
			dbConnected = new DBConnected_MySQL();
		}
		return dbConnected;
	}

	/**
	 * 查询数据库记录
	 * @param sql
	 * @return 数据库记录
	 * @throws Exception
	 */
	public ResultSet executeQuery(String sql) throws Exception {
		Statement statement = connection.createStatement();
		return statement.executeQuery(sql);
	}
	
	
	/**
	 * 数据库记录跟新
	 * @param sql
	 * @return 1：表示成功跟新这条数据
	 * @throws Exception
	 */
	public int executeUpdate(String sql) throws Exception {
		Statement statement = connection.createStatement();
		return statement.executeUpdate(sql);
	}
	
	/**
	 * 根据参数执行查询操作
	 * @param sql 
	 * @param objects 
	 * @return
	 * @throws Exception
	 */
	public ResultSet executeQuery(String sql, Object...objects) throws Exception {
		PreparedStatement statement = connection.prepareStatement(sql);
		if (objects != null) {
			for (int i = 0; i < objects.length; i++) {
				Object param = objects[i];
				System.out.println("param: " + param);
				statement.setObject(i+1, param);
			}
		}
		ResultSet result = statement.executeQuery();
		return result;
	}
	
	
	/**
	 * 根据参数执行跟新操作
	 * @param sql 
	 * @param objects 
	 * @return
	 * @throws Exception
	 */
	public int executeUpdate(String sql, Object...objects) throws Exception {
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		if (objects != null) {
			for (int i = 0; i < objects.length; i++) {
				Object param = objects[i];
				preparedStatement.setObject(i+1, param);
			}
		}
		int result = preparedStatement.executeUpdate();
		return result;
	}
	
	/**
	 * 数据库连接关闭操作
	 */
	public void close() {
		try {
			if (connection != null && !connection.isClosed()) {
				connection.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connection = null;
			dbConnected = null;
		}
	}
	
}