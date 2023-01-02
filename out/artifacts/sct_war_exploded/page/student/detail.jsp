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
				$("#editForm").validate({
					rules:{
						stuNo:{
							required:true,
							digits:true
						},
						stuName:"required",
						stuPwd:{
							required:true,
							rangelength:[6,15]
						}
					}
					/* messages:{
						stuPwd:{
							rangelength:$.validator.format( "Please enter a value between {0} and {1} characters long.")
						}
					} */
				});
			});
		</script>
	</head>
	<body>
		<div class="add">
			<table style="width: 50%;">
				<tr>
					<td height="50px" width="150px">学号</td>
					<td>
						${student.stuNo}
					</td>
				</tr>
				<tr>
					<td height="50px">姓名</td>
					<td style="color: red;">
					${student.stuName}
					</td>
				</tr>
			</table>
			<table class="tablelist" style="width: 50%;">
			<thead>
				<tr>
					<th>课程</th>
					<th>成绩</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="sc">
			<tr>
				<td>${sc.cName}</td>
				<td>${sc.score}</td>
			</tr>
			</c:forEach>
			</table>
			
			<table class="tablelist">
			<thead>
				<tr>
					<th> </th>
					<th>星期一</th>
					<th>星期二</th>
					<th>星期三</th>
					<th>星期四</th>
					<th>星期五</th>
					<th>星期六</th>
					<th>星期日</th>
				</tr>
			</thead>
			<tr height="60" align="center">
			<td width="30"> 1</td>
			<td id = "table_1_1" width="120" rowspan="2"></td>
            <td id = "table_2_1" width="120" rowspan="2"></td>
            <td id = "table_3_1" width="120" rowspan="2"></td>
            <td id = "table_4_1" width="120" rowspan="2">骑着扫帚飞 j3-103</td>
            <td id = "table_5_1" width="120" rowspan="2"></td>
            <td id = "table_6_1" width="120" rowspan="2"></td>
            <td id = "table_7_1" width="120" rowspan="2"></td>
			</tr>
			<tr height="60" align="center">
            <td width="30">2</td>
<!--              <td id = "table_1_2" width="120" rowspan="2"></td>
            <td id = "table_2_2" width="120" rowspan="2"></td>
            <td id = "table_3_2" width="120" rowspan="2"></td>
            <td id = "table_4_2" width="120" rowspan="2">骑着扫帚飞 j3-103</td>
            <td id = "table_5_2" width="120" rowspan="2"></td>
            <td id = "table_6_2" width="120" rowspan="2"></td>
            <td id = "table_7_2" width="120" rowspan="2"></td>  -->
        	</tr>
        	<tr height="60" align="center">
            <td width="30">3</td>
            <td id = "table_1_2" width="120" rowspan="2"></td>
            <td id = "table_2_2" width="120" rowspan="2"></td>
            <td id = "table_3_2" width="120" rowspan="2"></td>
            <td id = "table_4_2" width="120" rowspan="2">骑着扫帚飞 j3-103</td>
            <td id = "table_5_2" width="120" rowspan="2"></td>
            <td id = "table_6_2" width="120" rowspan="2"></td>
            <td id = "table_7_2" width="120" rowspan="2"></td> 
        	</tr>
        	<tr height="60" align="center">
            <td width="30">4</td>
<!--             <td id = "table_1_4" width="120" rowspan="2"></td>
            <td id = "table_2_4" width="120" rowspan="2"></td>
            <td id = "table_3_4" width="120" rowspan="2"></td>
            <td id = "table_4_4" width="120" rowspan="2">骑着扫帚飞 j3-103</td>
            <td id = "table_5_4" width="120" rowspan="2"></td>
            <td id = "table_6_4" width="120" rowspan="2"></td>
            <td id = "table_7_4" width="120" rowspan="2"></td> -->
        	</tr>
        	<tr height="60" align="center">
            <td width="30">5</td>
            <td id = "table_1_3" width="120" rowspan="2"></td>
            <td id = "table_2_3" width="120" rowspan="2"></td>
            <td id = "table_3_3" width="120" rowspan="2"></td>
            <td id = "table_4_3" width="120" rowspan="2">骑着扫帚飞 j3-103</td>
            <td id = "table_5_3" width="120" rowspan="2"></td>
            <td id = "table_6_3" width="120" rowspan="2"></td>
            <td id = "table_7_3" width="120" rowspan="2"></td> 
        	</tr>
        	<tr height="60" align="center">
            <td width="30">6</td>
<!--            <td id = "table_1_6" width="120" rowspan="2"></td>
            <td id = "table_2_6" width="120" rowspan="2"></td>
            <td id = "table_3_6" width="120" rowspan="2"></td>
            <td id = "table_4_6" width="120" rowspan="2">骑着扫帚飞 j3-103</td>
            <td id = "table_5_6" width="120" rowspan="2"></td>
            <td id = "table_6_6" width="120" rowspan="2"></td>
            <td id = "table_7_6" width="120" rowspan="2"></td> -->
        	</tr>
        	<tr height="60" align="center">
            <td width="30">7</td>
            <td id = "table_1_4" width="120" rowspan="2"></td>
            <td id = "table_2_4" width="120" rowspan="2"></td>
            <td id = "table_3_4" width="120" rowspan="2"></td>
            <td id = "table_4_4" width="120" rowspan="2">骑着扫帚飞 j3-103</td>
            <td id = "table_5_4" width="120" rowspan="2"></td>
            <td id = "table_6_4" width="120" rowspan="2"></td>
            <td id = "table_7_4" width="120" rowspan="2"></td> 
        	</tr>
        	<tr height="60" align="center">
            <td width="30">8</td>
 <!--           <td id = "table_1_8" width="120" rowspan="2"></td>
            <td id = "table_2_8" width="120" rowspan="2"></td>
            <td id = "table_3_8" width="120" rowspan="2"></td>
            <td id = "table_4_8" width="120" rowspan="2">骑着扫帚飞 j3-103</td>
            <td id = "table_5_8" width="120" rowspan="2"></td>
            <td id = "table_6_8" width="120" rowspan="2"></td>
            <td id = "table_7_8" width="120" rowspan="2"></td> -->
        	</tr>
        	<tr height="60" align="center">
            <td width="30">9</td>
            <td id = "table_1_5" width="120" rowspan="2"></td>
            <td id = "table_2_5" width="120" rowspan="2"></td>
            <td id = "table_3_5" width="120" rowspan="2"></td>
            <td id = "table_4_5" width="120" rowspan="2">骑着扫帚飞 j3-103</td>
            <td id = "table_5_5" width="120" rowspan="2"></td>
            <td id = "table_6_5" width="120" rowspan="2"></td>
            <td id = "table_7_5" width="120" rowspan="2"></td>
        	</tr>
        	<tr height="60" align="center">
            <td width="30">10</td>
<!--            <td id = "table_1_10" width="120" rowspan="2"></td>
            <td id = "table_2_10" width="120" rowspan="2"></td>
            <td id = "table_3_10" width="120" rowspan="2"></td>
            <td id = "table_4_10" width="120" rowspan="2">骑着扫帚飞 j3-103</td>
            <td id = "table_5_10" width="120" rowspan="2"></td>
            <td id = "table_6_10" width="120" rowspan="2"></td>
            <td id = "table_7_10" width="120" rowspan="2"></td> -->
        	</tr>
		</table>
		</div>
	<script type="text/javascript">
	function clear(){
		for(var i=1;i<=7;i++){
			for(var j=1;j<=10;j++){
				$("#table_"+j+"_"+i).html("");
			}
		}
	}
	function changeBg()
	{
		var color = ["#FF0000","#FF7D00","#FFFF00","#00FF00","#00FFFF","#0000FF","#FF00FF"];
		//将背景颜色的值定义为空字符串
		var bgColor="";
		//生成一个随机的六位数
		var i = Math.round(Math.random()*6);
		console.log(i);
		bgColor += color[i];
		return bgColor;
	}
	function setCource(){
		<c:forEach items="${list}" var="temp">
		var week = "${temp.week}";
		var cTime = "${temp.cTime}";
    	$("#table_"+week+"_" + cTime).html("${temp.cName}"+"<br>"+"${temp.cPlace}"+"<br>");
    	var color = changeBg();
    	document.getElementById("table_"+week+"_" + cTime).style.backgroundColor = color;
    	$("#table_"+week+"_" + cTime).bgcolor=color;
		</c:forEach>
	}
	clear();
	setCource();
	</script>
	</body>
	
</html>
