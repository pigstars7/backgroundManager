package com.hq.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import com.hq.servlet.core.Action;
import com.hq.util.HtmlGenerator;
@WebServlet("/admin/createindex")
public class CreateIndexServlet extends Action {

	@Override
	public void index(Mapping map) throws ServletException, IOException {
		
		String url=map.basePath()+"index";
		
		String realpath=this.getServletContext().getRealPath("index.html");
		HtmlGenerator.createHtmlPage(url, realpath);
		map.setAttr("msg", "生成首页成功！");
		map.forward("admin/welcome.jsp");

	}

}
