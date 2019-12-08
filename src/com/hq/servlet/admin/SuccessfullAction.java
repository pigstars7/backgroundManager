package com.hq.servlet.admin;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.hq.bean.Successfull;
import com.hq.db.Db;
import com.hq.servlet.core.Action;
@WebServlet("/admin/successfull")
public class SuccessfullAction extends Action		 {

	@Override
	public void index(Mapping map) throws ServletException, IOException {
		String sql="select * from successfull order by level";
		try {
			List<Successfull> list=Db.query(sql, new BeanListHandler<Successfull>(Successfull.class));
			map.setAttr("list",list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
       map.forward("admin/success_list.jsp");
	}
	public void toadd(Mapping map) throws ServletException, IOException {
		// TODO Auto-generated method stub
       map.forward("admin/success_add.jsp");
	}
	
	public void saveadd(Mapping map) throws ServletException, IOException {
		Successfull sf=new Successfull();
		map.getBean(sf);
		
	
		sf.setDis(map.getString("dis"));
	    try {
			String sql="insert into successfull(name,house,why,dis,pic1,pic2,level) values(?,?,?,?,?,?,?)";
			Db.update(sql,sf.getName(),sf.getHouse(),sf.getWhy(),sf.getDis(),sf.getPic1(),sf.getPic2(),sf.getLevel());
			map.setAttr("msg","增加成功案例成功!");
	    } catch (SQLException e) {
	    	map.setAttr("msg","增加成功案例失败!");
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
						Successfull success=Db.query("select * from successfull where id=?", new BeanHandler<Successfull>(Successfull.class),id);
						map.setAttr("success", success);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
          
            		map.forward("admin/success_edit.jsp");
              }else
              {
            	  index(map);
              }

	
	}
	
	public void saveedit(Mapping map) throws ServletException, IOException 
	{
              int id=map.getInt("id");
              if(id>0)
              {
                     try {
                    	 Successfull success=Db.query("select * from successfull where id=?", new BeanHandler<Successfull>(Successfull.class),id);
						map.getBean(success);
						
						success.setDis(map.getString("dis"));
						
						String sql="update successfull set name=?,house=?,why=?,dis=?,pic1=?,pic2=?,level=? where id=?";
						Db.update(sql,success.getName(),success.getHouse(),success.getWhy(),success.getDis(),success.getPic1(),success.getPic2(),success.getLevel(),success.getId());
						map.setAttr("msg","修改案例成功！");
                     } catch (SQLException e) {
                    	 map.setAttr("msg","修改案例失败！");
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
                    	 Successfull success=Db.query("select * from successfull where id=?", new BeanHandler<Successfull>(Successfull.class),id);
						String path=this.getServletContext().getRealPath(success.getPic1());
						new File(path).delete();
						
						String path1=this.getServletContext().getRealPath(success.getPic2());
						new File(path1).delete();
						
						String sql="delete from successful where id=?";
						Db.update(sql,id);
						map.setAttr("msg","删除成功！");
                     } catch (SQLException e) {
                    	 map.setAttr("msg","删除失败！");
						e.printStackTrace();
					}
     
              }
              index(map);
	
	}
}
