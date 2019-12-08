package com.hq.servlet.admin;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.log4j.Logger;

import com.hq.bean.Attach;
import com.hq.db.Db;
import com.hq.db.PageDiv;
import com.hq.servlet.core.Action;
import com.hq.servlet.core.Action.Mapping;
@WebServlet("/admin/attach")
public class AttachAction extends Action 
{
    private Logger log=Logger.getLogger(AttachAction.class);
	@Override
	public void index(Mapping map) throws ServletException, IOException 
	{
		try {
			int pageNo=1;
			if(map.getInt("pageNo")>0)pageNo=map.getInt("pageNo");
			int pageSize=12;
			
			String sql="select * from attach order by id desc limit ?,?";
			String totalsql="select count(id) from attach";
			
			
			List<Attach> list=Db.query(sql, new BeanListHandler<Attach>(Attach.class),(pageNo-1)*pageSize,pageSize);
		    Long total=(Long)Db.query(totalsql, new ArrayHandler())[0];
		    PageDiv<Attach> pd=new PageDiv<>(pageNo, pageSize, total.intValue(), list);
		    
		    
		   // PageDiv<Attach> pd1=Db.getByPage(Attach.class, "select * from attach order by id desc", pageNo, pageSize, new Object[] {});
		    
		   map.setAttr("pd", pd);
		} catch (SQLException e) {
			map.setAttr("err","查询附件失败");
			log.error("com.redcms.servlet.admin.AttacheAction_ERROR_23_查询附件失败!"+e);
		}
		map.forward("admin/attach_list.jsp");

	}
	
	public void del(Mapping map) throws ServletException, IOException 
	{
		int []ids=map.getIntArray("ids");
		if(null!=ids&&ids.length>0)
		{
			StringBuilder sb=new StringBuilder();
			for(int i:ids)
			{
			sb.append(i+",");	
			}
			sb.deleteCharAt(sb.length()-1);
			System.out.println(sb.toString());
			String sql="select * from attach where id in("+sb.toString()+")";
			try {
				List<Attach> list=Db.query(sql,new BeanListHandler<Attach>(Attach.class));
				String sql2="delete from attach  where id in("+sb.toString()+")";
				
                 Db.update(sql2);
                 
             for(Attach a:list)
              {
            	 int lastindex=a.getNewpath().lastIndexOf("ups");
         		
     			
     			File f=new File(this.getServletContext().getRealPath(a.getNewpath().substring(lastindex)));
            	
            	 if(f.exists())f.delete();
            	
              }
             map.setAttr("msg", "删除成功!");
			} catch (SQLException e) {
				map.setAttr("err","删除附件失败");
				log.error("com.redcms.servlet.admin.AttacheAction_ERROR_24_删除附件失败!"+e);
			}
			
		}
	
		index(map);
	}

}
