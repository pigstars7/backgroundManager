package com.hq.servlet.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.hq.bean.Channel;
import com.hq.db.Db;
import com.hq.servlet.core.Action;
@WebServlet("/admin/artchannel")
public class ChannelAction extends Action {
	private static final long serialVersionUID = 3602932052946152107L;

	@Override
	public void index(Mapping map) throws ServletException, IOException 
	{

		List<Channel> allc=null;
		
		 try {
			allc=Db.query("select * from channel order by level", new BeanListHandler<Channel>(Channel.class));
			 map.setAttr("allc", allc);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 map.forward("admin/channel_list.jsp");
		
	}

	
	
	
	public void saveAdd(Mapping map) throws ServletException, IOException 
	{

		Channel c=new Channel();
		map.getBean(c);
		 try {
			Db.add(c);
			map.setAttr("msg", "增加资讯栏目成功！");
		} catch (SQLException e) {
			map.setAttr("err", "增加资讯栏目失败！");
			e.printStackTrace();
		}
		
		 index(map);
		
	}
	
	public void update(Mapping map) throws ServletException, IOException 
	{

		Channel c=new Channel();
		map.getBean(c);
		 try {
			Db.update(c);
			map.setAttr("msg", "修改资讯栏目成功！");
		} catch (SQLException e) {
			map.setAttr("err", "修改资讯栏目失败！");
			e.printStackTrace();
		}
		 index(map);
		
	}
	
	public void del(Mapping map) throws ServletException, IOException 
	{

		 int id=map.getInt("id");
		
		//随后在关闭此项功能
		 try {
			if(id>0)Db.update("delete from channel where id=?",id);
			map.setAttr("msg", "删除资讯栏目成功！");
		} catch (SQLException e) {
			map.setAttr("err", "删除资讯栏目失败！");
			e.printStackTrace();
		}
		
		 index(map);
		
	}
}
