package com.hq.servlet.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.log4j.Logger;

import com.hq.bean.City;
import com.hq.bean.House;
import com.hq.db.Db;
import com.hq.db.PageDiv;
import com.hq.servlet.core.Action;
import com.hq.util.HtmlGenerator;

@WebServlet("/admin/house")
public class HouseAction extends Action {
	private static final long serialVersionUID = -6546076263707966913L;
	Logger log=Logger.getLogger(HouseAction.class);
	@Override
	public void index(Mapping map) throws ServletException, IOException {
		try {
			//所有国家信息
			List<City> countrys=Db.getAll(City.class, "select * from city where display=1 and parent_id=0 order by level");
			map.setAttr("countrys", countrys);
			
		
			 PageDiv<House> pd=null;
	         int pageSize=15;
	         int pageNo=1;
	         if(map.getInt("pageNo")>0)pageNo=map.getInt("pageNo");
				
	            long cid=map.getLong("cid");//国家id

				if(cid<1)cid=null!=(Long)map.getAttr("cid")?(Integer)map.getAttr("cid"):0;
				
				List<House> arts=null;
				Object ototal=null;
			    if(cid>0)
			    {
			    	map.setAttr("country", Db.get(cid, City.class));
			    	pd=Db.getByPage(House.class, "select * from house where  country_id=? order by level,id", pageNo, pageSize, cid);
			    }
			    else
			    {
			    		pd=Db.getByPage(House.class, "select * from house  order by level,id", pageNo, pageSize);
			    }
			    map.setAttr("cid",cid);
			    map.setAttr("pd",pd);
		} catch (SQLException e) {
			 log.error("列出所有楼盘信息出错"+e.getMessage());
		}

			  map.forward("admin/house_list.jsp");

	}
	public void toadd(Mapping map) throws ServletException, IOException {
		 
		try 
		{
			List<City> countrys=Db.getAll(City.class, "select * from city where display=1 and parent_id=0 order by level");
			map.setAttr("countrys", countrys);
		
		} catch (SQLException e) {
			 log.error("跳转到增加楼盘页面出错!"+e.getMessage());
		}
		map.forward("admin/house_add.jsp");
	}
	
	public void saveadd(Mapping map) throws ServletException, IOException {
		 House house=new House();
		 map.getBean(house);
         String []alltys=map.getStringArray("types");
	     //设置类型
			StringBuilder sb=new StringBuilder();
			if(null!=alltys)
			{
				for(int i=0;i<alltys.length;i++)
				{
					sb.append(alltys[i]);
					if(i<(alltys.length-1))
						sb.append(",");
				}
			}
			house.setTypes(sb.toString());
			
			
			 String []alltarget=map.getStringArray("target");
		     //设置类型
				StringBuilder sb1=new StringBuilder();
				if(null!=alltarget)
				{
					for(int i=0;i<alltarget.length;i++)
					{
						sb1.append(alltarget[i]);
						if(i<(alltarget.length-1))
							sb1.append(",");
					}
				}
				house.setTarget(sb1.toString());
		
		 house.setCtimes(new Date());
		try {
			/*String sql="insert into house(name,keyword,area,addr,price_rmb,price_other,feature,types,propertys,sizes,payment,huxing,fitment,country_id,city_id,level,ctimes,txt1,txt2,txt3,pic) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			Db.update(sql,house.getName(),house.getKeyword(),house.getArea(),house.getAddr(),house.getPrice_rmb(),house.getPrice_other(),house.getFeature(),house.getTypes(),house.getPropertys(),house.getSizes(),house.getPayment(),house.getHuxing(),house.getFitment(),house.getCountry_id(),house.getCity_id(),house.getLevel(),house.getCtimes(),house.getTxt1(),house.getTxt2(),house.getTxt3(),house.getPic());
			reqAttr("msg", "增加房产基本信息成功!");*/
			
			Db.add(house);
		    map.setAttr("msg", "增加房产基本信息成功!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.index(map);
	}
	
	    //跳转到修改基本信息
		public void edit(Mapping map) throws ServletException, IOException
		{
			long id=map.getInt("id");
			if(id>0)
			{
			try {
				//所有国家信息
				List<City> countrys=Db.getAll(City.class, "select * from city where display=1 and parent_id=0 order by level");

				map.setAttr("cons", countrys);
				House house=Db.get(id, House.class);
				
				map.setAttr("house",house);
			} catch (SQLException e) {
				 log.error("跳转到楼盘基本信息修改出错"+e.getMessage());
			}
			}
			map.forward("admin/house_edit.jsp");
		}
		//保存房产基础信息
		public void savebase(Mapping map) throws ServletException, IOException
		{
			try {
			
			House house=new House();
			map.getBean(house);
			
			house.setCtimes(new Date());
			
			 String []alltys=map.getStringArray("types");//req.getParameterValues("types");
		
				StringBuilder sb=new StringBuilder();
				if(null!=alltys)
				{
					for(int i=0;i<alltys.length;i++)
					{
						sb.append(alltys[i]);
						if(i<(alltys.length-1))
							sb.append(",");
					}
				}
				house.setTypes(sb.toString());


				 String []alltarget=map.getStringArray("target");
			     //设置类型
					StringBuilder sb1=new StringBuilder();
					if(null!=alltarget)
					{
						for(int i=0;i<alltarget.length;i++)
						{
							sb1.append(alltarget[i]);
							if(i<(alltarget.length-1))
								sb1.append(",");
						}
					}
					house.setTarget(sb1.toString());
				
	           // String sql="update  house set name=?,keyword=?,area=?,addr=?,price_rmb=?,price_other=?,feature=?,types=?,propertys=?,sizes=?,payment=?,huxing=?,fitment=?,country_id=?,city_id=?,level=?,ctimes=?,txt1=?,txt2=?,txt3=?,pic=? where id=?";
				//Db.update(sql,house.getName(),house.getKeyword(),house.getArea(),house.getAddr(),house.getPrice_rmb(),house.getPrice_other(),house.getFeature(),house.getTypes(),house.getPropertys(),house.getSizes(),house.getPayment(),house.getHuxing(),house.getFitment(),house.getCountry_id(),house.getCity_id(),house.getLevel(),house.getCtimes(),house.getTxt1(),house.getTxt2(),house.getTxt3(),house.getPic(),house.getId());
				Db.update(house);
				
				//所有国家信息
				List<City> countrys=Db.getAll(City.class, "select * from city where display=1 and parent_id=0 order by level");

				map.setAttr("cons", countrys);
			
				map.setAttr("house",house);
				map.setAttr("msg","修改房产信息成功!");
			} catch (SQLException e) {
			    log.error("修改房产基本信息失败!"+e.getMessage());
			}
			
			map.forward("admin/house_edit.jsp");
		}

		public void isdel(Mapping map) throws ServletException, IOException
		{
			int id=map.getInt("id");
			try {
				if(id>0)
				{
				  Db.update("update house set isdel=? where id=?",map.getInt("vv"),id);
				
				  map.setAttr("msg","修改成功!");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			map.setAttr("cid",map.getInt("cid"));
			index(map);
		}

	//发布信息
		public void pub(Mapping map) throws ServletException, IOException
		{
			
			int id=map.getInt("id");
			if(id>0)
			{
		     	String basePath=map.basePath()+"/web/housecontent?id="+id;
			   String realpath=this.getServletContext().getRealPath("web");
			   HtmlGenerator.createHtmlPage(basePath, realpath+"/house_"+id+".html");
			   map.setAttr("msg","房子详情页成功!");
			}
			index(map);
		}
}
