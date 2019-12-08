<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    
    <title>环球优家- 主页</title>
    <base href="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"%>"/> 
    <meta name="keywords" content="">
    <meta name="description" content="">

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
           <!--         <li class="nav-header">
                        <div class="dropdown profile-element">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                                   <span class="block m-t-xs" style="font-size:20px;">
                                        <i class="fa fa-area-chart"></i>
                                      
                                        <strong class="font-bold">hAdmin</strong>
                                    </span>
                                      <a class="navbar-minimalize J_menuItem">
                            <i class="glyphicon glyphicon-home" style="font-size:24px;color:#FFF;"></i>
                            <span class="nav-label" style="font-size:24px;color:#FFF;">RedCMS</span>
                        </a>
                                </span>
                            </a>
                        </div>
                       <div class="logo-element">hAdmin
                        </div>
                    </li>-->
                    <li >
                        <a class="navbar-minimalize J_menuItem">
                            <i class="fa fa-bars" style="font-size:20px;color:#FFF;"></i>
                            <span class="nav-label" style="font-size:20px;color:#FFF;">环球优家</span>
                        </a>
                    </li>
                   <%--  <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">你好，${loged.uname}</span>
                    </li> --%>
                    <li>
                        <a class="J_menuItem top_menu" href="admin/forward?page=admin/welcome.jsp">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">主页</span>
                        </a>
                    </li>
                      <li>
                        <a class="J_menuItem top_menu" href="admin/createindex">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">生成首页</span>
                        </a>
                    </li>
                    <li>
                        <a class="J_menuItem top_menu" href="admin/article?action=toadd">
                            <i class="fa fa-image"></i>
                            <span class="nav-label">发布资讯</span>
                        </a>
                    </li>
                    <li>
                        <a class="J_menuItem top_menu" href="admin/article">
                            <i class="fa fa-object-group"></i>
                            <span class="nav-label">资讯管理</span>
                        </a>
                    </li>
                    <li>
                        <a class="J_menuItem top_menu" href="admin/travel">
                            <i class="fa fa-bus"></i>
                            <span class="nav-label">旅游考察</span>
                        </a>
                    </li>
                    <li>
                        <a class="J_menuItem top_menu" href="admin/successfull">
                            <i class="fa fa-bullhorn"></i>
                            <span class="nav-label">成功案例</span>
                        </a>
                    </li>
                    
               <!--       <li>
                        <a class="J_menuItem top_menu" href="admin/train">
                            <i class="fa fa-user-secret"></i>
                            <span class="nav-label">培训管理</span>
                        </a>
                    </li> -->
                <li>
                        <a class="J_menuItem top_menu" href="admin/house?cid=0&pageNo=1">
                            <i class="fa fa-building-o"></i>
                            <span class="nav-label">楼盘管理</span>
                        </a>
                    </li>
                 
                    <!--  <li>
                        <a href="#" class="hassubs_menu">
                            <i class="fa fa fa-bar-chart-o"></i>
                            <span class="nav-label">经纪人管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="admin/seller?action=regist">注册经纪人</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="admin/company?action=add">注册经纪公司</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="admin/company">经纪公司管理</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="admin/seller">经纪人管理</a>
                            </li>
                           <li>
                                <a class="J_menuItem" href="admin/custom?action=add">新客户报备</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="admin/custom">客户管理</a>
                            </li>
                        </ul>
                    </li> -->
                    
                     <li>
                        <a href="#" class="hassubs_menu">
                            <i class="fa fa-wrench"></i>
                            <span class="nav-label">系统管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                             <li>
                                <a class="J_menuItem" href="admin/city">国家</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="admin/focuspic">焦点图</a>
                            </li>
                         
                            <li>
                                <a class="J_menuItem" href="admin/artchannel">资讯栏目</a>
                            </li>
                             <li>
                                <a class="J_menuItem" href="admin/attach">附件管理</a>
                            </li>
                          <li>
                                <a class="J_menuItem" href="admin/druid">数据库监控</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="admin/admin">管理员管理</a>
                            </li>
                           
                        </ul>
                    </li>
                     <li>
                        <a class="J_menuItem top_menu" href="admin/login?action=logout">
                            <i class="glyphicon glyphicon-off"></i>
                            <span class="nav-label">注销退出</span>
                        </a>
                    </li>
                    
             <!--        
                    <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">分类</span>
                    </li>
                    <li>
                        <a href="mailbox.html" class="hassubs_menu"><i class="fa fa-envelope"></i> <span class="nav-label">信箱 </span><span class="label label-warning pull-right">16</span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="mailbox.html">收件箱</a>
                            </li>
                            <li><a class="J_menuItem" href="mail_detail.html">查看邮件</a>
                            </li>
                            <li><a class="J_menuItem" href="mail_compose.html">写信</a>
                            </li>
                        </ul>
                    </li>
           
                   
                    <li class="line dk"></li> -->

<!---------------------------------end menu------------------------------->
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
        	<!--右则顶部-->
	   <!--      <div class="row border-bottom">
	                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
	                
	
	                </nav>
	            </div>-->
	            
            <div class="row" style="height: 20px; line-height: 36px;">
                <nav class="navbar navbar-static-top" style="margin-bottom: 0; min-height:35px;">
                    <div class="pull-left"  style=" margin-left: 20px;"><!--<a class="navbar-minimalize minimalize-styl-2 btn btn-info " href="#"><i class="fa fa-bars"></i> </a>-->
                         <span class="fa fa-home"></span>&nbsp; 
                         <a href="" style="color: #333; font-weight: bold;">首页</a>
                         <span id="one_show"></span> 
                         <span id="jm_show"></span>
                    </div>
                    <div class="pull-right " style="margin-right: 20px;"  >
                      Welcome,${loged.email}! <a href="admin/login?action=logout">退出</a>
                       
                    </div>
                </nav>
            </div>
         <div style="clear: both;"></div>
            <!--
            	作者：langyamoren@163.com
            	时间：2018-07-09
            	描述：选项卡结束
            -->
            
           <!--  <div class="row J_mainContent" id="content-main" > -->
          <div class="row J_mainContent" id="content-main">
                <iframe id="J_iframe" name="iframe0" data-index="0"  width="100%" height="100%" src="admin/forward?page=admin/welcome.jsp" frameborder="0" data-id="admin/forward?page=admin/welcome.jsp" seamless></iframe>
              
               <!--  <iframe class="J_iframe" id="J_iframe" name="iframe0" width="100%" height="100%" src="admin/admin/welcome" frameborder="0" data-id="admin/admin/welcome" seamless></iframe> -->
          </div>
        </div>
        <!--右侧部分结束-->
    </div>

    <!-- 全局js -->
     <script src="js/jquery.min.js?v=2.1.4"></script>
   
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="js/plugins/layer/layer.min.js"></script>

    <!-- 自定义js -->
    <script src="js/hAdmin.js?v=4.1.0"></script>
    <script type="text/javascript" src="js/index.js"></script>

    <!-- 第三方插件 -->
    <script src="js/plugins/pace/pace.min.js"></script>
     <!--选项卡相关-->


</body>

</html>
