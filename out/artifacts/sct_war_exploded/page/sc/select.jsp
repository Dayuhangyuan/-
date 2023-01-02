<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>选课</title>
		<link  rel="stylesheet"  href="${basePath}static/css/styles.css" />
		<link rel="stylesheet"  href="${basePath}static/css/font-awesome-4.7.0/css/font-awesome.min.css" />
		<script  src="${basePath}static/js/jquery.min.js" type="text/javascript"></script>
		<script type="text/javascript">
			
		</script>
	</head>
	<body>
		<c:if test="${param.msg == 0}">
			<span style="color:red;">操作失败！</span>
		</c:if>
		<c:if test="${param.msg == 1}">
			<span style="color:green;">操作成功！</span>
		</c:if>
		<c:if test="${param.msg == 2}">
			<span style="color:green;">操作失败，课程不可以为空！</span>
		</c:if>
		<c:if test="${param.msg == 3}">
			<span style="color:green;">操作失败，选择课程时间地点存在冲突！</span>
		</c:if>
		<form action="${basePath}sc?method=submit" method="post">
			<table class="tablelist">
			<th></th>
			<th>课程名</th>
			<th>教师名</th>
			<th>星期</th>
			<th>节数</th>
			<th>地点</th>
				<c:forEach items="${courses}" var="course">
				<tr>
					<td width="50px" align="center">
						<!-- 选中的cId -->
						<input type="checkbox"
							<c:forEach items="${scs}" var="sc">
								<c:if test="${sc.cId eq course.cId}">checked="checked"</c:if>
							</c:forEach>
						 name="cId" value="${course.cId}">
					</td>
					<td>
					${course.cName}
					</td>
					<td>
					${course.teacher.tName}
					</td>
					<td>
					${course.week}
					</td>
					<td>
					${course.cTime}
					</td>
					<td>
					${course.cPlace}
					</td>
				</tr>
				</c:forEach>
			</table>
			<br/>
			<button class="mybtn">
				<i class="fa fa-save"></i>
				提交选课
			</button>
		</form>
			
		
	</body>
</html>
