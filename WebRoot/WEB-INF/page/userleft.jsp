<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC
"-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>计科2班</title>
<script type="text/javascript">
  var flag = false;
  function yh(){
  	if(flag) {
  	  document.getElementById("yh").style.display="none";
  	  flag = false;
  	}else {
  	  document.getElementById("yh").style.display="block";
  	  flag = true;
  	}
  }
</script>
</head>

<body style="font-family:'微软雅黑';font-size:12px;color:#FAFAD2">
  <s:set name="user" value="#session.login"/>
  <s:if test="user.role">
  <div style="background-color:#8B4513;padding-left:5px;padding-right:5px;height:24px">
      <div style="float:left">高级管理</div>
      <div style="float:right">[<a href="javascript:" onclick="yh()">+</a>]</div>
  </div>
  <div id="yh" style="text-align:center;padding:10px;background-color:#8B4513;display:none">
    <input type="button" value="全部用户查询" onclick="location.href='user.html?off=0'"/><br/><br/>
    <input type="button" value="违约用户查询" onclick="location.href='user.html?off=3'"/><br/><br/>
  </div>
  </s:if>
</body>
</html>
