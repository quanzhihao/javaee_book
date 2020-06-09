<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC
"-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>计科2班</title>
</head>

<body style="font-family:'微软雅黑';font-size:12px">
  <div style="background-color:#71cabf;width:898px;margin-left:auto;margin-right:auto">
    <!-- 页面头部 -->
    <div>
      <jsp:include page="head.jsp" />
    </div>
    <!-- 页面主体 -->
    <div style="height:398px;">
      <div>
		<jsp:include page="search.jsp" />
      </div>
      <div style="width:672px; height:350px; margin:5px; border:solid 0px #e9edf5; float:left">
        <div style="height:356px">
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
