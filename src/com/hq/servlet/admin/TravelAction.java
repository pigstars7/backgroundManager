package com.hq.servlet.admin;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.hq.bean.Travel;
import com.hq.db.Db;
import com.hq.servlet.core.Action;
import com.hq.util.HtmlGenerator;

@WebServlet("/admin/travel")
public class TravelAction extends Action {

	@Override
	public void index(Mapping map) throws ServletException, IOException {
		List<Travel> list=null;
		try 
		{
			list=Db.query("select * from travel order by id desc", new BeanListHandler<Travel>(Travel.class));
		    map.setAttr("list",list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		map.forward("admin/travel_list.jsp");
	}
	public void toadd(Mapping map) throws ServletException, IOException 
	{


		map.forward("admin/travel_add.jsp");
	}
	
	public void saveadd(Mapping map) throws ServletException, IOException 
	{
      Travel tr=new Travel();
      map.getBean(tr);
      tr.setIssue(0);
      tr.setCtimes(new Date());
     
      String sql="insert into travel(title,depart,city,visitcity,content,issue,ctimes,pic) values(?,?,?,?,?,?,?,?)";
      
      try {
		Db.update(sql,tr.getTitle(),tr.getDepart(),tr.getCity(),tr.getVisitcity(),tr.getContent(),tr.getIssue(),tr.getCtimes(),tr.getPic());
		map.setAttr("msg","增加旅行成功!");
	} catch (SQLException e) {
		map.setAttr("msg","增加旅行失败!");
		e.printStackTrace();
	}
    
		index(map);
	}
	public void edit(Mapping map) throws ServletException, IOException 
	{
              int id=map.getInt("id");
              if(id>0)
              {
                     try {
						Travel travel=Db.query("select * from travel where id=?", new BeanHandler<Travel>(Travel.class),id);
						map.setAttr("travel", travel);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
          
            		map.forward("admin/travel_edit.jsp");
              }else
              {
            	  index(map);
              }

	
	}
	
	public void saveedit(Mapping map) throws ServletException, IOException 
	{
              int id= map.getInt("id");
              if(id>0)
              {
                     try {
						Travel travel=Db.query("select * from travel where id=?", new BeanHandler<Travel>(Travel.class),id);
						map.getBean(travel);
						
						String sql="update travel set title=?,depart=?,city=?,visitcity=?,content=?,issue=?,ctimes=?,pic=? where id=?";
						Db.update(sql,travel.getTitle(),travel.getDepart(),travel.getCity(),travel.getVisitcity(),travel.getContent(),travel.getIssue(),travel.getCtimes(),travel.getPic(),travel.getId());
						map.setAttr("msg","修改成功！");
                     } catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
     
              }
              index(map);
	
	}
	
	
	public void del(Mapping map) throws ServletException, IOException 
	{
              int id=map.getInt("id");
              if(id>0)
              {
                     try {
                    	 Travel travel=Db.query("select * from travel where id=?", new BeanHandler<Travel>(Travel.class),id);
				
						map.deleteFile(travel.getPic());
						
						String sql="delete from travel where id=?";
					Db.update(sql,id);
						map.setAttr("msg","删除成功！");
                     } catch (SQLException e) {
                    	 map.setAttr("msg","删除失败！");
						e.printStackTrace();
					}
     
              }
              index(map);
	
	}
	
	public void display(Mapping map) throws ServletException, IOException 
	{
		   int id=map.getInt("id");
		   int display=map.getInt("display");
           if(id>0)
           {
                  try {
                 	
						String sql="update travel set issue=? where id=?";
						Db.update(sql,display,id);
						if(display==1)
							map.setAttr("msg","禁用成功！");
						if(display==0)
							map.setAttr("msg","启用成功！");
							
                  } catch (SQLException e) {
                	  map.setAttr("msg","禁用或启用失败！");
						e.printStackTrace();
					}
  
           }
           index(map);
	}
	
	public void show(Mapping map) throws ServletException, IOException 
	{

        int id=map.getInt("id");
        if(id>0)
        {
               try {
					Travel travel=Db.query("select * from travel where id=?", new BeanHandler<Travel>(Travel.class),id);
					map.setAttr("art",travel);
					
               } catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

        }
        map.forward("admin/travel_show.jsp");
	}
	public void pub(Mapping map) throws ServletException, IOException 
	{
		
		int id=map.getInt("id");
		if(id>0)
		{
		String basePath=map.basePath()+"web/travel?id="+id;
		 int cid=map.getInt("cid");
		 map.setAttr("cid", cid );
		 String realpath=this.getServletContext().getRealPath("web/travel");
		 File temf=new File(realpath);
		 if(!temf.exists())temf.mkdirs();
		 
		
		   HtmlGenerator.createHtmlPage(basePath, realpath+"/travel_"+id+".html");
		   map.setAttr("msg","发布旅行成功!");
        
         
		}
		index(map);
	}
}
