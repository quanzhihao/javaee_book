<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC
"-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>计科2班</title>
</head>

<body style="font-family:'微软雅黑';font-size:12px;color:#FAFAD2">
  <div style="background-color:#71cabf;width:898px;margin-left:auto;margin-right:auto">
    <!-- 页面头部 -->
    <div>
	  <jsp:include page="head.jsp" />
    </div>
    <!-- 页面主体 -->
    <div style="height:395px">
      <div>
  <div style="font-size:13px;line-height:24px; float:left">
      <div style="width:200px;height:380px;border:solid 0px #8B4513; margin:5px">
        <div style="background-color:#8B4513;padding-left:5px">内容选择</div>
        <div style="margin:5px">
<!--  -->
		  <jsp:include page="userleft.jsp" />
<!--  -->
        </div>
      </div>
  </div>
      </div>
      <div>
  <div style="width:672px; height:380px; margin:5px; border:solid 0px #8B4513; float:left">
  <div style="height:356px">
    <div style="height:400px">
      <form id="infor" action="gooo.html" method="post">
      <input type="hidden" value="${user.id }"/>
      <div style="width:350px;padding-top:80px; margin-left:auto; margin-right:auto">
        <div>名字：&nbsp;<input type="text" name="user.name" value="${user.name}" style="width:160px; height:16px"/>&nbsp;&nbsp;<span style="color:#f00">${errors.Name[0]}</span></div>
    	<div>年龄：&nbsp;<input type="text" name="user.age" value="${user.age}" style="width:160px; height:16px"/>&nbsp;&nbsp;<span style="color:#f00">${errors.Age[0]}</span></div>
    	<div>学号：&nbsp;<input type="text" name="user.sid" value="${user.sid}" style="width:160px; height:16px"/>&nbsp;&nbsp;<span style="color:#f00">${errors.Sid[0]}</span></div>
    	<div>专业：&nbsp;<input type="text" name="user.szy" value="${user.szy}" style="width:160px; height:16px"/>&nbsp;&nbsp;<span style="color:#f00">${errors.Szy[0]}</span></div>
    	<div>班级：&nbsp;<input type="text" name="user.cls" value="${user.cls}" style="width:160px; height:16px"/>&nbsp;&nbsp;<span style="color:#f00">${errors.Cls[0]}</span></div>
    	<div>电话：&nbsp;<input type="text" name="user.tel" value="${user.tel}" style="width:160px; height:16px"/>&nbsp;&nbsp;<span style="color:#f00">${errors.Tel[0]}</span></div>
    	<s:set name="user" value="#session.login"/>
    	<div>违约：&nbsp;<input type="text" name="user.off" value="${user.off}" <s:if test="!user.role">disabled</s:if> style="width:160px; height:16px"/>&nbsp;&nbsp;<span style="color:#f00">${errors.Off[0]}</span></div>
        <div><a href="javascript:" onclick="document.getElementById('infor').submit()" style="text-decoration:none; color:#FFF; line-height:30px; text-align:center; display:block; width:80px; height:30px; background-color:#066; margin-top:30px; margin-left:40px; float:left">修&nbsp;改</a>
        </div>
      </div>
      </form>
    </div>
  </div>
  <div style="background-color:#8B4513;padding-left:5px;font-size:13px;line-height:24px; text-align:right; padding-right:10px"></div>
  </div>
      </div>
    </div>
    <!-- 页面尾部 -->
    <div style="font-size:12px;line-height:15px;text-align:center;padding-bottom:5px;">
      计科2班
    </div>
  </div>
</body>
</html>
