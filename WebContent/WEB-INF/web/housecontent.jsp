<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>环球第二家园</title>
      
     <link rel="stylesheet" href="css/bootstrap.min.css" />
	    <link rel="stylesheet" href="css/huanqiu.css" />
	    <style type="text/css">
	    	
	    	#inner_mianbao{ width: 1200px; margin: 0 auto;}
	    	#inner_mianbao .pathnav li a{ color: #FFF; }
	    	#inner_mianbao .pathnav li a:hover{ text-decoration: underline; }
	    	#house_focus_img{width: 1200px; margin: 0 auto; position: relative;}
	    	
#house_focus_img .left{ width:670px; height: 540px; float: left; }
#house_focus_img .right{ width:480px; height: 540px; background: #FFF; border-top: 6px  #F75053 solid; float: left; margin-left: 15px; position: relative;}
#house_focus_img .right h1{ position: absolute; left: 10px; top: 10px; line-height: 40px; font-size: 24px;}
#house_focus_img .right p.price{ position: absolute; left: 30px; top: 60px; font-size: 12px; color: #666;}
#house_focus_img .right p.price span{ color: red; font-size: 24px; font-weight: bold;}
#house_focus_img .right p.location{ position: absolute; left: 30px; top: 120px; font-size: 12px; letter-spacing: 3px; color: #666;}
#house_focus_img .right p.focus_list{ text-align:center;position: absolute; left: 0px; top: 160px; width: 480px; line-height: 40px; font-size: 12px; border-bottom: 1px #ccc dashed;}
#house_focus_img .right p.focus_list span{ border: 1px #CCC solid; margin:0 10px; border-radius: 12px; padding: 3px 10px; background: #F8F8F8;}
#house_focus_img .right  ul{position: absolute; left: 0px; top: 210px; width: 480px; height: 130px;  border-bottom: 1px #ccc dashed;}
#house_focus_img .right  ul li{ width: 190px;  line-height: 40px;  float: left;  margin-left: 40px; color: #333; font-size: 12px;}
#house_focus_img .right  ul li span{ margin-right: 10px;}
#house_focus_img .right  p.address{ position: absolute; left: 20px; top: 355px; font-size: 12px; width: 420px; }
#house_focus_img .right  p.huxing{ position: absolute; left: 20px; top: 410px; font-size: 12px;width: 420px;}
#house_focus_img .right  a.zixun{position: absolute; left: 300px; top: 460px;  display: block; padding: 10px 25px; border-radius: 6px; background: orangered; color: #FFF; text-decoration: none; letter-spacing: 5px;}
#house_focus_img .right  a.zixun:hover{ background: #FF724F;}
#house_focus_img .right  p.telphone{position: absolute; left: 30px; top: 470px; font-size: 24px; font-weight: bold; color: #FF0000;;}

/*房子详情*/

#desc_menu{}
#desc_menu ul li{ float: left;}
#desc_menu ul li a{ display: block; padding: 10px 20px; text-decoration: none; color: #333; background: #eee;}
#desc_menu ul li a:hover,#desc_menu ul li a.act{ background: orangered; color: #FFF;}

/*
图片轮播的样式
*/
#house_imgs{position: relative; z-index: 8; padding-bottom: 25px; width: 100%; overflow: hidden;}
#house_imgs #house_bigImg{margin-bottom: 10px; width: 670px; height: 445px; overflow: hidden;}
#house_imgs #house_bigImg ul li{position: relative; z-index: 9;}
#house_imgs .project_img{width: 670px; height: 445px; overflow: hidden;}
#house_imgs .project_img dl{width:auto; height:445px; overflow: hidden;}
#house_imgs .project_img dl dd{float: left; width: 670px; height: 445px;}
#house_imgs #house_smallImg{position: relative; z-index: 10; margin-top: 0px; width: 100%; height: 82px; overflow: hidden;}
#house_imgs span.house_imgs_lf2{display: block; position: absolute; left:20px; top: 190px; z-index: 9; width: 44px; height: 44px; border-radius: 22px; overflow: hidden; background:url(img/arrow_lf2.png) no-repeat center center; cursor:pointer;}
#house_imgs span.house_imgs_rt2{display: block; position: absolute; right:20px; top: 190px; z-index: 9; width: 44px; height: 44px; border-radius: 22px; overflow: hidden; background:url(img/arrow_rt2.png) no-repeat center center; cursor:pointer;}

/*和bootstrap冲突解决方法*/
#house_smallImg *{box-sizing:content-box}
#house_smallImg ul{width: 100%;}
#house_smallImg ul li{position:relative; float: left;   width:126px;  padding-right: 10px;}
#house_smallImg ul li img{display: block; width: 126px; height: 82px; cursor: pointer; }
#house_smallImg ul li.on img{width: 122px; height: 78px; border: 2px #f23742 solid;}
#house_smallImg ul li .bun_bg{display: block; position: absolute; bottom: 0; left: 0; z-index: 9; width: 126px; height: 27px; line-height: 26px; text-align: center; font-size: 14px; color: #FFF; background: rgba(0,0,0,0.5); }
#house_smallImg ul li.on .bun_bg{width: 122px; bottom: 2px; left: 2px;}
/*
图片轮播结束
*/

/**
 * 详情页面内容
 */
.house_detil_list{  padding: 30px; font-size: 14px; line-height: 30px;  color: #333; margin-bottom: 20px;}
.house_detil_list h3{ line-height: 50px; border-bottom: 1px #ccc solid; font-weight: bold; font-size: 24px;}
/*户型列表*/
.house_detil_list .huxing_show{ position: relative; width: 100%; height: 190px; margin-bottom: 10px;}
.house_detil_list .huxing_show img{ position: absolute; left: 0px; top: 5px; width: 250px; height: 175px;}
.house_detil_list .huxing_show p.hx_title{ position: absolute; left:280px ; top: 30px; font-size: 22px; font-weight: bold; }
.house_detil_list .huxing_show p.hx_price{position: absolute; left:360px ; top: 100px;  color: #666; font-size: 16px;}
.house_detil_list .huxing_show p.hx_price span{ color: #FF0000; font-size: 22px;}
.house_detil_list .huxing_show a.hx_detil{ position: absolute; left:930px ; top: 80px; border-radius: 6px; letter-spacing: 5px; font-size: 14px;  color: #666;  display: block; padding: 6px 25px;  text-decoration: none; border: 1px #888 solid;}
.house_detil_list .huxing_show a.hx_detil:hover{ background: orangered; color: #FFF; }
/*物业配套*/

.house_detil_list div.cf_list{ line-height: 60px; font-size: 14px; color: #999;}

.house_detil_list div.cf_list p{ float: left;}
.house_detil_list div.cf_list p.cf_title{ margin-right: 25px;}
.house_detil_list div.cf_list p.cf_item{ margin: 0 15px;}
.house_detil_list div.cf_list p.cf_item span{ color: red; margin-right: 10px;}
	    </style>
	    
	</head>
	<body>
		<div style="border-bottom: 1px #ccc solid; background: #FFF; width: 100%; z-index: 900;" id="outnav">
	    <%@include file="topnav.jsp" %>
	   </div>
	
	<!--面包导航-->
	<div style="height: 50px; background: #333; line-height: 50px;">
		<div id="inner_mianbao">
			 <ol class="pathnav" style="line-height: 50px; color: #FFF;">
			  <li><a href="#">首页</a></li>
			  <li><a href="#">海外购房</a></li>
			  
			  <li>&nbsp;${house.name}</li>
			</ol>
		</div>
	</div>
	<!--
    	作者：langyamoren@163.com
    	时间：2018-08-15
    	描述：以下是图片
    -->
    <div style="background: #333; width: 100%;">
    	<div  id="house_focus_img">
    	    <!--轮播图上-->
<div class="left">
            	
	<div id="house_imgs">
		<div id="house_bigImg">
			<ul>
					<li>
						<div class="project_img">
								<dl>
								   <c:forEach items="${pic01}" var="pic">
								   	<dd><img src="${pic.path }" class="img-responsive" alt="${pic.dis}"/></dd>
								   </c:forEach>
									
								</dl>
								<span class="house_imgs_lf2"></span><span class="house_imgs_rt2"></span>
						</div>
					</li>
				
				
				<li>
					<div class="project_img">
						<dl>
							 <c:forEach items="${pic02}" var="pic">
								   	<dd><img src="${pic.path }" class="img-responsive" alt="${pic.dis}"/></dd>
								   </c:forEach>
						</dl>
						<span class="house_imgs_lf2"></span><span class="house_imgs_rt2"></span>
					</div>
				</li>
				
				<li>
				    <div class="project_img">
						<dl>
							 <c:forEach items="${pic03}" var="pic">
								   	<dd><img src="${pic.path }" class="img-responsive" alt="${pic.dis}"/></dd>
								   </c:forEach>
						</dl>
						<span class="house_imgs_lf2"></span><span class="house_imgs_rt2"></span>
					</div>
				</li>
					
				<li>
					
					<div class="project_img">
						<dl>
						       <c:forEach items="${pic04}" var="pic">
								   	<dd><img src="${pic.path }" class="img-responsive" alt="${pic.dis}"/></dd>
								   </c:forEach>
						</dl>
						<span class="house_imgs_lf2"></span><span class="house_imgs_rt2"></span>
					</div>
				</li>
					
				<li>
					<div class="project_img">
						<dl>
							 <c:forEach items="${pic05}" var="pic">
								   	<dd><img src="${pic.path }" class="img-responsive" alt="${pic.dis}"/></dd>
								   </c:forEach>
						</dl>
					    <span class="house_imgs_lf2"></span><span class="house_imgs_rt2"></span>
					</div>
				</li>
			</ul>
				
		</div><!--house_bigImg-->
				
		<div id="house_smallImg">
			<ul>
				<li>
				   <img src="${title1.path}" alt="外景图"/>
				   <div class="bun_bg">外景图(${pic01.size()})</div>
				</li>
			
				<li>
					<img src="${title2.path}" alt="样板间"/>
					<div class="bun_bg">样板间(${pic02.size()})</div>
				</li>
			
				<li>
					<img src="${title3.path}" alt="户型图"/>
					<div class="bun_bg">户型图(${pic03.size()})</div>
				</li>
			
				<li>
					<img src="${title4.path}" alt="周边配套"/>
					<div class="bun_bg">周边配套(${pic04.size()})</div>
				</li>
			
				<li>
					<img src="${title5.path}" alt="区位图"/>
					<div class="bun_bg">区位图(${pic05.size()})</div>
				</li>
			</ul>
		</div><!--house_smallImg-->
		<span class="house_imgs_lf"></span><span class="house_imgs_rt"></span>
		<div style="clear: both;"></div>
	</div><!--house_imgs-->
		
</div><!--end left-->
 
 <div class="right">
            	<h1>${house.name}</h1>
            	<p class="price">总价： <span>${house.price_rmb}</span>（人民币）${house.price_other}</p>
            	<p class="location"><span class="glyphicon glyphicon-map-marker"></span>${house.area}</p>
            	<p class="focus_list">
            	<c:set var="string2" value="${fn:split(house.types, ',')}" />
	        			<c:forEach items="${string2}" var="tt">
	        				<span>${tt}</span>
                        </c:forEach>
	        				
	        	</p>
	        	<ul>
	        
	        		<li><span class="glyphicon glyphicon-credit-card"></span>套内${house.sizes}M²</li>
	        		<li><span class="glyphicon glyphicon-jpy"></span>首付${house.payment}%</li>
	        		<li><span class="glyphicon glyphicon-king"></span>${house.propertys}</li>
	        		<li><span class="glyphicon glyphicon-queen"></span>${house.types}</li>
	        		<li><span class="glyphicon glyphicon-knight"></span>${house.fitment}交付</li>
	        		<li><span class="glyphicon glyphicon-equalizer"></span>可贷款</li>
	        	</ul>
	        	<p class="address"><b>项目地址：</b>${house.addr } </p>
	        	<p class="huxing"><b>主力户型：</b>${house.huxing}</p>
                <a href="#" class="zixun">预约咨询</a>
                <p class="telphone">
                	<span class="glyphicon glyphicon-phone-alt"></span>  :
		 		400-123-456
                </p>
 </div><!--end right-->
            <div style="clear: both; height: 30px;"></div>
            <!--轮播图上 end-->
    	</div>
    </div>
	<!--
    	作者：langyamoren@163.com
    	时间：2018-08-16
    	描述：上部，图片轮播和右则完成
    -->
 
<div style="width: 100%; background: #F2F2F2; height: 40px; z-index: 910;" id="out_house_desc">
    <div  style="width: 1200px; margin: 0 auto;" id="desc_menu">
    	
					<ul>
						<li><a data-ids="#menu-01" href="#">项目简介</a></li>
						<li><a data-ids="#menu-02"  href="#">周边设施</a></li>
						<li><a data-ids="#menu-03"  href="#">特业配套</a></li>
						<li><a data-ids="#menu-04"  href="#">户型展示</a></li>
					</ul>
    </div>
</div>	
<!--详情开始-->

<div  style="width: 1200px; margin: 0 auto;">
	<div class="house_detil_list">
		 <h3 id="menu-01">项目简介</h3>
		 <p>
			${house.txt1}
		 </p>
	</div>
    
    <div class="house_detil_list">
    	<h3 id="menu-02">周边设施</h3>
        <p>${house.txt2}</p>
    
    </div>
	  
 <div class="house_detil_list">
	  <h3 id="menu-03">特业配套</h3>
	   ${house.txt3}
	  	  <div style="clear: both;"></div>

	  
</div>

<div class="house_detil_list">
	  <h3 id="menu-04">户型展示</h3>
	  
	  <c:forEach items="${housetypes}" var="type">
			  <div class="huxing_show">
			  	   <img src="${type.path}"  width="250" height="175"/>
			  	   <p class="hx_title">${type.dis }</p>
			  	   <p class="hx_price">总价：<span>¥${type.price}万</span>起</p>
			  	   <a href="#" class="hx_detil">查看详情</a>
			  </div>
	  </c:forEach>
	  
</div>
	

     <!--
 	作者：langyamoren@163.com
 	时间：2018-08-14
 	描述：页脚
 -->
<%@include file="foot.jsp" %>
		<script type="text/javascript" src="js/carousel.js" ></script>
		
		<script type="text/javascript">
			$(function(){
			/*$("#house_smallImg ul li").css("padding-right","10px");*/
	
	
	//单击详情切换菜单
	var tls= $('#desc_menu ul li > a');
	
    tls.each(function (i){
    	
      $(this).click(function(){
       
         tls.each(function(){$(this).removeClass("act")});
        $(this).addClass('act');
        
        var temid=$(this).data("ids");
     /*  $(window).scrollTop($(temid).offset().top);*/
      var tohei=$(temid).offset().top;
      // body.animate({scrollTop:tohei }, 2000);
      // $("body").animate({scrollTop:tohei},slow);
        /*$(window).scrollTop(1200);*/
       $('body, html').animate({scrollTop:tohei-200},500);

      });
    });
   // tls.eq(0).click();
				
	//滚动条tab联动
    $(window).scroll(function(){
        //为页面添加页面滚动监听事件
        var wst =$(window).scrollTop(); //滚动条距离顶端值
        for (i=1; i<5; i++){
            var h = $("#menu-0"+i).offset().top-200;//加循环
           
            /*if(h<=wst){ //判断滚动条位置
                $("#desc_menu ul li > a").removeClass("on"); //清除c类
                $("#desc_menu ul li > a[href=h]").addClass("on");    //给当前导航加c类
                $(".panel-bg").css("left",  $("#a"+i+i).position().left + "px");
            }*/
          if(h<=wst){
          	   $("#desc_menu ul li > a").removeClass("act"); 
          	   $("#desc_menu ul li > a[data-ids*="+i+"]").addClass("act");
           }
        }
       
    });			
				//详情菜单置顶
			  var elm1 = $('#out_house_desc'); 
			    var startPos1 = $(elm1).offset().top-100; 
			   
			    $.event.add(window, "scroll", function() { 
			        var p1 = $(window).scrollTop(); 
			        $(elm1).css('position',((p1) > startPos1) ? 'fixed' : 'static'); 
			        $(elm1).css('top',((p1) > startPos1) ?'80px' : ''); 
			    }); 
				
				
	  $("#house_smallImg li:eq(0),#house_bigImg li:eq(0) dl dd:eq(0)").addClass("on");
    /* 详情页房产图片展示 */
    $("#house_imgs").thumbnailImg({
        large_elem: "#house_bigImg",
        small_elem: "#house_smallImg",
        left_btn: ".house_imgs_lf",
        right_btn: ".house_imgs_rt",
        vis: 5,
        speed: "500"
    });
    var small_num = $("#house_smallImg ul").find("li").size(); //小图集的个数
    if (small_num <= 10) {
        $(".house_imgs_lf,.house_imgs_rt").hide();
    }else{}
    // 点击小图
    $("#house_smallImg ul li").click(function(){
        $('.project_img dl dd').removeClass("on");
        $('.project_img dl dd:first-child').addClass("on");
        $('.project_img dl').css({marginLeft: '0'});
    });
    // 点击左按钮
    $(".house_imgs_lf2").click(function(){
        var bigImg_region = $(this).closest("li").find('.project_img');//找到大图区域
        var w = bigImg_region.find("dl").find("dd").outerWidth(true); //单个大图片的宽度
        var thisindex = bigImg_region.find("dl").find(".on").index(); //当前选中的
        var li_num = bigImg_region.find("dl").find("dd").length; //图片的个数
        if(thisindex == 0){
            var thisnum = 0;
            // var thisnum = li_num-1; 
            rollFun(bigImg_region,thisnum,w);
            $(".house_imgs_lf").click();
        }
        else{
            var thisnum = thisindex-1; 
            rollFun(bigImg_region,thisnum,w);
        }
    });
    // 点击右按钮
    $(".house_imgs_rt2").click(function(){
        var bigImg_region = $(this).closest("li").find('.project_img');//找到大图区域
        var w = bigImg_region.find("dl").find("dd").outerWidth(true); //单个大图片的宽度
        var thisindex = bigImg_region.find("dl").find(".on").index(); //当前选中的
        var li_num = bigImg_region.find("dl").find("dd").length; //图片的个数
        if(thisindex == li_num-1){
            var thisnum = li_num-1;
            /*var thisnum = 0; */
            rollFun(bigImg_region,thisnum,w);
            $(".house_imgs_rt").click();
        }
        else{
            var thisnum = thisindex+1; 
            rollFun(bigImg_region,thisnum,w);
        }
    });
    //动画效果
    function rollFun(item1,item3,item4){
        //大图向左滑动
        item1.find("dl").stop().animate({
            "marginLeft" : -(item3 * item4) + "px"
        });
        //选中
        item1.find("dl").find("dd").removeClass("on").eq(item3).addClass("on");
    }
    var t1=window.setInterval("$('.house_imgs_rt').click()", 5000);//1秒执行一次
    $(".house_con_lf").hover(function(){
        window.clearTimeout(t1);//去掉定时器 
    },function(){
        t1=window.setInterval("$('.house_imgs_rt').click()", 5000);//1秒执行一次
    });

});

</script>
	</body>
</html>
