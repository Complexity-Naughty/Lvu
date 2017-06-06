package dao;

import java.util.List;

public interface BaseDao<T> {
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
	
	public boolean add(T obj) throws Exception;
	
	public boolean update(T obj) throws Exception;
	
	public boolean delete(T obj) throws Exception;
}
