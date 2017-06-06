package action;

import com.opensymphony.xwork2.ActionSupport;

import model.Users;
import service.UsersService;
import service.impl.UsersServiceImpl;

/**
 * 用户中心Action：
 * 用来处理用户进入个人页面之后的动作
 * @author Administrator
 *
 */
public class UserAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private int id;
	private Users user;
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public String turnToindex() throws Exception {
		UsersService usersService = new UsersServiceImpl();
		this.user = usersService.getUserById(new Users(id));
//		System.out.println(id);
//		System.out.println("id: " + user.getId());
//		System.out.println("name: " + user.getName());
//		System.out.println("password: " + user.getPassword());
//		System.out.println("permit: " + user.getPermit());
//		System.out.println("user: " + this.user);
		if(user == null) {
			addActionError("获取用户信息失败");
			return ERROR;
		}
		return SUCCESS;
	}
}
