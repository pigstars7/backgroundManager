package com.hq.servlet.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.hq.bean.City;
import com.hq.bean.Travel;
import com.hq.db.Db;
import com.hq.servlet.core.Action;
@WebServlet("/web/travel")
public class TravelAction extends Action {

	@Override
	public void index(Mapping map) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id=map.getInt("id");
		if(id>0)
		{
		  try {
			//所有国家
			List<City> countrys=Db.query("select * from city where isdisplay=1 and parent_id=0 order by level", new BeanListHandler<City>(City.class));
			map.setAttr("countrys", countrys);
			Travel travel=Db.query("select * from travel where id=?", new BeanHandler<Travel>(Travel.class),id);
			map.setAttr("travel",travel);
		  
		  } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   map.forward("web/travel.jsp");
		}else
		{
			map.redirect("index");
		}
	}

}
