package com.hq.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import com.hq.bean.Admin;
import com.hq.servlet.core.Action;
@WebServlet("/indexdd")
public class HelloServlet extends Action {

	@Override
	public void index(Mapping map) throws ServletException, IOException {

    String name=map.getString("name");
    int age=map.getInt("age");
    
     map.randerText("你好,"+name+"!"+age);

	}
	
	public void admin(Mapping map) throws ServletException, IOException {
		  Admin admin=new Admin();
		  admin.setEmail("admin@qq.com");
		  admin.setUpwd("123");
		  
		  map.randerJson(admin);

	}

}
