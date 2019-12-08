<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.hq.bean.*,java.util.*" %>
<!DOCTYPE html>
<head>
<%@include file="header.jsp" %>
<title>资讯栏目管理</title>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
               
                    <div class="ibox-title">
                        <h5>资讯栏目管理</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content" style="font-size:12px;">
                       <!-- 内容开始 -->
                   
<form class="form-inline" method="post" action="admin/artchannel">
 <input type="hidden" name="action" value="saveAdd"/>
  <div class="form-group">
    <input type="text" name="name" class="form-control"  placeholder="栏目名称">
  </div>
   <div class="form-group">
    <input type="text" name="path" class="form-control"  placeholder="栏目路径">
  </div>
  <div class="form-group">
   <select name="level"  class="form-control" >
       <%for(int i=9;i>0;i--) {%>
    	<option value="<%=i%>"><%=i%></option>
    	<%
    	}
    	%>
    </select>
  </div>
  <button type="submit" class="btn btn-info">增加</button>
</form>
                    
<table class="table table-striped">
  <tr><th>#</th><th>用户名</th><th>密码</th><th>级别</th><th>管理</th></tr>
  <%
  int index=1;
   List<Channel> list=(List<Channel>)request.getAttribute("allc");
    		for(Channel c:list)
    		{
  %>
 <form  method="post" action="admin/artchannel">
 <input type="hidden" name="action" value="update"/>
  <tr>
  <td>
     <%=index++ %>
  </td>
    <td>
       <input type="hidden" name="id" value="<%=c.getId()%>"/>
      <input type="text" name="name"  value="<%=c.getName()%>"/>
     
    </td>
     <td>
     <input type="text" name="path"  value="<%=c.getPath()%>"/>
    
     </td>
      <td>
      <select name="level" class="form-control">
    	<%
    	  for(int i=9;i>0;i--)
    	  {
    		 
    	%>
    		<option value="<%=i%>"   <%=i==c.getLevel()?"selected='selected'":"" %>><%=i%></option>
    		<%
    	  }
    		%>
    	</select>
      </td>
      <td>
         <button type="submit"  class="btn btn-info" >修改</button>
         <a  class="btn btn-danger" href="admin/artchannel?action=del&id=<%=c.getId()%>">删除</a>
      </td>
     
  </tr>
  </form>
  <%
    		}
  %>
  
</table>
                       <!-- 内容结束 -->
                    </div>
             
                </div><!-- ibox float-e.. -->
            </div>
       </div>
   </div>
</body>
</html>
<%@include file="booter.jsp" %>