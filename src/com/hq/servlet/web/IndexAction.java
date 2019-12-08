package com.hq.servlet.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.hq.bean.Article;
import com.hq.bean.House;
import com.hq.bean.Travel;
import com.hq.db.Db;
import com.hq.servlet.core.Action;
@WebServlet("/index")
public class IndexAction extends Action {

	@Override
	public void index(Mapping map) throws ServletException, IOException
	{
		try {
			//旅行数据
			Travel tra=Db.query("select * from travel order by id desc limit 1", new BeanHandler<Travel>(Travel.class));
		    map.setAttr("travel", tra);
		    
		    //文章
		    List<Article> arts=Db.query("select * from article order by id desc limit 6", new BeanListHandler<Article>(Article.class));
		    map.setAttr("arts", arts);
		    
		    //取房产
		    List<House> house=Db.query("select * from house where isdel=0 order by level,id limit 3", new BeanListHandler<House>(House.class));
		    map.setAttr("houses", house);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	map.forward("web/index.jsp");

	}

}
