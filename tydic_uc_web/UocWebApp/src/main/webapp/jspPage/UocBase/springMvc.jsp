<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>服务订单环节关系维护</title>
	<script type="text/javascript" src="../js/common/WebUtil.js"></script> 
    <script type="text/javascript" src="../js/jquery-easyui-1.3.5/jquery.min.js"></script>   
    <script type="text/javascript" src="../js/jquery-easyui-1.3.5/jquery.easyui.min.js"></script>   
    <script type="text/javascript" src="../js/jquery-easyui-1.3.5/locale/easyui-lang-zh_CN.js"></script>   
    
    <link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.3.5/themes/default/easyui.css" />   
    <link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.3.5/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.3.5/demo/demo.css">
     
    
</head>
<body>
	<table id="test"></table>
	
	
	<div id='tb' style="padding:5px;">
	   <table style="padding:0 0 0 7px;">
	     <tr>
	       <td> 业务名称A:  </td>
	       <td> <input id="oper_code_a" class="easyui-textbox" style="width:70px">  </td>
	       <td> 业务名称B:  </td>
	       <td> <input id="oper_code_b" class="easyui-textbox" style="width:70px">  </td>
	       <td> 环节A:  </td>
	       <td> <input id="tache_code_a" class="easyui-textbox" style="width:70px">  </td>
	       <td> 环节B:  </td>
	       <td> <input id="tache_code_b" class="easyui-textbox" style="width:70px">  </td>
	       <td> <a href="#" class="easyui-linkbutton" iconcls="icon-search" onclick="obj.qry();">查询</a>  </td>  
	       <td><a href="#" class="easyui-linkbutton" plain="true" iconcls="icon-add" onclick="obj.add();">增加</a></td>
	       <td><a href="#" class="easyui-linkbutton" plain="true" iconcls="icon-save" onclick="SaveRow();">保存</a></td>
	       <td><a href="#" class="easyui-linkbutton" plain="true"iconcls="icon-remove" onclick="obj.del();">删除</a></td>
	     </tr>   
	   </table>	
	<div>
	
	<script type="text/javascript">
	var newcolumnsFlag=0;
	var dataForDatagrid;
	var currentPageSize=5;
	var currentPageNo=1;
	var totalResults;
	function getData(){
		$('#test').datagrid("loading");	
		var json_info = "{\"pageNo\":"+ currentPageNo+",\"pageSize\": "+currentPageSize +",\"param\": {\"1\":\"1\"";
		if($('#oper_code_a').val()!=null){
			json_info +=",\"oper_code_a\": \""+$('#oper_code_a').val()+"\"";
		}
		if($('#oper_code_b').val()!=null){
			json_info +=",\"oper_code_b\": \""+$('#oper_code_b').val()+"\"";
		}
		if($('#tache_code_a').val()!=null){
			json_info +=",\"tache_code_a\": \""+$('#tache_code_a').val()+"\"";
		}
		if($('#tache_code_b').val()!=null){
			json_info +=",\"tache_code_b\": \""+$('#tache_code_b').val()+"\"";
		}
		 json_info +="}}";
	 $.ajax({
         type: "post",
         url: URLS.URL_API_HOST+"rest/ordModServiceRest/getOrdModTacheRule",
         contentType: "application/x-www-form-urlencoded; charset=utf-8",
         async:true,
         data: {
        	 jsession_id:"555555555555555555",
        	 oper_type:"103",
        	 json_info: json_info
         },
         dataType: "json",
         success: function(data){
        	 if(data.args.json_info.ordModTacheRule!=null&&data.args.json_info.ordModTacheRule.length>0){
        		newcolumnsFlag=0;
	     		$('#test').datagrid("loadData",data.args.json_info.ordModTacheRule);	
	     		$('#test').datagrid("loaded");	
	     		totalResults =  data.args.json_info.totalNume;
	     		 var pager = $("#test").datagrid("getPager"); 
	     		      pager.pagination({
	     			   pageNumber:currentPageNo,
	     		        total:totalResults,
	     		        onSelectPage:function (pageNo, pageSize) { 
	     		         currentPageNo=pageNo;
	     				 currentPageSize = pageSize;
	     				 getData();	
	     		        } 
	     		      }); 
        	 }    },
         error:function(data)
         {
        	 alert('查询失败');
         }
     });	
	}

	$(function(){
		$('#test').datagrid({
			width:1138,
			height:497,
			fitColumns:true,
			rownumbers:false,
			singleSelect:true,
			columns:[[
						/*{field:'action',title:'',width:5,align:'center'},*/
			         	{field:'tache_code_a',title:'环节A',sortable:"true",width:50,editor:'text'},
						{field:'province_code',title:'省份',sortable:"true",width:50,editor:'text'},    
						{field:'area_code',title:'地域',width:50,editor:'text'},
						{field:'tache_code_b',title:'环节B',width:50,editor:'text'},
						{field:'id',title:'id',hidden:'true'}
						
			]],
			onSelect:function(index,row){
				if(newcolumnsFlag==1){
					var rows = $('#test').datagrid('getRows');
					if(index!=rows.length-1){//选择某一行时，删除新增未保存的尾行
						$('#test').datagrid('deleteRow', rows.length-1);
						newcolumnsFlag = 0;
						
						 totalResults--;
                    	 /*删除后刷新分页数据*/
                    	 var pager = $("#test").datagrid("getPager"); 
         	     		      pager.pagination({
         	     			   pageNumber:currentPageNo,
         	     		        total:totalResults,
         	     		        onSelectPage:function (pageNo, pageSize) { 
         	     		         currentPageNo=pageNo;
         	     				 currentPageSize = pageSize;
         	     				 getData();	
         	     		        } 
         	     		      }); 
					}
					
				}
				/*选择某一行时，其他行的保存按钮隐藏*/
				var rowAll = $('#test').datagrid('getRows');
				for(j=0;j<rowAll.length;j++){
					//rowAll[j]['action'] = '';	
					$('#test').datagrid('refreshRow', j);
				}
				if(newcolumnsFlag ==1){/*选择新增行时，初始化数据*/ 
					row['tache_code_a'] ="";
					row['tache_code_b'] ="";
					row['province_code'] ="";
					row['area_code'] ="";
					row['id'] ="";				
				}
				/*row['action'] = '<a href="#" onclick="SaveRow()">保存</a>';*/	
				$('#test').datagrid('refreshRow', index);
				$('#test').datagrid('beginEdit', index);/*开启编辑模式*/
		    },
		  
			toolbar:'#tb',
			pagination:true,
			pageSize:5,
			pageList :[5,10,20]
		});
		setTimeout("getData()",100);
	  	
		obj={
		
				qry:function(){
					getData();
				},
				add:function(){
					if(newcolumnsFlag==0){
						newcolumnsFlag = 1;
						$('#test').datagrid('appendRow',{});/*尾部新增一行*/
						
						 totalResults++;
                    	 /*新增后刷新分页数据*/
                    	 var pager = $("#test").datagrid("getPager"); 
         	     		      pager.pagination({
         	     			   pageNumber:currentPageNo,
         	     		        total:totalResults,
         	     		        onSelectPage:function (pageNo, pageSize) { 
         	     		         currentPageNo=pageNo;
         	     				 currentPageSize = pageSize;
         	     				 getData();	
         	     		        } 
         	     		      }); 
						
						var rows = $('#test').datagrid('getRows');
						$('#test').datagrid('selectRow', rows.length-1);/*直接选择新增行，触发onSelect事件，进入编辑模式*/
					}	
				},
				del:function(){					
					DelRow();
				}
				
		}
		
		
	});
	
	function SaveRow(){/*保存按钮事件*/
		var row = $('#test').datagrid('getSelected');
        if (row) {       
        	var rowIndex = $('#test').datagrid('getRowIndex', row);
            var oper_type="";
            var json_info ="";
            $('#test').datagrid('endEdit', rowIndex);
            //row['action'] = "";	/*隐藏保存按钮*/
            $('#test').datagrid('refreshRow', rowIndex);
            if(newcolumnsFlag==1){/*新增数据*/
              newcolumnsFlag = 0;
              oper_type= "100";
              json_info = "{\"ordModTacheRule\":[{\"tache_code_a\": \""+row['tache_code_a']+"\",\"tache_code_b\": \""+row['tache_code_b']+"\",\"province_code\": \""+row['province_code']+"\",\"area_code\": \""+row['area_code']+"\"}]}";             	
            }else{/*修改数据*/
              oper_type= "101";
              json_info = "{\"ordModTacheRule\":[{\"id\": \""+row['id']+"\",\"tache_code_a\": \""+row['tache_code_a']+"\",\"tache_code_b\": \""+row['tache_code_b']+"\",\"province_code\": \""+row['province_code']+"\",\"area_code\": \""+row['area_code']+"\"}]}";             	
            }
           
           	var data= {
               	 jsession_id:"555555555555555555",
               	 oper_type:oper_type,
               	 json_info: json_info
                };
           	var str = JSON.stringify(data);
           	console.info("str="+str);
           	
           	$.ajax({
                type: "post",
                url: URLS.URL_API_HOST+"rest/ordModServiceRest/operateOrdModTacheRule",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                async:true,
                data:data,
                dataType: "json",
                success: function(data){    
                	if(newcolumnsFlag==1){
                		
	                	if(data.args.json_info.ordModTacheRule!=null&&data.args.json_info.ordModTacheRule.length>0){/*需要保存返回的ID，用于修改跟删除*/
	                		var id =  data.args.json_info.ordModTacheRule[0].id;
	                		row['id'] =id;
	                	}
                	}
                 },
                error:function(data)
                {
                	$('#test').datagrid('beginEdit', rowIndex); 
                	alert('保存失败');
                	 
                }
            });	
        }
        
		
	}
	
	function DelRow(){/*删除一行*/
		var row = $('#test').datagrid('getSelected');
        if (row) {       
        	var rowIndex = $('#test').datagrid('getRowIndex', row);
            var json_info = "{\"ordModTacheRule\":[{\"id\": \""+row['id']+"\",\"tache_code_a\": \""+row['tache_code_a']+"\",\"tache_code_b\": \""+row['tache_code_b']+"\",\"province_code\": \""+row['province_code']+"\",\"area_code\": \""+row['area_code']+"\"}]}";             	
           	var data= {
               	 jsession_id:"555555555555555555",
               	 oper_type:"102",
               	 json_info: json_info
                };
           	var str = JSON.stringify(data);
           	console.info("str="+str);
           	
           	$.ajax({
                type: "post",
                url: URLS.URL_API_HOST+"rest/ordModServiceRest/operateOrdModTacheRule",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                async:true,
                data:data,
                dataType: "json",
                success: function(data){
                	 $('#test').datagrid('deleteRow', rowIndex);
                	 totalResults--;
                	 /*删除后刷新分页数据*/
                	 var pager = $("#test").datagrid("getPager"); 
     	     		      pager.pagination({
     	     			   pageNumber:currentPageNo,
     	     		        total:totalResults,
     	     		        onSelectPage:function (pageNo, pageSize) { 
     	     		         currentPageNo=pageNo;
     	     				 currentPageSize = pageSize;
     	     				 getData();	
     	     		        } 
     	     		      }); 
			            if(newcolumnsFlag==1){
							newcolumnsFlag = 0;
						}
                 },
                error:function(data)
                {
                	$('#test').datagrid('beginEdit', rowIndex); 
                	alert('保存失败');
                	 
                }
            });	
        }
        
		
	}
	
	
	

    </script>


</body>

</html>