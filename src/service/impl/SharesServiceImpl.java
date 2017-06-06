package service.impl;

import java.util.List;

import dao.SharesDao;
import dao.impl.SharesDaoImpl;
import model.Works;

import service.SharesService;

public class SharesServiceImpl extends BaseServiceImpl<Works> implements SharesService {
	SharesDao sharesDao = new SharesDaoImpl(); 
	
	@Override
	public List<Works> search(Works works, int pageSize, int pageNum, String key) throws Exception {
		// TODO Auto-generated method stub
		return sharesDao.search(works, pageSize, pageNum, key);
	}

	@Override
	public int pageCount(Works works, int pageSize, String key) throws Exception {
		// TODO Auto-generated method stub
		return sharesDao.pageCount(works, pageSize, key);
	}

	@Override
	public boolean add(Works works) throws Exception {
		return sharesDao.add(works);
	}

	@Override
	public boolean update(Works works) throws Exception {
		return sharesDao.update(works);
	}

	@Override
	public boolean delete(Works works) throws Exception {
		return sharesDao.delete(works);
	}
	
	@Override
	public Works getWorkByTitle(Works works) throws Exception {
		return sharesDao.getWorkByTitle(works);
	}
	
	@Override
	public Works getWorkById(Works works) throws Exception {
		return sharesDao.getWorkById(works);
	}

	@Override
	public boolean addToWorks(Works works) throws Exception {
		return sharesDao.addToWorks(works);
	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return super.clone();
	}

	@Override
	public boolean equals(Object arg0) {
		// TODO Auto-generated method stub
		return sharesDao.equals(arg0);
	}

	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
	}

	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return sharesDao.hashCode();
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return sharesDao.toString();
	}

}
