package com.hq.servlet.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.hq.bean.City;
import com.hq.bean.House;
import com.hq.bean.Huxing;
import com.hq.bean.Pictures;
import com.hq.db.Db;
import com.hq.servlet.core.Action;

@WebServlet("/web/housecontent")
public class HouseContentServlet extends Action {

	@Override
	public void index(Mapping map) throws ServletException, IOException 
	{
		  try {
			int id=map.getInt("id");
			  if(id>0)
			  {
				  House house=Db.query("select * from house where id=?", new BeanHandler<House>(House.class),id);
				   //所有国家
					List<City> countrys=Db.query("select * from city where display=1 and parent_id=0 order by level", new BeanListHandler<City>(City.class));
					map.setAttr("countrys", countrys);
				
				  //效果
				  List<Pictures> pic01=Db.query("select * from pictures where house_id=? and channel=1 order by level", new BeanListHandler<Pictures>(Pictures.class),id);
				  if(null!=pic01&&pic01.size()>0)
				  {
					  map.setAttr("title1", pic01.get(0));
				  }
				  //实景
				  List<Pictures> pic02=Db.query("select * from pictures where house_id=? and channel=2 order by level", new BeanListHandler<Pictures>(Pictures.class),id);
				  if(null!=pic01&&pic01.size()>0)
				  {
					  map.setAttr("title2", pic02.get(0));
				  }
				  //样板间
				  List<Pictures> pic03=Db.query("select * from pictures where house_id=? and channel=3 order by level", new BeanListHandler<Pictures>(Pictures.class),id);
				  if(null!=pic01&&pic01.size()>0)
				  {
					  map.setAttr("title3", pic03.get(0));
				  }
				  //配套
				  List<Pictures> pic04=Db.query("select * from pictures where house_id=? and channel=4 order by level", new BeanListHandler<Pictures>(Pictures.class),id);
				  if(null!=pic01&&pic01.size()>0)
				  {
					  map.setAttr("title4", pic04.get(0));
				  }
				  //活动
				  List<Pictures> pic05=Db.query("select * from pictures where house_id=? and channel=5 order by level", new BeanListHandler<Pictures>(Pictures.class),id);
				  if(null!=pic01&&pic01.size()>0)
				  {
					  map.setAttr("title5", pic05.get(0));
				  }
				  
				  
				  List<Huxing> housetypes=Db.query("select * from huxing where house_id=? order by level", new BeanListHandler<Huxing>(Huxing.class),id);
				  
				  map.setAttr("housetypes",housetypes);
				  map.setAttr("house", house);
				  map.setAttr("pic01", pic01);
				  map.setAttr("pic02", pic02);
				  map.setAttr("pic03", pic03);
				  map.setAttr("pic04", pic04);
				  map.setAttr("pic05", pic05);
				  
			  }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
		  map.forward("web/housecontent.jsp");

	}

}
