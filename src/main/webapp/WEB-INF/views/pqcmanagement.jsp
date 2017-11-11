<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 引入jsp的标签库 -->
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>植物检疫表单打印管理平台</title>
<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>


<!--  -->
<script type="text/javascript" src="${APP_PATH}/static/js/LodopFuncs.js"></script>
<!-- 引入jquery -->
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<!-- 引入bootstrap -->
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/moment-with-locales.min.js"></script>
<link href="${APP_PATH}/static/js/bootstrap-datetimepicker.min.css" rel="stylesheet">
<script type="text/javascript" src="${APP_PATH}/static/js/bootstrap-datetimepicker.min.js"></script>
	<style type="text/css">
			#alable{
                min-width: 130px;
                float: left;
                display: inline-block;
                margin-right: 5px;
                text-transform: capitalize;
                text-align:right
            	}
            	
           	
		</style>
</head>
<body>

<!-- 新增弹出来的模态框-->
<div class="modal fade" id="pqcAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">新增表单</h4>
      </div>
      <div class="modal-body">
      	<!--表单  -->
      	
      	<div class="container">
			<form  class="form-horizontal" style="margin:1px" id="pqcinfosave">
			    <div class="form-group-sm col-sm-5">
			    	<div>
			    		<label id="alable" >林:</label>
			    		<input type="text" name="lin" id="lin" style="width:50%;">
			    	</div>
			    	
			    	<div >
			    		<label id="alable">调运(承办)人姓名:</label>
			    		<input type="text" name="infoName" id="infoName" style="width:50%;">
			    	</div>
			    	<div >
			    		<label id="alable">联系电话:</label>
			    		<input type="text" name="phoneNumber" id="phoneNumber" style="width:50%;">
			    	</div>
			    	<div >
			    		<label id="alable">运输起讫 自:</label>
			    		<input type="text" name="transportFrom" id="transportFrom" style="width:50%;">
			    	</div>
			    	<div >
			    		<label id="alable">经   </label>
			    		<input type="text" name="transportBy" id="transportBy" style="width:50%;">
			    	</div>
			    	<div >
			    		<label id="alable">至   </label>
			    		<input type="text" name="transportTo" id="transportTo" style="width:50%;">
			    	</div>
			    	<div >
			    		<label id="alable">签发意见:</label>
			    		<input type="text" name="detail" id="detail" style="width:50%;">
			    	</div>
			    </div>
			    <div class="col-sm-4">
		   			<div>
			    		<label id="alable" >检字:</label>
			    		<input type="text" name="inspection" id="inspection" style="width:50%;">
		    		</div>
		    		<div>
			    		<label id="alable">身份证号码:</label>
			    		<input type="text" name="idNumber" id="idNumber" style="width:50%;">
		    		</div>
		    		<div >
			    		<label id="alable" >产品来源:</label>
			    		<input type="text" name="source" id="source" style="width:50%;">
			    	</div>
			    	<div >
			    		<label id="alable">运输工具:</label>
			    		<input type="text" name="transportMachine" id="transportMachine" style="width:50%;">
			    	</div>
			    	<div >
			    		<label id="alable">有限期限 自:</label>
					    		<div class="input-group date" id='Date1'>  
						                <input type="text" id="startdate"  name="startdate" style="width:100%;"readonly>  
						                <span class="input-group-addon" onclick="removeclss()">  
						                    <i class="glyphicon glyphicon-calendar"></i>  
						                </span>  
		            			</div>
			    	</div>
			    	<div >
			    		<label id="alable">至   </label>
			    		<div class="input-group date" id='Date2'>  
						                <input type="text" id="enddate"  name="enddate" style="width:100%;" readonly>  
						                <span class="input-group-addon"  onclick="removeclss()">  
						                    <i class="glyphicon glyphicon-calendar"></i>  
						                </span>  
		            			</div>
			    	</div>
			    	<div >
			    		<label id="alable">签证日期: </label>
			    		<div class="input-group date" id='Date3'>  
						                <input type="text" id="date" name="date" style="width:100%;" readonly>  
						                <span class="input-group-addon"  onclick="removeclss()">  
						                    <i class="glyphicon glyphicon-calendar"></i>  
						                </span>  
		            			</div>
			    	</div>
			    </div>
			    
			    <div class="col-sm-12">
			    	<div>
			    		<label id="alable">调运单位(人)及地址:</label>
			    		<input type="text" name="coLtdPersonAd" id="coLtdPersonAd" style="width:58%;">
			    	</div>
			    	<div>
			    		<label id="alable">收货单位(人)及地址:</label>
			    		<input type="text" name="address" id="address" style="width:58%;"></br>
			    	</div>
			    </div>
			    
			    <div class=" col-sm-12">
			   		 <label class="col-sm-1 control-label" style="text-align:center"></label>
			   		 
					<label class="col-sm-1 control-label" style="text-align:center">名    称</label>
					<label class="col-sm-1 control-label" style="text-align:center">品    名</label>
					<label class="col-sm-1 control-label" style="text-align:center">规    格</label>
					<label class="col-sm-1 control-label" style="text-align:center">单    位</label>
					<label class="col-sm-1 control-label" style="text-align:center">数    量</label>
					<label class="col-sm-1 control-label" style="text-align:center">备    注</label>
				</div>
		    </form>
		    <form class="form-horizontal" id="prosaveone" >
			<div class="form-group-sm col-sm-12">
				<div class="col-sm-1"></div>
				 <div class="col-sm-1">											
		      	  <input type="text" name="plantName"  id="plantName" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="variety" id="variety" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="specification"  id="specification" style="width:100%;" >
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="unit"  id="unit" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="amount"  id="amount" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="remark" id="remark" style="width:100%;">
			    </div>
			</div>	
		</form>
		<form class="form-horizontal" id="prosave2" >
			<div class="form-group-sm col-sm-12">
				<div class="col-sm-1"></div>
				 <div class="col-sm-1">											
		      	  <input type="text" name="plantName"  id="plantName" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="variety" id="variety" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="specification"  id="specification" style="width:100%;" >
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="unit"  id="unit" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="amount"  id="amount" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="remark" id="remark" style="width:100%;">
			    </div>
			</div>	
		</form>
		<form class="form-horizontal" id="prosave3" >
			<div class="form-group-sm col-sm-12">
				<div class="col-sm-1"></div>
				 <div class="col-sm-1">											
		      	  <input type="text" name="plantName"  id="plantName" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="variety" id="variety" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="specification"  id="specification" style="width:100%;" >
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="unit"  id="unit" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="amount"  id="amount" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="remark" id="remark" style="width:100%;">
			    </div>
			</div>	
		</form>
		<form class="form-horizontal" id="prosave4" >
			<div class="form-group-sm col-sm-12">
				<div class="col-sm-1"></div>
				 <div class="col-sm-1">											
		      	  <input type="text" name="plantName"  id="plantName" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="variety" id="variety" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="specification"  id="specification" style="width:100%;" >
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="unit"  id="unit" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="amount"  id="amount" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="remark" id="remark" style="width:100%;">
			    </div>
			</div>	
		</form>
		<form class="form-horizontal" id="prosave5" >
			<div class="form-group-sm col-sm-12">
				<div class="col-sm-1"></div>
				 <div class="col-sm-1">											
		      	  <input type="text" name="plantName"  id="plantName" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="variety" id="variety" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="specification"  id="specification" style="width:100%;" >
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="unit"  id="unit" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="amount"  id="amount" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="remark" id="remark" style="width:100%;">
			    </div>
			</div>	
		</form>
		<form class="form-horizontal" id="prosave6" >
			<div class="form-group-sm col-sm-12">
				<div class="col-sm-1"></div>
				 <div class="col-sm-1">											
		      	  <input type="text" name="plantName"  id="plantName" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="variety" id="variety" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="specification"  id="specification" style="width:100%;" >
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="unit"  id="unit" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="amount"  id="amount" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="remark" id="remark" style="width:100%;">
			    </div>
			</div>	
		</form>
		<form class="form-horizontal" id="prosave7" >
			<div class="form-group-sm col-sm-12">
				<div class="col-sm-1"></div>
				 <div class="col-sm-1">											
		      	  <input type="text" name="plantName"  id="plantName" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="variety" id="variety" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="specification"  id="specification" style="width:100%;" >
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="unit"  id="unit" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="amount"  id="amount" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="remark" id="remark" style="width:100%;">
			    </div>
			</div>	
		</form>
		<form class="form-horizontal" id="prosave8" >
			<div class="form-group-sm col-sm-12">
				<div class="col-sm-1"></div>
				 <div class="col-sm-1">											
		      	  <input type="text" name="plantName"  id="plantName" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="variety" id="variety" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="specification"  id="specification" style="width:100%;" >
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="unit"  id="unit" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="amount"  id="amount" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="remark" id="remark" style="width:100%;">
			    </div>
			</div>	
		</form>
		<form class="form-horizontal" id="prosave9" >
			<div class="form-group-sm col-sm-12">
				<div class="col-sm-1"></div>
				 <div class="col-sm-1">											
		      	  <input type="text" name="plantName"  id="plantName" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="variety" id="variety" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="specification"  id="specification" style="width:100%;" >
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="unit"  id="unit" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="amount"  id="amount" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="remark" id="remark" style="width:100%;">
			    </div>
			</div>	
		</form>
		<form class="form-horizontal" id="prosave10" >
			<div class="form-group-sm col-sm-12">
				<div class="col-sm-1"></div>
				 <div class="col-sm-1">											
		      	  <input type="text" name="plantName"  id="plantName" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="variety" id="variety" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="specification"  id="specification" style="width:100%;" >
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="unit"  id="unit" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="amount"  id="amount" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="remark" id="remark" style="width:100%;">
			    </div>
			</div>	
		</form>
		</div>
		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="qpc_save_btn">保存</button>
      </div>
    </div>
  </div>
</div>

<!-- 修改弹出来的模态框-->
<div class="modal fade" id="pqcEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">修改表单</h4>
      </div>
      <div class="modal-body">
      	<!--表单  -->
      	
      	<div class="container">
			<form  class="form-horizontal" style="margin:1px" id="pqcinfoedit">
			    <div class="form-group-sm col-sm-5">
			    	<div>
			    		<label id="alable" >林:</label>
			    		<input type="text" name="lin" id="update_lin" style="width:50%;">
			    	</div>
			    	
			    	<div >
			    		<label id="alable">调运(承办)人姓名:</label>
			    		<input type="text" name="infoName" id="update_infoName" style="width:50%;">
			    	</div>
			    	<div >
			    		<label id="alable">联系电话:</label>
			    		<input type="text" name="phoneNumber" id="update_phoneNumber" style="width:50%;">
			    	</div>
			    	<div >
			    		<label id="alable">运输起讫 自:</label>
			    		<input type="text" name="transportFrom" id="update_transportFrom" style="width:50%;">
			    	</div>
			    	<div >
			    		<label id="alable">经   </label>
			    		<input type="text" name="transportBy" id="update_transportBy" style="width:50%;">
			    	</div>
			    	<div >
			    		<label id="alable">至   </label>
			    		<input type="text" name="transportTo" id="update_transportTo" style="width:50%;">
			    	</div>
			    	<div >
			    		<label id="alable">签发意见:</label>
			    		<input type="text" name="detail" id="update_detail" style="width:50%;">
			    	</div>
			    </div>
			    <div class="col-sm-4">
		   			<div>
			    		<label id="alable" >检字:</label>
			    		<input type="text" name="inspection" id="update_inspection" style="width:50%;">
		    		</div>
		    		<div>
			    		<label id="alable">身份证号码:</label>
			    		<input type="text" name="idNumber" id="update_idNumber" style="width:50%;">
		    		</div>
		    		<div >
			    		<label id="alable" >产品来源:</label>
			    		<input type="text" name="source" id="update_source" style="width:50%;">
			    	</div>
			    	<div >
			    		<label id="alable">运输工具:</label>
			    		<input type="text" name="transportMachine" id="update_transportMachine" style="width:50%;">
			    	</div>
			    	<div >
			    		<label id="alable">有限期限 自:</label>
			    			<div class="input-group date" id='Date1'>  
						                <input type="text" id="update_startdate"  name="startdate" style="width:100%;"readonly>  
						                <span class="input-group-addon" onclick="removeclss()">  
						                    <i class="glyphicon glyphicon-calendar"></i>  
						                </span>  
		            			</div>
			    	</div>
			    	<div >
			    		<label id="alable">至   </label>
				    		<div class="input-group date" id='Date2'>  
						                <input type="text" id="update_enddate"  name="enddate" style="width:100%;" readonly>  
						                <span class="input-group-addon"  onclick="removeclss()">  
						                    <i class="glyphicon glyphicon-calendar"></i>  
						                </span>  
		            			</div>
			    	</div>
			    	<div >
			    		<label id="alable">签证日期: </label>
					    		<div class="input-group date" id='Date3'>  
						                <input type="text" id="update_date" name="date" style="width:100%;" readonly>  
						                <span class="input-group-addon"  onclick="removeclss()">  
						                    <i class="glyphicon glyphicon-calendar"></i>  
						                </span>  
		            			</div>
			    	</div>
			    </div>
			    
			    <div class="col-sm-12">
			    	<div>
			    		<label id="alable">调运单位(人)及地址:</label>
			    		<input type="text" name="coLtdPersonAd" id="update_coLtdPersonAd" style="width:58%;">
			    	</div>
			    	<div>
			    		<label id="alable">收货单位(人)及地址:</label>
			    		<input type="text" name="address" id="update_address" style="width:58%;"></br>
			    	</div>
			    </div>
			    
			    <div class=" col-sm-12">
			   		 <label class="col-sm-1 control-label" style="text-align:center"></label>
			   		 
					<label class="col-sm-1 control-label" style="text-align:center">名    称</label>
					<label class="col-sm-1 control-label" style="text-align:center">品    名</label>
					<label class="col-sm-1 control-label" style="text-align:center">规    格</label>
					<label class="col-sm-1 control-label" style="text-align:center">单    位</label>
					<label class="col-sm-1 control-label" style="text-align:center">数    量</label>
					<label class="col-sm-1 control-label" style="text-align:center">备    注</label>
				</div>
		    </form>
		    <form class="form-horizontal" id="prouupdate1" >
			<div class="form-group-sm col-sm-12">
				<div class="col-sm-1"></div>
				 <div class="col-sm-1">											
		      	  <input type="text" name="plantName"  id="plantName0" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="variety" id="variety0" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="specification"  id="specification0" style="width:100%;" >
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="unit"  id="unit0" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="amount"  id="amount0" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="remark" id="remark0" style="width:100%;">
			    </div>
			
			</div>	
		</form>
		<form class="form-horizontal" id="prouupdate2" >
			<div class="form-group-sm col-sm-12">
				<div class="col-sm-1"></div>
				 <div class="col-sm-1">											
		      	  <input type="text" name="plantName"  id="plantName1" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="variety" id="variety1" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="specification"  id="specification1" style="width:100%;" >
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="unit"  id="unit1" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="amount"  id="amount1" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="remark" id="remark1" style="width:100%;">
			    </div>
			    
			</div>	
		</form>
		<form class="form-horizontal" id="prouupdate3" >
			<div class="form-group-sm col-sm-12">
				<div class="col-sm-1"></div>
				 <div class="col-sm-1">											
		      	  <input type="text" name="plantName"  id="plantName2" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="variety" id="variety2" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="specification"  id="specification2" style="width:100%;" >
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="unit"  id="unit2" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="amount"  id="amount2" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="remark" id="remark2" style="width:100%;">
			    </div>
			    
			</div>	
		</form>
		<form class="form-horizontal" id="prouupdate4" >
			<div class="form-group-sm col-sm-12">
				<div class="col-sm-1"></div>
				 <div class="col-sm-1">											
		      	  <input type="text" name="plantName"  id="plantName3" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="variety" id="variety3" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="specification"  id="specification3" style="width:100%;" >
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="unit"  id="unit3" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="amount"  id="amount3" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="remark" id="remark3" style="width:100%;">
			    </div>
			   
			</div>	
		</form>
		<form class="form-horizontal" id="prouupdate5" >
			<div class="form-group-sm col-sm-12">
				<div class="col-sm-1"></div>
				 <div class="col-sm-1">											
		      	  <input type="text" name="plantName"  id="plantName4" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="variety" id="variety4" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="specification"  id="specification4" style="width:100%;" >
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="unit"  id="unit4" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="amount"  id="amount4" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="remark" id="remark4" style="width:100%;">
			    </div>
			    
			</div>	
		</form>
		<form class="form-horizontal" id="prouupdate6" >
			<div class="form-group-sm col-sm-12">
				<div class="col-sm-1"></div>
				 <div class="col-sm-1">											
		      	  <input type="text" name="plantName"  id="plantName5" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="variety" id="variety5" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="specification"  id="specification5" style="width:100%;" >
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="unit"  id="unit5" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="amount"  id="amount5" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="remark" id="remark5" style="width:100%;">
			    </div>
			    
			</div>	
		</form>
		<form class="form-horizontal" id="prouupdate7" >
			<div class="form-group-sm col-sm-12">
				<div class="col-sm-1"></div>
				 <div class="col-sm-1">											
		      	  <input type="text" name="plantName"  id="plantName6" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="variety" id="variety6" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="specification"  id="specification6" style="width:100%;" >
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="unit"  id="unit6" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="amount"  id="amount6" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="remark" id="remark6" style="width:100%;">
			    </div>
			    
			</div>	
		</form>
		<form class="form-horizontal" id="prouupdate8" >
			<div class="form-group-sm col-sm-12">
				<div class="col-sm-1"></div>
				 <div class="col-sm-1">											
		      	  <input type="text" name="plantName"  id="plantName7" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="variety" id="variety7" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="specification"  id="specification7" style="width:100%;" >
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="unit"  id="unit7" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="amount"  id="amount7" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="remark" id="remark7" style="width:100%;">
			    </div>
			  
			</div>	
		</form>
		<form class="form-horizontal" id="prouupdate9" >
			<div class="form-group-sm col-sm-12">
				<div class="col-sm-1"></div>
				 <div class="col-sm-1">											
		      	  <input type="text" name="plantName"  id="plantName8" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="variety" id="variety8" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="specification"  id="specification8" style="width:100%;" >
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="unit"  id="unit8" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="amount"  id="amount8" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="remark" id="remark8" style="width:100%;">
			    </div>
			    
			</div>	
		</form>
		<form class="form-horizontal" id="prouupdate10" >
			<div class="form-group-sm col-sm-12">
				<div class="col-sm-1"></div>
				 <div class="col-sm-1">											
		      	  <input type="text" name="plantName"  id="plantName9" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="variety" id="variety9" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="specification"  id="specification9" style="width:100%;" >
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="unit"  id="unit9" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="amount"  id="amount9" style="width:100%;">
			    </div> 
			    <div class="col-sm-1">											
			      <input type="text" name="remark" id="remark9" style="width:100%;">
			    </div>
			    
			</div>	
		</form>
		</div>
		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="qpc_update_btn">修改</button>
      </div>
    </div>
  </div>
</div>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>植物检疫表单管理</h1>
			</div>
		</div>
		<!-- 左上角按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="pac_add_modal_btn">新增</button>
			</div>
		</div>
		<!-- 表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="infos_table">
					<thead>
						<tr>
						<th>编号</th>
							<th>调运(承办)人姓名</th>
							<th>手机号码</th>
							<th>身份证号码</th>
							<th>调运单位(人)及地址</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						
						
					</tbody>	
				</table>
			</div>
		</div>
		<!-- 显示分页信息 -->
		<div class="row">
			<!--分页文字信息  -->
			<div class="col-md-6" id="page_info_area">
					
			</div>
			<!-- 分页条 -->
			<div class="col-md-6" id="page_nav_area">
				
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

	var totalRecord,currentPage;
	
	//1.页面加载完成以后，直接去发送一个ajax请求，要到分页数据
	$(function(){
		//去首页
		to_page(1);
	});
	
	function to_page(pn){
			$.ajax({
				url:"${APP_PATH}/getpagelist",
				data:"pn="+pn,
				type:"GET",
				success:function(result){
					//console.log(result);
					//1.解析并显示员工数据
					build_info_table(result);
					//2.解析并显示分页信息
					build_page_info(result);
					//解析显示分页条数据
					build_page_nav(result);
				}
			})
		}
	
	function build_info_table(result){
		//清空table表格
		$("#infos_table tbody").empty(); //jqury清空元素的方法
		var infos =result.extend.pageInfo.list; //返回的是result里的extend...
		$.each(infos,function(index,item){ //each方法传入第一个要遍历的元素emps,每一次遍历的函数就是function
										//传入2个函数，第一个是索引，第二个当前的item
			var idTd = $("<td></td>").append(item.id);							
			var infoNameTd = $("<td></td>").append(item.infoName);
			var phoneNumberTd = $("<td></td>").append(item.phoneNumber);
			var idNumberTd = $("<td></td>").append(item.idNumber);
			var coLtdPersonAdTd = $("<td></td>").append(item.coLtdPersonAd);
			var editBtn =$("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
							.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("修改");
			//为编辑按钮添加一个自定义属性，表示当前的uuid
			editBtn.attr("edit-uuid",item.uuid);
			var delBtn =$("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
			.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
			delBtn.attr("del-id",item.id);
			delBtn.attr("del-uuid",item.uuid);
			var infoBtn =$("<button></button>").addClass("btn btn-info btn-sm info_btn")
			.append($("<span></span>").addClass("glyphicon glyphicon-comment")).append("查看");
			infoBtn.attr("info-uuid",item.uuid);
			var printBtn =$("<button></button>").addClass("btn btn-warning btn-sm print_btn")
			.append($("<span></span>").addClass("glyphicon glyphicon-print")).append("打印");
			var btnTd = $("<td></td>").append(editBtn).append(delBtn).append(infoBtn).append(printBtn);
			printBtn.attr("print-uuid",item.uuid);
			//append方法执行完成以后，还是返回原来的元素
			$("<tr></tr>").append(idTd)
							.append(infoNameTd)
							.append(phoneNumberTd)
							.append(idNumberTd)
							.append(coLtdPersonAdTd)
							.append(btnTd)
							.appendTo("#infos_table tbody");  //添加到哪里去用appendTo,使用选择器选择元素
		
		});
	}
	
	//解析显示分页信息
	function build_page_info(result){
		//选择器，找到html元素的id,用append添加后续
		$("#page_info_area").empty();
		$("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+
				result.extend.pageInfo.pages+"页,总"+result.extend.pageInfo.total+"条记录");
		totalRecord = result.extend.pageInfo.lastPage;
		currentPage =result.extend.pageInfo.pageNum;
	}
	
	//解析显示分页条,点击分页要能去下一页...
	function build_page_nav(result){
		$("#page_nav_area").empty();
		//page_nav_area   不能让他点击跳转 写一个#
		var ul = $("<ul></ul>").addClass("pagination");
		
		//构建 元素
		var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
		var	prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
		//如果有前一页
		if(result.extend.pageInfo.hasPreviousPage == false){
			firstPageLi.addClass("disabled"); //不能被点击，bootstrap的class"disabled属性"
			prePageLi.addClass("disabled"); 
		}else{
			//为元素添加点击翻页的事件
			firstPageLi.click(function(){
				to_page(1); //首页去第一页
			});
			prePageLi.click(function(){
				to_page(result.extend.pageInfo.pageNum - 1);  //前一页
			});
		}
		
		
		var	nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
		var lastPageLi =  $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
		
		if(result.extend.pageInfo.hasNextPage == false){
			nextPageLi.addClass("disabled");
			lastPageLi.addClass("disabled");
		}else{
			nextPageLi.click(function(){
				to_page(result.extend.pageInfo.pageNum + 1); //后一页
			});
			
			lastPageLi.click(function(){
				to_page(result.extend.pageInfo.pages); //最后一页 
			});
		}
		
		
		//添加首页和前一页的提示
		ul.append(firstPageLi).append(prePageLi);
		//遍历方法  index 索引  item当前元素
		//12345 遍历给ul中添加页码提示
		$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
			
			var numLi = $("<li></li>").append($("<a></a>").append(item));
			//如果页码等于正在遍历的页码
			if(result.extend.pageInfo.pageNum == item){
				numLi.addClass("active");
			}
			numLi.click(function(){
				to_page(item);
			});
			ul.append(numLi);
		});
		//添加下一页和末页的提示
		ul.append(nextPageLi).append(lastPageLi);
		//把ul加入到此元素中
		var navEle = $("<nav></nav>").append(ul);
		navEle.appendTo("#page_nav_area");
	}
	
	
	//（点击新增按钮弹出模态框）绑定事件                                   回调函数
	$("#pac_add_modal_btn").click(function(){
		//发送ajax请求，查处部门信息，显示在下拉列表中
		//弹出模态框
		$("#pqcAddModal").modal({
			backdrop:"static"
		});
	});
	//$.param({"id":uuidNum})+'&'+
	$("#qpc_save_btn").click(function(){
		//1将模块框中填写的表单数据提交
		var uuidNum = uuid(32,16);
		
		$.ajax({
			url:"${APP_PATH}/pqcsaves",
			type:"POST",
			data:$.param({"uuid":uuidNum})+'&'+$("#pqcinfosave").serialize(),
			async:false,
			success:function(result){
				//关闭模态框
				$("#pqcAddModal").modal('hide');
				//去最后一页
				to_page(totalRecord);
			}
		});
		
		$.ajax({
			url:"${APP_PATH}/saveproducts",
			type:"POST",
			data:$.param({"proUuid":uuidNum})+'&'+$("#prosaveone").serialize(),
			async:false,
			success:function(result){
			}
		});
		$.ajax({
			url:"${APP_PATH}/saveproducts",
			type:"POST",
			data:$.param({"proUuid":uuidNum})+'&'+$("#prosave2").serialize(),
			async:false,
			success:function(result){
			}
		});
		$.ajax({
			url:"${APP_PATH}/saveproducts",
			type:"POST",
			data:$.param({"proUuid":uuidNum})+'&'+$("#prosave3").serialize(),
			async:false,
			success:function(result){
			}
		});
		$.ajax({
			url:"${APP_PATH}/saveproducts",
			type:"POST",
			data:$.param({"proUuid":uuidNum})+'&'+$("#prosave4").serialize(),
			async:false,
			success:function(result){
			}
		});
		$.ajax({
			url:"${APP_PATH}/saveproducts",
			type:"POST",
			data:$.param({"proUuid":uuidNum})+'&'+$("#prosave5").serialize(),
			async:false,
			success:function(result){
			}
		});
		$.ajax({
			url:"${APP_PATH}/saveproducts",
			type:"POST",
			data:$.param({"proUuid":uuidNum})+'&'+$("#prosave6").serialize(),
			async:false,
			success:function(result){
			}
		});
		$.ajax({
			url:"${APP_PATH}/saveproducts",
			type:"POST",
			data:$.param({"proUuid":uuidNum})+'&'+$("#prosave7").serialize(),
			async:false,
			success:function(result){
			}
		});
		$.ajax({
			url:"${APP_PATH}/saveproducts",
			type:"POST",
			data:$.param({"proUuid":uuidNum})+'&'+$("#prosave8").serialize(),
			async:false,
			success:function(result){
			}
		});
		$.ajax({
			url:"${APP_PATH}/saveproducts",
			type:"POST",
			data:$.param({"proUuid":uuidNum})+'&'+$("#prosave9").serialize(),
			async:false,
			success:function(result){
			}
		});
		$.ajax({
			url:"${APP_PATH}/saveproducts",
			type:"POST",
			data:$.param({"proUuid":uuidNum})+'&'+$("#prosave10").serialize(),
			async:false,
			success:function(result){
			}
		});
		
	});
	
	
	//绑定修改事件
	$(document).on("click",".edit_btn",function(){
		//显示编号
		getinfouuid($(this).attr("edit-uuid"));
		$("#qpc_update_btn").attr("edit-uuid",$(this).attr("edit-uuid"));
		$("#pqcEditModal").modal({
			backdrop:"static"
		});
	});
	function getinfouuid(uuid){
		$.ajax({
			url:"${APP_PATH}/getoneinfomationwithuuid/"+uuid,
			type:"GET",
			success:function(result){
				$("#update_lin").val(result[0].lin);
				$("#update_infoName").val(result[0].infoName);
				$("#update_phoneNumber").val(result[0].phoneNumber);
				$("#update_transportFrom").val(result[0].transportFrom);
				$("#update_transportBy").val(result[0].transportBy);
				$("#update_transportTo").val(result[0].transportTo);
				$("#update_detail").val(result[0].detail);
				$("#update_inspection").val(result[0].inspection);
				$("#update_idNumber").val(result[0].idNumber);
				$("#update_source").val(result[0].source);
				$("#update_transportMachine").val(result[0].transportMachine);
				$("#update_startdate").val(result[0].startdate);
				$("#update_enddate").val(result[0].enddate);
				$("#update_date").val(result[0].date);
				$("#update_coLtdPersonAd").val(result[0].coLtdPersonAd);
				$("#update_address").val(result[0].address);
			}
		});
		$.ajax({
			url:"${APP_PATH}/getoneproduct/"+uuid,
			type:"GET",
			success:function(pro){
				for(var i = 0;i < getJsonObjLength(pro);i++){
					$("#plantName"+i).val(pro[i].plantName);
					$("#variety"+i).val(pro[i].variety);
					$("#specification"+i).val(pro[i].specification);
					$("#amount"+i).val(pro[i].amount);
					$("#unit"+i).val(pro[i].unit);
					$("#remark"+i).val(pro[i].remark);
					$("#plantName"+i).attr("edit_pro_id_"+i,pro[i].proId);
					
				}
			}
		});
	}
	
	//点击更新更新信息
	$("#qpc_update_btn").click(function(){
		$.ajax({
			url:"${APP_PATH}/updateinfo/"+$(this).attr("edit-uuid"),
			type:"PUT",
			data:$("#pqcinfoedit").serialize(),
			success:function(result){
				$("#pqcEditModal").modal('hide');
				to_page(currentPage);
			}
		});
		
		$.ajax({
			url:"${APP_PATH}/updateproduct/"+$("#plantName0").attr("edit_pro_id_0"),
			type:"PUT",
			data:$("#prouupdate1").serialize(),
			success:function(result){
				//alert(result);
			}
		});
		$.ajax({
			url:"${APP_PATH}/updateproduct/"+$("#plantName1").attr("edit_pro_id_1"),
			type:"PUT",
			data:$("#prouupdate2").serialize(),
			success:function(result){
				//alert(result);
			}
		});
		$.ajax({
			url:"${APP_PATH}/updateproduct/"+$("#plantName2").attr("edit_pro_id_2"),
			type:"PUT",
			data:$("#prouupdate3").serialize(),
			success:function(result){
				//alert(result);
			}
		});
		$.ajax({
			url:"${APP_PATH}/updateproduct/"+$("#plantName3").attr("edit_pro_id_3"),
			type:"PUT",
			data:$("#prouupdate4").serialize(),
			success:function(result){
				//alert(result);
			}
		});
		$.ajax({
			url:"${APP_PATH}/updateproduct/"+$("#plantName4").attr("edit_pro_id_4"),
			type:"PUT",
			data:$("#prouupdate5").serialize(),
			success:function(result){
				//alert(result);
			}
		});
		$.ajax({
			url:"${APP_PATH}/updateproduct/"+$("#plantName5").attr("edit_pro_id_5"),
			type:"PUT",
			data:$("#prouupdate6").serialize(),
			success:function(result){
				//alert(result);
			}
		});
		$.ajax({
			url:"${APP_PATH}/updateproduct/"+$("#plantName6").attr("edit_pro_id_6"),
			type:"PUT",
			data:$("#prouupdate7").serialize(),
			success:function(result){
				//alert(result);
			}
		});
		$.ajax({
			url:"${APP_PATH}/updateproduct/"+$("#plantName7").attr("edit_pro_id_7"),
			type:"PUT",
			data:$("#prouupdate8").serialize(),
			success:function(result){
				//alert(result);
			}
		});
		$.ajax({
			url:"${APP_PATH}/updateproduct/"+$("#plantName8").attr("edit_pro_id_8"),
			type:"PUT",
			data:$("#prouupdate9").serialize(),
			success:function(result){
				//alert(result);
			}
		});
		$.ajax({
			url:"${APP_PATH}/updateproduct/"+$("#plantName9").attr("edit_pro_id_9"),
			type:"PUT",
			data:$("#prouupdate10").serialize(),
			success:function(result){
				//alert(result);
			}
		});
	});
	
	
	
	//获取每一页的id
	function getinfoid(id){
		$.ajax({
			url:"${APP_PATH}/pqcsinfos/"+id,
			type:"GET",
			success:function(result){
				//console.log(result);
				var infoid = result.extend.pqc.id;
				//$("#proId").text(infoid);
				$("#proId").val(infoid);
			}
		});
	}
	//$.param({'address':address,'delivity':delivity,'payment':payment}) + '&' + $('#card_form').serialize()
	//保存种类
	$("#product_save_btn").click(function(){
		
		$.ajax({
			url:"${APP_PATH}/saveproducts",
			type:"POST",
			data:$("#proAddModal form").serialize(),
			success:function(result){
				$("#proAddModal").modal('hide');
			}
		});
		
	});
	 //打印按钮绑定事件
	$(document).on("click",".print_btn",function(){
		var uuid = $(this).attr("print-uuid");
		RealPrint(uuid);
	});
	
	 //查看按钮绑定事件
	 $(document).on("click",".info_btn",function(){
		 var uuid = $(this).attr("info-uuid");
		 window.location.href= "Viewpage.jsp?uuid="+uuid;
	 });
	
	function RealPrint(uuid){
		var qrcode="http://damaobing.com/Viewpage.jsp?uuid="+uuid;
		LODOP=getLodop(); 
		LODOP.PRINT_INITA(0,0,795,1061,"打印");
		LODOP.SET_SHOW_MODE("BKIMG_WIDTH","182mm");
		LODOP.SET_SHOW_MODE("BKIMG_HEIGHT","257mm");
		LODOP.ADD_PRINT_BARCODE(20,563,120,120,"QRCode",qrcode);
		$.ajax({
			url:"${APP_PATH}/getoneproduct/"+uuid,
			type:"GET",
			async:false,
			success:function(pro){
				var productLength = 0;
				//每行之间相差29像素
				var n = 27;
				//第一个值的高度
				var hight =367;
				//获取长度循环遍历输出打印结果
				for(var i = 0;i < getJsonObjLength(pro);i++){
					LODOP.ADD_PRINT_TEXT(hight,66,129,24,pro[i].plantName);
					LODOP.ADD_PRINT_TEXT(hight,186,142,24,pro[i].variety);
					LODOP.ADD_PRINT_TEXT(hight,338,72,24,pro[i].specification);
					LODOP.ADD_PRINT_TEXT(hight,414,75,24,pro[i].unit);
					LODOP.ADD_PRINT_TEXT(hight,488,76,24,pro[i].amount);
					LODOP.ADD_PRINT_TEXT(hight,563,92,24,pro[i].remark);
					hight+=n;
					
				}
				
				
				
				
				$.ajax({
					url:"${APP_PATH}/getoneinfomationwithuuid/"+uuid,
					type:"GET",
					async:false,
					success:function(info){
						var Date = info[0].date;
						var yeartxt = Date.substring(0,4);
						var monthtxt = Date.substring(5,7);
						var daytxt = Date.substring(8,10);
						var startDate = info[0].startdate;
						var y1 = NoToChinese(startDate.substring(0,1));
						var y2 = NoToChinese(startDate.substring(1,2));
						var y3 = NoToChinese(startDate.substring(2,3));
						var y4 = NoToChinese(startDate.substring(3,4));
						var startyear = y1+y2+y3+y4;
						var startmonth = NoToChinese(startDate.substring(5,7));
						var startday = NoToChinese(startDate.substring(8,10));
						
						var endDate = info[0].enddate;
						var y5 = NoToChinese(endDate.substring(0,1));
						var y6 = NoToChinese(endDate.substring(1,2));
						var y7 = NoToChinese(endDate.substring(2,3));
						var y8 = NoToChinese(endDate.substring(3,4));
						var endyear = y5+y6+y7+y8;
						var endmonth = NoToChinese(endDate.substring(5,7));
						var endday = NoToChinese(endDate.substring(8,10));
						
						LODOP.ADD_PRINT_TEXT(152,461,28,24,info[0].lin); //ok
						//LODOP.ADD_PRINT_TEXT(152,520,146,24,info[0].inspection); //ok
						LODOP.ADD_PRINT_TEXT(238,198,518,24,info[0].address);   //ok
						LODOP.ADD_PRINT_TEXT(209,198,94,24,info[0].infoName);  //ok
						LODOP.ADD_PRINT_TEXT(209,353,140,24,info[0].idNumber);  //ok
						LODOP.ADD_PRINT_TEXT(209,550,104,24,info[0].phoneNumber);  //ok
						LODOP.ADD_PRINT_TEXT(181,198,516,24,info[0].coLtdPersonAd);  //ok
						LODOP.ADD_PRINT_TEXT(265,196,336,24,info[0].source);  //ok
						LODOP.ADD_PRINT_TEXT(267,555,112,24,info[0].transportMachine);  //ok
						LODOP.ADD_PRINT_TEXT(287,121,199,24,info[0].transportFrom);  //x
						LODOP.ADD_PRINT_TEXT(287,348,99,24,info[0].transportBy);  //x
						LODOP.ADD_PRINT_TEXT(287,460,203,24,info[0].transportTo);  //x
						LODOP.ADD_PRINT_TEXT(315,125,92,24,startyear);  //x
						LODOP.ADD_PRINT_TEXT(315,228,46,22,startmonth);
						LODOP.ADD_PRINT_TEXT(315,301,54,24,startday);
						LODOP.ADD_PRINT_TEXT(315,385,80,24,endyear);
						LODOP.ADD_PRINT_TEXT(315,485,56,25,endmonth);
						LODOP.ADD_PRINT_TEXT(315,565,54,24,endday);
						LODOP.ADD_PRINT_TEXT(637,353,327,24,info[0].detail);  //xx
						LODOP.ADD_PRINT_TEXT(825,467,49,24,yeartxt);
						LODOP.ADD_PRINT_TEXT(825,535,32,24,monthtxt);
						LODOP.ADD_PRINT_TEXT(825,585,30,24,daytxt); 
						LODOP.PRINTA();
					}
				});
	
			}
		});
		
	}
	
	

	//json计数器
	function getJsonObjLength(jsonObj) {
	        var Length = 0;
			//获取product长度
	        for (var item in jsonObj) {
	            Length++;
	        }
	        return Length;
	}
	
	//UUID生成
	function uuid(len, radix) {
		  var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split('');
		  var uuid = [], i;
		  radix = radix || chars.length;		 
		  if (len) {
		   for (i = 0; i < len; i++) uuid[i] = chars[0 | Math.random()*radix];
		  } else {
		   var r;	 
		   uuid[8] = uuid[13] = uuid[18] = uuid[23] = '-';
		   uuid[14] = '4';
		   for (i = 0; i < 36; i++) {
		    if (!uuid[i]) {
		     r = 0 | Math.random()*16;
		     uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r];
		    }
		   }
		  }		 
		  return uuid.join('');
		}
		
	
	$(function () {  
	    $("#Date1,#Date2,#Date3").datetimepicker({  
	        format: 'YYYY-MM-DD',  
	        locale: moment.locale('zh-cn')  
	    });  
	});
	
	
	function removeclss(){
		$("#enddate,#startdate,#date").removeAttr("readonly");
		
	}
	
	
	//大写
	function NoToChinese(num) { 
		if (!/^\d*(\.\d*)?$/.test(num)) { alert("Number is wrong!"); return "Number is wrong!"; } 
		if(num == 0)
			return "零";
		var AA = new Array("零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖"); 
		var BB = new Array("", "拾", "佰", "仟", "萬", "億", "点", ""); 
		var a = ("" + num).replace(/(^0*)/g, "").split("."), k = 0, re = ""; 
		for (var i = a[0].length - 1; i >= 0; i--) { 
		switch (k) { 
		case 0: re = BB[7] + re; break; 
		case 4: if (!new RegExp("0{4}\\d{" + (a[0].length - i - 1) + "}$").test(a[0])) 
		re = BB[4] + re; break; 
		case 8: re = BB[5] + re; BB[7] = BB[5]; k = 0; break; 
		} 
		if (k % 4 == 2 && a[0].charAt(i + 2) != 0 && a[0].charAt(i + 1) == 0) re = AA[0] + re; 
		if (a[0].charAt(i) != 0) re = AA[a[0].charAt(i)] + BB[k % 4] + re; k++; 
		} 

		if (a.length > 1) //加上小数部分(如果有小数部分) 
		{ 
		re += BB[6]; 
		for (var i = 0; i < a[1].length; i++) re += AA[a[1].charAt(i)]; 
		} 
		return re; 
		}
	
	$(document).on("click","delete_btn",function(){
		var thisid = $(this).attr("del-id");
		if(confirm("确认删除这条记录吗?")){
			$.ajax({
				url:"${APP_PATH}//delinfo/"+thisid,
				type:"DELETE",
				success:function(result){
					to_page(currentPage);
				}
			});
		}
	}
</script>










</html>