package service;

import java.util.List;

/**
 * 基本的业务逻辑接口
 * @author Administrator
 *
 * @param <T> 需要处理的对象类型
 */
public interface BaseService<T> {
	/**
	 * 按条件查询
	 * @param condition 查询条件
	 * @param pageSize  分页大小
	 * @param pageNum  页码
	 * @param order  排序依据
	 * @return 查询结果，列表，如果没有数据，返回null
	 * @throws Exception
	 */
	public List<T> search(T condition, int pageSize, int pageNum, String key) throws Exception;

	/**
	 * 根据条件获取数据页数
	 * @param condition 查询条件
	 * @param pageSize  分页大小
	 * @return 页数
	 * @throws Exception
	 */
	public int pageCount(T condition, int pageSize, String key) throws Exception;
	
	/**
	 * 添加对象
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public boolean add(T obj) throws Exception;
	
	/**
	 * 修改对象
	 * @param obj 根据关键字修改对象
	 * @return
	 * @throws Exception
	 */
	public boolean update(T obj) throws Exception;
	
	/**
	 * 删除对象
	 * @param obj 根据关键字删除对象
	 * @return
	 * @throws Exception
	 */
	public boolean delete(T obj) throws Exception;

}
