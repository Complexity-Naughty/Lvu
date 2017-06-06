package dao.impl;


import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.StringUtils;

import dao.BaseDao;
import util.DBConnected;

public class BaseDaoImpl<T> implements BaseDao<T> {

	@Override
	public List<T> search(T condition, int pageSize, int pageNum, String key) throws Exception {
		// TODO
		return null;
	}

	@Override
	public int pageCount(T condition, int pageSize, String key) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean add(T obj) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(T obj) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(T obj) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
	
	/**
	 * 根据类名返回表名
	 * @param cls 类
	 * @return
	 */
	private String getTableName(Class<T> cls) {
		String name = cls.getSimpleName();
		return name;
	}
	
	/**
	 * 根据类名返回字段列表
	 * @param cls 类名
	 * @return
	 */
	private String[] getColumnNames(Class<T> cls) {
		Field[] fields = cls.getDeclaredFields();
		if (fields == null) 
			return null;
		String names[] = new String[fields.length];
		for (int i = 0; i < names.length; i++) {
			names[i] = fields[i].getName();					
		}
		return names;
	}

}
