package com.hq.servlet.admin;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.log4j.Logger;

import com.hq.bean.Article;
import com.hq.bean.Channel;
import com.hq.bean.City;
import com.hq.db.Db;
import com.hq.db.PageDiv;
import com.hq.servlet.core.Action;
import com.hq.util.HtmlGenerator;

@WebServlet("/admin/article")
public class ArticleAction extends Action {

private static final long serialVersionUID = -5326655896995553635L;
public static	Logger log=Logger.getLogger(ArticleAction.class);
	@Override
	public void index(Mapping map) throws ServletException, IOException {
		PageDiv<Article> pd=null;
		int pageNo=1;
		if(map.getInt("pageNo")>0)pageNo=map.getInt("pageNo");
		int pageSize=20;
		
		try {
			//所有栏目
			List<Channel> allchannel=Db.query("select * from channel order by level", new BeanListHandler<Channel>(Channel.class));
		    map.setAttr("channels", allchannel);
		    //先看是不是搜索
		    String keyword=map.getString("keyword");
		    if(keyword.length()>0)
		    {
		    	 String sql="select a.*,c.name as channelName,t.name as cityName from article a,channel c,city t where a.channel_id=c.id and a.city_id=t.id and a.title like ? order by level asc,id desc limit ?,?";
				 List<Article> data=Db.query(sql, new BeanListHandler<Article>(Article.class),"%"+keyword+"%",(pageNo-1)*pageSize,pageSize);
				
				 Long total=(Long)Db.query("select count(id) from article where title like ?", new ArrayHandler(),"%"+keyword+"%")[0];
				
				 pd=new PageDiv<>(pageNo, pageSize, total.intValue(), data);
				 map.setAttr("keyword", keyword);
		    }else
		    {
			    int channelId=map.getInt("channel_id");
			    if(channelId>0)
			    {
					 String sql="select a.*,c.name as channelName,t.name as cityName from article a,channel c,city t where a.channel_id=c.id and a.city_id=t.id and a.channel_id=? order by level asc,id desc limit ?,?";
					 List<Article> data=Db.query(sql, new BeanListHandler<Article>(Article.class),channelId,(pageNo-1)*pageSize,pageSize);
					
					 Long total=(Long)Db.query("select count(id) from article where channel_id=?", new ArrayHandler(),channelId)[0];
					
					 pd=new PageDiv<>(pageNo, pageSize, total.intValue(), data);
					 map.setAttr("channel_id", channelId);
			    }else
			    {
				   	 String sql="select a.*,c.name as channelName,t.name as cityName from article a,channel c,city t where a.channel_id=c.id and a.city_id=t.id order by level asc,id desc limit ?,?";
					 List<Article> data=Db.query(sql, new BeanListHandler<Article>(Article.class),(pageNo-1)*pageSize,pageSize);
					
					 Long total=(Long)Db.query("select count(id) from article", new ArrayHandler())[0];
					
					 pd=new PageDiv<>(pageNo, pageSize, total.intValue(), data);
			    }
		    }
			map.setAttr("pd", pd);
		} catch (SQLException e) {
			log.error("查询所有文章出错 。。"+e.getMessage());
			
		}
		
         map.forward("admin/article_list.jsp");

	}
	
	public void toadd(Mapping map) throws ServletException, IOException 
	{
		try {
			//所有国家信息
			List<City> countrys=Db.getAll(City.class, "select * from city where display=1 and parent_id=0 order by level");
			map.setAttr("countrys", countrys);
			
			//所有栏目
			List<Channel> allchannel=Db.query("select * from channel order by level", new BeanListHandler<Channel>(Channel.class));
		    map.setAttr("channels", allchannel);
		
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        map.forward("admin/article_add.jsp");
	}
	
	public void saveadd(Mapping map) throws ServletException, IOException 
	{
		try {
		/*	//所有国家信息
			List<City> countrys=Db.getAll(City.class, "select * from city where display=1 and parent_id=0 order by level");
			map.setAttr("countrys", countrys);
			
			//所有栏目
			List<Channel> allchannel=Db.query("select * from channel order by level", new BeanListHandler<Channel>(Channel.class));
		    map.setAttr("channels", allchannel);
		*/
		    
		    Article art=new Article();
		    
		    map.getBean(art);
		    art.setVisits(0);
		    art.setCtime(new Date());
		    
		  long lastid= Db.add(art);
		  //发布，生成表态
		  pub(lastid,art.getChannel_id(),map);
		    map.setAttr("msg", "增加资讯成功!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         this.toadd(map);
	}
	
	/**
	 * 显示文章
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void show(Mapping map) throws ServletException, IOException 
	{
		try {
		      long id=map.getLong("id");
		      if(id>0)
		      {
		    	  String sql="select a.*,c.name as channelName,t.name as cityName from article a,channel c,city t where a.channel_id=c.id and a.city_id=t.id and a.id=?";
		    	  Article art=Db.query(sql, new BeanHandler<Article>(Article.class),id);
		    	  map.setAttr("art", art);
		    	  map.setAttr("basepath",map.basePath());
		      }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        map.forward("admin/article_show.jsp");
	}
	/**
	 * 跳转到修改界面
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void edit(Mapping map) throws ServletException, IOException 
	{
		try {
		      long id=map.getLong("id");
		      if(id>0)
		      {
		    	  
		    	  //所有国家信息
					List<City> countrys=Db.getAll(City.class, "select * from city where display=1 and parent_id=0 order by level");
					map.setAttr("countrys", countrys);
					
					//所有栏目
					List<Channel> allchannel=Db.query("select * from channel order by level", new BeanListHandler<Channel>(Channel.class));
				    map.setAttr("channels", allchannel);
				
		    	  
		    	  String sql="select * from article a where a.id=?";
		    	  Article art=Db.query(sql, new BeanHandler<Article>(Article.class),id);
		    	  map.setAttr("art", art);
		    	  map.setAttr("basepath",map.basePath());
		      }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        map.forward("admin/article_edit.jsp");
	}
	
	/**
	 * 真正修改文章
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void saveupdate(Mapping map) throws ServletException, IOException 
	{
		  Article art=null;
		try {
		      long id=map.getLong("id");
		     
		      if(id>0)
		      {
		    	  String sql="select * from article a where a.id=?";
		    	art=Db.query(sql, new BeanHandler<Article>(Article.class),id);
		    	  map.getBean(art);  
		    	  Db.update(art);
		    	  pub(id,art.getChannel_id(),map);
		      }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         map.redirect("article?channel_id="+art.getChannel_id());
	}
	/**
	 * 删除
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void del(Mapping map) throws ServletException, IOException 
	{
		 Article art=null;
		try {
		      long id=map.getLong("id");
		     
		      if(id>0)
		      {
		    	  
		    	    String sql="select * from article a where a.id=?";
			    	art=Db.query(sql, new BeanHandler<Article>(Article.class),id);
			    	
			    	if(null!=art&&null!=art.getPic()&&-1!=art.getPic().indexOf("ups"))
			    	{
			    	//删主图
			    	int lastindex=art.getPic().lastIndexOf("ups");
					File delf=new File(this.getServletContext().getRealPath(art.getPic().substring(lastindex)));
					delf.delete();
					
					File htmlfile=new File(this.getServletContext().getRealPath("web/art_"+art.getChannel_id()+"/news_"+art.getChannel_id()+"_"+art.getId()+".html"));
					if(htmlfile.exists()) htmlfile.delete();
		    	
			    	}
		    	    Db.update("delete from article where id=?",id);

		      }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         map.redirect("article?channel_id="+map.getInt("channel_id"));
	}

	/**
	 * 发布
	 * @throws ServletException
	 * @throws IOException
	 */
	public void pub(long id,int channelId,Mapping map) throws ServletException, IOException 
	{

		if(id>0)
		{
		 String basePath=map.basePath()+"/web/article?id="+id;
		 String realpath=this.getServletContext().getRealPath("web/art_"+channelId);
		 File temf=new File(realpath);
		 if(!temf.exists())temf.mkdirs();
		   HtmlGenerator.createHtmlPage(basePath, realpath+"/news_"+channelId+"_"+id+".html");
		}
		 
	}
	
	public void createhtml(Mapping map) throws ServletException, IOException 
	{
		
			
			      long id=map.getLong("id");
			      int channelId=map.getInt("channel_id");
			      if(id>0&&channelId>0)
			      {
			    	  
			    	   pub(id, channelId, map);
			    	   map.setAttr("msg", "发布成功!");
			    	
				   }
			  //    index(map);
			    	
			      map.redirect("article?channel_id="+channelId);
	}
	
}
