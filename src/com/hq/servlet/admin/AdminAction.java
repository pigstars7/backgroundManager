package com.hq.servlet.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.log4j.Logger;

import com.hq.bean.Admin;
import com.hq.db.Db;
import com.hq.servlet.core.Action;
import com.hq.util.Md5Encrypt;
@WebServlet("/admin/admin")
public class AdminAction extends Action {
    private static Logger log=Logger.getLogger(AdminAction.class);
	@Override
	public void index(Mapping map) throws ServletException, IOException {

		//判断用户级别
		Admin admin=(Admin)map.getSessionAttr("loged");
		if(admin.getUpur().startsWith("1000"))
		{
		
       try {
		List<Admin> list=Db.query("select * from admin",new BeanListHandler<Admin>(Admin.class));
	       map.setAttr("list",list);
       } catch (SQLException e) {
		 log.error("com.hq.servlet.admin_ERROR_09_查询管理员出错!");
	}

		map.forward("admin/admin_manager.jsp");
		}else
		{
			map.forward("admin/welcome.jsp");
		}
	}
	
	
	public void saveAdd(Mapping map) throws ServletException, IOException {

         Admin admin=new Admin();
         map.getBean(admin);
         String sql="insert into admin(email,upwd,upur) values(?,?,?)";
         try {
			Db.update(sql,admin.getEmail(),Md5Encrypt.md5(admin.getUpwd()),admin.getUpur());
			map.setAttr("msg", "增加管理员成功");
		} catch (SQLException e) {
			map.setAttr("err", "增加管理员失败");
			 log.error("com.hq.servlet.admin_ERROR_10_增加管理员失败!"+e);
		}
		
		
		 this.index(map);

	}
	public void update(Mapping map) throws ServletException, IOException {

        Admin admin=new Admin();
       map.getBean(admin);
      
        
        String newpwd=map.getString("newpwd");
        if(null!=newpwd||!"".equals(newpwd))
        {
        	admin.setUpwd(Md5Encrypt.md5(newpwd));
        }        
        String sql=" update admin set email=?,upwd=?,upur=? where id=?";
        try {
			Db.update(sql,admin.getEmail(),admin.getUpwd(),admin.getUpur(),admin.getId());
			map.setAttr("msg", "修改管理员成功");
		} catch (SQLException e) {
			map.setAttr("err", "修改管理员失败");
			 log.error("com.hq.servlet.admin_ERROR_11_修改管理员失败!"+e);
		}
		
		
        this.index(map);

	}
	public void del(Mapping map) throws ServletException, IOException {

       int id=map.getInt("id");
       if(id>0)
       {
        String sql="delete from admin where id=?";
        try {
			Db.update(sql,id);
			map.setAttr("msg", "删除管理员成功");
		} catch (SQLException e) {
			map.setAttr("err", "删除管理员失败");
			 log.error("com.hq.servlet.admin_ERROR_12_删除管理员失败!"+e);
		}
		
       }
       this.index(map);

	}

}
