package com.hq.servlet.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.handlers.BeanHandler;

import com.hq.bean.Article;
import com.hq.db.Db;
import com.hq.servlet.core.Action;
@WebServlet("/web/article")
public class ArticleAction extends Action {

	@Override
	public void index(Mapping map) throws ServletException, IOException {
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

}
