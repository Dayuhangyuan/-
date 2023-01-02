<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>新增</title>
		<link  rel="stylesheet"  href="${basePath}static/css/styles.css" />
		<link rel="stylesheet"  href="${basePath}static/css/font-awesome-4.7.0/css/font-awesome.min.css" />
		<script  src="${basePath}static/js/jquery.min.js" type="text/javascript"></script>
		<script  src="${basePath}static/js/jquery-validation-1.14.0/jquery.validate.js" type="text/javascript"></script>
		<script  src="${basePath}static/js/jquery-validation-1.14.0/localization/messages_zh.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function(){
				$("#addForm").validate({
					rules:{
						cName:"required",
						tId:"required"
					}
				});
			});
		</script>
	</head>
	<body>
		<div class="add">
			<form id="addForm" action="${basePath}course?method=editsubmit" method="post">
				<input type="hidden" name="cId" value="${course.cId}">
				<table class="tableadd" style="width: 50%;">
					<tr>
						<td>课程名称</td>
						<td style="color: red;"><input type="text" name="cName" value="${course.cName}"></td>
					</tr>
					<tr>
						<td>星期</td>
						<td>
						<select id="week" name="week" >
						    <option value="1"  disabled hidden>请选择选项</option> 
							<option value="1" <c:if test="${course.week == 1}">selected</c:if>>1</option>
							<option value="2" <c:if test="${course.week == 2}">selected</c:if>>2</option>
							<option value="3" <c:if test="${course.week == 3}">selected</c:if>>3</option>
							<option value="4" <c:if test="${course.week == 4}">selected</c:if>>4</option>
							<option value="5" <c:if test="${course.week == 5}">selected</c:if>>5</option>
							<option value="6" <c:if test="${course.week == 6}">selected</c:if>>6</option>
							<option value="7" <c:if test="${course.week == 7}">selected</c:if>>7</option>
						</select>
						</td>
					</tr>
					<tr>
						<td>节数</td>
						<td>
						<select id="week" name="cTime" >
						    <option value="1"  disabled hidden>请选择选项</option> 
							<option value="1" <c:if test="${course.cTime == 1}">selected</c:if>>1</option>
							<option value="2" <c:if test="${course.cTime == 2}">selected</c:if>>2</option>
							<option value="3" <c:if test="${course.cTime == 3}">selected</c:if>>3</option>
							<option value="4" <c:if test="${course.cTime == 4}">selected</c:if>>4</option>
							<option value="5" <c:if test="${course.cTime == 5}">selected</c:if>>5</option>
						</select>
						</td>
					</tr>
					<tr>
						<td>地点</td>
						<td style="color: red;"><input type="text" name="cPlace" value="${course.cPlace}"></td>
					</tr>
					<tr>
						<td>老师</td>
						<td>
							<select name="tId">
								<option value="">请选择老师</option>
								<c:forEach items="${teachers}" var="teacher">
									<option 
										<c:if test="${course.teacher.tId == teacher.tId}">
											selected
										</c:if>
									value="${teacher.tId}">${teacher.tName}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					
					<tr>
						<td colspan="4" align="left">
							<button class="edit" type="button" onclick="window.history.back(-1);">
								<i class="fa fa-arrow-left"></i>
								返回
							</button>
							<button class="remove" type="submit">
								<i class="fa fa-save"></i>
								提交
							</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>
