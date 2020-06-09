<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>用户注册 </title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="./css/style.css">
</head>
<body style="font-family:'微软雅黑';color:#FAFAD2">
<div class="wrap">

	<div class="banner"style="background:url(./images/zhuce.png) no-repeat 0 0;width:950px;padding-top:150px; margin-left:auto; margin-right:auto">
	
		
	
	
	  <div style="height:520px">
      <form id="zhuce" action="zzzc.html" method="post">
      <div style="width:350px;padding-top:0px; margin-left:auto; margin-right:auto">
        <div style=" font-size:30px; border-bottom: solid 1px #999; margin-bottom:10px">用户注册：</div>
        <div>密码：&nbsp;<input type="password" name="user.pass" style="width:160px; height:16px"/>&nbsp;&nbsp;<span style="color:#f00">${errors.Pass[0]}</span></div>
    	<div>重复：&nbsp;<input type="password" name="user.repass" style="width:160px; height:16px"/>&nbsp;&nbsp;<span style="color:#f00">${errors.Repass[0]}</span></div>
    	<div>名字：&nbsp;<input type="text" name="user.name" style="width:160px; height:16px"/>&nbsp;&nbsp;<span style="color:#f00">${errors.Name[0]}</span></div>
    	<div>性别：&nbsp;<input type="radio" name="user.sex" value="男" checked/>男&nbsp;<input type="radio" name="user.sex" value="女"/>女</div>
    	<div>年龄：&nbsp;<input type="text" name="user.age" style="width:160px; height:16px"/>&nbsp;&nbsp;<span style="color:#f00">${errors.Age[0]}</span></div>
    	<div>学号：&nbsp;<input type="text" name="user.sid" style="width:160px; height:16px"/>&nbsp;&nbsp;<span style="color:#f00">${errors.Sid[0]}</span></div>
    	<div>专业：&nbsp;<input type="text" name="user.szy" style="width:160px; height:16px"/>&nbsp;&nbsp;<span style="color:#f00">${errors.Szy[0]}</span></div>
    	<div>班级：&nbsp;<input type="text" name="user.cls" style="width:160px; height:16px"/>&nbsp;&nbsp;<span style="color:#f00">${errors.Cls[0]}</span></div>
    	<div>电话：&nbsp;<input type="text" name="user.tel" style="width:160px; height:16px;backgound-color:#FAFAD2" />&nbsp;&nbsp;<span style="color:#f00">${errors.Tel[0]}</span></div>
        <div>
        <a href="javascript:" onclick="document.getElementById('zhuce').submit()" style=" text-decoration:none; color:#fff; font-size:30px; line-height:50px; text-align:center; display:block; width:200px; height:50px; ; margin-top:20px; float:left">注&nbsp;册</a>
        <a href="index.html" style=" text-decoration:none; color:#fff; font-size:30px; line-height:50px; text-align:center; display:block; width:100px; height:50px; ; margin-top:20px; float:left">登&nbsp;录</a>
        </div>
      </div>
      </form>
    </div>
	
	
	
		
	</div>
	<div class="page">
		<h2></h2>
	</div>
	<div class="footer">
		
	</div>
</div>
</body>
</html>

