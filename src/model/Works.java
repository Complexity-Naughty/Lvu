package model;

public class Works {

	private Integer id;
	private Integer authorId;
	private String authorName;
	private String title;
	private String type;
	private String summary;
	private String time;
	
	private String[] content = new String[3];
	private String[] pic = new String[3];
	
	public Works() {
		
	}
	
	public Works(Integer id) {
		this.id = id;
		
	}
	
	public Works(Integer id, Integer authorId, String authorName, String title, String type, String summary,
			String time) {
		super();
		this.id = id;
		this.authorId = authorId;
		this.authorName = authorName;
		this.title = title;
		this.type = type;
		this.summary = summary;
		this.time = time;
	}
	
	public Works(Integer id, Integer authorId, String authorName, String title, String type, String summary,
			String time, String[] content, String[] pic) {
		super();
		this.id = id;
		this.authorId = authorId;
		this.authorName = authorName;
		this.title = title;
		this.type = type;
		this.summary = summary;
		this.time = time;
		this.content = content;
		this.pic = pic;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getAuthorId() {
		return authorId;
	}

	public void setAuthorId(Integer authorId) {
		this.authorId = authorId;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String[] getContent() {
		return content;
	}

	public void setContent(String[] content) {
		this.content = content;
	}

	public String[] getPic() {
		return pic;
	}

	public void setPic(String[] pic) {
		this.pic = pic;
	}

	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return super.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Works) {
			return this.id.intValue() == ( (Works)obj).id.intValue();
		}
		return false;
	}

	@Override
	public String toString() {
		return this.title;
	}
	
}
