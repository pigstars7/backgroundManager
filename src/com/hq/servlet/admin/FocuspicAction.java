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

import com.hq.bean.Focuspic;
import com.hq.db.Db;
import com.hq.fileupload.FilePart;
import com.hq.fileupload.FileUploadUtil;
import com.hq.fileupload.UploadException;
import com.hq.servlet.core.Action;
@WebServlet("/admin/focuspic")
public class FocuspicAction extends Action
{
	private static Logger log=Logger.getLogger(FocuspicAction.class);
	
	@Override
	public void index(Mapping map) throws ServletException, IOException {

		   String sql="select * from focuspic order by level";
		   
		   List<Focuspic> flist=null;
		   
		   try {
			flist=Db.query(sql, new BeanListHandler<Focuspic>(Focuspic.class));
			map.setAttr("flist", flist);
		} catch (SQLException e) {
			 log.error("com.hq.servlet.admin.FocuspicAction_查询焦点图失败！");
			e.printStackTrace();
		}
		
       map.forward("admin/focuspic_list.jsp");
	}
	
	
	public void delfocuspic(Mapping map)throws ServletException, IOException 
	{
		
		int id=map.getInt("id");
		try {
			Focuspic fpic=Db.query("select * from focuspic where id=?", new BeanHandler<Focuspic>(Focuspic.class),id);
			Db.update("delete from focuspic where id=?", id);
			
			//int lastindex=fpic.getPath().lastIndexOf("ups");
		
			
			File delf=new File(this.getServletContext().getRealPath(fpic.getPath()));
			delf.delete();

			map.setAttr("msg", "删除焦点图片成功!");
		} catch (SQLException e) {
			map.setAttr("err", "删除焦点图片失败!");
			 log.error("com.hq.servlet.admin.FocuspicAction_删除焦点图失败！");
		}
		index(map);
	}
	
	/**
	 * 上传焦点图
	 * @throws ServletException
	 * @throws IOException
	 */
	public void uploadpic(Mapping map) throws ServletException, IOException 
	{
		
		 String basePath=this.getServletContext().getRealPath("ups");
		 FileUploadUtil fup=new FileUploadUtil(map.getReq(), 1024*1024*5,new String[]{".jpg",".bmp",".gif",".png"}, basePath);
	     try 
	     {
			fup.uploadFile();
			
		/*	for(FilePart fp:fup.getFilePart())
			{
				if(fp.getResult()==1)
				{
					out.println(getError("超过长度"));
					return ;
				}
				if(fp.getResult()==2)
				{
					out.println(getError("类型不支持"));
					return ;
				}
				
			}	*/
			
			if(fup.getFilePart().size()==1&&fup.getFilePart().get(0).getResult()==0)//上传成功
			{
				FilePart fp=fup.getFilePart().get(0);
				String sql="insert into focuspic( path, level,dis,link) value(?,?,?,?)";
				Db.update(sql,"ups/"+fp.getNewname(),fup.getFormvalues().get("level"),fup.getFormvalues().get("dis"),fup.getFormvalues().get("link"));
				map.setAttr("msg", "增加焦点成功！");
			}
		} catch (Exception e) {
			log.error("com.hq.servlet.admin.FocuspicAction_上传焦点图失败!"+e);
			map.setAttr("err", "增加焦点失败！");
		}
		
		
         this.index(map);
	}

	
}
