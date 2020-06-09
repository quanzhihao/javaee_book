<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC
"-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>29聂晋</title>
</head>

<body style="font-family:'微软雅黑';font-size:12px;color:#FAFAD2">
  <div style="background-color:#71cabf;width:898px;margin-left:auto;margin-right:auto">
    <!-- 页面头部 -->
    <div>
      <jsp:include page="head.jsp" />
    </div>
    <!-- 页面主体 -->
    <form id="xx" name="xx" method="post" enctype="multipart/form-data">
    <div style="height:430px;color:#FAFAD2">
      <div>
		<jsp:include page="bookleft.jsp" />
      </div>
      <div style="width:672px; height:380px; margin:5px; border:solid 0px #e9edf5;float:left;color:#FAFAD2">
        <div style="height:356px;color:#FAFAD2">
		  <div style="background-color:#8B4513;line-height:24px;padding-left:5px;color:#FAFAD2">图书信息</div>
		  <s:if test="#request.onebook==null">
<!---->  
		  <div style="padding-top:20px;padding-left:5px;line-height:24px;float:left">
		    <div>ISBN:</div>
		    <div>书名:</div>
		    <div>出版社:</div>
		    <div>作者:</div>
		    <div>内容提要:</div>
		  </div>
		  <div style="padding-top:20px;padding-left:5px;float:left;padding-left:50px">
		    <div style="height:24px"><input type="text" name="book.isbn" style="width:200px"/></div>
		    <div style="height:24px"><input type="text" name="book.bookName" style="width:200px"/></div>
		    <div style="height:24px"><input type="text" name="book.publisher" style="width:200px"/></div>
		    <div style="height:24px"><input type="text" name="book.author" style="width:200px"/></div>
		    <div style="height:24px"><textarea name="book.summary" style="width:200px;height:100px"></textarea></div>
		</div>
		<div style="padding-top:20px;padding-left:20px;line-height:24px;float:left">
		    <div>价格:</div>
		    <div>复本:</div>
		    <div>库存:</div>
		</div>
		<div style="padding-top:20px;padding-left:5px;float:left;padding-left:50px">
		    <div style="height:24px"><input type="text" name="book.price" style="width:200px"/></div>
		    <div style="height:24px"><input type="text" name="book.cnum" style="width:200px"/></div>
		    <div style="height:24px"><input type="text" name="book.snum" disabled style="width:200px"/></div>
        </div>
        <div>
          <img id="image" width="100" height="120" style="padding-top:10px;padding-left:20px"/>
        </div>
        <div style="padding-left:260px;padding-top:10px">
          <span>封面图片:</span>
          <input type="file" name="photo" accept="image/*" onchange="document.all['image'].src=this.value"/>
        </div>
        <div style="font-size:18px;color:#f00;padding-top:30px;padding-left:250px">${errors.msg[0]}</div>
<!---->		  
		</s:if>
		<s:else>
		<s:set name="onebook" value="#request.onebook"/>
<!---->  
		  <div style="padding-top:20px;padding-left:5px;line-height:24px;float:left">
		    <div>ISBN:</div>
		    <div>书名:</div>
		    <div>出版社:</div>
		    <div>作者:</div>
		    <div>内容提要:</div>
		  </div>
		  <div style="padding-top:20px;padding-left:5px;float:left;padding-left:50px">
		    <div style="height:24px"><input type="text" value="${onebook.isbn}" name="book.isbn" readonly style="width:200px"/></div>
		    <div style="height:24px"><input type="text" value="${onebook.bookName}" name="book.bookName" style="width:200px"/></div>
		    <div style="height:24px"><input type="text" value="${onebook.publisher}" name="book.publisher" style="width:200px"/></div>
		    <div style="height:24px"><input type="text" value="${onebook.author}" name="book.author" style="width:200px"/></div>
		    <div style="height:24px"><textarea name="book.summary" style="width:200px;height:100px">${onebook.summary}</textarea></div>
		</div>
		<div style="padding-top:20px;padding-left:20px;line-height:24px;float:left">
		    <div>价格:</div>
		    <div>复本:</div>
		    <div>库存:</div>
		</div>
		<div style="padding-top:20px;padding-left:5px;float:left;padding-left:50px">
		    <div style="height:24px"><input type="text" value="${onebook.price}" name="book.price" style="width:200px"/></div>
		    <div style="height:24px"><input type="text" value="${onebook.cnum}" name="book.cnum" style="width:200px"/></div>
		    <div style="height:24px"><input type="text" value="${onebook.snum}" name="book.snum" disabled style="width:200px"/></div>
        </div>
        <div>
          <img id="image" width="100" height="120" src="getImage.html?book.isbn=${onebook.isbn}" style="padding-top:10px;padding-left:20px"/>
        </div>
        <div style="padding-left:260px;padding-top:10px">
          <span>封面图片:</span>
          <input type="file" name="photo" accept="image/*" onchange="document.all['image'].src=this.value"/>
        </div>
        <div style="font-size:18px;color:#f00;padding-top:30px;padding-left:250px">${errors.msg[0]}</div>
<!---->		
		</s:else>
      </div>
    </div>
    </form>
    <!-- 页面尾部 -->
    <div style="font-size:12px;line-height:15px;text-align:center;padding-bottom:5px">
      计科2班
    </div>
  </div>
</body>
</html>
