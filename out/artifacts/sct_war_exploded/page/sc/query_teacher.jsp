<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.* "%>
<%
List<Map<String, Object>> list3 =  (List<Map<String, Object>>) request.getAttribute("list1");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>选课</title>
		<link  rel="stylesheet"  href="${basePath}static/css/styles.css" />
		<link rel="stylesheet"  href="${basePath}static/css/font-awesome-4.7.0/css/font-awesome.min.css" />
		<script  src="${basePath}static/js/jquery.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="${basePath}static/echarts/echarts.min.js">
		</script>
	</head>
	<body>
	<div>
	<div>
		<table class="tablelist">
			<thead>
				<tr>
					<th>ID</th>
					<th>课程名</th>
					<th>(0,60)</th>
					<th>[60,70]</th>
					<th>(70,85]</th>
					<th>(85,100]</th>
				</tr>
			</thead>
			<c:forEach items="${list1}" var="temp">
			<tr>
				<td>${temp.cId}</td>
				<td>${temp.cname}</td>
				<td>${temp.bad}</td>
				<td>${temp.common}</td>
				<td>${temp.good}</td>
				<td>${temp.best}</td>
			</tr>
			</c:forEach>
		</table>
		
		
		<table class="tablelist">
			<thead>
				<tr>
					<th>ID</th>
					<th>课程名</th>
					<th>及格人数</th>
					<th>总人数</th>
					<th>及格率</th>
				</tr>
			</thead>
			<c:forEach items="${list2}" var="temp">
			<tr>
				<td>${temp.cId}</td>
				<td>${temp.cname}</td>
				<td>${temp.jgnum}</td>
				<td>${temp.allnum}</td>
				<td>${temp.jgl}%</td>
			</tr>
			</c:forEach>
		</table>
	<div id="container2"  style="height: 400px; width: 100%; float: left;border: 1px solid #e1e1e1;margin-top: 10px;">
		<div>
	</div>
		<div>
		<div id = "container" style="height: 1000px">
		</div>
		</div>
	</div>
	<input type="hidden" id="list3" value="<%=list3%>">
	<script type="text/javascript">
	function serie_func(list1){
		var series=[];
		<c:forEach items="${list1}" var="temp">
		series.push({
			//系列名称
            name:'${temp.cname}',
            //类型：折线图c                                               
            type:'bar',
            //数据堆叠，同个类目轴上系列配置相同的stack值可以堆叠放置。
            // stack:'test',
            //在柱体上显示对应数值
            label:{
                normal:{
                    //是否显示
                    show:true,
                    //显示位置：在标记图形的上方
                    position:'top',
                    //文本颜色：黑色，不设置默认为系列色
                    color:'black'
                    }
                },
            data: ["${temp.bad}","${temp.common}","${temp.good}","${temp.best}"]
	       });
		console.log( "${temp.bad}","${temp.common}","${temp.good}","${temp.best}");
		
		</c:forEach>
		return series;
	}
	</script>
	<script type="text/javascript">
	var dom = document.getElementById("container2");
	var myChart = echarts.init(dom);
	var list2 = "${list1}";
	console.log(list2);
	var list1 = $("#list3").val();
	console.log(list1);
	option1 = {
			title: {
		        text: '及格率柱状图'
		    },
			tooltip: {
		        trigger: 'axis'
		    },
		    xAxis: {
		        type: 'category',
		        axisLabel: {
		               interval:0
		           },
		        data: ['(0,60)','[60,70]','(70,85]','(85,100]']
		    },
		    yAxis: {
		        type: 'value'
		    },
		    legend:{
	            data:[<c:forEach items="${list1}" var="temp">
	       		'${temp.cname}',
	       		</c:forEach>]
		    ,
	            //统一设置系列样式
	            textStyle:{
	                fontSize:'12',
	                color:'green'
	                },
	                //系列之间的间距
	                itemGap:50,
	                //系列标记图形的宽高
	                itemWidth:15,
	                itemHeight:15
	            },
		    series: serie_func(list2)};
		myChart.setOption(option1, true);
	</script>
<!--	<script type="text/javascript">
	var div = document.getElementById('container');
	<c:forEach items="${list1}" var="temp">
	var cId = ${temp.cId};
	console.log(cId);
	var divChild = '<div id=\"' + cId + '\"'+ '"style=\"height: 100px; width: 40%; overflow:visible; float: left;border: 1px solid #e1e1e1;margin-top: 50px;\">aaa<div>';
	div.innerHTML += divChild;
	</c:forEach>
	div.innerHTML += '<div></div>';
	<c:forEach items="${list1}" var="temp">
	var cId = ${temp.cId};
	var dom = document.getElementById(cId);
	var myChart = echarts.init(dom);
	option1 = {
			title: {
		        text: '及格率柱状图'
		    },
			tooltip: {
		        trigger: 'axis'
		    },
		    xAxis: {
		        type: 'category',
		        axisLabel: {
		               interval:0
		           },
		        data: ['(0,60)','[60,70]','(70,85]','(85,100]']
		    },
		    yAxis: {
		        type: 'value'
		    },
		    series:[
		            {
		                //系列名称
		                name:'测试系列1',
		                //类型：折线图c                                               
		                type:'bar',
		                //数据堆叠，同个类目轴上系列配置相同的stack值可以堆叠放置。
		                // stack:'test',
		                //在柱体上显示对应数值
		                label:{
		                    normal:{
		                        //是否显示
		                        show:true,
		                        //显示位置：在标记图形的上方
		                        position:'top',
		                        //文本颜色：黑色，不设置默认为系列色
		                        color:'black'
		                        }
		                    },
		                //柱体样式
		                itemStyle:{
		                    normal:{
		                        //柱体颜色
		                        color: 'blue',
		                        //柱体边框颜色
		                        borderColor:'rgba(153,51,204,0.27)',
		                        //柱体边框宽度
		                        borderWidth:10,
		                        //圆角设置，（顺时针左上：5，右上：5，右下：0，左下：0）
		                        barBorderRadius: [5, 5, 0, 0] 
		                        }
		                    },
		                data: [14,16,19,22,25,30]
		                },
		            {
		                //系列名称
		                name:'测试系列2',
		                //类型：折线图
		                type:'bar',
		                //数据堆叠，同个类目轴上系列配置相同的stack值可以堆叠放置。
		                stack:'test',
		                //在标记图形上显示对应数值
		                label:{
		                    normal:{
		                        //是否显示
		                        show:true,
		                        //显示位置：在标记图形的上方
		                        position:'top',
		                        //文本颜色：黑色，不设置默认为系列色
		                        color:'black'
		                        }
		                    },
		                //系列之间的间距
		                // barGap: '-100%',
		                data: [14,16,19,22,25,30]
		                }
		                
		        ]};
		myChart.setOption(option1, true);
		</c:forEach>
	</script>
	 -->
	</body>
</html>
