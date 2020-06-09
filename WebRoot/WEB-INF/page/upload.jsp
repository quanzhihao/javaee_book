<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>计科2班</title>
<style type="text/css">
body {
	background-color:#F7F7F7;
	font-family: Arial;
	font-size: 14px;
	line-height:150%;
}
.main {
	background-color:#FFFFFF;
	font-size: 12px;
	color: #666666;
	width:600px;
	height:200px;
	margin:60px auto 0px;
	border-radius: 10px;
	padding:30px 10px;
	list-style:none;
	border:#DFDFDF 1px solid;
}
input{ vertical-align:middle; margin:0; padding:0}
.file-box{ position:relative;width:340px;margin:auto}
.txt{ height:22px; border:1px solid #cdcdcd; width:180px;}
.btn{ background-color:#FFF; border:1px solid #CDCDCD;height:24px; width:70px;}
.file{ position:absolute; top:0; right:80px; height:24px; filter:alpha(opacity:0);opacity: 0;width:260px }
</style>
</head>
<body style="font-family:'微软雅黑';font-size:12px;color:#FAFAD2">
<div class="main">
<div style="padding:30px;font-size:24px;text-align:center;color:#FAFAD2"">文 件 上 传</div>
<div class="file-box">
  <form action="up.html" method="post" enctype="multipart/form-data">
 <input type='text' name='textfield' id='textfield' class='txt' />  
 <input type='button' class='btn' value='浏览...' />
    <input type="file" name="upload" class="file" id="upload" size="28" onchange="document.getElementById('textfield').value=this.value" />
 <input type="submit" name="submit" class="btn" value="上传" />
  </form>
</div>
<div style="padding-left:500px;padding-top:50px"><a href="javascript:history.back(-1);">&laquo;点击返回</a></div>
</div>
</body>
</html>
