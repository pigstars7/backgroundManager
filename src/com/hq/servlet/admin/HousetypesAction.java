package com.hq.servlet.admin;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.log4j.Logger;

import com.hq.bean.House;
import com.hq.bean.Huxing;

import com.hq.db.Db;
import com.hq.fileupload.FilePart;
import com.hq.fileupload.FileUploadUtil;
import com.hq.servlet.core.Action;
@WebServlet("/admin/type_house")
public class HousetypesAction extends Action{

    private static Logger log=Logger.getLogger(HousetypesAction.class);
	@Override
	public void index(Mapping map) throws ServletException, IOException
	{
		
		long id=0;
	  
	    if(map.getInt("id")>0)id=map.getInt("id");
		
	    if(null!=(Long)map.getAttr("id"))
		 {
			 id=(Long)map.getAttr("id");
		 }
	
		   
		 
		
		 try {
			if(id>0)
			 {
				 House house=Db.query("select * from house where id=?", new BeanHandler<House>(House.class),id);
				
				 List<Huxing> pics=null;
				 pics=Db.query("select * from huxing where house_id=? order by level", new BeanListHandler<Huxing>(Huxing.class),id);

				map.setAttr("pics", pics);
				map.setAttr("house", house);
					
			 }
		} catch (SQLException e) {
			 log.error("查询户型出错..."+e.getMessage());
		}
		
           map.forward("admin/house_type_list.jsp");
	}
	
	/**
	 * 上传房型图
	 * @throws ServletException
	 * @throws IOException
	 */
	public void imgupload(Mapping map) throws ServletException, IOException 
	{
		
		String basePath=this.getServletContext().getRealPath("ups");

		 FileUploadUtil fup=new FileUploadUtil(map.getReq(), 1024*1024*10,new String[]{".jpg",".bmp",".gif",".png"}, basePath);
	     try 
	     {
			fup.uploadFile();
			if(fup.getFilePart().size()==1&&fup.getFilePart().get(0).getResult()==0)//上传成功
			{
				FilePart fp=fup.getFilePart().get(0);
				String sql="insert into huxing(house_id,path,level,dis,price) value(?,?,?,?,?)";
				//String fullpath=map.getReq().getScheme()+"://"+map.getReq().getServerName()+":"+map.getReq().getServerPort()+map.getReq().getContextPath()+"/ups/housepic/"+fp.getNewname();
				String fullpath=map.basePath()+"ups/"+fp.getNewname();
				Db.update(sql,fup.getFormvalues().get("house_id"),fullpath,fup.getFormvalues().get("level"),fup.getFormvalues().get("dis"),fup.getFormvalues().get("price"));
			    
				map.setAttr("id",Long.parseLong(fup.getFormvalues().get("house_id")));
				map.setAttr("msg", "上传户型成功！");
			}
		} catch (Exception e) {
			log.error("上传房型出错"+e.getMessage());
			map.setAttr("err", "上传户型失败！");
		}
		
		
         this.index(map);
	}

	
	public void update(Mapping map)throws ServletException, IOException 
	{
		Huxing ht=new Huxing();
		map.getBean(ht);
		
		try {
			Db.update("update huxing set price=?,dis=?,level=? where id=?", ht.getPrice(),ht.getDis(),ht.getLevel(),ht.getId());
			map.setAttr("msg","修改成功!");
		} catch (SQLException e) {
			map.setAttr("msg","修改失败!");
			e.printStackTrace();
		}
		map.setAttr("id",map.getLong("house_id"));
		  
		  this.index(map);
	}
	//删除图片
	public void delimg(Mapping map)throws ServletException, IOException 
	{
		String path=map.getString("path");

		long houseid=map.getLong("hid");
		long id=map.getLong("id");
		try {
			if(id>0)
			{
		

				int lastindex=path.lastIndexOf("ups");
			
				
				File delf=new File(this.getServletContext().getRealPath(path.substring(lastindex)));
				delf.delete();
			   
			  Db.update("delete from huxing where id=?",id);
			  map.setAttr("msg", "删除图片成功!");		
			
			  map.setAttr("id",houseid);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		index(map);
	}

}
