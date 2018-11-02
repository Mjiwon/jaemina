<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
</head>
<body>
<label>${user.ID}님의 판매관리</label><Br/>

<input type="date" id="date1">부터
<input type="date" id="date2">까지

<!-- 월별 -->
<button type="button" id="ybtn" value="year">년별</button>
    <script type="text/javascript">
    $("#ybtn").on("click",function(){ 

    	console.log(this.value)
    	
    	var date1=$("#date1").val();
    	  var date2=$("#date2").val();
    	  console.log(date1);	
    	  console.log(date2);
    	  var param = {
    		"seller": "${user.ID}",
    		"date_type":this.value,
    		"date1":date1,  
    		"date2":date2,  
    	  }
    
   	$.post("${pageContext.servletContext.contextPath }/ajaxchart.do",param).done(function(rst) {	
	 console.log(rst);
	   	
   		
       google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
 
      function drawChart() {
    	  var data = google.visualization.arrayToDataTable(rst);
 			
	   	console.log(data);
	   	var options = {
	   			
          title:'수입'
        };
 
       
        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
      });
    });
 </script>

<!-- 월별 -->
<button type="button" id="mbtn" value="moon">월별</button>
    <script type="text/javascript">
    $("#mbtn").on("click",function(){ 

    	console.log(this.value)
 
    	var date1=$("#date1").val();
    	  var date2=$("#date2").val();
    	  console.log(date1);	
    	  console.log(date2);
    	  var param = {
    		"seller": "${user.ID}",
    		"date_type":this.value,
    		"date1":date1,  
    		"date2":date2,  
    	  }
    
   	$.post("${pageContext.servletContext.contextPath }/ajaxchart.do",param).done(function(rst) {	
	 console.log(rst);
	   	
   		
       google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
 
      function drawChart() {
    	  var data = google.visualization.arrayToDataTable(rst);
 			
	   	console.log(data)	
	   	var options = {
	   			
          title:'수입'
        };
 
       
        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
      });
    });
 </script>
 
 <!-- 일별 -->
<button type="button" id="dbtn" value="day">일별</button>
    <script type="text/javascript">
    $("#dbtn").on("click",function(){ 

    	console.log(this.value)
    	   	
    	var date1=$("#date1").val();
    	  var date2=$("#date2").val();
    	  console.log(date1);	
    	  console.log(date2);
    	  var param = {
    		"seller": "${user.ID}",
    		"date_type":this.value,
    		"date1":date1,  
    		"date2":date2,  
    	  }
    
   	$.post("${pageContext.servletContext.contextPath }/ajaxchart.do",param).done(function(rst) {	
	 console.log(rst);
	   	
   		
       google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
 
      function drawChart() {
    	  var data = google.visualization.arrayToDataTable(rst);
 			
	   	console.log(data)	
	   	var options = {
	   			
          title:'수입'
        };
 
       
        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
      });
    });
 </script>
 
 <div id="chart_div" style="width: 900px; height: 500px;"></div>

</body>
</html>