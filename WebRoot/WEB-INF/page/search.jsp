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
  <div style="font-size:13px;line-height:24px; float:left">
    <form action="selectBook.html" method="post">
      <div style="width:200px;height:380px;border:solid 0px #8B4513; margin:5px">
        <div style="background-color:#8B4513;padding-left:5px">内容选择</div>
        <div style="margin:5px">
          <div>借书证号：</div>
          <div>
            <input type="text" name="l.reader" style="width:120px"/>
            <input type="submit" value="查询" />
          </div>
          <div>${errors.Read[0]}</div>
        </div>
      </div>
    </form>
  </div>
</body>
</html>
