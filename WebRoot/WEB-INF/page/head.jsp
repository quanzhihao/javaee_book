<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC
"-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<title>计科2班</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="http://fonts.googleapis.com/css?family=Ruthie" rel="stylesheet" type="text/css" />
</head>
<body style="font-family:'微软雅黑';background-image:url(./images/zhuce.png)">
<div id="wrapper">
	<div id="wrapper-bgtop">
		<div id="wrapper-bgbtm">
			<div id="header" class="container">
				<div id="logo">
					<h1><a href="#"> library</a></h1>
					
					<p>My books</p>
			
				</div>
				<div id="menu">		
				</div>
      
			<div style="width:898px;height:120px;">
			
  
				 
			</div>
			<div>&nbsp;</div>
<s:set name="user" value="#session.login"/>
     
    <div style="float:left">
      <img src="images/x_03.png" onclick="location.href='start.html'" style="cursor:pointer" 
       onmouseover="this.src='images/x_033.png'" onmouseout="this.src='images/x_03.png'" />
      
    </div>
    <div style="float:left">
      <img src="images/x_04.png" onclick="location.href='lend.html'" style="cursor:pointer" 
onmouseover="this.src='images/x_044.png'" onmouseout="this.src='images/x_04.png'" />
    </div>
    
    <div style="float:left">
      <s:if test="user.role">
        <img src="images/x_07.png" onclick="location.href='user.html'" style="cursor:pointer" 
onmouseover="this.src='images/x_077.png'" onmouseout="this.src='images/x_07.png'" />
      </s:if>
      <s:else>
        <img src="images/x_07.png" onclick="location.href='reader.html'" style="cursor:pointer" 
onmouseover="this.src='images/x_077.png'" onmouseout="this.src='images/x_07.png'" />
      </s:else>
    </div>
    <div style="float:left">
      <s:if test="user.role">
        <img src="images/x_08.png" onclick="location.href='book.html'" style="cursor:pointer" 
onmouseover="this.src='images/x_088.png'" onmouseout="this.src='images/x_08.png'" />
      </s:if>
      <s:else>
        <img src="images/x_08b.png" />
      </s:else>
    </div>
    <div>
      <img src="images/x_09.png" onclick="location.href='logon.html'" style="cursor:pointer" 
onmouseover="this.src='images/lk.png'" onmouseout="this.src='images/x_09.png'" />
    </div>
				
		
  </div> 
</body>


</html>
