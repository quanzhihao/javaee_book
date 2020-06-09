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
		<jsp:include page="search.jsp" />
      </div>
      <div style="width:672px; height:380px; margin:5px; border:solid 0px #8B4513; float:left">
<!-- 借书 -->
  <form id="xx" name="xx" method="post">
    <div style="height:30px; line-height: 30px; padding-left: 5px">
      <div style="float:left;padding-right: 72px">图书信息</div>
      <div style="float:left;padding-right: 10px">ISBN&nbsp;<input type="text" name="lend.isbn"/></div>
      <div style="float:left;padding-right: 10px">书名&nbsp;<input type="text" name="lend.bookName"/></div>
      <div style="float:left;padding-right: 10px;padding-top: 5px"><input type="submit" value="借书" onclick="document.xx.action='lendbook.html';document.xx.submit();"/></div>
      <div style="padding-top: 5px"><input type="submit" value="还书" onclick="document.xx.action='returnbook.html';document.xx.submit();"/></div>
    </div>
  </form>
  
  
  
  
  
<!-- 借书 -->
        <div style="height:326px">
          <jsp:include page="lendbook.jsp" />
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
