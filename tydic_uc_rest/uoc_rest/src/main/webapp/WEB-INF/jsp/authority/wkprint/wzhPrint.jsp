<%@ page contentType="text/html; charset=GBK" %>
<%
	String req_xml = (String)request.getAttribute("req_xml");  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<META HTTP-EQUIV="pragma" CONTENT="no-cache" />
	<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate" />
	<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT" />
	<META HTTP-EQUIV="expires" CONTENT="0" />
	<title>����ǩ��</title>
<script language="javascript">		
	window.onload = function() {
		var req_xml = '<%=req_xml%>';
		if (req_xml == '') {
			// TODO ��ȡ��ֽ��XMLʧ��
		}
		document.getElementById("data").value = req_xml;
	}

	var url, data, name;
	function wzhPrint() {
		//���Ի�����ַ
		url = 'http://10.124.8.30:8080/caseMsg/init';

		//����������ַ
		//url='http://wzh.10010.com/caseMsg/init';
		data = document.getElementById('data').value;
		name = 'usrConfirm';
		openPostWindow(url, data, name);
	}

	function openPostWindow(url, data, name) {
		var tempForm = document.createElement('form');
		document.charset = 'utf-8';
		tempForm.id = 'tempForm1';
		tempForm.method = 'post';
		tempForm.action = url;
		tempForm.target = name;

		var hideInput = document.createElement('input');
		hideInput.type = 'hidden';
		hideInput.name = 'xmlStr';
		hideInput.value = data;
		tempForm.appendChild(hideInput);

		document.body.appendChild(tempForm);

		openWindow(name);
		tempForm.submit();
		document.body.removeChild(tempForm);
	}

	function openWindow(name) {
		//���ڴ�Сȡȫ��
		var h = window.screen.availHeight;
		var w = window.screen.availWidth;
		//������������Ϊ��no����ֻ��resizable����Ϊ��yes��
		window.open('about:blank', name, 'height=' + h + ',width=' + w + ',top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=yes,location=no,status=no');
	}
</script>
</head>
<body>
	<input type="button" id="bWzhPrint" name="bWzhPrint" value="��ֽ����ӡ" onclick="wzhPrint();"/>
	<br/>
	<TEXTAREA NAME="data" ID="data" style="width:800px;height:500px">
	<WZH_UNI_TRADE_REQ> 
	  <SYSTEM_TYPE>34</SYSTEM_TYPE>  
	  <PROVINCE_CODE>34</PROVINCE_CODE>  
	  <EPARCHY_CODE>340</EPARCHY_CODE>  
	  <OP_TIME>20160120134512</OP_TIME>  
	  <ORDER_ID>1216011515863634</ORDER_ID>  
	  <ORDER_TYPE>1</ORDER_TYPE>  
	  <ORDER_PARAM1/>  
	  <ORDER_PARAM2/>  
	  <ORDER_PARAM3/>  
	  <ORDER_PARAM4/>  
	  <WORKER_NAME>������</WORKER_NAME>  
	  <WORKER_NO>wuql1</WORKER_NO>  
	  <ORG_ID>11a0134</ORG_ID>  
	  <ORG_INFO>�籨��¥Ӫҵ��</ORG_INFO>  
	  <CUST_INFO> 
	    <CERT_ADDR>��</CERT_ADDR>  
	    <CERT_CODE>3699687831665316</CERT_CODE>  
	    <CERT_END_DATE>2030-02-24 00:00:00</CERT_END_DATE>  
	    <CERT_TYPE>����</CERT_TYPE>  
	    <CONTACT>����Ӱ</CONTACT>  
	    <CONTACT_PHONE>61507211</CONTACT_PHONE>  
	    <CUST_NAME>zhangsan</CUST_NAME>  
	    <CUST_TYPE>���˿ͻ�</CUST_TYPE>  
	    <EMAIL/>  
	    <IS_NEW>1</IS_NEW>  
	    <POST_ADDRESS>��</POST_ADDRESS>  
	    <SCORE_PHO_LIST>18610278812</SCORE_PHO_LIST>  
	    <SEX>F</SEX> 
	  </CUST_INFO>  
	  <BODY_INFO> 
	    <ACCT_INFO> 
	      <ACCT_ONLY>�����ʻ�</ACCT_ONLY>  
	      <AGM_NAME/>  
	      <BANK/>  
	      <BANK_ACCT_NAME/>  
	      <BANK_ACCT_NO/>  
	      <BANK_CODE/>  
	      <CARD_ID/>  
	      <DK_NUM/>  
	      <DK_TYPE/>  
	      <IS_NEW>1</IS_NEW>  
	      <PARENT_BANK/>  
	      <PAY_MODE>�ֽ�</PAY_MODE>  
	      <PAY_NAME>3699488769294031</PAY_NAME>  
	      <START_TIME/> 
	    </ACCT_INFO>  
	    <AGENT_INFO> 
	      <AGENT_CARD_ID/>  
	      <AGENT_CARD_TYPE/>  
	      <AGENT_NAME/>  
	      <AGENT_PHONE/> 
	    </AGENT_INFO>  
	    <ASSURE_INFO> 
	      <ASSURE_CARD_ID/>  
	      <ASSURE_CARD_TYPE/>  
	      <ASSURE_NAME/>  
	      <ASSURE_PHONE/> 
	    </ASSURE_INFO>  
	    <BUSI_LIST> 
	      <BUSI_LV1> 
	        <ACTIVITY_INFO> 
	          <ACTIVITY_BUSINESS_AMOUNT/>  
	          <ACTIVITY_CODE>G333G00GW01</ACTIVITY_CODE>  
	          <ACTIVITY_EFFECT_DATE>2010-09-27 11:15:47</ACTIVITY_EFFECT_DATE>  
	          <ACTIVITY_INVALID_DATE>2899-12-31 23:59:59</ACTIVITY_INVALID_DATE>  
	          <ACTIVITY_MINIMUM/>  
	          <ACTIVITY_NAME>3G�󸶷�</ACTIVITY_NAME>  
	          <ACTIVITY_SERIAL_NUMBER/> 
	        </ACTIVITY_INFO>  
	        <BUSI_CERT_NO>3699687831665316</BUSI_CERT_NO>  
	        <BUSI_CERT_TYPE>8</BUSI_CERT_TYPE>  
	        <BUSI_CUST_NAME>zhangsan</BUSI_CUST_NAME>  
	        <BUSI_HEAD1>SP��ѯ/�˶�/����</BUSI_HEAD1>  
	        <BUSI_LV2> 
	          <BUSI_BODY2>[����Ʒ]3G-386ԪiPhone�󸶷��ײ�</BUSI_BODY2>  
	          <BUSI_HEAD2>�ײ���Ϣ</BUSI_HEAD2> 
	        </BUSI_LV2>  
	        <BUSI_PARAM1/>  
	        <BUSI_PARAM2/>  
	        <BUSI_PARAM3/>  
	        <BUSI_PARAM4/>  
	        <BUSI_TYPE_CODE>381</BUSI_TYPE_CODE>  
	        <BUSI_TYPE_NAME>SP��ѯ/�˶�/����</BUSI_TYPE_NAME>  
	        <NET_TYPE>1</NET_TYPE>  
	        <ORDER_ID>1216011515863634</ORDER_ID>  
	        <PHONE_NO>18610278812</PHONE_NO>  
	        <PRODUCT_CODE>90000017</PRODUCT_CODE>  
	        <PRODUCT_NAME>3G-386ԪiPhone�󸶷��ײ�</PRODUCT_NAME>  
	        <SPECIAL_NO_BUSINESS_AMOUNT/>  
	        <SPECIAL_NO_EFFECT_DATE/>  
	        <SPECIAL_NO_EXIST/>  
	        <SPECIAL_NO_INVALID_DATE/>  
	        <SPECIAL_NO_MINIMUM/>  
	        <SPECIAL_NO_PRESTORE/>  
	        <USER_TYPE>WCDMA-3G/4G</USER_TYPE>  
	        <ACTIVITY_INFO> 
	          <ACTIVITY_BUSINESS_AMOUNT/>  
	          <ACTIVITY_CODE>G333G00GW01</ACTIVITY_CODE>  
	          <ACTIVITY_EFFECT_DATE>2010-09-27 11:15:47</ACTIVITY_EFFECT_DATE>  
	          <ACTIVITY_INVALID_DATE>2899-12-31 23:59:59</ACTIVITY_INVALID_DATE>  
	          <ACTIVITY_MINIMUM/>  
	          <ACTIVITY_NAME>3G�󸶷��ײ�</ACTIVITY_NAME>  
	          <ACTIVITY_SERIAL_NUMBER/> 
	        </ACTIVITY_INFO>  
	        <BUSI_LV2> 
	          <BUSI_BODY2>[ȡ��]:[1]��ͨ������(��Ч����:2011-04-22,ʧЧ����:2016-01-15)[2]��˫�������(��Ч����:2011-09-27,ʧЧ����:2016-01-15)</BUSI_BODY2>  
	          <BUSI_HEAD2>������Ϣ</BUSI_HEAD2> 
	        </BUSI_LV2>  
	        <BUSI_LV2> 
	          <BUSI_BODY2/>  
	          <BUSI_HEAD2>ҵ����Ϣ</BUSI_HEAD2> 
	        </BUSI_LV2> 
	      </BUSI_LV1> 
	    </BUSI_LIST>  
	    <BUSI_NOTE/>  
	    <OP_INFO>SP��ѯ/�˶�/����</OP_INFO> 
	  </BODY_INFO> 
	</WZH_UNI_TRADE_REQ>
	</TEXTAREA>
</body>
</html>