<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>环球优家</title>
		<link rel="stylesheet" href="font/iconfont.css" />
		<link rel="stylesheet" href="css/animate.css" />

		<link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/owl.theme.css">
		<style type="text/css">
			body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,input,button,textarea,p,blockquote,th,td{margin:0;padding:0;}
			body{font-family: "微软雅黑"; font-size: 14px;}
			a{ text-decoration: none; color: #333;}
			#outtop{ width: 100%; min-width: 1200px; height: 460px; background: url(img/topbak.png) no-repeat 0 -80px; background-size: cover;}
		  
		    #top,#youjia_dis,#activity,#brod_vod,#hot_house,#youjia_edu,#our_team,#footer{width: 1200px; margin: 0 auto;}
		    
		    #outtop #top_nav{ height: 80px; width: 100%; min-width: 1200px; z-index: 9999; }
		    #outtop #top_nav #logo{ float: left;}
		    #outtop #top_nav #logo img{max-height: 80px; max-width: 240px; margin-left: 30px;  margin-top: 10px;}
		    #outtop #top_nav ul{ list-style: none; float: left; margin-left: 35px; line-height: 80px;}
		    #outtop #top_nav ul li{ float: left;}
		    #outtop #top_nav ul li a { color: #FFF; text-decoration: none; font-size: 16px; font-weight: 500; margin-right: 25px;}
		    #outtop #top_nav ul li a:hover{ text-decoration: underline; }
		    #outtop #top_nav span{ float: right; color: white; font-size: 16px; margin-right: 30px; line-height: 80px;}
		    
		    #top{height: 400px;}
		    #top #bigtit{ width:1200px;font-size: 56px; font-weight: bold; color: white;  letter-spacing: 20px; line-height: 160px; text-shadow: #000 3px 3px 8px; padding: 10px; text-align: center; }
		    #top #title2{ width:1200px; text-align: center; height: 100px;}
		    #top #title2 span{ width: auto;  background:#1683E2; color: #FFF; font-size: 22px; font-weight: bold; letter-spacing: 15px; line-height:40px; padding: 10px 30px; border-top-left-radius: 50px; border-bottom-right-radius: 50px;}
		    #top #actionbut{ width:1200px; text-align: center; }
		    #top #actionbut a{border: 3px #FFF solid;color: #000; background: #FFF; text-decoration: none; font-size: 22px; margin-right: 30px; padding: 10px 80px; border-radius: 30px;}
		    #top #actionbut a:hover{ background:orangered; color: #FFF; border: 0;}
		    /*大图下四块描述*/
		     #youjia_dis{ height: 100px;   padding-top: 10px; margin-top: 20px;}
		     #youjia_dis .dis_item{ width: 300px;  float: left; overflow: hidden;}
		     #youjia_dis .dis_item .icon_left{float: left; width: 70px;height: 70px; border:1px #4DBDFD solid;border-radius: 35px; line-height: 70px;  text-align: center;}
		     #youjia_dis .dis_item .icon_left span{color: #4DBDFD; font-size: 50px; cursor: pointer;}
		     #youjia_dis .dis_item .icon_left:hover{ background: #4DBDFD; color: white;} 
		      #youjia_dis .dis_item .icon_left span:hover{color: white;} 
		     #youjia_dis .dis_item .icon_right{ float: right; width: 220px;  }
		     #youjia_dis .dis_item .icon_right h3{line-height: 30px;}
		     #youjia_dis .dis_item .icon_right p{ color: #999; font-size: 13px;}
		    /*活动和文章*/ 
		     #out_activity{width: 100%; height: 450px; min-width: 1200px; background: #F9F9F9; padding-top: 30px; }
		     #activity{ height: 450px; }
		     #activity #act_left{ width:500px ; height: 400px;  float: left;  }
		     #activity #act_right{ width: 700px; height: 400px; float: right;}
		     
		      #activity #act_left h4{ line-height: 36px; font-size: 16px;}
		       #activity #act_left .active_a{ display: block;width: 490px; height: 300px;overflow: hidden; }
		      #activity #act_left img{width: 490px; height: 300px;overflow: hidden;  transition: all 0.6s;}
		      #activity #act_left img:hover{transform: scale(1.1); }
		      #activity #act_left h3{ text-align: center;}
		      #activity #act_left h3 a{font-size: 16px; font-weight: 600;  color: #333; line-height: 36px; text-decoration: none; }
		      #activity #act_left h3 a:hover{ text-decoration: underline;} 
		      #activity #act_left p{ text-align: center; }
		      #activity #act_left p time{ margin-right: 30px;}
		      
		      #activity #act_right #top_tit{ line-height: 36px;}
		      #activity #act_right #top_tit span{ font-size: 16px; color: #333;font-weight: 600 ;}
		      #activity #act_right #top_tit a{ color: #333; text-decoration: none; color: #888; float: right; margin-right: 30px;}
		      #activity #act_right #top_tit a:hover{text-decoration: underline;}
/*最新资讯*/		      
#activity #act_right .hot_list1{ margin-bottom:20px;width: 340px; height: 180px; position: relative; float: left; margin-right: 10px;}
#activity #act_right .hot_list1 .art_pic01{ display:block;width: 340px; height: 180px; overflow: hidden;  transition: all 0.6s;}
#activity #act_right .hot_list1 img{ width: 340px; height: 180px; border-radius: 5px;  transition: all 0.6s;}
#activity #act_right .hot_list1 img:hover{transform: scale(1.2);}
#activity #act_right .hot_list1 p{ position: absolute; left: 10px; top: 130px;
white-space:initial;
overflow : hidden;
text-overflow: ellipsis;
display: -webkit-box;
-webkit-line-clamp: 2;
-webkit-box-orient: vertical; }
#activity #act_right .hot_list1 p a{ color: white; text-decoration: none;}
#activity #act_right .hot_list1 p a:hover{text-decoration: underline;}
#activity #act_right .hot_list2{ margin-bottom:25px;width: 340px; height: 60px; position: relative; float: left; margin-right: 10px;}
#activity #act_right .hot_list2 .art_pic02{display:block;width:80px; height: 60px; overflow: hidden;  transition: all 0.6s;}
#activity #act_right .hot_list2 img{ width:80px; height: 60px; border-radius: 3px;  transition: all 0.6s;}
#activity #act_right .hot_list2 img:hover{transform: scale(1.2);}
#activity #act_right .hot_list2 p{ line-height: 30px; position: absolute; left: 85px; top:0;
 white-space:initial;
overflow : hidden;
text-overflow: ellipsis;
display: -webkit-box;
-webkit-line-clamp: 2;
-webkit-box-orient: vertical; }
#activity #act_right .hot_list2 p a{ color: black; text-decoration: none;}
#activity #act_right .hot_list2 p a:hover{ text-decoration:underline;}

/*直播视频*/
#brod_vod{ height: 340px; padding-top: 15px;}
.brod_title{ line-height: 50px; font-size: 16px;}
.brod_title h4{ float: left;}
.brod_title a{ float: right; margin-right: 35px;}
.brod_title a:hover{text-decoration: underline;}
#brod_vod .vod_list{}
#brod_vod .vod_list .vod_item{ float: left; margin-right: 20px; width: 380px; height: 260px;}
#brod_vod .vod_list .vod_item video{width: 380px; height: 260px;}

/*热点房子*/
#hot_house{ height: 630px;}
#hot_house h4{line-height: 55px;}
#hot_house .house_condition{ line-height: 45px;}
#hot_house .house_condition a{margin-right: 20px; padding: 5px 10px; border-radius: 10px;}
#hot_house .house_condition a:hover{ background: #1683E2; color: white;}
#hot_house #house_list {height: 360px;}
#hot_house #house_list .house_item{width: 380px; height: 350px; background: white; box-shadow: #666 3px 5px 6px; margin-right: 20px; float: left;} 
#hot_house #house_list .house_item .img_area{ width: 380px; height: 220px;  position: relative; overflow: hidden; }
#hot_house #house_list .house_item .img_area img{width: 380px; height: 220px;  transition: all 0.6s;}
#hot_house #house_list .house_item .img_area img:hover{ transform: scale(1.2);}
#hot_house #house_list .house_item .img_area .black_title{background: rgba(0,0,0,0.5); width: 100px; height: 40px; color: white; font-size: 20px; position: absolute; left: 0; top: 180px; line-height: 40px; text-align: center;}
#hot_house #house_list .house_item .house_tit01{ border-bottom: 1px #ccc solid; margin: 0 10px;}
#hot_house #house_list .house_item .house_tit01 h4{line-height: 35px; font-size: 16px; font-weight: 600;}
#hot_house #house_list .house_item .house_tit01 h5{ line-height: 30px; color: #888888; font-size: 12px; font-weight: 400;}
#hot_house #house_list .house_item .house_tit02{margin: 0 10px; position: relative;}
#hot_house #house_list .house_item .house_tit02 h5{ font-size: 14px; font-weight: 600; line-height: 30px;}
#hot_house #house_list .house_item .house_tit02 h5 span{ color: red;}
#hot_house #house_list .house_item .house_tit02 h6{ font-size: 12px; font-weight: 500; line-height: 26px; color: #888888;}
#hot_house #house_list .house_item .house_tit02 a{ font-size: 12px; display: block; padding:6px 15px; color: white; border-radius:20px; background:orangered;  position: absolute; left: 240px; top: 20px;}
#hot_house #house_list .house_item .house_tit02 a:hover{ background:orange;}


#youjia_edu{ height: 320px;}
#youjia_edu .edu_list .edu_item{width: 280px; height: 300px; margin-right: 20px;  float: left; position: relative; }
#youjia_edu .edu_list .edu_item h4{position: absolute; left: 10px; top: 10px; font-size: 16px; line-height: 30px;}
#youjia_edu .edu_list .edu_item img{position: absolute; left: 160px; top: 15px; width: 100px; height: 100px; border-radius: 50px; }
#youjia_edu .edu_list .edu_item ul{ position: absolute; left: 20px; top: 50px; font-size: 12px;}
#youjia_edu .edu_list .edu_item ul li{ line-height: 30px;}
#youjia_edu .edu_list .edu_item  p{position: absolute; left: 10px; top: 160px; }
#youjia_edu .edu_list .edu_item  a{ position: absolute; left: 100px; top: 200px; padding: 10px 25px; letter-spacing: 3px; border:1px #1683E2 solid; border-radius: 30px;}
#youjia_edu .edu_list .edu_item  a:hover{ background: #1683E2; color: #FFF;}


/*团队*/
#our_team{ }
#our_team h3{ line-height: 50px; text-align: center;}
.dowebok-outer { height: 421px; background: url(img/bg.jpg) 50% 0 no-repeat;}
#dowebok { width: 1080px; margin: 0 auto; padding-top: 30px; font-family: "Microsoft Yahei";}
#dowebok .owl-wrapper-outer { margin: 0 auto;}
#dowebok .item { position: relative; width: 250px; height: 339px; margin: 0 auto; background-color: #fff; overflow: hidden;}
#dowebok .shd { position: absolute; left: 0; top: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.15);}
#dowebok .shd a { display: block; width: 250px; height: 239px; *background-image: url(about:blank); background-image: url(about:blank)\0;}
#dowebok .txt { position: absolute; left: 0; bottom: 0; width: 226px; height: 100px; padding: 0 12px; color: #888; box-shadow: 0 0 15px 15px rgba(228, 233, 238, 0.95); background-color: #e4e9ee\9; background-color: rgba(228, 233, 238, 0.95);}
#dowebok h3 { width: 226px; height: 25px; margin-bottom: 6px; padding-top: 6px; font: 700 18px/25px arial,"Microsoft Yahei"; overflow: hidden;}
#dowebok h3 a { color: #333; text-decoration: none;}
#dowebok h3 a:hover { color: #338de6;}
#dowebok p { text-align: center; width: 226px;  line-height: 30px; font-size: 12px;}

#dowebok .item:hover .shd { background-color: rgba(0, 0, 0, 0);}
#dowebok .item:hover .txt { background-color: #fff\9; background-color: rgba(248, 249, 249, 0.95); box-shadow: 0 0 15px 15px rgba(248, 249, 249, 0.95);}

.owl-theme .owl-controls .owl-buttons div { position: absolute; top: 180px; width: 30px; height: 60px; margin: 0; padding: 0; border-radius: 0; font: 60px/60px "宋体"; background-color: transparent; overflow: hidden; _display: none;}
.owl-theme .owl-controls .owl-buttons .owl-prev { left: -40px;}
.owl-theme .owl-controls .owl-buttons .owl-next { right: -40px;}
.owl-theme .owl-controls .owl-buttons .owl-prev:before { content: "<";}
.owl-theme .owl-controls .owl-buttons .owl-next:before { content: ">";}


/*页脚*/
#footer{ height: 230px;}
#footer #foot_left{ width: 600px; height: 230px; float: left; text-align: center;}
#footer #foot_left h3{ line-height: 50px; font-size: 20px; margin-top: 30px;}
#footer #foot_left h4{ line-height: 36px;}
#footer #foot_right{ width: 600px; height: 230px; float: right;}
		</style>
	</head>
	<body>
		<div id="outtop">
			<div id="top_nav" >
				<div id="logo">
				<a href="#"><img src="img/logo.png"/></a>
				</div>
				 <ul>
					  	    	<li><a href="#">首页</a></li>
					  	    	<li><a href="web/house_list">海外房产</a></li>
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
				    <div id="bigtit">专注家庭资产配置</div>
					<div id="title2"><span>为您的高品质生活保驾护航</span></div>
					<div id="actionbut">
						 <a href="#">立即咨询</a>
						 <a href="#" style="background: transparent;  color: #FFF;">了解更多</a>
					</div>
			</div>
			<div style="clear: both;"></div>
		</div>
		
		<!--
	作者：langyamoren@163.com
	时间：2019-10-10
	描述：关于环球优家一些描述
-->

<div id="youjia_dis">
	
	<div class="dis_item">
		  <div class="icon_left">
		  	<span class="iconfont icon-shouye"></span>
		  </div>
		  <div class="icon_right">
		  <h3>优家房产</h3>
		  <p>全世界那么多好房产，我们只您甄选好的，为您的资产保驾</p>
		  </div>
	</div>
	<div class="dis_item">
		<div class="icon_left">
		  	<span class="iconfont icon-wodejuhuasuan"></span>
		  </div>
		  <div class="icon_right">
		  <h3>优家教育</h3>
		  <p>只专注家庭教育、财富教育、女子教育，保障您的高品质生活</p>
		  </div>
	</div>
	<div class="dis_item">
		  <div class="icon_left">
		  	<span class="iconfont icon-shouhuodizhi"></span>
		  </div>
		  <div class="icon_right">
		  <h3>优家留学</h3>
		  <p>挑选学历提升最优方式与高品质欧美大学</p>
		  </div>
	</div>
	<div class="dis_item">
		  <div class="icon_left">
		  	<span class="iconfont icon-wangluo"></span>
		  </div>
		  <div class="icon_right">
		  <h3>优管家</h3>
		  <p>一站式帮您搭理海外资产，保证资产永久升值</p>
		  </div>
	</div>
	<div style="clear: both;"></div>
</div>
<!--
	作者：langyamoren@163.com
	时间：2019-10-16
	描述：活动和文章
-->
<div id="out_activity">
	  <div id="activity">
	  	   <div id="act_left">
	  	      <h4>热门活动</h4>
	  	      <a  href="#" class="active_a">
	  	   	  <img src="${travel.pic}"  />
	  	   	  </a>
	  	   	  <h3><a href="#">${travel.title }</a></h3>
	  	   	  <p><time><fmt:formatDate pattern="yyyy-MM-dd" 
            value="${travel.ctimes}" /></time>${travel.city}出发</p>
	  	   </div>
	  	   <div id="act_right">
	  	   	  <div id="top_tit">
	  	   	  	  <span>最新资讯</span>
	  	   	  	  <a href="#">更多>></a>
	  	   	  </div>
	  	   	  
	  	   	  <c:forEach items="${arts}" var="art" varStatus="vsts">
	  	   	     
	  	   	      <c:if test="${vsts.index<2}">
	  	   	      <!-- 大的 -->
	  	  <div class="hot_list1">
				<a href="web/art_${art.channel_id}/news_${art.channel_id}_${art.id}.html" class="art_pic01"><img src="${art.pic }" /></a>
				<p>
					<a href="web/art_${art.channel_id}/news_${art.channel_id}_${art.id}.html">
					${art.title }
					</a>
				</p>
			</div>
	  	   	      </c:if>
	  	     	  <c:if test="${vsts.index>1}">
	  	   	        <!-- 小的 -->
	  	  <div class="hot_list2">
				<a href="web/art_${art.channel_id}/news_${art.channel_id}_${art.id}.html"  class="art_pic02"><img src="${art.pic }" /></a>
				<p>
					<a href="web/art_${art.channel_id}/news_${art.channel_id}_${art.id}.html">
						${art.title }
					</a>
				</p>
			</div>
	  	   	      </c:if>
	  	   	  
	  	   	  </c:forEach>
	  	   	  
	  	  
			
		
			
			
	  	   	  
	  	   </div><!--end act_rigth-->
	  </div><!--end activity-->
	
</div><!--end out_activity-->
<!--
	作者：langyamoren@163.com
	时间：2019-10-20
	描述：直播视频
-->
<div id="brod_vod">
	<div class="brod_title">
		<h4>热点视频</h4>
		<a href="#">更多>></a>
	</div>
	<div style="clear: both;"></div>
	<div class="vod_list">
<div class="vod_item">
<video width="380" height="260" controls>
<source src="vod/vod03.mp4" type="video/mp4">
   
    您的浏览器不支持 video 标签。
</video>
</div>
<div class="vod_item">
<video width="380" height="260" controls>
  <source src="vod/vod01.mp4" type="video/mp4">
    您的浏览器不支持 video 标签。
</video>
</div>
<div class="vod_item">
<video width="380" height="260" controls>
<source src="vod/vod03.mp4" type="video/mp4"> 
    您的浏览器不支持 video 标签。
</video>
		  </div>
	</div>
</div>
<!--
	作者：langyamoren@163.com
	时间：2019-10-22
	描述：房产列表
-->
<div  style="width: 100%; background: #F9F9F9; padding-top:20px;">
	 <div id="hot_house">
	 	  <h4>推荐好房子</h4>
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
	 	   
	 	   <div id="house_list">
	 	    
	 	    <c:forEach items="${houses}" var="house">
	 	      <div class="house_item">
	 	      	   <div class="img_area">
	 	      	   	   <a href="web/house_${house.id}.html">
	 	      	   	   	<img src="${house.pic}" />
	 	      	   	   </a>
	 	      	   	   <div class="black_title">
	 	      	   	   	${house.price_rmb}起
	 	      	   	   </div>
	 	      	   </div>
	 	      	   <div class="house_tit01">
	 	      	   	   <h4>${house.name}</h4>
	 	      	   	   <h5>${house.feature}</h5>
	 	      	   </div>
	 	      	    <div class="house_tit02">
	 	      	   	   <h5>近一年房价涨幅<span>8%</span>&nbsp;&nbsp;&nbsp;首付<span>10%</span></h5>
	 	      	   	   <h6>重要商圈，离索卡海滩400米</h6>
	 	      	   	   
	 	      	   	   <a href="#">立即索取资料</a>
	 	      	   </div>
	 	        </div>	
	 	    </c:forEach> 
	 	      
	 	      
	 	      
	 	      
	 	      
	 	      
	 	   </div><!--#house_list-->
	 	  
	 </div>
</div>

<!--
	作者：langyamoren@163.com
	时间：2019-10-25
	描述：优家教育
-->

<div id="youjia_edu">
	<!--<div class="brod_title">
		<h4>优家留学</h4>
		<a href="#">更多>></a>
	</div>-->
	<h4 style="text-align: center; line-height: 46px; font-size: 18px;">优家留学</h4>
	<div style="clear: both;"></div>
	<div class="edu_list">
		  <div class="edu_item">
		  	  <h4>泰国西那瓦本硕连读</h4>
		  	  <img src="img/xuexiao01.jpg" />
		  	  <ul>
		  	  <li>双语教学(英语、汉语)</li>
		  	  <li>15万拿海外硕士学位</li>
		  	  <li>中国教育部认证大学</li>
		  	  </ul>
		  	  <p>
		  	  	相比较欧美留学，入学简单、好进好出，双语教学
		  	  </p>
		  	  <a href="#">了解详情 &gt;&gt;</a>
		  </div>
		  <div class="edu_item">
		  	  <h4>泰国西那瓦本硕连读</h4>
		  	  <img src="img/xuexiao01.jpg" />
		  	  <ul>
		  	  <li>双语教学(英语、汉语)</li>
		  	  <li>15万拿海外硕士学位</li>
		  	  <li>中国教育部认证大学</li>
		  	  </ul>
		  	  <p>
		  	  	相比较欧美留学，入学简单、好进好出，双语教学
		  	  </p>
		  	  <a href="#">了解详情 &gt;&gt;</a>		  	
		  </div>
		  <div class="edu_item">
		  	  <h4>泰国西那瓦本硕连读</h4>
		  	  <img src="img/xuexiao01.jpg" />
		  	  <ul>
		  	  <li>双语教学(英语、汉语)</li>
		  	  <li>15万拿海外硕士学位</li>
		  	  <li>中国教育部认证大学</li>
		  	  </ul>
		  	  <p>
		  	  	相比较欧美留学，入学简单、好进好出，双语教学
		  	  </p>
		  	  <a href="#">了解详情 &gt;&gt;</a>		  	
		  </div>
		   <div class="edu_item" style="margin-right: 0; margin-left: 20px;">
		  	  
		  	  <img src="img/xuexiao01.jpg"  style="position: absolute; left: 20px; top: 20px; width: 140px; height: 100px; border-radius: 5px;"  />
		  	  
		  	  <p style="text-align: center;">
		  	  &nbsp;&nbsp;想了解更多海外留学项目
		  	  </p>
		  	  <a href="#" style=" background: #1683E2; color: #FFF; left: 60px;">了解详情</a>		  	
		  </div>

	</div>
</div>

<!--
	作者：langyamoren@163.com
	时间：2019-07-29
	描述：团队
-->
<div id="our_team">
	  <h3>专业团队</h3>
	   <!-- Swiper -->
<div class="dowebok-outer">
	<div id="dowebok" class="owl-carousel">
		<div class="item">
			<img src="img/1.jpg" alt="">
			<div class="shd"><a href="###"></a></div>
			<div class="txt">
				<h3><a href="###">张三</a></h3>
				<p>苹果在2014年9月推出的新产品</p>
				<div align="center"><a href="#" class="btn  btn-xs btn-success ">在线咨询</a></div>
				
			</div>
		</div>
		<div class="item">
			<img src="img/2.jpg" alt="">
			<div class="shd"><a href="###"></a></div>
			<div class="txt">
				<h3><a href="###">张三</a></h3>
				<p>苹果在2014年9月推出的新产品</p>
				<div align="center"><a href="#" class="btn  btn-xs btn-success ">在线咨询</a></div>
				
			</div>
		</div>
		<div class="item">
			<img src="img/3.jpg" alt="">
			<div class="shd"><a href="###"></a></div>
			<div class="txt">
				<h3><a href="###">张三</a></h3>
				<p>苹果在2014年9月推出的新产品</p>
				<div align="center"><a href="#" class="btn  btn-xs btn-success ">在线咨询</a></div>
				
			</div>
		</div>
		<div class="item">
			<img src="img/4.jpg" alt="">
			<div class="shd"><a href="###"></a></div>
			<div class="txt">
				<h3><a href="###">张三</a></h3>
				<p>苹果在2014年9月推出的新产品</p>
				<div align="center"><a href="#" class="btn  btn-xs btn-success ">在线咨询</a></div>
				
			</div>
		</div>
		<div class="item">
			<img src="img/5.jpg" alt="">
			<div class="shd"><a href="###"></a></div>
			<div class="txt">
				<h3><a href="###">张三</a></h3>
				<p>苹果在2014年9月推出的新产品</p>
				<div align="center"><a href="#" class="btn  btn-xs btn-success ">在线咨询</a></div>
				
			</div>
		</div>
		<div class="item">
			<img src="img/6.jpg" alt="">
			<div class="shd"><a href="###"></a></div>
			<div class="txt">
				<h3><a href="###">张三</a></h3>
				<p>苹果在2014年9月推出的新产品</p>
				<div align="center"><a href="#" class="btn  btn-xs btn-success ">在线咨询</a></div>
				
			</div>
		</div>
		<div class="item">
			<img src="img/7.jpg" alt="">
			<div class="shd"><a href="###"></a></div>
			<div class="txt">
				<h3><a href="###">张三</a></h3>
				<p>苹果在2014年9月推出的新产品</p>
				<div align="center"><a href="#" class="btn  btn-xs btn-success ">在线咨询</a></div>
				
			</div>
		</div>
		<div class="item">
			<img src="img/8.jpg" alt="">
			<div class="shd"><a href="###"></a></div>
			<div class="txt">
				<h3><a href="###">张三</a></h3>
				<p>苹果在2014年9月推出的新产品</p>
				<div align="center"><a href="#" class="btn  btn-xs btn-success ">在线咨询</a></div>
				
			</div>
		</div>
		<div class="item">
			<img src="img/9.jpg" alt="">
			<div class="shd"><a href="###"></a></div>
			<div class="txt">
				<h3><a href="###">张三</a></h3>
				<p>苹果在2014年9月推出的新产品</p>
				<div align="center"><a href="#" class="btn  btn-xs btn-success ">在线咨询</a></div>
				
			</div>
		</div>
		<div class="item">
			<img src="img/1.jpg" alt="">
			<div class="shd"><a href="###"></a></div>
			<div class="txt">
				<h3><a href="###">张三</a></h3>
				<p>苹果在2014年9月推出的新产品</p>
				<div align="center"><a href="#" class="btn  btn-xs btn-success ">在线咨询</a></div>
				
			</div>
		</div>
		<div class="item">
			<img src="img/2.jpg" alt="">
			<div class="shd"><a href="###"></a></div>
			<div class="txt">
				<h3><a href="###">张三</a></h3>
				<p>苹果在2014年9月推出的新产品</p>
				<div align="center"><a href="#" class="btn  btn-xs btn-success ">在线咨询</a></div>
				
			</div>
		</div>
		<div class="item">
			<img src="img/3.jpg" alt="">
			<div class="shd"><a href="###"></a></div>
			<div class="txt">
				<h3><a href="###">张三</a></h3>
				<p>苹果在2014年9月推出的新产品</p>
				<div align="center"><a href="#" class="btn  btn-xs btn-success ">在线咨询</a></div>
				
			</div>
		</div>
		<div style="clear: both;"></div>
	</div>
</div>
</div>
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
<script src="js/swiper.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
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
  
  		$('#dowebok').owlCarousel({
		items: 4,
		navigation: true,
		navigationText: ["",""],
		scrollPerPage: true
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
