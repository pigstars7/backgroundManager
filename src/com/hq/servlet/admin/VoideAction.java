package com.hq.servlet.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.hq.bean.House;
import com.hq.bean.Video;
import com.hq.db.Db;
import com.hq.servlet.core.Action;
@WebServlet("/admin/voide_house")
public class VoideAction extends Action
{


	@Override
	public void index(Mapping map) throws ServletException, IOException
	{
		int id=0;
		  
	  
	    if(null!=(Integer)map.getAttr("id"))
		 {
			 id=(Integer)map.getAttr("id");
		 }else   if(map.getInt("id")>0)
		 {
			 id=map.getInt("id");
		 }
		 try {
			 House house=null;
			 List<Video> pics=null;
			if(id>0)
			 {
				
				 house=Db.query("select * from house where id=?", new BeanHandler<House>(House.class),id);
				
				 
				 pics=Db.query("select * from video where house_id=? order by level", new BeanListHandler<Video>(Video.class),id);

				
				 map.setAttr("pics", pics);
				 map.setAttr("house", house);
					
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
           map.forward("admin/house_voide_list.jsp");
	}
	//增加视频
	public void addvideo(Mapping map)throws ServletException, IOException 
	{
		Video v=new Video();
		map.getBean(v);
		try {
			Db.update("insert into video(house_id,dis,code,level) values(?,?,?,?)",v.getHouse_id(),v.getDis(),v.getCode(),v.getLevel());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 map.setAttr("id",map.getInt("house_id"));
		   index(map);
	}
	/**
	 * 上传焦点图
	 * @throws ServletException
	 * @throws IOException
	 */
/*
  public void imgupload() throws ServletException, IOException 
	{
		
		String basePath=req.getServletContext().getRealPath("uppics/housevoide");
		 FileUploadUtil fup=new FileUploadUtil(req, 1024*1024*5,new String[]{".mp4"}, basePath);
	     try 
	     {
			fup.uploadFile();
			String path="";
			if(fup.getFilePart().size()==1&&fup.getFilePart().get(0).getResult()==0)//上传成功
			{
				FilePart fp=fup.getFilePart().get(0);
			    path=fp.getNewname();
			}	
			String sql="insert into video(house_id,path,level,dis,code) value(?,?,?,?,?)";
			Db.update(sql,fup.getFormvalues().get("house_id"),path,fup.getFormvalues().get("level"),fup.getFormvalues().get("dis"),fup.getFormvalues().get("code"));
		    
		    reqAttr("id",Integer.parseInt(fup.getFormvalues().get("house_id")));
			reqAttr("msg", "上传视频成功！");
			
		} catch (Exception e) {
			
			 reqAttr("err", "上传视频失败！");
		}

         this.index();
	}*/

	
	public void update(Mapping map)throws ServletException, IOException 
	{
		Video vi=new Video();
		map.getBean(vi);
		
		try {
			Db.update("update video set code=?,dis=?,level=? where id=?", vi.getCode(),vi.getDis(),vi.getLevel(),vi.getId());
			map.setAttr("pic", vi);
			map.setAttr("msg","修改视频成功!");
		} catch (SQLException e) {
			map.setAttr("msg","修改视频失败!");
			e.printStackTrace();
		}
		map.setAttr("id",map.getInt("house_id"));
		  
		  index(map);
		
	}
	//删除图片
	public void delimg(Mapping map)throws ServletException, IOException 
	{
		int id=map.getInt("id");
		try {
			if(id>0)
			{
			
			  Db.update("delete from video where id=?",id);
			  map.setAttr("msg", "删除视频成功!");		
			
			  
			}
			map.setAttr("id",map.getInt("hid"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		index(map);
	}

}
