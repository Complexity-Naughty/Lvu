package service.impl;

import java.util.List;

import dao.BaseDao;
import service.BaseService;

/**
 * 所有业务的公共服务对象
 * @author Administrator
 *
 * @param <T>
 */
public class BaseServiceImpl<T> implements BaseService<T> {
	protected BaseDao<T> dao = null;
	
	public BaseServiceImpl() {		
	}
	
	public BaseServiceImpl(BaseDao<T> baseDao) {
		this.dao = baseDao;
	}

	@Override
	public List<T> search(T condition, int pageSize, int pageNum, String key) throws Exception {
		return dao.search(condition, pageSize, pageNum, key);
	}

	@Override
	public int pageCount(T condition, int pageSize, String key) throws Exception {
		return dao.pageCount(condition, pageSize, key);
	}

	@Override
	public boolean add(T obj) throws Exception {
		return dao.add(obj);
	}

	@Override
	public boolean update(T obj) throws Exception {
		return dao.update(obj);
	}

	@Override
	public boolean delete(T obj) throws Exception {
		return dao.delete(obj);
	}

}
