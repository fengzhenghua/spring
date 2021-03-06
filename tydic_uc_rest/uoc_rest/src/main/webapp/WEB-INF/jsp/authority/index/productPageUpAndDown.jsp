<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tydic.unicom.util.DateUtil" %>
<%@ taglib prefix="t" uri="http://tydic.com/jsp/core" %>
<%@include file="../common/common.jsp"%>
<%@ page import="com.tydic.unicom.service.cache.service.interfaces.MemQueryServ" %>
<%@ page import="com.tydic.unicom.service.cache.po.CodeType" %>
<%@ page import="com.tydic.unicom.webUtil.SpringBean" %>
<%@ page import="com.tydic.unicom.service.cache.po.CodeList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.tydic.unicom.crm.uss.service.pub.interfaces.CodeListServDu" %>

<%
    //用于获取img_url
    MemQueryServ memQueryServ = SpringBean.getBean("MemQueryServ", MemQueryServ.class);
	String imgUrl="";
    CodeType imgUrlCode = memQueryServ.queryCodeType("code_type_url_type");
    List<CodeList> codeList = imgUrlCode.getCodeList();
	for (CodeList listw : codeList) {
		if ("img_download_url".equals(listw.getCode_name().trim())) {
			imgUrl=listw.getCode_id().trim();
		}
	}
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>产品活动维护</title>

<link href="<%=fullPath%>css/share1.css" rel="stylesheet" type="text/css" />
<link href="<%=fullPath%>css/card.css" rel="stylesheet" type="text/css" />
<link href="<%=fullPath%>css/shareNew.css" rel="stylesheet" type="text/css" />
<link href="<%=fullPath%>css/showOrder.css" rel="stylesheet" type="text/css" />
<link href="<%=fullPath%>css/public_pc.css" rel="stylesheet" type="text/css" />
<link href="<%=fullPath%>css/pre_accept.css" rel="stylesheet" type="text/css" />
<link href="<%=fullPath%>js/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
<link href="<%=fullPath%>css/departmentManage.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=fullPath%>js/zTree/js/jquery.ztree.all.min.js"></script>
<script type="text/javascript" >
var imgUrlPath="<%=imgUrl%>";
var fullPath="<%=fullPath%>";
</script>
<script type="text/javascript" src="<%=fullPath%>js/jquery.jUploader-1.0.js"></script>
<script type="text/javascript" src="<%=fullPath%>js/productPageUpAndDown.js"></script>
</head>
<body>
	<div name="reader_context" id="reader_context">
  		<div class="show">
		<div class="info">
			<!-- 第1层标题 -->
 			<div class="detail_white">
				<div class="title_tab" style="width:850px;">
					<div class="tab_menu"></div>                					
					<div class="tab_menu">
						<a href="javascript:void(0);"  class="current" id="terminal_manage">产品维护</a><!-- 点击后是<ul id="step2">的内容显示 -->
					</div>         
				</div>    
				<div class="clear"></div> 
       		</div>
			
			<div id="step_terminal">
				<!-- 第2层标题 -->
				<div class="detail_white">
					<div class="line_red_top"></div>
					<div id ="select">
						<div class="handle">
							<div class="handle_btn_left handle_btn_left_clicked" id="commodity_up">
								<a href="javascript:void(0)" onclick="">产品上架</a>
							</div>
							<div class="handle_btn_right " id="commodity_down"><a href="javascript:void(0)">产品下架</a></div>
						</div>				
					</div>       
					<div class="clear"></div>
				</div>
			  
				<!-- 点击商品上架时显示——，第3层(默认显示)，含四小层    上左右下层-->
				<div class="info" id="content_up">
					<div class="detail_white">
						<!-- 1商品选择 -->
						<div class="detail_white" id="goodSelect"><!--style="display: none" height: 400px;-->
						<!-- 标题层 -->
						<div class="title_tab">        
							<span class="text_large24" id="title2" style="font-size:20px;color:#080808">1 选择</span>
						</div>
						
						<div class="padding_blank10"></div>
						<!-- 内容层 -->
						<div>
							<!-- 最左边垂直空白层 -->
							<div class="left_blank_vertical" style="float:left;display:block;width:30px;height:330px"></div>
							<!-- 左边，分三个内容层 -->
							<div class="leftClass" style="float:left;width:400px;">
								<!-- 选择上架活动 -->
								<div class="firstClass" style="height:150px;">
								   <div style="float:left;font-size:15px;color:#080808;font-weight:bold;width:150px">
										<span style="float:left;">请选择上架的分类</span>
								   </div>
								   <div style="float:left;margin-left:10px">
										<select id="type_section" name="type_section"  onchange="typeChange()" style="width: 155px">											
											<option value="0">快速业务办理</option>
											<option value="1">TOP热销</option>
										</select>
								   </div>
								</div>
								
								<!-- 选择上架场景-->
								<div class="secendClass" style="height:70px;">
								   <div style="float:left;font-size:15px;color:#080808;font-weight:bold;width:150px">
										<span style="float:left;">请选择上架场景</span>
								   </div>
								   <div style="float:left;margin-left:10px">
										<select id="scene_type" name="scene_type"  style="width: 155px">
										   <option value=""></option>
										
										   </select>
								   </div>
								</div>
								<div class="secendClass" style="height:70px;">
			                         <div style="float:left;font-size:15px;color:#080808;font-weight:bold;width:150px">
			                             <span style="float:left;">所属部门：</span>			                           			                           
			                        </div>                    
			                         <div style="float:left;margin-left:0px"> 
			                          <input type="text" id="dept_select" placeholder=""  readOnly="true" ></input>                    	
			                            <a href="javascript:void(0)" onClick="showdiv('dept_Tree');">
			                                <div class="input_button"><span>选择</span></div>
			                                
			                            </a>
			                             <a href="javascript:void(0)" onClick="getDeptList('');">			                            
			                              <div class="input_button"><span>查询</span></div>
			                           </a>
			                        </div>
                       
                              
						            </div>
								
							</div>
						
							<!-- 右边的层  产品选择 -->
							<div class="rightClass" style="float:left;width: 400px;height:300px">
								<div style="float:left;font-size:15px;color:#080808;font-weight:bold;">
									<div>上架产品</div>
								</div>
								<div id="phoneList" style="float:left;margin-left:10px;height:300px;width: 300px;border:1px solid #cccccc;overflow-y:auto; overflow-x:hidden">
									<ul id="phoneLis_select">
										<li class="list">
											<input type="checkbox" name="phoneList" value="1" disabled="disabled" style="font-size:15px;color:#cccccc;display: none;">
												<div style="display: none;"></div>
											</input>
										</li>
									</ul>
								</div>
								<div class="clear"></div>
							</div>
							<div class="clear"></div>
						</div>
				
						<!-- 下一步按钮 -->
						<div class="next_step">
							<div class="ok" id="commit_up"><a  href="javascript:void(0)">下一步</a></div>
						</div>
						<div class="clear"></div>
					</div>
					
						<!-- 2 商品信息确认 -->
						<div class="detail_white" id="goodOk" style="display: none"><!-- style="display: none" -->
							<!-- 标题层 -->
							<div class="title_tab">       
								<span class="text_large24" id="title2" style="font-size:20px;color:#080808">2 信息确认</span>
							</div>
							<div class="padding_blank10"></div>
							<!-- 主体内容层 -->
							<!-- <div>-->
								<!-- 最左边垂直空白层
								<div class="left_blank_vertical" style="float:left;display:block;width:30px;height:300px"></div>-->
								<!-- 显示已选信息 -->
								<div id="selectedMes"><!-- style="height: 500px;" -->
									<!-- 左边的层 -->
									<div class="leftClass" style="float:left;width:400px;">
										<!-- 已选类型 -->
										<div class="firstClass" style="font-size:15px;color:#080808;height:50px;"><!-- style="height:150px;" -->
										   <div style="float:left;font-weight:bold;width:150px">
												<span style="float:right;">已选择类型:</span>
										   </div>
										   <div style="float:left;margin-left:10px">
										   		<input id="type_ed" style="border:none"></input>
										   </div>
										</div>
										<!-- 已选择场景 -->
										<div style="font-size:15px;color:#080808;height:100px;"><!-- style="height:150px;" -->
										   <div style="float:left;font-weight:bold;width:150px">
												<span style="float:right;">已选产品:</span>
										   </div>
										   <div style="float:left;margin-left:10px;margin-left:10px;height:150px;width: 150px;border:1px solid #cccccc;overflow-y:auto; overflow-x:hidden">
										   		<ul id="producted">
										   			<li>1.金立手机</li>
										   		</ul>
										   </div>
										</div>
									</div>
									<!-- 右边的层 -->
									<div class="rightClass" style="float:left;width: 400px;">
										<!-- 已选择终端 -->
										<div style="font-size:15px;color:#080808;height:50px;"><!-- style="height:150px;" -->
										   <div style="float:left;font-weight:bold;width:120px;">
												<span style="float:left;">已选择场景:</span>
										   </div>
										   <div style="float:left;margin-left:10px">
										   		<input id="scene_type_ed" style="border:none"></input>
										   </div>
										</div>
										<!-- 部门 -->
										<div id="autoRang" style="font-size:15px;color:#080808;">
										   <div style="float:left;font-weight:bold;width:120px">
												<span style="float:left;">已选择部门:</span>
										   </div>
										   <div style="float:left;margin-left:10px;" id="depted">
										   		
										   </div>
										</div>
									</div>
									<div class="clear"></div>
								</div>
								<div class="padding_blank10"></div>
								<!-- 机型展示及快速办理所配置的内容，显示手机图片 -->
								<div style="margin-left: 30px;">
									<div style="font-size:15px;color:#080808;font-weight:bold;">机型展示及快速办理所配置的内容：</div>
									<div style="height:250px;width:800px;border:1px solid #cccccc;overflow-y:hidden; overflow-x:auto">
										<table>
											<tr id="phoneImgShow">
												<td style="width:380px;">
													<div style="float:left;border-left: 1px dashed #080808;width:380px;">
														<!-- 图片显示 -->
														<div class="img" style="float:left;height:200px;width:100px;margin:5px 5px 5px 10px;border:1px solid #cccccc">
															<div><img id="img" src="" style="height:190px;width:90px;" /></div>
															<div style="float:left;"><span>机型名称</span></div>
														</div>
														<!-- 内容显示 -->
														<div class="content" style="float: left;margin:0 10px 0 10px;width:300px;">
															<div style="font-size:14px;color:#080808;font-weight:bold;">活动描述：</div>
															<div id="desc" style="height:100px;width:200px;border:1px solid #cccccc;">具体内容显示</div>
															<div style="font-size:14px;color:#080808;font-weight:bold;">添加个性说明：</div>
															<textarea name="personDesc" style="width:100px;height:30px;">这里写内容</textarea>
														</div>
														<div class="clear"></div>
													</div>
												</td>
											</tr>	
										</table>
									</div>
									<div class="clear"></div>
								</div>
								
								<div class="padding_blank10"></div>
								<!-- 确定按钮 -->
								<div class="next_step">
									<div class="ok"><a id="step2" href="javascript:void(0)">完成</a></div>
								</div>
							<!-- </div>-->
							
							<div class="clear"></div>
						</div>
					
					</div>
				<div class="clear"></div>
			</div>
		
		<!-- 点击商品下架时显示，第3层(默认显示)，含四小层    上左右下层-->
		<div class="info" id="content_down" style="display: none">
			<div class="detail_white">
				<!-- 标题层 -->
				<div class="title_tab">        
					<span class="text_large24" id="title2" style="font-size:20px;color:#080808">下架处理</span>
				</div>
				<div class="padding_blank10"></div>
					<!-- 主体内容层 -->
					<!-- <div>-->
					<!-- 显示已选择的上架信息 -->
					<div id="selectedUpMes"><!-- style="height: 500px;" -->
						<!-- 左边的层 -->
						<div class="leftClass" style="float:left;"><!-- width:450px; -->
							<!-- 需下架活动 -->
							<div class="firstClass" style="font-size:15px;color:#080808;"><!-- style="height:150px;" -->
								<div style="float:left;font-weight:bold;margin-left:30px;">
									<span style="float:right;">请选择需要下架类型:</span>
								</div>
								 <div style="float:left;margin-left:10px">
										<select id="down_type_section" name="down_type_section"  onchange="typeChangeDown()" style="width: 155px">											
											<option value="0">快速业务办理</option>
											<option value="1">TOP热销</option>
										</select>
								   </div>
								<div class="clear"></div>
							</div>
							<div class="padding_blank10"></div>
							<!-- 需下架终端 -->
							<div style="font-size:15px;color:#080808;margin-left:30px;"><!-- style="height:150px;" -->
							   <div style="float:left;font-weight:bold;">
									<span style="float:right;">请选择需要下架的场景:</span>
							   </div>
							  <div id="scenetype_Down" style="float:left;margin-left:10px;font-size:12px;height:200px;width: 250px;border:1px solid #cccccc;overflow-y:auto; overflow-x:hidden">
									<ul id="scenetypeDown">
										<li class="list" style="font-size:15px;">
											<input name="downActed" type="radio" value="" style="display: none;"></input><!-- 单选按钮 -->
										</li>
									</ul>	
								</div>
							   <div class="clear"></div>
							</div>														
							<div class="clear"></div>
						</div>
						<!-- 右边的层 -->
						<div class="rightClass" style="float:left;margin-left:30px;">
							<!-- 需下架的机型 -->
						   <div style="float:left;font-size:15px;color:#080808;font-weight:bold;">
								<div>需下架的产品</div>								
						   </div>
						   <div id="downPhoneList" style="float:left;margin-left:10px;height:230px;width: 250px;border:1px solid #cccccc;overflow-y:auto; overflow-x:auto">
								<ul id="phoneedDown" style="font-size:15px;">
									<li class="list">
										<input type="checkbox" name="downPhoneList" value="1" onclick="" style="display: none;">
											
										</input>
									</li>
								</ul>
							</div>
							<div class="clear"></div>
						</div>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
					</div>
					<div class="padding_blank10"></div>
					<!-- 机型展示及快速办理所配置的内容，显示手机图片 -->
					<div style="margin-left: 50px;">
						<div style="font-size:10px;color:red;font-weight:bold;font-family:微软雅黑,宋体;">勾选右上方的勾后下方的产品打岔显示</div>
						<div style="height:250px;width:830px;border:1px solid #cccccc;overflow-y:hidden; overflow-x:auto">
							<table>
								<tr id="phoneImgDownShow">
									<td style="width:380px;">
										<div style="float:left;border-left: 1px dashed #080808;width:380px;">
											<!-- 图片显示 -->
											<div class="img" style="float:left;height:200px;width:100px;margin:5px 5px 5px 10px;border:1px solid #cccccc;display: none;">
												<div><img id="img" src="" style="height:190px;width:90px;" /></div>
												<div style="float:left;"><span>机型名称</span></div>
											</div>
											<!-- 内容显示 -->
											<div class="content" style="float: left;margin:0 10px 0 10px;width:300px;display: none;">
												<div style="font-size:14px;color:#080808;font-weight:bold;">活动描述：</div>
												<div id="desc" style="height:100px;width:200px;border:1px solid #cccccc;">具体内容显示</div>
												<div style="font-size:14px;color:#080808;font-weight:bold;">添加个性说明：</div>
												<textarea name="personDesc" style="width:100px;height:30px;">这里写内容</textarea>
											</div>
											<div class="clear"></div>
											<img id="coverImg" src="<%=fullPath%>images/delete_ql.png" style="z-index: 3; position: absolute; top: 0px;display: none;"/>
										</div>
									</td>
								</tr>	
							</table>
						</div>
						<div class="clear"></div>
					</div>
					
					<div class="padding_blank10"></div>
						<!-- 完成按钮 -->
						<div class="next_step">
						<div class="ok"><a id="step" href="javascript:void(0)" onclick="downDeal();">完成</a></div>
					</div>
						<!-- </div>-->
						
					<div class="clear"></div>
				</div>
				
			<div class="clear"></div>
		</div><!-- 商品下架end -->
			
		</div>
		</div>
		</div>
	 </div>
	</div>
  	
	<!-- 遮盖层 -->
	<div class="bg_mask" id="bg_mask">
	<iframe class="bg_mask_iframe"> </iframe>
    </div>
	<!-- 弹出窗口 商品上架点击"下一步"的提示 begin -->
	<div class="pop_win" id="next1" style="display:none;border:1px solid #d5d5d5;width: 180px;">
   		<div class="padding_blank"></div>
   		<div class="bold" style="text-align:center;">是否确认？</div>
   		<div class="padding_blank"></div>
   		<div class="input_button" id="next1_ok" style="float: left;margin-left: 10px;">确 定</div></a> 
    	<div class="input_button" id="next1_cancel" style="float: left;margin-left: 10px;">返回</div></a>
    </div>
	<!-- 弹出窗口 商品上架点击"下一步"的提示 end -->
	
	<!-- 弹出窗口 商品上架点击"完成"的提示 begin  -->
	<div class="pop_win" id="next2" style="display:none;border:1px solid #d5d5d5;width: 180px;">
   		<div class="padding_blank"></div>
   		<div class="bold" style="text-align:center;width: 170px;">处理成功</div>
   		<div class="padding_blank"></div>
   		<div class="input_button" id="up_ok" style="margin-left: 50px">确 定</div></a> 
    </div>
	<!-- 弹出窗口 商品上架点击"完成"的提示 end -->
	
	<!-- 弹出窗口 商品下架点击"完成"的提示 begin -->
	<div class="pop_win" id="next_down" style="display:none;border:1px solid #d5d5d5;width: 180px;">
   		<div class="padding_blank"></div>
   		<div class="bold" style="text-align:center;width: 170px;">处理成功</div>
   		<div class="padding_blank"></div>
   		<div class="input_button" id="down_ok" style="margin-left: 50px">确 定</div></a>
    </div>
	<!-- 弹出窗口 商品下架点击"完成"的提示 end -->
	 
	<!-- 弹出窗口部门选择： -->
<div class="pop_win" id="dept_search" style="display:none;">
    <div class="msgbox">
    	<a href="javascript:hidediv('dept_search');"><div class="msgbox_close"></div></a>
        <ul class="text_big">
            <li><span class="bold">部门查询</span></li>
        </ul>
            <div class="band_phone_small">
                <input type="text" class="search_input_small" placeholder="输入部门名称模糊查询" id="dept_searchInput"></input>
                <a href="javascript:void(0)"><div class="input_button" id="searchdept_search">搜  索</div></a>
            </div>
        <div class="scroll_v" style="position:relative;">
         
		<ul id="dept_list"> 
	          <li class="list" style="*display:inline;">
                 <div class="order_row">
                   <div class="order_cell" style="width:100px;">部门名称</div>                                               
                   <div class="order_cell" style="width:160px;">部门编码</div>
                     <div class="order_cell" style="width:100px;"></div>                      
                 </div>
                </li>
                <li class="list" style="*display:inline;">
                     <div class="order_row white_bgcolor">
                     <div class="order_cell white_bgcolor" style="width:100px;"></div>                               
                     <div class="order_cell white_bgcolor" style="width:160px;"></div>
                     <div  class="order_cell white_bgcolor" style="width:100px;">
                        <input name="localnet_search_check" type="radio"></input>
                    </div>
                     </div>
               </li>                  
            
        </ul>
        </div>
        <div class="line_dashed_h"></div>
		<ul>
         <li class="center">
        <a href="javascript:void(0)" onClick="deptConfirm();"><div class="input_button">确 定</div></a> 
       	<a href="javascript:void(0)" onClick="deptBack('dept_search');"><div class="input_button">返回</div></a>    		
        </li></ul>      
           
    </div>
</div>
<!-- 部门树形弹出窗口部门选择： -->
<div class="pop_win" id="dept_Tree" style="display:none;">
  <div style="margin:0 auto; width:auto; max-width:auto;min-height:auto; background:#FFF; position:relative; padding:0px;">
  <div class="msgbox_close" onClick="deptBack('dept_Tree');"></div>
   
      <ul class="text_big">
      <li><span class="bold">部门列表</span></li>
      </ul>
    <ul>     
	    <li>
			<div style="width:90%; min-height:300px; max-height:300px; margin-left:15px; padding:10px 5px; border:1px solid #cccccc; background-color:white; display:inline-block; vertical-align:top; overflow:auto;">
			   <div class="ztree" id="ztree_dept_div">
				</div>
			</div>
		</li>
	</ul>
	
	 <div class="line_dashed_h"></div>
	<ul>
	
    <li class="center">
  	<a href="javascript:void(0)" onClick="deptBack('dept_Tree');"><div class="input_button">返回</div></a>    		
    </li>
    </ul>  
</div>
</div>	
	<input type="hidden" id="province_code"  value="${province_code}"/><!--省份标识 --> 
	
	
</body>
</html>