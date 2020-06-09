<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC
"-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>29聂晋</title>
<script type="text/javascript">
  var flag = false;
  function ts(){
  	if(flag) {
  	  document.getElementById("ts").style.display="none";
  	  flag = false;
  	}else {
  	  document.getElementById("ts").style.display="block";
  	  flag = true;
  	}
  }
  var flag0 = false;
  function wj(){
    if(flag0) {
  	  document.getElementById("wj").style.display="none";
  	  flag0 = false;
    }else {
  	  document.getElementById("wj").style.display="block";
  	  flag0 = true;
  	}
  }
</script>
</head>

<body style="font-family:'微软雅黑'">
  <div style="font-size:13px;line-height:24px; float:left;color:#FAFAD2">
    <form action="selectBook.html" method="post">
      <div style="width:200px;height:380px;border:solid 0px #8B4513; margin:5px">
        <div style="background-color:#8B4513;padding-left:5px;color:#FAFAD2">内容选择</div>
        <div style="margin:10px">
          <div style="background-color:#8B4513;padding-left:5px;padding-right:5px;height:24px">
            <div style="float:left;color:#FAFAD2">图书管理</div>
            <div style="float:right">[<a href="javascript:" onclick="ts()">+</a>]</div>
          </div>
          <div id="ts" style="text-align:center;padding:10px;background-color:#8B4513;display:none">
            <input type="button" value="图书录入" onclick="document.xx.action='book!insert.html';document.xx.submit();"/>
            <input type="button" value="图书删除" onclick="document.xx.action='book!delete.html';document.xx.submit();"/><br/>
            <input type="button" value="图书修改" onclick="document.xx.action='book!update.html';document.xx.submit();"/>
            <input type="button" value="图书查询" onclick="document.xx.action='book!select.html';document.xx.submit();"/>
          </div>
          <div style="background-color:#8B4513;padding-left:5px;padding-right:5px;margin-top:10px;height:24px">
            <div style="float:left;color:#FAFAD2">文件管理</div>
            <div style="float:right">[<a href="javascript:" onclick="wj()">+</a>]</div>
          </div>
          <div id="wj" style="text-align:center;padding:10px;background-color:#8B4513;display:none;color:#FAFAD2">
 			  <input type="button" onclick="location.href='upload.html'" value="相关规章制度文件上传" />
          </div>
        </div>
      </div>
    </form>
  </div>
</body>
</html>
