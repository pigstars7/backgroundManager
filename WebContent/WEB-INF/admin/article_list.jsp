<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.hq.bean.*"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>资讯管理列表</title>
		<%@include file="header.jsp" %>

	</head>
	<body>

		<div class="container-fluid" >
			<div class="row">
		
				 <div class="col-sm-12"  style="border-left:1px #ccc solid;">
				    <!--right start-->
				   
				    <div class="row">
				        <div class="col-sm-3" style="line-height:50px;">
				        &nbsp;&nbsp;&nbsp;<a href="admin/article">全部</a>
				           <c:forEach items="${channels}" var="channel">
				              &nbsp;&nbsp;&nbsp;<a href="admin/article?channel_id=${channel.id}">${channel.name}</a>
				           </c:forEach>
				        </div>
				        
				         <div class="col-sm-8" style="line-height:50px;">
<form class="form-inline" action="admin/article" method="post">

  <div class="form-group">
 
    <input type="text" name="keyword" class="form-control" placeholder="请输入要搜索的关键词">
  </div>
  <button type="submit" class="btn btn-info">搜索</button>
</form>
				        </div>
				    	
				    </div> 
				  
				    <table class="table table-hover table-striped table-condensed table-responsive">
				    	<tr><th>ID</th><th>主图</th><th>资讯</th><th>栏目</th><th>国家</th><th>时间</th><th>管理</th></tr>
				    	
				    	<c:forEach items="${pd.list}" var="art" varStatus="vs">
					    	<tr>
					    	<td>${vs.count}</td>
					    	<td><img src="${art.pic}" style="max-height:40px"/></td>
					    	<td><a href="admin/article?action=show&id=${art.id}" target="_blank">${art.title}</a></td>	
			    			<td>${art.channelName}</td>
			    			<td>${art.cityName}</td>
					    	<td>${art.ctime}</td>
					    		<td>
					    		<a href="admin/article?action=edit&id=${art.id}" class="btn btn-info btn-sm">
					    				<i class="fa fa-edit">修改</i>
					    		</a>
					    		<a href="admin/article?action=del&id=${art.id}&channel_id=${art.channel_id}" class="btn btn-danger btn-sm">
					    		  <li class="fa fa-close">删除</li>
					    		</a>
					    		<a href="admin/article?action=createhtml&id=${art.id}&channel_id=${art.channel_id}" class="btn btn-success btn-sm">
					    		  <li class="fa fa-close">发布</li>
					    		</a>

					    			
					    		</td>
					    	</tr>
				    	</c:forEach>
				    	
				    </table> 
				    <div class="row">
				      <div class="col-sm-8">
				       <div class="text-center">
                            <div class="btn-group">
                            <%  com.hq.db.PageDiv<Article> pd=(com.hq.db.PageDiv<Article>)request.getAttribute("pd"); 
                                if(null!=pd)
                                {
                            %>
                            
                                <a href="admin/article?keyword=${keyword}&pageNo=<%=((pd.getPageNo()-1)>1?(pd.getPageNo()-1):1)%>&channel_id=${channel_id}" class="btn btn-white" ><i class="fa fa-chevron-left"></i>
                                </a>
                                <%
                                
                                  for(int i=pd.getStart();i<=pd.getEnd();i++)
                                  {
                                %>
                                <a class="btn btn-white" href="admin/article?keyword=${keyword}&pageNo=<%=i%>&channel_id=${channel_id}"><%=i%></a>
                                <%
                                  }
                                %>
                            
                                <a class="btn btn-white" href="admin/article?keyword=${keyword}&pageNo=<%=((pd.getPageNo()+1)<pd.getTotalPage()?(pd.getPageNo()+1):pd.getTotalPage())%>&channel_id=${channel_id}"><i class="fa fa-chevron-right"></i>
                                </a>
                                <%
                                }
                                %>
                            </div>
                     </div>
				      </div>
				      <div class="col-sm-4">
				         <h4>当前${pd.pageNo}/${pd.totalPage}页&nbsp;&nbsp;总共${pd.totalCount}条</h4>
				      </div>
				    </div>
				     
				    <!--right end-->
				 </div>
			</div>
		</div>
		 <!-- 全局js -->
<%@include file="booter.jsp" %>

	</body>
</html>
