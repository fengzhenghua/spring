var json_info =selectTaskInfo.json_info;
var order_no =selectTaskInfo.order_no;
var order_type =selectTaskInfo.order_type;
var cust_name=selectTaskInfo.cust_name;
var cert_no=selectTaskInfo.cert_no;
var jsession_id =commonInfo.jsession_id;
var gzt_flag =window.parent.Config.GZT_FLAG;	//国政通效验标识

$(document).ready(function() {
	if(json_info==null){
		$.message.error("未获取到json_info");
		return;
	}
	/*加载页面数据 - 测试用*/
	$('#idcardName').text(cust_name);
	$('#idcardNum').text(cert_no);
	$('#idcardAddr').text(json_info.cert_address);
	//国政通校验
	if(gzt_flag){
		gztValid();
	}
	//加载图片
	if(!INPUT_UTIL.isNull(json_info)){
		if(!INPUT_UTIL.isNull(json_info.cert_video_url)){
			$('#video_source1').attr("src",json_info.cert_video_url);
		}else{
			$("#showVideo").parent().hide();
		}
		if(!INPUT_UTIL.isNull(json_info.pic_from_guardian_url)){
			$("#showPic7").attr("src",json_info.pic_from_guardian_url);
			$('#photoBox img').attr("src",json_info.pic_from_guardian_url);
		}else{
			$("#showPic7").parent().hide();
		}
		if(!INPUT_UTIL.isNull(json_info.pic_from_person_url)){
			$("#showPic6").attr("src",json_info.pic_from_person_url);
			$('#photoBox img').attr("src",json_info.pic_from_person_url);
		}else{
			$("#showPic6").parent().hide();
		}
		if(!INPUT_UTIL.isNull(json_info.pic_guardian_url)){
			$("#showPic5").attr("src",json_info.pic_guardian_url);
			$('#photoBox img').attr("src",json_info.pic_guardian_url);
		}else{
			$("#showPic5").parent().hide();
		}
		if(!INPUT_UTIL.isNull(json_info.pic_person_url)){
			$("#showPic4").attr("src",json_info.pic_person_url);
			$('#photoBox img').attr("src",json_info.pic_person_url);
		}else{
			$("#showPic4").parent().hide();
		}
		if(!INPUT_UTIL.isNull(json_info.cert_hand_url)){
			$("#showPic3").attr("src",json_info.cert_hand_url);
			$('#photoBox img').attr("src",json_info.cert_hand_url);
		}else{
			$("#showPic3").parent().hide();
		}
		if(!INPUT_UTIL.isNull(json_info.cert_back_url)){
			$("#showPic2").attr("src",json_info.cert_back_url);
			$('#photoBox img').attr("src",json_info.cert_back_url);
		}else{
			$("#showPic2").parent().hide();
		}
		if(!INPUT_UTIL.isNull(json_info.cert_face_url)){
			$("#showPic1").attr("src",json_info.cert_face_url);
			$('#photoBox img').attr("src",json_info.cert_face_url);
		}else{
			$("#showPic1").parent().hide();
		}
	}
	//点击图片事件
	$('#thumbnailList').on('click', 'li', function(e) {
		var $this = $(this);
		if ($this.attr('type') == 'video') {
			$('#photoBox').hide();
			$('#videoBox').show();
			//video动态添加样式
			$('.video-js .vjs-tech').css('position','relative');
			$('.vjs-poster').css('display','none');
		}else{
			$('#photoBox').show();
			$('#videoBox').hide();
			$('#photoBox img').attr("src", $this.find("img").attr("src"));
		}

	});

	// 通过
	$('#livingExaPassBtn').on('click', function(e) {
		$.dialog.confirm(
				"是否激活？",
			    "提示",
			    "确认",
			    "取消",
			    function() {
					orderAct();
			    }
			);
	});

	if(commonInfo.role_type !="2"){
		$("#forceFlowBtn").hide();
	}

	$("#forceFlowBtn").on('click', function(e) {
		$.dialog.confirm(
				"是否强制流转？",
			    "提示",
			    "确认",
			    "取消",
			    function() {
					forceFlow();
			    }
			);
	});
});



//国政通
function gztValid(){

	   var  data ={
			   jsession_id:jsession_id,
			   cert_no:cert_no,
			   cust_name:cust_name,
			   serv_order_no:order_no
	    	 };
		$.ajax({
			url:commonInfo.rest_host + "rest/checkInfoRest/gztValid",
			dataType:'json',
			crossDomain: true == !(document.all),
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			type:'post',
			data:data,
			success:function(message){
				if(message.respCode !="0000"){
					$.message.error("国政通校验失败");
					return;
				}
//				var pic_path = commonInfo.rest_host + message.args.pic_path.substring(message.args.pic_path.indexOf("workspace"));
				$(".idcard_area img").attr("src", message.args.pic_path);

				// 通过
//				$('#livingExaPassBtn').on('click', function(e) {
//					orderAct();
//				});

			}
		});

}

//通过
function orderAct(){
			var data1 ={
					jsession_id :jsession_id,
					order_no :order_no,
					oper_type :"101",
					order_type:"101",
					call_type:"1",
					tache_code:selectTaskInfo.tache_code
			};

			$.ajax({
				url:commonInfo.rest_host + "rest/ArtificialTaskRest/createHandingArtificialTask",
				dataType:'json',
				crossDomain: true == !(document.all),
				contentType: "application/x-www-form-urlencoded; charset=utf-8",
				type:'post',
				data:data1,
				beforeSend: function() {
					$.loading.show("正在激活");
				},
				success:function(message){
					if(message.respCode=="0000"){
						$.dialog.alert(
								"激活成功",
								"任务",
								"返回",
								function() {
							    	window.location.href = "task.jsp?tache_code="+commonInfo.tache_code+"&role_type="+commonInfo.role_type;
							    }
						);
					}else{
						$.dialog.alert(message.content);
					}

				},
				complete:function(){
					$.loading.hide();
				}
			});
}

//强制流转 UOC0015，flow_skip填1
function forceFlow(){
	var data1 ={
			jsession_id :jsession_id,
			order_no :order_no,
			oper_type :"101",
			order_type:"101",
			flow_skip:"1",
			call_type:"1",
			tache_code:selectTaskInfo.tache_code
	};

	$.ajax({
		url:commonInfo.rest_host + "rest/ArtificialTaskRest/createHandingArtificialTask",
		dataType:'json',
		crossDomain: true == !(document.all),
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		type:'post',
		data:data1,
		beforeSend: function() {
			$.loading.show("正在激活");
		},
		success:function(message){
			if(message.respCode=="0000"){
				$.dialog.alert(
						"激活成功",
						"任务",
						"返回",
						function() {
					    	window.location.href = "task.jsp?tache_code="+commonInfo.tache_code+"&role_type="+commonInfo.role_type;
					    }
				);
			}else{
				$.dialog.alert(message.content);
			}

		},
		complete:function(){
			$.loading.hide();
		}
	});
}

