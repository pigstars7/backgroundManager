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
import com.hq.bean.Pictures;
import com.hq.db.Db;
import com.hq.fileupload.FilePart;
import com.hq.fileupload.FileUploadUtil;
import com.hq.servlet.core.Action;
@WebServlet("/admin/pic_house")
public class HousepicAction extends Action {
    private static Logger log=Logger.getLogger(HousepicAction.class);
	@Override
	public void index(Mapping map) throws ServletException, IOException
	{
		
		 long id=0;
	     int channel=0;
	     if(map.getLong("id")>0)id=map.getLong("id");//房产基本信息的
		 if(map.getInt("channel")>0)channel=map.getInt("channel");//效果、实景、。。
		 
	    if(null!=(Integer)map.getAttr("id"))
		 {
			 id=(Integer)map.getAttr("id");
		 }
		 if(null!=(Integer)map.getAttr("channel"))
		 {
			 channel=(Integer)map.getAttr("channel");
		 }

		 try {
			if(id>0)
			 {
				    House house=Db.query("select * from house where id=?", new BeanHandler<House>(House.class),id);
				
					List<Pictures> pics=null;
					if(channel>0)
					{
						 pics=Db.query("select * from pictures where house_id=? and channel=? order by level", new BeanListHandler<Pictures>(Pictures.class),id,channel);
					    
					}else
					{
						 pics=Db.query("select * from pictures where house_id=? order by level", new BeanListHandler<Pictures>(Pictures.class),id);
					}
					
					map.setAttr("pics", pics);
					map.setAttr("house", house);
					
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 map.setAttr("channel", channel);
         map.forward("admin/house_pic_list.jsp");
	}
	
	/**
	 * 上传焦点图
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
				String sql="insert into pictures(house_id,path,level,dis,channel) value(?,?,?,?,?)";
				
				//String fullpath=map.getReq().getScheme()+"://"+map.getReq().getServerName()+":"+map.getReq().getServerPort()+map.getReq().getContextPath()+"/ups/housepic/"+fp.getNewname();
				String fullpath="ups/"+fp.getNewname();
				Db.update(sql,fup.getFormvalues().get("house_id"),fullpath,fup.getFormvalues().get("level"),fup.getFormvalues().get("dis"),fup.getFormvalues().get("channel"));

                 map.setAttr("channel",Integer.parseInt(fup.getFormvalues().get("channel")));
				 map.setAttr("id",Integer.parseInt(fup.getFormvalues().get("house_id")));
				 map.setAttr("msg", "上传图片成功！");
			}
			
			if(fup.getFilePart().get(0).getResult()==1)
			{
				map.setAttr("err", "上传的文件不能超过10M");
			}
			if(fup.getFilePart().get(0).getResult()==2)
			{
				map.setAttr("err", "只能上传图片类型");
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.error("上传图片失败^-^"+e.getMessage());
			 map.setAttr("err", "上传图片失败！");
		
		}
		
	     map.setAttr("channel",Integer.parseInt(fup.getFormvalues().get("channel")));
		 map.setAttr("id",Integer.parseInt(fup.getFormvalues().get("house_id")));
		
         this.index(map);
	}

	//删除图片
	public void delimg(Mapping map)throws ServletException, IOException 
	{
		String path=map.getString("path");
		int channel=map.getInt("channel");
		int houseid=map.getInt("hid");
		long id=map.getLong("id");
		try {
			if(id>0)
			{
				int lastindex=path.indexOf("ups");
				String webpath=path.substring(lastindex+4);
				
			 File f=new File(map.getReq().getServletContext().getRealPath("ups/"+webpath));
			 
			  f.delete();
			  Db.update("delete from pictures where id=?",id);
			  map.setAttr("msg", "删除图片成功!");		
			  map.setAttr("channel",channel);
			  map.setAttr("id",houseid);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.index(map);
	}
}
