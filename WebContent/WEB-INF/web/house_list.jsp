<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		  <base href="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"%>"/>
		<title></title>
		<style type="text/css">
			body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,input,button,textarea,p,blockquote,th,td{margin:0;padding:0;}
			body{font-family: "微软雅黑"; font-size: 14px;}
			a{ text-decoration: none; color: #333;}
			#outtop{ width: 100%; min-width: 1200px; height: 320px; background: url(img/topbak.png) no-repeat 0 -100px; background-size: cover;}
		  
		    #top,#youjia_dis,#activity,#brod_vod,#hot_house,#youjia_edu,#our_team,#hot_house,#footer{width: 1200px; margin: 0 auto;}
		    
		    #outtop #top_nav{ height: 80px; width: 100%; min-width: 1200px; z-index: 9999; }
		    #outtop #top_nav #logo{ float: left;}
		    #outtop #top_nav #logo img{max-height: 80px; max-width: 240px; margin-left: 30px;  margin-top: 10px;}
		    #outtop #top_nav ul{ list-style: none; float: left; margin-left: 35px; line-height: 80px;}
		    #outtop #top_nav ul li{ float: left;}
		    #outtop #top_nav ul li a { color: #FFF; text-decoration: none; font-size: 16px; font-weight: 500; margin-right: 25px;}
		    #outtop #top_nav ul li a:hover{ text-decoration: underline; color:black;}
		    #outtop #top_nav span{ float: right; color: white; font-size: 16px; margin-right: 30px; line-height: 80px;}
		    
		    #top{height: 240px;  display: block; clear: both; letter-spacing: 3px;}
		    #top .top_tit{ font-size: 24px; color:#FFF;text-align: left; font-weight: bold; margin-bottom: 10px;}
			#top form{}
			#top form input.input_key{ height: 50px; width: 580px; background: #FFF; border: 0; margin: 0; float: left; }
			#top form input.input_but{ height: 50px; width: 80px; background: orangered; border: 0; color: #FFF; margin: 0; float: left; font-weight: bold; font-size: 18px; letter-spacing: 5px;}
			
			#top p{ clear: both; line-height: 50px;  color: #FFF;}
			
			#top p a{ color: #FFF; text-decoration: none; margin: 0 8px;}
			#top p a:hover{ text-decoration: underline;}
			
			/**
			 * 房产列表
			 */
#hot_house{ height: 200px;}
#hot_house h4{line-height: 40px;}
#hot_house .house_condition{ line-height: 34px;}
#hot_house .house_condition a{margin-right: 20px; padding: 5px 10px; border-radius: 10px;}
#hot_house .house_condition a:hover{ background: #1683E2; color: white;}
#hot_house .house_tit{ font-weight: bold;font-size: 18px; border-bottom:1px #1683E2 solid; color: #338DE6; line-height: 46px; letter-spacing: 5px;}

#hot_house .house_list .house_item{ height:360px; box-shadow: #999 4px 4px 12px; border-radius: 6px;  margin: 20px 0; position: relative;}
#hot_house .house_list .house_item img{ position: absolute; left:0; top:0;width: 465px; height: 360px; border-bottom-left-radius: 6px; border-top-left-radius: 6px;}
#hot_house .house_list .house_item h1{ position: absolute; left:480px; top:50px; font-size: 22px; letter-spacing: 4px;}
#hot_house .house_list .house_item h1 small{ margin-left: 10px;  width: 28px; padding: 3px; font-size: 13px; background: orangered; color: #FFF;}
#hot_house .house_list .house_item span.first_price{position: absolute; left:942px; top:48px; font-weight: bold; font-size: 26px; color: #F00; }
#hot_house .house_list .house_item span.rmb_price{position: absolute; left:480px; top:118px; font-weight: bold; font-size: 26px; color: #F00; }
#hot_house .house_list .house_item span.thoer_price{position: absolute; left:670px; top:118px; font-weight: bold; font-size: 20px; color: #666; }
#hot_house .house_list .house_item p{position: absolute; left: 486px; top: 200px; color: #338DE6; font-weight: bold; font-size: 20px; letter-spacing: 6px;}
#hot_house .house_list .house_item a{ text-decoration: none; font-size: 24px;}
#hot_house .house_list .house_item  a.yuyue{ padding: 5px 25px; position: absolute; left: 486px; top: 257px; width: 300px; line-height: 54px; border-radius: 10px; text-align: center; background: #127DEF; font-size: 22px; letter-spacing: 4px; color: #FFF;}
#hot_house .house_list .house_item  a.yuyue:hover{background: orangered;}
#hot_house .house_list .house_item  a.get_detials{ padding: 5px 25px; position: absolute; left: 879px; top: 257px; width: 200px; line-height: 54px; border-radius: 10px; text-align: center; background: #E5F1FF; font-size: 22px; letter-spacing: 4px; color: #666;}
#hot_house .house_list .house_item  a.get_detials:hover{ background:#127DEF ; color: #FFF;}
#hot_house  .page_nav{ clear: both;}
#hot_house  .page_nav ul{list-style: none; float: right;}
#hot_house  .page_nav ul li{ float: left;}
#hot_house  .page_nav ul li a{ padding: 8px 15px; border:1px #CCC solid; margin: 5px;}
#hot_house  .page_nav ul li a:hover{ background: #127DEF; color: #FFF;}

/*页脚*/
#footer{ height: 230px;}
#footer #foot_left{ width: 600px; height: 230px; float: left; text-align: center;}
#footer #foot_left h3{ line-height: 50px; font-size: 20px; margin-top: 30px;}
#footer #foot_left h4{ line-height: 36px;}
#footer #foot_right{ width: 600px; height: 230px; float: right;}
		</style>
	</head>
	<body>
		<!--
        	作者：langyamoren@163.com
        	时间：2019-11-30
        	描述：
        -->
        <div id="outtop">
			<div id="top_nav" >
				<div id="logo">
				<a href="#"><img src="img/logo.png"/></a>
				</div>
				 <ul>
					  	    	<li><a href="#">首页</a></li>
					  	    	<li><a href="#">海外房产</a></li>
					  	    	<li><a href="#">国内旅居</a></li>
					  	    	<li><a href="#">优家留学</a></li>
					  	    	<li><a href="#">优家教育</a></li>
					  	    	<li><a href="#">优管家</a></li>
					  	    	<li><a href="#">关于我们</a></li>
					  	    	<li><a href="#">联系我们</a></li>
					  	   </ul>
					  	   <span>咨询：400-188-5865</span>
					  	   <div style="clear: both;"></div>
			</div>
			<div id="top">
				   <div style="height: 30px;"></div>
				    <div class="top_tit">立即搜索海外房产</div>
				    <form action="web/house_list" method="post">
				    	 <input type="text" name="key" class="input_key "/>
				    	 <input type="submit" value="搜索"  class="input_but"/>
				    	
				    </form>
				    <p><b>热门搜索：</b><a href="#">柬埔寨</a><a href="#">曼谷</a><a href="#">马来西亚</a><a href="#">泰国</a><a href="#">总价30万起</a></p>
			</div>
			<div style="clear: both;"></div>
		</div>
		
		<!--
        	作者：langyamoren@163.com
        	时间：2019-11-30
        	描述：房产列表
        -->
        <!--
	作者：langyamoren@163.com
	时间：2019-10-22
	描述：房产列表
-->
<div  style="width: 100%; background: #F9F9F9; padding-top:10px;">
	 <div id="hot_house">
	 	  <h4>环球优家&gt;海外房产</h4>
	 	  <div class="house_condition">
	 	  	  <b>国家地区：</b>
	 	  	  <a href="#">全部</a>
				<a href="#">美国</a>
				<a href="#">泰国</a>
				<a href="#">日本</a>
				<a href="#">越南</a>
				<a href="#">菲律宾</a>
				<a href="#">阿联酋</a>
				<a href="#">希腊</a>
	 	  </div>
	 	  <div class="house_condition">
	 	  	 <b>房屋总价：</b><a href="#">全部</a><a href="#">50万以下</a><a href="#">50万-100万</a><a href="#">100万-200万</a><a href="#">200万-300万</a><a href="#">300万-500万</a><a href="#">500万-700万</a><a href="#">700万-1000万</a><a href="#">1000万以上</a>
	 	  </div>
	 	  
	 	   <div class="house_condition">
	 	   	<b>置业目的：</b>
	 	   	<a href="#">全部</a>
			<a href="#">投资</a>
			<a href="#">移民</a>
			<a href="#">留学</a>
			<a href="#">自住</a>
			<a href="#">养老</a>
	 	   </div>
	 	   <div class="house_condition">
	 	   	<b>物来类型：</b>
	 	   	<a href="#">全部</a>
	 	   	<a href="#">独栋别墅</a><a href="#">联排别墅</a><a href="#">洋房</a><a href="#">公寓</a>
	 	   </div>
	 	   <div style="clear: both; height: 30px;"></div>
	 	   <div class="house_tit">为您推荐好房子</div>
	 	   
	 	   <div class="house_list">
	 	   	   <c:if test="${not empty pd.list}">
	 	   	   <c:forEach items="${pd.list}" var="house">
		 	   	   <div class="house_item">
		 	   	     <img src="${house.pic}" />
		 	   	   	 <h1>${house.name}<small>荐</small></h1>
		 	   	   	  <span class="rmb_price">￥${house.price_rmb}</span>
		 	   	   	  <span class="thoer_price">约${house.price_other}</span>
		 	   	   	  <span class="first_price">首付${house.payment}%</span>
		 	   	   	  <p>预约人数：已有<%=new java.util.Random().nextInt(20)+50 %>名用房参加预约</p>
		 	   	   	  
		 	   	   	  <a href="#" class="yuyue">预约看房</a>
		 	   	   	  <a href="web/house_${house.id}.html" class="get_detials">查看详情</a>
		 	   	   </div>
	 	   	   </c:forEach>
	 	   	   </c:if>
	 	   	  
	 	   	   
	 	   	  
	 	   </div><!--end house_list-->
	 	   <div class="page_nav">
	 	   	<ul>
	 	   		<li><a href="web/house_list?pageNo=${pd.pageNo-1>1?pd.pageNo-1:1}&key=${key}">上一页</a></li>
	 	   		<c:forEach begin="${pd.start}" end="${pd.end}" var="pit">
	 	   		<li><a href="web/house_list?pageNo=${pit}&key=${key}">${pit}</a></li>
	 	   		</c:forEach>
	 	   		
	 	   		
	 	   		<li><a href="web/house_list?pageNo=${pd.pageNo+1<pd.totalPage?pd.pageNo+1:pd.totalPage}&key=${key}">下一页</a></li>

	 	   	</ul>
	 	   </div>
	 </div><!--hot_house--->
</div>
<div style="clear: both; height: 20px;"></div>
<!--
	作者：langyamoren@163.com
	时间：2019-06-27
	描述：页脚开始
-->
<div style="height: 230px; background: #000; color: #EEE;">
	<div id="footer">
		
		 	  <div id="foot_left">
		 	  	  <h3>环球优家</h3>
		 	  	  <h4>www.huanqiujiayuan.com</h4>
		 	  	  <h4>电话：400-123-456</h4>
		 	  	  <h4>Email:9703239@qq.com</h4>
		 	  </div>
		 	    <div  id="foot_right">
		 	  	   <img src="img/erwei.jpg" style="margin:20px; max-height: 120px;" />
		 	  	   <img src="img/erwei.jpg"  style="margin:20px; max-height: 120px;" />
		 	  	   
		 	  	   <p class="bootinfo">Copyright@2019 huaqiujiayuan.com Inc.All Rights Reserved <br/>陕西棕榈海岸置业有限公司 陕ICP备18013995号 </p>
		 	  </div>
		    <div style="clear: both;"></div>

	</div>
</div>
<!--
	作者：langyamoren@163.com
	时间：2019-07-27
	描述：js 开始
-->
<script type="text/javascript" src="js/jquery-1.8.3.min.js" ></script>
<script type="text/javascript">
	$(function(){
//下面我们需要开发用户滚动时，当滚动向下一定距离，展示这个隐藏的顶端固定导航
  $(window).scroll(function(){
    //在window的滚动回调方法中，我们处理具体逻辑
      var scrollTop　=　document.documentElement.scrollTop || document.body.scrollTop;
    /* 以上代码获取滚动后，离顶端距离，这里使用两个值是为了兼容不同浏览器及其不同doctype定义 */
     
     if(scrollTop > 100){
        /*当滚动超过100px*/
        $('#top_nav').css({ position: "fixed",background: "#000000",top:"0"})
     }else{
        $('#top_nav').css({ position: "",background: "transparent",top:"0"})
     }
     
  });
  
  
  //加动画
 /*  $("#act_left img").mouseover(function(){
   	$(this).addClass("zoomIn");
   	$(this).addClass("animated");
   });
    $("#act_left img").mouseout(function(){
   	$(this).removeClass("zoomIn");
   	$(this).removeClass("animated");
   });*/
});
	
</script>
	</body>
</html>
