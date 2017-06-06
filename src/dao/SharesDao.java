package dao;

import model.Works;

public interface SharesDao extends BaseDao<Works> {
	/**
	 * 分享作品未找到
	 */
	public final int WORKS_NOT_EXISTS = 0;
	
	/**
	 * 通过Title查找分享作品
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
