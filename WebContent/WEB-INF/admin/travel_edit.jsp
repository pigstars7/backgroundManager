<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>修改旅行</title>
		 <link rel="shortcut icon" href="favicon.ico"> 
<%@include file="header.jsp" %>
	</head>
	<body>
		  <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>修改旅行 <small class="m-l-sm"></small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="tabs_panels.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                        <!--   <ul class="dropdown-menu dropdown-user">
                                <li><a href="tabs_panels.html#">选项1</a>
                                </li>
                                <li><a href="tabs_panels.html#">选项2</a>
                                </li>
                            </ul>-->
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div><!--ibox-title-->
                    <div class="ibox-content">
                      
<form class="form-horizontal" method="post" action="admin/travel">
<input type="hidden" name="action" value="saveedit"/>
  <div class="form-group">
    <div class="col-sm-6">
      <input class="form-control" type="text" name="title"  placeholder="请输入标题" value="${travel.title}" >
      <input type="hidden" name="id" value="${travel.id}"/>
    </div>
   <div class="col-sm-3">
       <input class="form-control" type="text" name="depart"   placeholder="格式:年-月-日"  id="start"  value="${travel.depart}" >
    </div>

  </div>
  <div class="form-group ">
    
     <div class=col-sm-3>
       <input class="form-control" type="text" name="city"  placeholder="发出城市" value="${travel.city}">
     </div>
      <div class=col-sm-3>
       <input class="form-control" type="text" name="visitcity"  placeholder="访问城市" value="${travel.visitcity}">
     </div>
      
    
  </div>
  <div class="form-group ">
   
    <div class="col-sm-12">
    
    	<textarea name="content" class="form-control" id="txt1" style="height:300px">${travel.content}</textarea>
     
    </div>
  </div>
  
  <div class="form-group ">
   
        <label  class="col-sm-1 control-label">主图1:</label>
	    <div class="col-sm-1">
	          <input type="hidden" id="pic1" name="pic" value="${travel.pic}"/>
	          <img id="uppic01" src="${travel.pic}" style="width:68px; height:57px" />
	    </div>
<!-- 	
	 <label  class="col-sm-1 control-label">主图2:</label>
	    <div class="col-sm-1">
	          <input type="hidden" id="pic2" name="pic2"/>
	          <img id="uppic02" src="adminres/img/upload.png" style="width:68px; height:57px" />
	    </div>
	
	
	 <label  class="col-sm-1 control-label">主图3:</label>
	    <div class="col-sm-1">
	          <input type="hidden" id="pic3" name="pic3"/>
	          <img id="uppic03" src="adminres/img/upload.png" style="width:68px; height:57px" />
	    </div>
	 -->
	   
      </div>
</div>	    
	    
<div class="form-group ">
   
    <div class="col-sm-2 col-lg-offset-3">
    	 <button type="submit" class="btn btn-info btn-lg">修改旅行</button>
    </div>
  </div>
	    
	    
	 
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
                
           
 
        });
        
</script>


   <%--  <!-- layerDate plugin javascript -->
    <script src="adminres/js/plugins/layer/laydate/laydate.js"></script>
    <script>
        

        //日期范围限制
        var start = {
            elem: '#start',
            format: 'YYYY/MM/DD hh:mm:ss',
            min: laydate.now(), //设定最小日期为当前日期
            max: '2099-06-16 23:59:59', //最大日期
            istime: true,
            istoday: false,
            choose: function (datas) {
                end.min = datas; //开始日选好后，重置结束日的最小日期
                end.start = datas //将结束日的初始值设定为开始日
            }
        };
      
        laydate(start);
   
    </script> --%>