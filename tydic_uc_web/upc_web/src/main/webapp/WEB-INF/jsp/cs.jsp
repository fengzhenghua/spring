<%@ page contentType="text/html; charset=GBK" session="false"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="javax.servlet.http.Cookie"%>
<%
System.out.println("KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK");
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires",0);
//һ������µ��ñ�ҳ��ֻ����ͻ��˻Ự��ʾ
Cookie[]   cookies=request.getCookies();
String csName=request.getParameter("cs_name");//�Ӳ�����õ�ǰϵͳ��jsessionid��name
if(null==csName||"".equals(csName)){//���û�У�ʹ��Ĭ��ֵ
	csName="jsessionid_uss";//��ֵӦ�����Ӧ��ϵͳ��info_sub_sys���е�jsessionid_name�ֶ�һ��
}
  //cookies��Ϊ�գ������
  if(cookies!=null)
  {
          String   tempuid_1="";
          for(int   i=0;i<cookies.length;i++)
          {
              tempuid_1=cookies[i].getName();
              if(csName.equalsIgnoreCase(tempuid_1)){
              cookies[i].setMaxAge(0);
              response.addCookie(cookies[i]);
              }
          }
  }

//�����Ҫͬ�������������session�Ļ�����Ҫ��request����CSSC=1
if("1".equals(request.getParameter("CSSC"))){
//����������˻Ự
try{
HttpSession hsession=request.getSession(false);
if(hsession!=null){
hsession.invalidate();
}else{
}
}catch(Exception e){
}
}
%>
