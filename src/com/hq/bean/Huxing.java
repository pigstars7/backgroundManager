package com.hq.bean;import java.util.Date;/******************************************************************************* * javaBeans * huxing --> Huxing  * <table explanation> * @author 2019-01-06 11:40:53 *  */	public class Huxing implements java.io.Serializable {	/**	 * 	 */	private static final long serialVersionUID = 4662577665912533142L;	//field	/** id **/	private long id;	/** house_id **/	private Object house_id;	/** path **/	private String path;	/** orgname **/	private String orgname;	/** mime **/	private String mime;	/** level **/	private int level;	/** dis **/	private String dis;	/** area **/	private String area;	/** ctime **/	private Date ctime;	/** price **/	private int price;	//method	public long getId() {		return id;	}	public void setId(long id) {		this.id = id;	}	public Object getHouse_id() {		return house_id;	}	public void setHouse_id(Object house_id) {		this.house_id = house_id;	}	public String getPath() {		return path;	}	public void setPath(String path) {		this.path = path;	}	public String getOrgname() {		return orgname;	}	public void setOrgname(String orgname) {		this.orgname = orgname;	}	public String getMime() {		return mime;	}	public void setMime(String mime) {		this.mime = mime;	}	public int getLevel() {		return level;	}	public void setLevel(int level) {		this.level = level;	}	public String getDis() {		return dis;	}	public void setDis(String dis) {		this.dis = dis;	}	public String getArea() {		return area;	}	public void setArea(String area) {		this.area = area;	}	public Date getCtime() {		return ctime;	}	public void setCtime(Date ctime) {		this.ctime = ctime;	}	public int getPrice() {		return price;	}	public void setPrice(int price) {		this.price = price;	}	}