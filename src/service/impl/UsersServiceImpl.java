package service.impl;

import java.sql.ResultSet;

import org.apache.catalina.User;

import com.mysql.jdbc.StringUtils;

import dao.UsersDao;
import dao.impl.UsersDaoImpl;
import model.Users;
import service.UsersService;
import util.DBConnected_MySQL;


public class UsersServiceImpl extends BaseServiceImpl<Users> implements UsersService {
	UsersDao usersDao = new UsersDaoImpl();
	
	/**
	 * 核对用户名和密码
	 */
	@Override
	public int rightUsers(Users user) throws Exception{
		Users oneuser = usersDao.getUsersByName(user);
		if (oneuser == null) {	// 返回为null，表明数据库里不存在该用户名账号
			return USER_NOT_EXISTS;
		}
		if (oneuser.getName().trim().equals(user.getName().trim())) {
			if (oneuser.getPassword().trim().equals(user.getPassword().trim())) {
				return USER_OK;
			} else
				return PASSWORD_ERROR;
		}
		return USER_NOT_EXISTS;
	}
	
	/**
	 * 通过用户名，查找用户是否存在
	 */
	@Override
	public int isExitsUser(Users user) throws Exception {

		Users oneuser = usersDao.getUsersByName(user);
		if (oneuser == null) {
			return USER_NOT_EXISTS;
		}
		return USER_ALREADY_EXISTS;
	}
	
	
	/**
	 * 通过传入的id查找用户
	 */
	@Override
	public Users getUserById(Users user) throws Exception {
		return usersDao.getUserById(user);
	}
	
	
	
	
	@Override
	public Users getUsersByName(Users user) throws Exception {
		return usersDao.getUsersByName(user);
	}

	/**
	 * 添加新用户
	 */
	@Override
	public boolean add(Users user) throws Exception {
		//TODO
		return usersDao.add(user);
	}

	@Override
	public boolean update(Users obj) throws Exception {
		// TODO Auto-generated method stub
		return super.update(obj);
	}

	@Override
	public boolean delete(Users obj) throws Exception {
		// TODO Auto-generated method stub
		return super.delete(obj);
	}	
}
