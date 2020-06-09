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
    <form action="start.html" method="post">
      <div style="width:200px;height:380px;border:solid 0px #8B4513; margin:5px">
        <div style="background-color:#8B4513;padding-left:5px">内容选择</div>
        <div style="margin:5px">
          <div>书名：</div>
          <div>
            <input type="text" name="books" style="width:120px"/>
            <input type="submit" value="查询" />
          </div>
          <div>${errors.book[0]}</div>
        </div>
      </div>
    </form>
  </div>
      </div>
      <div style="width:672px; height:380px; margin:5px; border:solid 0px #8B4513; float:left">
        <div style="height:356px">
<!--  -->
		  <div style="width:115px;padding:5px;float:left;background-color:#8B4513;margin-right:1px">ISBN</div>
		    <div style="width:125px;padding:5px;float:left;background-color:#8B4513;margin-right:1px">书名</div>
		    <div style="width:85px;padding:5px;float:left;background-color:#8B4513;margin-right:1px">作者</div>
		    <div style="width:105px;padding:5px;float:left;background-color:#8B4513;margin-right:1px">出版社</div>
		    <div style="width:45px;padding:5px;float:left;background-color:#8B4513;margin-right:1px">价格</div>
		    <div style="width:45px;padding:5px;float:left;background-color:#8B4513;margin-right:1px">复本量</div>
		    <div style="width:76px;padding:5px;float:left;background-color:#8B4513;clean:left">库存量</div>
		    <div style="padding:5px;line-height: 60px;">
		      <s:iterator value="#request.list" id="book">
		        <div style="float:left;width:126px;height:60px;overflow: hidden">${book.isbn}</div>
		        <div style="float:left;width:136px;height:60px;overflow: hidden">${book.bookName}</div>
		        <div style="float:left;width:96px;height:60px;overflow: hidden">${book.author}</div>
		        <div style="float:left;width:116px;height:60px;overflow: hidden">${book.publisher}</div>
		        <div style="float:left;width:56px;height:60px;overflow: hidden">${book.price}</div>
		        <div style="float:left;width:56px;height:60px;overflow: hidden">${book.cnum}</div>
		        <div style="float:left;width:76px;height:60px;overflow: hidden">${book.snum}</div>
		      </s:iterator>
		    </div>
		  </div>
		  <div style="background-color:#8B4513;padding-left:5px;font-size:13px;line-height:24px; text-align:right; padding-right:10px">
		    <s:set name="page" value="#request.page"/>
		      <a href="start.html?pageNow=1&books=${request.books}" style="color:#000">首页</a>&nbsp;
		      <s:if test="#page.hasPre">
		        <a href="start.html?pageNow=${pageNow-1}&books=${request.books}" style="color:#000">上一页</a>&nbsp;
		      </s:if>
		      <s:else>
		        <a href="start.html?pageNow=1&books=${request.books}" style="color:#000">上一页</a>&nbsp;
		      </s:else>
		      <s:if test="#page.hasNext">
		        <a href="start.html?pageNow=${pageNow+1}&books=${request.books}" style="color:#000">下一页</a>&nbsp;
		      </s:if>
		      <s:else>
		        <a href="start.html?pageNow=${page.totalPage}&books=${request.books}" style="color:#000">下一页</a>&nbsp;
		      </s:else>
		      <a href="start.html?pageNow=${page.totalPage}&books=${request.books}" style="color:#000">尾页</a>
<!--  -->
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
