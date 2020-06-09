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
      <div style="width:200px;height:380px;border:solid 0px #8B4513; margin:5px">
        <div style="background-color:#8B4513;padding-left:5px">内容选择</div>
        <div style="margin:5px">
<!--  -->
		  <jsp:include page="userleft.jsp" />
<!--  -->
        </div>
      </div>
  </div>
      </div>
      <div>
  <div style="width:672px; height:380px; margin:5px; border:solid 0px #8B4513; float:left">
  <div style="height:356px">
    <div>
<!-- --------- -->
      <div style="">
        <div style="float:left;width:50px;background-color:#8B4513;margin-right:1px;padding:5px">借书证号</div>
        <div style="float:left;width:50px;background-color:#8B4513;margin-right:1px;padding:5px">姓名</div>
        <div style="float:left;width:30px;background-color:#8B4513;margin-right:1px;padding:5px">性别</div>
        <div style="float:left;width:30px;background-color:#8B4513;margin-right:1px;padding:5px">年龄</div>
        <div style="float:left;width:100px;background-color:#8B4513;margin-right:1px;padding:5px">学号</div>
        <div style="float:left;width:100px;background-color:#8B4513;margin-right:1px;padding:5px">专业</div>
        <div style="float:left;width:60px;background-color:#8B4513;margin-right:1px;padding:5px">班级</div>
        <div style="float:left;width:100px;background-color:#8B4513;margin-right:1px;padding:5px">电话</div>
        <div style="float:left;width:54px;background-color:#8B4513;padding:5px">违约次数</div>
      </div>
      <s:iterator value="#request.list" id="s">
      <div style="line-height:65px">
        <div style="float:left;width:61px;margin-left:5px;clear:left"><a href="reader.html?uid=${s.id}">${s.id}</a></div>
        <div style="float:left;width:61px">${s.name}</div>
        <div style="float:left;width:41px">${s.sex}</div>
        <div style="float:left;width:41px">${s.age}</div>
        <div style="float:left;width:111px">${s.sid}</div>
        <div style="float:left;width:111px">${s.szy}</div>
        <div style="float:left;width:71px">${s.cls}</div>
        <div style="float:left;width:111px">${s.tel}</div>
        <div style="float:left;width:51px">${s.off}</div>
      </div>
      </s:iterator>
<!-- --------- -->
    </div>
  </div>
  <div style="background-color:#8B4513;padding-left:5px;font-size:13px;line-height:24px; text-align:right; padding-right:10px">
    <s:set name="page" value="#request.page"/>
      <a href="user.html?pageNow=1&off=${off}" style="color:#000">首页</a>&nbsp;
      <s:if test="#page.hasPre">
        <a href="user.html?pageNow=${pageNow-1}&off=${off}" style="color:#000">上一页</a>&nbsp;
      </s:if>
      <s:else>
        <a href="user.html?pageNow=1&off=${off}" style="color:#000">上一页</a>&nbsp;
      </s:else>
      <s:if test="#page.hasNext">
        <a href="user.html?pageNow=${pageNow+1}&off=${off}" style="color:#000">下一页</a>&nbsp;
      </s:if>
      <s:else>
        <a href="user.html?pageNow=${page.totalPage}&off=${off}" style="color:#000">下一页</a>&nbsp;
      </s:else>
      <a href="user.html?pageNow=${page.totalPage}&off=${off}" style="color:#000">尾页</a>
  </div>
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
