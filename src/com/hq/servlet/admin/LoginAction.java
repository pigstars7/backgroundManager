package com.hq.servlet.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.log4j.Logger;

import com.hq.bean.Admin;
import com.hq.db.Db;
import com.hq.servlet.core.Action;
import com.hq.servlet.core.Action.Mapping;
import com.hq.util.Md5Encrypt;
@WebServlet("/admin/login")
public class LoginAction extends Action {

private static final long serialVersionUID = -3409100655558872117L;
private Logger log=Logger.getLogger(LoginAction.class);
	@Override
	public void index(Mapping map)throws IOException,ServletException
	{
		map.forward("admin/login.jsp");
	}
	
	public void logout(Mapping map) throws IOException,ServletException
	{
		map.removeSessionAttr("loged");
		map.invalidateSession();
		map.forward("admin/login.jsp");
	}
	/**
	 * 验证用户名和密码
	 */
	public void checkLogin(Mapping map)throws IOException,ServletException
	{
		
		String email=map.getString("uname");
		String password=map.getString("upwd");
		String rand=map.getString("rand");
		String srand=(String)map.getSessionAttr("randomCode");
		
		if(password.length()>0&&email.length()>0&&null!=srand&&srand.equals(rand))
		{
			String sql="select * from admin where email=? and upwd=? limit 1";
			try {
				
				Admin admin=Db.query(sql, new BeanHandler<Admin>(Admin.class),email,Md5Encrypt.md5(password));
				
				if(null!=admin)
				{
					map.setSessionAttr("loged", admin);
					map.redirect("indexadmin");
				
				}else
				{
					map.setAttr("err", "用户名和密码不正确！");
					map.forward("admin/login.jsp");
				}
			} catch (SQLException e) {
				log.error("com.redcms.servlet.admin.LoginAction_ERROR_32_验证用户名和密码失败!"+e);
			}
			
		}else
		{
			 map.forward("admin/login.jsp");
		}
		
      

	}

}
