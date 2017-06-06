package model;

public class Users {
	private Integer id;
	private String name;
	private String password;
	private boolean permit = false;
	
	public Users() {
		super();
	}
	
	public Users(Integer id) {
		super();
		this.id = id;
	}
	
	public Users(String name, String password, boolean permit) {
		super();
		this.name = name;
		this.password = password;
		this.permit = permit;
	}
	
	public Users(Integer id, String name, String password, boolean permit) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.permit = permit;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean getPermit() {
		return permit;
	}

	public void setPermit(boolean permit) {
		this.permit = permit;
	}

	
}
