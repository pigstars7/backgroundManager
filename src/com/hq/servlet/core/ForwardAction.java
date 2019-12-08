package com.hq.servlet.core;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
@WebServlet("/admin/forward")
public class ForwardAction extends Action {

	@Override
	public void index(Mapping map) throws ServletException, IOException 
	{
	    map.forward(map.getString("page"));

	}

}
