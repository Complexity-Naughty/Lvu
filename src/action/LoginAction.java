package action;

import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.ActionSupport;

import model.Users;
import service.UsersService;
import service.impl.UsersServiceImpl;

/**
 * 登陆Action：
 * 用来处理登陆动作
 * @author Administrator
 *
 */
public class LoginAction extends ActionSupport {

	private Users user;
	private String repassword;
	private boolean logined = false;
	
	
	public Users getUser() {
		return user;
	}


	public void setUser(Users user) {
		this.user = user;
	}


	public String getRepassword() {
		return repassword;
	}


	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public boolean isLogined() {
		return logined;
	}


	public void setLogined(boolean logined) {
		this.logined = logined;
	}


	public String login() throws Exception {
		if (StringUtils.isEmpty(user.getName()) || StringUtils.isEmpty(user.getPassword())) {
			addActionError("- - - 用户名或密码为空 - - -");
			return LOGIN;
		}
		UsersService usersService = new UsersServiceImpl();
		int result = usersService.rightUsers(user);
		switch (result) {
		case UsersService.USER_OK:
			addActionMessage("- - - 登陆成功 - - -");
			this.user = usersService.getUsersByName(user);
			System.out.println(user.getId());
			System.out.println(user.getPermit());
			logined = true;
			System.out.println("logined: " + logined);
			return SUCCESS;
		case UsersService.PASSWORD_ERROR:
			addActionError("- - - 密码错误 - - -");
			break;
		case UsersService.USER_NOT_EXISTS:
			addActionError("- - - 该用户不存在 - - -");
			break;
		}
		addActionError("- - 未知错误，请刷新重试 - -");
		return LOGIN;
	}
	
	public String register() throws Exception {
		
		if (StringUtils.isEmpty(user.getName()) || StringUtils.isEmpty(user.getPassword()) || StringUtils.isEmpty(repassword)) {
			addActionError("- - - 账号或密码为空 - - -");
			return "register";
		}
		if (!repassword.equals(user.getPassword())) {
			addActionError("- - - 两次输入的密码不一致 - - -");
			return "register";
		}
		
		UsersService usersService = new UsersServiceImpl();
		
		if (usersService.USER_ALREADY_EXISTS == usersService.isExitsUser(user)) {
			addActionError("- - - 该账号已被使用 - - -");
			return "register";
		} else if (usersService.USER_NOT_EXISTS == usersService.isExitsUser(user)) {
			if (usersService.add(user)) {
				logined = true;
				System.out.println("logined: " + logined);
				return SUCCESS;
			}
		}

		return "register";
	}
	
	/**
	 * 转到添加页面
	 * @throws Exception
	 */
	public String turnToadd() throws Exception {
		UsersService usersService = new UsersServiceImpl();
		this.user = usersService.getUserById(user);
		logined = true;
		return SUCCESS;
	}
}
