package action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import model.Works;
import service.SharesService;
import service.impl.SharesServiceImpl;

public class WorksListAction extends ActionSupport {
	/**
	 * 页大小
	 */
	private int pageSize = 3;
	/**
	 * 用户指定的页码
	 */
	private int pageNum;
	/**
	 * 目前的页码
	 */
	private int pageNo;
	/**
	 * 页数
	 */
	private int pageCount;
	
	private List<Works> worksList;
	private Works tempworks;
	private String key="12";
	SharesService sharesService = new SharesServiceImpl();
	
	@Override
	public String execute() throws Exception {
		if (tempworks == null){
			tempworks = new Works();
		}
		tempworks.setAuthorName(key);
		tempworks.setTitle(key);
		tempworks.setSummary(key);
		
		pageCount = sharesService.pageCount(tempworks, pageSize, key);
		if (pageNum > pageCount) {
			pageNo = pageCount;
		} else if (pageNum < 1) {
			pageNo = 1;
		} else {
			pageNo = pageNum;
		}
		
		worksList = sharesService.search(tempworks, pageSize, pageNo, key);
		
		return SUCCESS;
	}

	public void setWorksList(List<Works> worksList) {
		this.worksList = worksList;
	}

	public List<Works> getWorksList() {
		return worksList;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public Works getWorks() {
		return tempworks;
	}

	public void setWorks(Works works) {
		this.tempworks = works;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}
	
	
}
