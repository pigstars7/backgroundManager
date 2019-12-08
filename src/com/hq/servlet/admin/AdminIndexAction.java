package com.hq.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.log4j.Logger;

import com.hq.servlet.core.Action;
@WebServlet("/admin/indexadmin")
public class AdminIndexAction extends Action {

	private static final long serialVersionUID = 3383291843832862856L;
    private static Logger log=Logger.getLogger(AdminIndexAction.class); 
	@Override
	public void index(Mapping map)throws IOException,ServletException
	{
		map.forward("admin/index.jsp");
		
	}

}
