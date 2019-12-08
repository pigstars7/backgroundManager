package com.hq.servlet.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.log4j.Logger;

import com.hq.bean.City;
import com.hq.bean.Citypic;
import com.hq.db.Db;
import com.hq.fileupload.FilePart;
import com.hq.fileupload.FileUploadUtil;
import com.hq.servlet.core.Action;

@WebServlet("/admin/city")
public class CityAction extends Action {

	private static final long serialVersionUID = -5217711206343468172L;
private static  Logger log=Logger.getLogger(CityAction.class);
	@Override
	public void index(Mapping map) throws ServletException, IOException {
		try {
			//所有国家
			List<City> countrys=Db.query("select * from city where display=1 and parent_id=0 order by level", new BeanListHandler<City>(City.class));
		    map.setAttr("countrys", countrys);
		
		    
		   //国显示哪个国家的城市
		    int cid=map.getInt("cid");//国家id
			List<City> citys=null;
		    if(cid>0)
		    {
		    	citys=Db.query("select * from city where display=1 and parent_id=? order by level", new BeanListHandler<City>(City.class),cid);
		    	City contry=Db.query("select * from city where id=?", new BeanHandler<City>(City.class),cid);
		    	 map.setAttr("country", contry);
		    }else
		    	{
		    	//所有城市
		    	citys=Db.query("select * from city where display=1 and parent_id>0 order by level", new BeanListHandler<City>(City.class));
		    	}
		    map.setAttr("citys",citys);
		} catch (SQLException e) {
			log.error("查询国家列表出错"+e.getMessage());
		}
           map.forward("admin/city_list.jsp");
	}
	/**
	 * 跳转到增加页面
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
public void toadd(Mapping map) throws ServletException, IOException {
		
		try {
			//List<Country> citys=Db.query("select * from citys where isdisplay=1 and parent_id=0 order by level", new BeanListHandler<Country>(Country.class));
			List<City> citys=Db.getAll(City.class, "select * from city where display=1 and parent_id=0 order by level");
			 map.setAttr("citys", citys);
		} catch (SQLException e) {
			log.error("查询国家出错"+e.getMessage());
		}
		// TODO Auto-generated method stub
           map.forward("admin/city_add.jsp");
	}

/**
 * 增加国家
 * @throws ServletException
 * @throws IOException
 */
public void saveadd(Mapping map) throws ServletException, IOException {
		
	City city=new City();
	map.getBean(city);
		try {
			//String sql="insert into citys(parent_id,dis,level,pic,name,isdisplay,temp) values(?,?,?,?,?,?,?)";
			//Db.update(sql, city.getParent_id(),city.getDis(),city.getLevel(),city.getPic(),city.getName(),city.getIsdisplay(),city.getTemp());
			Db.add(city);
			 map.setAttr("msg", "增加国家和城市成功!");
		} catch (SQLException e) {
			 map.setAttr("msg", "增加国家和城市失败!");
			log.error("增加国家和城市失败");
		}
		
       this.index(map);
	}


public void edit(Mapping map) throws ServletException, IOException {
	
	int cityid=map.getInt("cityid");

	if(cityid<1)cityid=(Integer)map.getAttr("cityid");
	try {
	if(cityid>0)
	{
		List<City> countrys=Db.query("select * from city where display=1 and parent_id=0 order by level", new BeanListHandler<City>(City.class));
	    map.setAttr("countrys", countrys); 
	    
	    City city=Db.get(cityid, City.class);
	     map.setAttr("city", city);
	    
		  List<Citypic>  citypics=Db.query("select * from citypic where city_id=? order by level", new BeanListHandler<Citypic>(Citypic.class),cityid);
		  map.setAttr("citypic", citypics);
	}

	} catch (SQLException e) {
	
		log.error("修改国家城市出错"+e.getMessage());
	}
	
    map.forward("admin/city_edit.jsp");
}
	/**
	 * 修改国家信息
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
public void saveedit(Mapping map) throws ServletException, IOException {
	
	City city=new City();
	map.getBean(city);
	try {
	/*	String sql="update country set parent_id=?,dis=?,level=?,pic=?,name=?,display=? where id=?";
		Db.update(sql, city.getParent_id(),city.getDis(),city.getLevel(),city.getPic(),city.getName(),city.getDisplay(),city.getId());*/
		Db.update(city);
		 map.setAttr("msg", "修改国家和城市成功!");
	} catch (SQLException e) {
		 map.setAttr("msg", "修改国家和城市失败!");
		 log.error("修改国家信息出错 。。。"+e.getMessage());
	}
	
   this.index(map);
}

/**
 * 上传国家城市图片
 * @throws ServletException
 * @throws IOException
 */
public void uploadcitypic(Mapping map) throws ServletException, IOException {
	
	String basePath=this.getServletContext().getRealPath("ups");
	 FileUploadUtil fup=new FileUploadUtil(map.getReq(), 1024*1024*10,new String[]{".jpg",".bmp",".gif",".png"}, basePath);
    try 
    {
    
		fup.uploadFile();
		if(fup.getFilePart().size()==1&&fup.getFilePart().get(0).getResult()==0)//上传成功
		{
			FilePart fp=fup.getFilePart().get(0);
			String fullpath="ups/"+fp.getNewname();
			String sql="insert into citypic( path, level,dis,city_id) value(?,?,?,?)";
			Db.update(sql,fullpath,fup.getFormvalues().get("level"),fup.getFormvalues().get("dis"),fup.getFormvalues().get("country_id"));
			map.setAttr("cityid", Integer.parseInt(fup.getFormvalues().get("country_id")));
			map.setAttr("msg", "增加国家图片成功！");
		}
	} catch (Exception e) {
		log.error("上传国家图片出错...");
		map.setAttr("err", "增加国家图片失败！");
	}
	
	
    this.edit(map);
}

/**
 * 修改国家图片
 * @param map
 * @throws ServletException
 * @throws IOException
 */
public void cityspicupdate(Mapping map) throws ServletException, IOException {
	Citypic cp=new Citypic();
	   map.getBean(cp);
	   try {
		Db.update("update citypic set level=?,dis=? where id=?",cp.getLevel(),cp.getDis(),cp.getId());
		map.setAttr("cityid", cp.getCity_id());
	} catch (SQLException e) {
		 log.error("修改国家图片出错"+e.getMessage());
	}
	   this.edit(map);
}

/**
 * 删除国家图片
 * @param map
 * @throws ServletException
 * @throws IOException
 */
public void cityspicdel(Mapping map) throws ServletException, IOException {
	   String path=map.getString("path");
	   int id=map.getInt("id");
	   String basePath=this.getServletContext().getRealPath("/");
	   try {
		   File f=new File(basePath,path);
		   f.delete();
		Db.update("delete from  citypic  where id=?",id);
		map.setAttr("cityid", map.getInt("country_id"));
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   this.edit(map);
}

//查询国家下的城市
public void subcitys(Mapping map)throws ServletException, IOException {
    
	int parentid=map.getInt("parent_id");
	List<City> citys=null;
	String result=null;
    try {
		if(parentid>0)
		{
			citys=Db.query("select * from city where display=1 and parent_id=? order by level", new BeanListHandler<City>(City.class),parentid);
   
			 result=com.alibaba.fastjson.JSON.toJSONString(citys);
		 	
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    map.getResp().setContentType("application/json;charset=utf-8");
    PrintWriter out= map.getResp().getWriter();
    
    out.print(result);
    out.close();

}

}
