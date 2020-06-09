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
    <div style="width:115px;padding:5px;float:left;background-color:#8B4513;margin-right:1px">ISBN</div>
    <div style="width:125px;padding:5px;float:left;background-color:#8B4513;margin-right:1px">书名</div>
    <div style="width:85px;padding:5px;float:left;background-color:#8B4513;margin-right:1px">作者</div>
    <div style="width:105px;padding:5px;float:left;background-color:#8B4513;margin-right:1px">出版社</div>
    <div style="width:45px;padding:5px;float:left;background-color:#8B4513;margin-right:1px">价格</div>
    <div style="width:45px;padding:5px;float:left;background-color:#8B4513;margin-right:1px">借书人</div>
    <div style="width:76px;padding:5px;float:left;background-color:#8B4513;clean:left">借书时间</div>
    <div style="padding:5px;line-height: 60px;">
      <s:iterator value="#request.list" id="lend">
        <div style="float:left;width:126px;height:60px;overflow: hidden">${lend.isbn}</div>
        <div style="float:left;width:136px;height:60px;overflow: hidden">${lend.bookName}</div>
        <div style="float:left;width:96px;height:60px;overflow: hidden">${lend.author}</div>
        <div style="float:left;width:116px;height:60px;overflow: hidden">${lend.publisher}</div>
        <div style="float:left;width:56px;height:60px;overflow: hidden">${lend.price}</div>
        <div style="float:left;width:56px;height:60px;overflow: hidden">${lend.reader}</div>
        <div style="float:left;width:76px;height:60px;overflow: hidden">${lend.lTime}</div>
      </s:iterator>
    </div>
  </div>
  <div style="background-color:#8B4513;padding-left:5px;font-size:13px;line-height:24px; text-align:right; padding-right:10px">
    <s:set name="page" value="#request.page"/>
      <a href="selectBook.html?pageNow=1&l.reader=${request.rid}" style="color:#000">首页</a>&nbsp;
      <s:if test="#page.hasPre">
        <a href="selectBook.html?pageNow=${pageNow-1}&l.reader=${request.rid}" style="color:#000">上一页</a>&nbsp;
      </s:if>
      <s:else>
        <a href="selectBook.html?pageNow=1&l.reader=${request.rid}" style="color:#000">上一页</a>&nbsp;
      </s:else>
      <s:if test="#page.hasNext">
        <a href="selectBook.html?pageNow=${pageNow+1}&l.reader=${request.rid}" style="color:#000">下一页</a>&nbsp;
      </s:if>
      <s:else>
        <a href="selectBook.html?pageNow=${page.totalPage}&l.reader=${request.rid}" style="color:#000">下一页</a>&nbsp;
      </s:else>
      <a href="selectBook.html?pageNow=${page.totalPage}&l.reader=${request.rid}" style="color:#000">尾页</a>
</body>
</html>
