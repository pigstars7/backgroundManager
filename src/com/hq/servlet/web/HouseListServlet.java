package com.hq.servlet.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import com.hq.bean.House;
import com.hq.db.Db;
import com.hq.db.PageDiv;
import com.hq.servlet.core.Action;
@WebServlet("/web/house_list")
public class HouseListServlet extends Action {

	@Override
	public void index(Mapping map) throws ServletException, IOException {
		int pageNo=1;
		int pageSize=3;
		if(map.getInt("pageNo")>0)pageNo=map.getInt("pageNo");
		PageDiv<House> pd=null;
		
		String key=map.getString("key");
		
		

		try {
			
			if(key.length()>0)
			{
				//有搜索
				pd=Db.getByPage(House.class, "select * from house where isdel=0 and name like ? order by level,id", pageNo, pageSize, new Object[] {"%"+key+"%"});
			    map.setAttr("key", key);
			}else
			{
				//没有搜索
				pd=Db.getByPage(House.class, "select * from house where isdel=0 order by level,id", pageNo, pageSize, new Object[] {});
			}
			
			map.setAttr("pd", pd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		 map.forward("web/house_list.jsp");
	}

}
