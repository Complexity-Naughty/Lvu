package dao.impl;

import java.sql.ResultSet;
import java.util.List;

import org.apache.catalina.User;

import com.mysql.jdbc.StringUtils;
import com.sun.rowset.internal.Row;

import dao.UsersDao;
import model.Users;
import util.DBConnected_MySQL;

public class UsersDaoImpl implements UsersDao {

	
	public Users getUsersByName(Users user) throws Exception {
		DBConnected_MySQL dbConnected_MySQL = DBConnected_MySQL.getDBConnected();
		String sql = "select * from users where name=?";
		ResultSet resultSet = dbConnected_MySQL.executeQuery(sql, user.getName());
		
		//TODO resultSet里会选择到本来没有的user，sql语句存在问题
		
		if (resultSet.next()) {
			int id = resultSet.getInt("id");
			String name = resultSet.getString("name");
			String password = resultSet.getString("password");
			boolean permit = resultSet.getBoolean("permit");
			
			Users oneuser = new Users(id, name, password, permit);
			
			return oneuser;
		}
		return null;
	}
	
	
	
	@Override
	public Users getUserById(Users user) throws Exception {
		DBConnected_MySQL dbConnected_MySQL = DBConnected_MySQL.getDBConnected();
		String sql = "select * from users where id=?";
		ResultSet resultSet = dbConnected_MySQL.executeQuery(sql, user.getId());
		
		if (resultSet.next()) {
			int id = resultSet.getInt("id");
			String name = resultSet.getString("name");
			String password = resultSet.getString("password");
			boolean permit = resultSet.getBoolean("permit");
			
			Users oneuser = new Users(id, name, password, permit);
			
			return oneuser;
		}
		
		return null;
	}



	@Override
	public List<Users> search(Users condition, int pageSize, int pageNum, String key) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int pageCount(Users condition, int pageSize, String key) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean add(Users user) throws Exception {
		DBConnected_MySQL dbConnected_MySQL = DBConnected_MySQL.getDBConnected();
		String sql = "insert into users(id, name, password) values(?,?,?)";
		int res = dbConnected_MySQL.executeUpdate(sql,
				user.getId(), user.getName(), user.getPassword());
		return res == 1;
	}

	@Override
	public boolean update(Users user) throws Exception {
		DBConnected_MySQL dbConnected_MySQL = DBConnected_MySQL.getDBConnected();
		String sql = "update users set name=?, password=? where id=?";
		int res = dbConnected_MySQL.executeUpdate(sql,
				user.getName(), user.getPassword(), user.getId());
		return res == 1;
	}

	@Override
	public boolean delete(Users user) throws Exception {
		DBConnected_MySQL dbConnected_MySQL = DBConnected_MySQL.getDBConnected();
		String sql = "delete from users where id=?";
		int res = dbConnected_MySQL.executeUpdate(sql, user.getId());
		return res == 1;
	}

	
	
}
