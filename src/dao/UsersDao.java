package dao;

import org.apache.catalina.User;

import model.Users;

public interface UsersDao extends BaseDao<Users> {
	/**
	 * 正确用户名和密码
	 */
	public final int USER_OK = 0;
	/**
	 * 存在用户，密码错误
	 */
	public final int PASSWORD_ERROR = 1;
	/**
	 * 不存在该用户名
	 */
	public final int USER_NOT_EXISTS = 2;
	/**
	 * 已存在该用户名
	 */
	public final int USER_ALREADY_EXISTS = 3;
	
	/**
	 * 根据姓名查询用户情况
	 * @param user 待查询的用户
	 * @return 查询结果
	 * @throws Exception
	 */
	public Users getUsersByName(Users user) throws Exception;
	
	/**
	 * 根据id获取用户信息
	 * @param user 待查询的用户
	 * @return 查询结果
	 * @throws Exception
	 */
	public Users getUserById(Users user) throws Exception;
	

}
