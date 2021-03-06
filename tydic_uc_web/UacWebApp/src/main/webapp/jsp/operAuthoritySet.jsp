<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="common.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>工号权限设置</title>
	
    <link rel="stylesheet" type="text/css" href="../css/public.css" />
    <link rel="stylesheet" type="text/css" href="../css/operAuthoritySet.css" />    
    <script type="text/javascript" src="../js/common/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="../js/common/WebUtil.js"></script>
    <script type="text/javascript" src="../js/common/public.js"></script>
    <script type="text/javascript" src="../js/operAuthoritySet.js"></script>
</head>
<body>
	<div class="container">
		<div class="detail_item">
			<ul class="detail_info_body mtop15">
				<li class="line">
					<div class="width100per">
						<span class="bold mright5">工号</span>
						<span class="input_box width200">
							<input type="text" class="cs_pointer" id="accept_oper_no" no="" placeholder="请选择工号" readonly/>
						</span>
						
						<span class="bold mleft10 mright5">角色</span>
						<span class="input_box">
							<input type="text" class="cs_pointer" id="roleId" no="" placeholder="请选择角色" readonly/>
						</span>
						
						<div class="btn btn_primary mleft10" id="searchBtn">查询</div>
						<div class="btn btn_default mleft5" id="resetBtn">重置</div>
					</div>
				</li>
				<li class="line mtop5">
					<div class="width100per">
						<div class="btn btn_info mleft5" id="authorityAddBtn">新增权限</div>
					</div>
				</li>
			</ul>
		</div>
		<table class="info_list">
			<thead>
				<tr>
					<th width="20%">工号</th>
					<th width="25%">姓名</th>
					<th width="20%">角色ID</th>
					<th width="25%">角色名</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="authorityList">
				<tr>
					<td>TEST01</td>
					<td>测试角色1</td>
					<td class="text_center">
						<div class="btn btn_link" name="delBtn">删除</div>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="pagination">
			<span class="mright10">共<b class="mleft5 mright5" id="totalCount">0</b>条</span>			
			<!-- <span class="input_box width40" >
				<select id="pageSize" value="">
					<option value="5">5</option>
					<option value="10">10</option>
					<option value="20">20</option>
				</select>				
			</span>
			<span class="page_turn" id="pageFirst">&lt;&lt;</span>
			<span class="page_turn" id="pageUp">&lt;</span>
			<span class="input_box width40"><input type="text" class="text_center" id="pageNo" value="1"/></span>
			<span class="page_turn" id="pageDown">&gt;</span>
			<span class="page_turn" id="pageLast">&gt;&gt;</span>
			<span class="mright10">共<b class="mleft5 mright5" id="totalPage">1</b>页</span>	
			<div class="btn btn_default mleft25" id="exportBtn">导出</div> -->
		</div>
	</div>
	<!-- 新增权限-模态框 -->
	<div class="modal_layer" belong="mask" id="authorityAddModal">
		<div class="bg_cover"></div>
		<div class="modal_box">
			<div class="modal_top">
				<span class="modal_title">新增权限</span><span class="modal_close">x</span>
			</div>
			<div class="modal_middle">
				<div class="detail_item">
					<ul class="detail_info_body mtop15">
						<li class="line">
							<div class="width100per">
								<span class="bold mright5">工号</span>
								<span class="input_box width200">
									<input type="text" class="cs_pointer" id="modal_accept_oper_no" no="" placeholder="请选择工号" readonly/>
								</span>
								
								<span class="bold mleft25 mright5">角色</span>
								<span class="input_box width200">
									<input type="text" class="cs_pointer" id="modalRoleId" no="" placeholder="请选择角色" readonly/>
								</span>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="modal_bottom">
				<div class="btn btn_primary" id="authorityAddConfirmBtn">保 存</div>
				<div class="btn btn_default mleft10" id="authorityAddCancelBtn">取 消</div>
			</div>
		</div>
	</div>
	<!-- 工号-模态框 -->
	<div class="modal_layer" belong="mask" id="acceptOperNoModal">
		<div class="bg_cover"></div>
		<div class="modal_box">
			<div class="modal_top">
				<span class="modal_title">工号</span><span class="modal_close">x</span>
			</div>
			<div class="modal_middle" style="margin-top:0;">
				<div class="detail_last_item">
					<ul class="detail_info_body">
						<li class="line">
							<div class="width100per text_center">
								<span class="input_box width150"><input type="text" id="accept_oper_no_search" placeholder="请输入姓名进行搜索"/></span>
								<div class="btn btn_primary mleft10" id="acceptOperNoSearchBtn">查询</div>
							</div>
						</li>
						<li class="line">
							<div class="option_box" type="radio" id="acceptOperNoList">
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="modal_bottom">
				<div class="btn btn_primary" id="acceptOperNoConfirmBtn">确 定</div>
				<div class="btn btn_default" id="acceptOperNoCancelBtn">取 消</div>
			</div>
		</div>
	</div>
	<!-- 角色-模态框 -->
	<div class="modal_layer" belong="mask" id="ruleModal">
		<div class="bg_cover"></div>
		<div class="modal_box">
			<div class="modal_top">
				<span class="modal_title">角色</span><span class="modal_close">x</span>
			</div>
			<div class="modal_middle" style="margin-top:0;">
				<div class="detail_last_item">
					<ul class="detail_info_body">
						<!-- <li class="line">
							<div class="width100per text_center">
								<span class="input_box width150"><input type="text" id="target_depart_no_search" placeholder="请输入部门进行搜索"/></span>
								<div class="btn btn_primary mleft10" id="targetDepartNoSearchBtn">查询</div>
							</div>
						</li> -->
						<li class="line">
							<div class="option_box" type="radio" id="modalRoleList">
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="modal_bottom">
				<div class="btn btn_primary" id="ruleModalConfirmBtn">确 定</div>
				<div class="btn btn_default" id="ruleModalCancelBtn">取 消</div>
			</div>
		</div>
	</div>
</body>
</html>