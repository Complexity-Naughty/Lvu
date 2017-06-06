package action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import model.Works;
import model.Users;
import service.SharesService;
import service.UsersService;
import service.impl.SharesServiceImpl;
import service.impl.UsersServiceImpl;


/**
 * LvuAction：
 * 用来处理用户进行的文章的增删改查操作
 * @author Administrator
 *
 */
public class LvuAction2 extends ActionSupport {
	private Users user;
	private boolean logined = false;
	private Works works;
	private String[] PicName = new String[3];
	private Integer worksID = 0;
	private File[] pic; // 上传的文件对象
	private String[] picFileName; // 上传的文件名
	private String[] picContentType; // 上传的文件类型
	private UsersService usersService = new UsersServiceImpl();
	
	
	/**
	 * 添加分享
	 * @return
	 * @throws Exception
	 */
	public String add() throws Exception {
		this.user = usersService.getUserById(user);
		logined = true;
		works.setAuthorId(user.getId());
		works.setAuthorName(user.getName());
		works.setSummary(works.getSummary());	
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式
		Date time = new Date();
		works.setTime(dateFormat.format(time));
		SharesService sharesService = new SharesServiceImpl();		
		
		//TODO add操作应确保标题唯一，未实现
		boolean result = sharesService.addToWorks(works);
		if (result) {
			String content[] = works.getContent();
			works = sharesService.getWorkByTitle(works);
			works.setContent(content);
			worksID = works.getId();
		}
		// 获取/MainPackage/images-eassay/的磁盘绝对路径 
		//F:/JAVA-IDEA/LvU/WebContent
		
		String path = ServletActionContext.getServletContext().getRealPath("/MainPackage/images-eassay/");
		if (pic != null) {
			for (int i = 0; i < pic.length; i++) {
				//为了上传一个文件 我也是哭了
				//文件保存的路径不应该在webcontent下面，不然重新启动时（重新部署时）会被清空
				//但是我自己放进去的文件夹却没有被清空，难道它是记忆那些文件是操作产生？
				String endfix = picFileName[i].substring(picFileName[i].lastIndexOf("."));
				String desFileName = worksID + "-" + i + endfix;
				File destFile = new File(path, desFileName);
				FileUtils.copyFile(pic[i], destFile);
				PicName[i] = path + desFileName;
				
				System.out.println("pic.toString(): " + pic[i].toString());
				System.out.println("PicName:" + PicName[i]);
				System.out.println("picFileName: " + picFileName[i]);
				System.out.println("endfix:" + endfix);
				System.out.println("path:" + path);
			}
			works.setPic(PicName);
		}
		if (sharesService.update(works)) {
			return SUCCESS;
		}
		//TODO
		return SUCCESS;
	}


	public Users getUser() {
		return user;
	}


	public void setUser(Users user) {
		this.user = user;
	}


	public boolean isLogined() {
		return logined;
	}


	public void setLogined(boolean logined) {
		this.logined = logined;
	}


	public Works getWorks() {
		return works;
	}


	public void setWorks(Works works) {
		this.works = works;
	}


	public String[] getPicName() {
		return PicName;
	}


	public void setPicName(String[] picName) {
		PicName = picName;
	}


	public Integer getSharesID() {
		return worksID;
	}


	public void setSharesID(Integer sharesID) {
		this.worksID = sharesID;
	}


	public File[] getPic() {
		return pic;
	}


	public void setPic(File[] pic) {
		this.pic = pic;
	}


	public String[] getPicFileName() {
		return picFileName;
	}


	public void setPicFileName(String[] picFileName) {
		this.picFileName = picFileName;
	}


	public String[] getPicContentType() {
		return picContentType;
	}


	public void setPicContentType(String[] picContentType) {
		this.picContentType = picContentType;
	}

	
}


