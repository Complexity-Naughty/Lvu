package service;

import model.Works;

public interface SharesService extends BaseService<Works> {
	/**
	 * 通过标题获取分享文章
	 */
	public Works getWorkByTitle(Works works) throws Exception; 
	/**
	 * 通过Id查找分享作品
	 */
	public Works getWorkById(Works works) throws Exception;
	/**
	 * 只添加作品信息
	 */
	public boolean addToWorks(Works works) throws Exception;
	
}
