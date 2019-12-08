<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>修改资讯：${art.title}</title>
		 <link rel="shortcut icon" href="favicon.ico"> 
<%@include file="header.jsp" %>
	</head>
	<body>
		  <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>修改资讯 <small class="m-l-sm"></small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="tabs_panels.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                 
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div><!--ibox-title-->
                    <div class="ibox-content">
                      
<form class="form-horizontal" method="post" action="admin/article">
   <input type="hidden" name="action" value="saveupdate"/>
   <input type="hidden" name="id" value="${art.id}"/>
  <div class="form-group">
    <div class="col-sm-8">
      <input class="form-control" type="text" name="title"  placeholder="请输入标题" value="${art.title}">
    </div>
    <div class="col-sm-3">
    	<select name="channel_id" class="form-control">	
    	
    	  <c:forEach items="${channels}" var="channel">
    	    
    	     <option value="${channel.id}"  <c:if test="${channel.id==art.channel_id}">selected="selected"</c:if>>${channel.name}</option>
    	  </c:forEach>
    	</select>
    </div>
  </div>
  <div class="form-group ">
    
	     <div class=col-sm-5>
	       <input class="form-control" type="text" value="${art.keywords}" name="keywords"  placeholder="请输入标签，多个用逗号隔开">
	     </div>
	     
	    <div class="col-sm-3">
    	<select name="city_id" class="form-control">
    	   <c:forEach items="${countrys}"  var="country">
    	   <option value="${country.id}"  <c:if test="${country.id==art.city_id}">selected="selected"</c:if>>${country.name}</option>
    	   </c:forEach>
    	</select>
    </div>
	     
       <div class="col-sm-3">
    	<select name="level" class="form-control">
    	<%
    	  for(int i=9;i>0;i--)
    	  {
    		  request.setAttribute("levtem", i);
    	%>
    		<option value="<%=i%>"  <c:if test="${levtem==art.level}">selected="selected"</c:if>><%=i%></option>
    		<%
    	  }
    		%>
    	</select>
    </div>
    
  </div>
  <div class="form-group ">
   
    <div class="col-sm-12">
    
    	<textarea name="content" class="form-control" id="txt1" style="height:300px">${art.content}</textarea>
     
    </div>
  </div>
  
  <div class="form-group ">
   
        <label  class="col-sm-2 control-label">主图1:</label>
	    <div class="col-sm-3">
	          <input type="hidden" id="pic1" name="pic" value="${art.pic}"/> 
	          
	          <c:choose>
		           <c:when test="${empty art.pic}">
		             <img id="uppic01" src="img/upload.jpg" style="width:68px; height:57px" />
		           </c:when>
		           <c:when test="${not empty art.pic}">
		             <img id="uppic01" src="${art.pic}" style="width:68px; height:57px" />
		           </c:when>
	          </c:choose>

	    </div>
	
<!-- 	 <label  class="col-sm-1 control-label">主图2:</label>
	    <div class="col-sm-1">
	          <input type="hidden" id="pic2" name="pic2"/>
	          <img id="uppic02" src="img/upload.jpg" style="width:68px; height:57px" />
	    </div>
	
	
	 <label  class="col-sm-1 control-label">主图3:</label>
	    <div class="col-sm-1">
	          <input type="hidden" id="pic3" name="pic3"/>
	          <img id="uppic03" src="img/upload.jpg" style="width:68px; height:57px" />
	    </div> -->
	
	    <div class="col-sm-5">
	          <button type="submit" class="btn btn-info btn-lg">修改文章 </button>
	    </div>
      </div>
</div>	    
	    
<!-- <div class="form-group ">
   
    <div class="col-sm-2 col-sm-offset-5">
    	 <button type="submit" class="btn btn-info btn-lg">增加文章 </button>
    </div>
</div> -->
	    
	    
	 
  <div style="clear: both;"></div>
  

</form>

	
                    </div><!--ibox-content-->
                </div>
        
	</body>
</html>
<%@include file="booter.jsp" %>

<script charset="utf-8" src="kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="kindeditor/lang/zh-CN.js"></script>
<script>
        KindEditor.ready(function(K) {
                window.editor = K.create('#txt1',{
                	uploadJson : 'admin/fileupload'
                });
                
               
                
              
                K('#uppic01').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							
						    uploadJson:'admin/fileupload',
							imageUrl : K('#pic1').val(),
							clickFn : function(url, title, width, height, border, align) {
								K('#pic1').val(url);
								document.getElementById("uppic01").src=url;
								editor.hideDialog();
							}
						});
					});
				});
                
    /*             K('#uppic02').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							
						    uploadJson:'admin/fileupload/index',
							imageUrl : K('#pic2').val(),
							clickFn : function(url, title, width, height, border, align) {
								K('#pic2').val(url);
								document.getElementById("uppic02").src=url;
								editor.hideDialog();
							}
						});
					});
				});
                
                
                K('#uppic03').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							
						    uploadJson:'admin/fileupload/index',
							imageUrl : K('#pic3').val(),
							clickFn : function(url, title, width, height, border, align) {
								K('#pic3').val(url);
								document.getElementById("uppic03").src=url;
								editor.hideDialog();
							}
						});
					});
				}); */
 
        });
        
</script>