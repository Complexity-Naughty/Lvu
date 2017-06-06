package dao.impl;

import java.sql.Array;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.mysql.jdbc.StringUtils;

import dao.SharesDao;
import model.Works;
import util.DBConnected_MySQL;

public class SharesDaoImpl implements SharesDao {
	private Integer id;
	private Integer authorId;
	private String authorName;
	private String title;
	private String type;
	private String summary;
	private String time;
	private String[] content = new String[3];
	private String[] pic= new String[3];

	@Override
	public List<Works> search(Works works, int pageSize, int pageNum, String key) throws Exception {
		Set<Works> tempworksList = new HashSet<>();
		tempworksList.clear();
		List<Works> worksList = new ArrayList<>();
		DBConnected_MySQL dbConnected_MySQL = DBConnected_MySQL.getDBConnected();
		//左连接的用法 需要再进一步研究， users表在前面的话， 会出现只有作者的空作品列，就是下面这条注释了的sql语句
		//String sql = "select * from users left join ((select id as worksId, authorId, title, type, summary, time from works) as works) on works.authorId=users.id ";
		String sql = "select * from ((select id as worksId, authorId, authorName, title, type, summary, time from works) as works) left join users on works.authorId=users.id";
		String where = "";
		String limit = " limit ?,? ";
		 
		
		//计算分页数据
		int begin = (pageNum - 1) * pageSize;
		int end = begin + pageSize;
		//有查询条件
		if (works != null) {
			if ( !StringUtils.isNullOrEmpty(works.getType()) && !"all".equals(works.getType()) ) {
				where = String.format(" where type='%s'", works.getType());
				if (!StringUtils.isNullOrEmpty(key)) {
					where += String.format(" and (authorName like '%%%s%%' or title like'%%%s%%' or summary like '%%%s%%')", 
							works.getAuthorName(), works.getTitle(), works.getSummary());
				}
			} else if (!StringUtils.isNullOrEmpty(key)) {
				where = String.format(" where authorName like '%%%s%%' or title like'%%%s%%' or summary like '%%%s%%'",
						works.getAuthorName(), works.getTitle(), works.getSummary());
			}
		}
		//置换分页条件
		sql += limit;
		System.out.println(sql);
		System.err.println("pageno: " + pageNum + " -- " + "begin: " + begin + " -- " + "end: " + end);
		ResultSet resultSet = dbConnected_MySQL.executeQuery(sql, begin, pageSize);
		System.err.println("HashSet.start.size: " + tempworksList.size());
		while (resultSet.next()) {
			 Integer worksId = resultSet.getInt("worksId");
			 Integer authorId = resultSet.getInt("authorId");
			 String authorName = resultSet.getString("name");
			 String title = resultSet.getString("title");
			 String type = resultSet.getString("type");
			 String summary = resultSet.getString("summary");
			 String time = resultSet.getString("time");		
		
			Works oneworks = new Works(worksId, authorId, authorName, title, type, summary, time);
			tempworksList.add(oneworks);
		}
		System.err.println("HashSet.Size: " + tempworksList.size());
		for (Works works2 : tempworksList) {
			sql = "select * from content where worksId=? ";
			resultSet = dbConnected_MySQL.executeQuery(sql, works2.getId());
			int k = 0;
			while (resultSet.next()) {
				works2.getContent()[k] = resultSet.getString("text");
				works2.getPic()[k] = resultSet.getString("pic");
				k++;
			}
			worksList.add(works2);
		}
		return worksList;
	}

	@Override
	public int pageCount(Works works, int pageSize, String key) throws Exception {
		String sql = "SELECT COUNT(*) FROM works";
		String where = "";
		// 有查询条件
		if (works != null) {
			if ( !StringUtils.isNullOrEmpty(works.getType()) && !"all".equals(works.getType()) ) {
				where = String.format(" where type='%s'", works.getType());
				if (!StringUtils.isNullOrEmpty(key)) {
					where += String.format(" and (authorName like '%%%s%%' or title like'%%%s%%' or summary like '%%%s%%') ", 
							works.getAuthorName(), works.getTitle(), works.getSummary());
				}
			} else if (!StringUtils.isNullOrEmpty(key)) {
				where = String.format(" where authorName like '%%%s%%' or title like'%%%s%%' or summary like '%%%s%%'",
						works.getAuthorName(), works.getTitle(), works.getSummary());
			}
		}
		sql += where;
		DBConnected_MySQL dbConnected_MySQL = DBConnected_MySQL.getDBConnected();
		ResultSet rs = dbConnected_MySQL.executeQuery(sql);
		if (rs.next()) {
			//getInt() : 获取下标为1的Result的值
			//getInt(1)的原因是：count(*)返回的值只有一个，即记录条数的数字，所以下标为1的值，就是记录总数
			int recordCount = rs.getInt(1);
			//获取页数
			int pageCount = (recordCount + pageSize - 1) / pageSize;
			return pageCount;
		}
		return 0;
	}

	@Override
	public Works getWorkByTitle(Works works) throws Exception {
		DBConnected_MySQL dbConnected_MySQL = DBConnected_MySQL.getDBConnected();
		String sql = "select * from works where title=? ";
		ResultSet resultSet = dbConnected_MySQL.executeQuery(sql, works.getTitle());
		if (resultSet.next()) {
			id = resultSet.getInt("id");
			authorId = resultSet.getInt("authorId");
			authorName = resultSet.getString("authorName");
			title = resultSet.getString("title");
			summary = resultSet.getString("summary");
			time = resultSet.getString("time");
		} else {
			return null;
		}
		sql = "select * from content where worksId=? ";
		resultSet = dbConnected_MySQL.executeQuery(sql, id);
		int k = 0;
		while (resultSet.next()) {
			this.content[k] = resultSet.getString("text");
			//System.err.println("content[" + k +"] : " + content[k]);
			this.pic[k] = resultSet.getString("pic");
			//System.err.println("pic[" + k +"] : " + pic[k]);
			k++;
		}
		
		Works onework = new Works(id, authorId, authorName, title, type, summary, time, this.content, this.pic);
		return onework;
	}

	@Override
	public Works getWorkById(Works works) throws Exception {
		DBConnected_MySQL dbConnected_MySQL = DBConnected_MySQL.getDBConnected();
		String sql = "select * from works where id=? ";
		ResultSet resultSet = dbConnected_MySQL.executeQuery(sql, works.getId());
		if (resultSet.next()) {
			id = resultSet.getInt("id");
			authorId = resultSet.getInt("authorId");
			authorName = resultSet.getString("authorName");
			title = resultSet.getString("title");
			summary = resultSet.getString("summary");
			time = resultSet.getString("time");
		} else {
			return null;
		}
		sql = "select * from content where worksId=? ";
		resultSet = dbConnected_MySQL.executeQuery(sql, id);
		int k = 0;
		while (resultSet.next()) {
			content[k] = resultSet.getString("text");
			pic[k] = resultSet.getString("pic");
			k++;
		}
		
		Works onework = new Works(id, authorId, authorName, title, type, summary, time, content, pic);
		return onework;
	}
	
	@Override
	public boolean addToWorks(Works works) throws Exception {
		DBConnected_MySQL dbConnected_MySQL = DBConnected_MySQL.getDBConnected();
		String sql = "insert into works(authorId, authorName, title, type, summary, time) values(?,?,?,?,?,?) ";
		int res = dbConnected_MySQL.executeUpdate(sql, works.getAuthorId(), works.getAuthorName(), 
				works.getTitle(), works.getType(), works.getSummary(), works.getTime() );
		return (res == 1);
	}

	@Override
	public boolean update(Works works) throws Exception {
		if (works == null) return false;
		DBConnected_MySQL dbConnected_MySQL = DBConnected_MySQL.getDBConnected();
		
		String sql = "update works set title=?, type=?, summary=? where id=?";
		int res = dbConnected_MySQL.executeUpdate(sql, works.getTitle(), works.getType(), works.getSummary(), works.getId());
		boolean del = deleteContent(works);
		int ans = 0;
		sql = "insert into content(worksId, text, pic) values(?,?,?) ";
		for (int i = 0; i < 3; i++) {
			ans += dbConnected_MySQL.executeUpdate(sql, works.getId(), works.getContent()[i], works.getPic()[i]);
		}
		return (res == 1 && del && ans == 3);
	}

	@Override
	public boolean delete(Works works) throws Exception {
		DBConnected_MySQL dbConnected_MySQL = DBConnected_MySQL.getDBConnected();
		
		String sql = "delete from works where id=? ";
		int res = dbConnected_MySQL.executeUpdate(sql, works.getId());
		
		sql = "delete from content where worksId=? ";
		int ans = dbConnected_MySQL.executeUpdate(sql, works.getId());
		return (res == 1 && ans == 1);
	}
	
	public boolean addContent(Works works) throws Exception {
		DBConnected_MySQL dbConnected_MySQL = DBConnected_MySQL.getDBConnected();
		String sql = "insert into content(worksId, text, pic) values(?,?,?)";
		int ans = 0;
		for (int i = 0; i < 3; i++) {
			ans += dbConnected_MySQL.executeUpdate(sql, works.getId(), works.getContent()[i], works.getPic()[i]);
		}
		return (ans == 3);
	}
	
	public boolean deleteContent(Works works) throws Exception {
		DBConnected_MySQL dbConnected_MySQL = DBConnected_MySQL.getDBConnected();
		String sql = "delete from content where worksId=?";
		int res = dbConnected_MySQL.executeUpdate(sql, works.getId());
		return res == 1;
	}

	@Override
	public boolean add(Works obj) throws Exception {
		return false;
	}

}
