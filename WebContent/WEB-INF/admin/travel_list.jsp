<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>旅行管理列表</title>
		<%@include file="header.jsp" %>
    <style type="text/css">
    	#treemenu ul{ list-style:none; padding: 0;}
    	#treemenu .parent_menu>a{ font-family: "微软雅黑"; color: #333; font-weight: bold; line-height: 35px;}
    	#treemenu .parent_menu>span{cursor: pointer;}
    	#treemenu .sub_menu { color: #333; line-height: 32px; padding-left: 22px;}
    	#treemenu .sub_menu a{ color: #333;}
    </style>


	</head>
	<body>
		<div style="height: 40px;"></div>
		<div class="container-fluid" >
			<div class="row">
			
				 <div class="col-sm-12"  style="border-left:1px #ccc solid;">
				    <!--right start-->
				    
				    <div class="row">
				    	<span style="font-size:20px; font-weight: bold; ">&nbsp;&nbsp</span>
				    	<a href="admin/travel?action=toadd" class="btn btn-info" style="margin: 10px 20px;">＋添加旅行</a>
				    </div>
				  
				    <table class="table table-hover table-striped table-condensed table-responsive">
				    	<tr><th>ID</th><th>标题</th><!-- <th>栏目</th> --><th>出发时间</th><th>管理</th></tr>
				    	
				    	<c:forEach items="${list}" var="art" varStatus="vs">
					    	<tr><td>${vs.count}</td><td><a href="admin/travel?action=show&id=${art.id}">${art.title}</a></td><!-- <td>新闻国内</td> -->
					    		<td>${art.depart}</td>
					    		<td>
					    			<a href="admin/travel?action=edit&id=${art.id}" class="btn btn-info btn-sm">
					    				<i class="fa fa-edit">修改</i>
					    			</a>
					    			<a href="admin/travel?action=del&id=${art.id}" class="btn btn-danger btn-sm">
					    				<i class="fa fa-close">删除</i>
					    			</a>
					    			<c:choose>
					    			  <c:when test="${art.issue==0}">
					    			     <a href="admin/travel?action=display&id=${art.id}&display=1" class="btn btn-primary btn-sm">
					    				  <i class="fa fa-lock">禁用</i>
					    			     </a>
					    			  </c:when>
					    			   <c:when test="${art.issue==1}">
					    			    <a href="admin/travel?action=display&id=${art.id}&display=0" class="btn btn-success btn-sm">
					    				<i class="fa fa-unlock">启用</i>
					    			    </a>
					    			  </c:when>
					    			</c:choose>
					    			<a href="admin/travel?action=pub&id=${art.id}" class="btn btn-success btn-sm">
					    				发布
					    			</a>
					    			
					    		</td>
					    	</tr>
				    	</c:forEach> 
				    	
				    </table>
				    <div class="row">
				<%--       <div class="col-sm-8">
				       <div class="text-center">
                            <div class="btn-group">
                            <%  com.hq.db.PageDiv<Article> pd=(com.hq.db.PageDiv<Article>)request.getAttribute("pd"); %>
                            
                                <a href="admin/article/index?cid=${cid}&pageNo=<%=((pd.getPageNo()-1)>1?(pd.getPageNo()-1):1)%>" class="btn btn-white" ><i class="fa fa-chevron-left"></i>
                                </a>
                                <%
                                
                                  for(int i=pd.getStart();i<=pd.getEnd();i++)
                                  {
                                %>
                                <a class="btn btn-white" href="admin/article/index?cid=${cid}&pageNo=<%=i%>"><%=i%></a>
                                <%
                                  }
                                %>
                            
                                <a class="btn btn-white" href="admin/article/index?cid=${cid}&pageNo=<%=((pd.getPageNo()+1)<pd.getTotalPage()?(pd.getPageNo()+1):pd.getTotalPage())%>"><i class="fa fa-chevron-right"></i>
                                </a>
                            </div>
                     </div>
				      </div>
				      <div class="col-sm-4">
				         <h4>当前${pd.pageNo}/${pd.totalPage}页&nbsp;&nbsp;总共${pd.totalCount}条</h4>
				      </div> --%>
				    </div>
				     
				    <!--right end-->
				 </div>
			</div>
		</div>
		 <!-- 全局js -->
<%@include file="booter.jsp" %>

	</body>
</html>
