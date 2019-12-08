package com.hq.servlet.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;

import com.hq.bean.Admin;
import com.hq.db.Db;
import com.hq.fileupload.FilePart;
import com.hq.fileupload.FileUploadUtil;
import com.hq.servlet.core.Action;

@WebServlet("/admin/fileupload")
public class FileUploadAction extends Action {
    private Logger log=Logger.getLogger(FileUploadAction.class);
	@Override
	public void index(Mapping map) throws ServletException, IOException 
	{
		 map.getResp().setContentType("text/html;charset=utf-8");
		 PrintWriter out= map.getResp().getWriter();
		 String basePath=this.getServletContext().getRealPath("ups");

		 FileUploadUtil fup=new FileUploadUtil(map.getReq(), 1024*1024*10,new String[]{".jpg",".bmp",".gif",".png"}, basePath);
	     try 
	     {
			fup.uploadFile();
			for(FilePart fp:fup.getFilePart())
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
				
			}	
			
			if(fup.getFilePart().size()==1&&fup.getFilePart().get(0).getResult()==0)
			{
				FilePart fp=fup.getFilePart().get(0);
				String sql="insert into attach( oldname, newpath, createtime, author) value(?,?,?,?)";
				Admin admin=(Admin)	map.getSessionAttr("loged");
				String author=(null!=admin&&null!=admin.getEmail())?admin.getEmail():"admin";

			//	String fullpath=map.getReq().getScheme()+"://"+map.getReq().getServerName()+":"+map.getReq().getServerPort()+map.getReq().getContextPath()+"/ups/imgs/"+fup.getFilePart().get(0).getNewname();
                 String contextpath=this.getServletContext().getContextPath();
                 
				String fullpath="/".equals(contextpath)?"/":(contextpath+"/")+"ups/"+fp.getNewname();
             
                
                Db.update(sql,fp.getFileName(),fullpath,new Date(),author);
				
				
			JSONObject obj = new JSONObject();
			obj.put("error", 0);
			obj.put("url",fullpath );
			out.println(obj.toJSONString());
			}
		} catch (Exception e) {
			log.error("com.redcms.servlet.admin.FileUploadAction_ERROR_32_上传文件失败!"+e);
		}
	
	}
	//{error:1,message:'太长了'}
	private String getError(String message) {
		JSONObject obj = new JSONObject();
		obj.put("error", 1);
		obj.put("message", message);
		return obj.toJSONString();
	}

}
