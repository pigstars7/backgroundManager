package com.hq.bean;

public class Channel implements java.io.Serializable{
  
	/**
	 * 
	 */
	private static final long serialVersionUID = -6609543509797631936L;
	private int	 id;
  private String	 name;
  private int level;
  private String path;
  
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int getLevel() {
	return level;
}
public void setLevel(int level) {
	this.level = level;
}
public String getPath() {
	return path;
}
public void setPath(String path) {
	this.path = path;
}
  
  
}
