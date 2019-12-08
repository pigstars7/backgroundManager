<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.hq.bean.*"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>国家-城市管理列表</title>
		<%@include file="header.jsp" %>
    <style type="text/css">
    	#treemenu ul{ list-style:none; padding: 0;}
    	#treemenu .parent_menu>a{ font-family: "微软雅黑"; color: #333; font-weight: bold; line-height: 35px;}
    	#treemenu .parent_menu>span{cursor: pointer;}
    	#treemenu .sub_menu { color: #333; line-height: 32px; padding-left: 22px;}
    	#treemenu .sub_menu a{ color: #333;}

    	.city_list{ width: 245px; height: 125px; border: 1px #CCC solid; float: left; margin: 5px; position: relative;}
    	.city_list img{position: absolute; left: 2px; top: 2px; width: 238px; height: 121px;}
    	.city_list span{ position: absolute; left: 100px; top: 50px; font-size: 20px; font-weight: bold; color: white;}
    	.city_list:hover{ border: 1px #FF0000 solid;}

    </style>


	</head>
<body>
	<div style="height: 40px;"></div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-1">
		<div id="treemenu">
		<a href="admin/city?action=toadd" class="btn btn-primary btn-info">增加国家/城市</a>
                   <div class="hr-line-dashed"></div>
                   <h5>国家列表</h5>
			<ul>  
				<li class="parent_menu"><span class="fa fa-folder-open"></span><a href="admin/city">所有</a></li>
				<c:forEach items="${countrys}" var="ct">
					<li class="parent_menu">
						<span class="fa fa-folder-close"></span><a href="admin/city?cid=${ct.id }">${ct.name}</a></li>
				</c:forEach>
			</ul>
		</div>
			</div>
			<div class="col-sm-10" style="border-left:1px #ccc solid;">
			<!-- 右边部分 -->
			<div class="clearfix"></div>
			</div>
			<div class="col-sm-9 animated fadeInRight">
			<div>
			<c:if test="${not empty country }">
				<h3>${country.name }&nbsp;&nbsp;<small><a href="admin/city?action=edit&cityid=${country.id}"class="btn brn-xs btn-primary">修改</a></small></h3>
			</c:if>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<c:forEach items="${citys}" var="city">
						<div class="city_list">
							<a href="admin/city?action=edit&cityid=${city.id}">
							<img src="${city.pic }"/>
							<span>${city.name}</span>
							</a>
				</div>
				</c:forEach>
			</div>
			</div>
			</div>
		</div>
		<script src="adminres/js/jquery.min.js?v=2.1.4"></script>
    <script src="adminres/js/bootstrap.min.js?v=3.3.6"></script>



    <!-- 自定义js -->
    <script src="adminres/js/content.js?v=1.0.0"></script>


    <script>
        $(document).ready(function () {
            $('.file-box').each(function () {
                animationHover(this, 'pulse');
            });
        });
    </script>
		
<%@include file="booter.jsp" %>	
</body>
</html>