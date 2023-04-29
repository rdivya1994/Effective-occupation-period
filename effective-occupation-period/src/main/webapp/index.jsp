<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "java.time.*" %>
<%@ page import = "java.util.Date" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c-rt"%>

<%!
  String[] months = { "January","February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
%>
<%! int count = 0;%>
<%!int errorCount = 0;%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">

    function addRow(tableID)
    {

    	var table = document.getElementById(tableID);
        var rowCount = table.rows.length;
        console.log( table.rows.length);
       
        if(rowCount>1){
        	console.log(rowCount);
        	var num = rowCount-1
        	console.log(num);
        	var periodCheck = document.getElementById("period"+num).value;
        	console.log(periodCheck);
        	if(periodCheck=="")
        		{
        		errorCount=1;
        		}
        }
        	

    	if(errorCount==0)
    	{       
        var row = table.insertRow(rowCount); 
        var cell1 = row.insertCell(0);
        var element1 = document.createElement("input");
        element1.type = "checkbox";
        element1.name="chkbox[]";
        cell1.appendChild(element1);

        var cell2 = row.insertCell(1);
        cell2.innerHTML = rowCount ;

        var cell3 = row.insertCell(2);
      //Create non occupation start dd select
      var array_start = ["DD","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"];

      //Create and append select list
      var selectList_start = document.createElement("select");
      selectList_start.setAttribute("id", "nonoccstartdd"+rowCount);
      selectList_start.setAttribute("name", "nonoccstartdd"+rowCount);
      cell3.appendChild(selectList_start);

      //Create and append the options
      for (var i = 0; i < array_start.length; i++) {
          var option = document.createElement("option");
          option.setAttribute("value", array_start[i]);
          option.text = array_start[i];
          selectList_start.appendChild(option);
      }
      cell3.appendChild(selectList_start);
      

    //Create non occupation start mm select
      var array1_start = ["MM","January","February","March","April","May","June","July","August","September","October","November","December"];

      //Create and append select list
      var selectList1_start = document.createElement("select");
      selectList1_start.setAttribute("id", "nonoccstartmm"+rowCount);    
      selectList1_start.setAttribute("name", "nonoccstartmm"+rowCount);
      cell3.appendChild(selectList1_start);
      //Create and append the options
      for (var i = 0; i < array1_start.length; i++) {
          var option = document.createElement("option");
          option.setAttribute("value", array1_start[i]);
          option.text = array1_start[i];
          selectList1_start.appendChild(option);
      }

    //Create non occupation start yy select
      var array2_start = ["YYYY","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"];

      //Create and append select list
      var selectList2_start = document.createElement("select");
      selectList2_start.setAttribute("id", "nonoccstartyy"+rowCount);  
      selectList2_start.setAttribute("name", "nonoccstartyy"+rowCount);
      cell3.appendChild(selectList2_start);
      //Create and append the options
      for (var i = 0; i < array2_start.length; i++) {
          var option = document.createElement("option");
          option.setAttribute("value", array2_start[i]);
          option.text = array2_start[i];
          selectList2_start.appendChild(option);
      }

      var cell4 = row.insertCell(3);
  
    //Create non occupation end dd select
      var array_end = ["DD","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"];

      //Create and append select list
      var selectList_end = document.createElement("select");
      selectList_end.setAttribute("id", "nonoccenddd"+rowCount);
      selectList_end.setAttribute("name", "nonoccenddd"+rowCount);
      cell4.appendChild(selectList_end);

      //Create and append the options
      for (var i = 0; i < array_end.length; i++) {
          var option = document.createElement("option");
          option.setAttribute("value", array_end[i]);
          option.text = array_end[i];
          selectList_end.appendChild(option);
      }

    //Create non occupation end mm select
      var array1_end = ["MM","January","February","March","April","May","June","July","August","September","October","November","December"];

      //Create and append select list
      var selectList1_end = document.createElement("select");
      selectList1_end.setAttribute("id", "nonoccendmm"+rowCount);    
      selectList1_end.setAttribute("name", "nonoccendmm"+rowCount);
      cell4.appendChild(selectList1_end);
      
      //Create and append the options
      for (var i = 0; i < array1_end.length; i++) {
          var option = document.createElement("option");
          option.setAttribute("value", array1_end[i]);
          option.text = array1_end[i];
          selectList1_end.appendChild(option);
      }

    //Create non occupation end yy select
      var array2_end = ["YYYY","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"];

      //Create and append select list
      var selectList2_end = document.createElement("select");
      selectList2_end.setAttribute("id", "nonoccendyy"+rowCount);  
      selectList2_end.setAttribute("name", "nonoccendyy"+rowCount);
      selectList2_end.setAttribute("onchange","formatDate(this)");
      cell4.appendChild(selectList2_end);
      //Create and append the options
      for (var i = 0; i < array2_end.length; i++) {
          var option = document.createElement("option");
          option.setAttribute("value", array2_end[i]);
          option.text = array2_end[i];
          selectList2_end.appendChild(option);
      }
      
    //Create non occupation period
      
      var cell5 = row.insertCell(4);
      var element_in = document.createElement("input");
      element_in.type = "text";
      element_in.name = "period"+rowCount;
      element_in.id = "period"+rowCount;
      cell5.appendChild(element_in);     
    }
    	else
    		{
    		alert("Clear fields in the previous row")
    		}
    }
    
  

    function formatDate(selectObject)
    {
    	 var monthNames = ["January","February","March","April","May","June","July","August","September","October","November","December"];
    	  	var num = selectObject.id.replace(/[^0-9]/g, ''); 
    	  	count = num;
  
    	    var nonoccstartdd=document.getElementById("nonoccstartdd"+num).value;
			var nonoccstartmm=document.getElementById("nonoccstartmm"+num).value;
			var nonoccstartyy=document.getElementById("nonoccstartyy"+num).value;
			var nonoccenddd=document.getElementById("nonoccenddd"+num).value;
			var nonoccendmm=document.getElementById("nonoccendmm"+num).value;
			var nonoccendyy=document.getElementById("nonoccendyy"+num).value;
			
			var occstartyy=document.getElementById("occstartyy").value;
			var occendyy=document.getElementById("occendyy").value;
	
    	    console.log(nonoccstartdd+","+nonoccstartmm+","+nonoccstartyy+","+nonoccenddd+","+nonoccendmm+","+nonoccendyy);
    	    console.log(num);
    		for(let i =0;i<monthNames.length;i++)
    		{
    			if(nonoccstartmm==monthNames[i])
    				{
    				nonoccstartmm = i;
    				}
    			if(nonoccendmm==monthNames[i])
				{
				nonoccendmm = i;
				}
    			
    		}
    		
    		if((nonoccstartyy>=occstartyy && nonoccstartyy<=occendyy)&& (nonoccendyy>=occstartyy && nonoccendyy<=occendyy))
    	   {
    		 var d1 = new Date(nonoccstartyy, nonoccstartmm, nonoccstartdd) ;
    		 var d2 = new Date(nonoccendyy,nonoccendmm,nonoccenddd);
        //find the period b/w non occ start and end dates
    		 var period = findPeriod(d1,d2);
    		 if(errorCount ==1 )
    			 {
    			 document.getElementById("nonoccendyy"+num).value = "YYYY";
    			 }
    		 else{
    		 document.getElementById("period"+num).readOnly = true;
    		 document.getElementById("period"+num).value= period;
    		 //simultaneously sum the periods and display total effective period
    		 sumperiod();
    		 validateForm();
    		 }
    	   }
    		else
    			{
    			errorCount = 1;
    			alert("Non occupation period must fall between occupation period");
    			}
    	}
    
    function findPeriod(date_1, date_2)
    {
    errorCount =0;
    var date2_UTC = new Date(Date.UTC(date_2.getUTCFullYear(), date_2.getUTCMonth(), date_2.getUTCDate()+1));
	var date1_UTC = new Date(Date.UTC(date_1.getUTCFullYear(), date_1.getUTCMonth(), date_1.getUTCDate()+1));


	var yAppendix, mAppendix, dAppendix;

	var days = date2_UTC.getDate() - date1_UTC.getDate();
	console.log(date2_UTC,date1_UTC,days);
	if (days < 0)
	{

		console.log("a",date2_UTC);
	    date2_UTC.setMonth(date2_UTC.getMonth() - 1);
	    console.log("aa",date2_UTC);
	    days += DaysInMonth(date2_UTC);
	    console.log(days)
	}

	var months = date2_UTC.getMonth() - date1_UTC.getMonth();
	console.log(months)
	if (months < 0)
	{
		console.log("b",date2_UTC);
	    date2_UTC.setFullYear(date2_UTC.getFullYear() - 1);
	    console.log("bb",date2_UTC);
	    months += 12;
	}

	console.log(date2_UTC.getFullYear(),date1_UTC.getFullYear());
	var years = date2_UTC.getFullYear() - date1_UTC.getFullYear();

	if(years < 0)
		{
		alert("End year must be greater than start");
		errorCount = 1;
		}

	if (years > 1) yAppendix = " years";
	else yAppendix = " year";
	if (months > 1) mAppendix = " months";
	else mAppendix = " month";
	if (days > 1) dAppendix = " days";
	else dAppendix = " day";
	return years + yAppendix + " " + months + mAppendix + " " + days + dAppendix;
	}


	function DaysInMonth(date2_UTC)
	{
	var monthStart = new Date(date2_UTC.getFullYear(), date2_UTC.getMonth(), 1);
	var monthEnd = new Date(date2_UTC.getFullYear(), date2_UTC.getMonth() + 1, 1);
	console.log(monthStart,monthEnd)
	var monthLength = (monthEnd - monthStart) / (1000 * 60 * 60 * 24);
	console.log(monthLength)
	return monthLength;
	}

    function deleteRow(tableID) {
        try {
        var table = document.getElementById(tableID);
        var rowCount = table.rows.length;

        for(var i=0; i<rowCount; i++) {
            var row = table.rows[i];
            var chkbox = row.cells[0].childNodes[0];
            if(null != chkbox && true == chkbox.checked) {
                table.deleteRow(i);
                rowCount--;
                i--;
                count--;
            }
            
        }
        sumperiod();
        validateForm();
        }catch(e) {
            alert(e);
        }
    }
    
    function sumperiod()
    {
       	
    	var t=0,d=0,m=0,y=0;
    	for(let i =1;i<=count;i++)
    		{
    		t = document.getElementById("period"+i).value
    		var arr = t.toString().split(" ");
    		d=d+parseInt(arr[4]);
    		m=m+parseInt(arr[2]);
    		y=y+parseInt(arr[0]);    		
    		}
 
    	var nonoccperiod=y+" years "+m+" months "+d+" days "
    	console.log("nonocc",nonoccperiod);
    	document.getElementById("nonoccperiod").value= nonoccperiod;
    }
    
    function validateForm()
    {    	
    	 var yAppendix, mAppendix, dAppendix;
		 var occperiod = document.getElementById("occperiod").value ;
		 var nonoccperiod = document.getElementById("nonoccperiod").value
		 console.log(occperiod,nonoccperiod);
		 if(occperiod!="")
		 {
		 var d=0,m=0,y=0;
		 var p1 = occperiod.toString().split(" ");
		 if(nonoccperiod!="")
			 {
		 var p2 = nonoccperiod.toString().split(" ");
		 d=Math.abs(parseInt(p1[4]) - parseInt(p2[4]));
	 		m=Math.abs(parseInt(p1[2])- parseInt(p2[2]));
	 		y=Math.abs(parseInt(p1[0])- parseInt(p2[0])); 
		 }
		  else
			 {
			 var p2 = 0;
			 d=parseInt(p1[4]);
		 	 m=parseInt(p1[2]);
		 	 y=parseInt(p1[0]); 
			 }
		 
			if (y > 1) yAppendix = " years";
			else yAppendix = " year";
			if (m > 1) mAppendix = " months";
			else mAppendix = " month";
			if (d > 1) dAppendix = " days";
			else dAppendix = " day";
			
 		var total=y + yAppendix + " " + m + mAppendix + " " + d + dAppendix;
    	console.log("total",total);
 		var tot = document.getElementById("total");
 	    tot.type= "text";
 	    tot.readOnly = true;
 		tot.value = total;
		 }
		 else if(occperiod=="")
			 {
			 alert("Enter occupation period")
			 }   
    }
    
    function validateOccPeriod()
    {
    	var occstartdd=document.getElementById("occstartdd").value;
		var occstartmm=document.getElementById("occstartmm").value;
		var occstartyy=document.getElementById("occstartyy").value;
		var occenddd=document.getElementById("occenddd").value;
		var occendmm=document.getElementById("occendmm").value;
		var occendyy=document.getElementById("occendyy").value;
		console.log(occstartdd,occstartmm,occstartyy,occenddd,occendmm,occendyy,occstartmm.toString().toLowerCase())
    	var monthNames = ["January","February","March","April","May","June","July","August","September","October","November","December"];
    	for(let i =0;i<monthNames.length;i++){
			if(occstartmm.toString().toLowerCase()==monthNames[i].toString().toLowerCase())
				{
				occstartmm = i;
				}
			if(occendmm.toString().toLowerCase()==monthNames[i].toString().toLowerCase())
			{
			occendmm = i;
			}
		}
    	 var d1 = new Date(occstartyy, occstartmm, occstartdd) ;
		 var d2 = new Date(occendyy,occendmm,occenddd);
	
		 var occperiod = findPeriod(d1,d2);
		 console.log("occ",occperiod);
		 if(errorCount == 1){
			 document.getElementById("occendyy").value = "YYYY";
		 }
		 else{
		 document.getElementById("occperiod").value = occperiod;
		 }
    }

</script>
<meta charset="ISO-8859-1">
<title>Effective Occupation Period</title>
</head>
<body>
<div align="center">

  <form name="myForm">
    <table id="occupation">
       <tr>
        <h4>Occupation Period</h4>
<td>Date start</td>
<td>
<select style="width:50px;" name="occstartdd" id="occstartdd">
<option>DD</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
<option value="31">31</option>
</select>

<select style="width:60px;" name="occstartmm" id="occstartmm">
<option>MM</option>
<option value="january">January</option>
<option value="february">February</option>
<option value="march">March</option>
<option value="april">April</option>
<option value="may">May</option>
<option value="june">June</option>
<option value="july">July</option>
<option value="august">August</option>
<option value="september">September</option>
<option value="october">October</option>
<option value="november">November</option>
<option value="december">December</option>
</select>

<select style="width:65px;" name="occstartyy" id="occstartyy">
<option>YYYY</option>
<option value="1997">1997</option>
<option value="1998">1998</option>
<option value="1999">1999</option>
<option value="2000">2000</option>
<option value="2001">2001</option>
<option value="2002">2002</option>
<option value="2003">2003</option>
<option value="2004">2004</option>
<option value="2005">2005</option>
<option value="2006">2006</option>
<option value="2007">2007</option>
<option value="2008">2008</option>
<option value="2009">2009</option>
<option value="2010">2010</option>
<option value="2011">2011</option>
<option value="2012">2012</option>
<option value="2013">2013</option>
<option value="2014">2014</option>
<option value="2015">2015</option>
<option value="2016">2016</option>
<option value="2017">2017</option>
<option value="2018">2018</option>
<option value="2019">2019</option>
<option value="2020">2020</option>
<option value="2021">2021</option>
<option value="2022">2022</option>
<option value="2023">2023</option>
</select>
</td>
</tr>
<td>Date end</td>
<td>
<select style="width:50px;" name="occenddd" id="occenddd">
<option>DD</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
<option value="31">31</option>
</select>

<select style="width:60px;" name="occendmm" id="occendmm">
<option>MM</option>
<option value="january">January</option>
<option value="february">February</option>
<option value="march">March</option>
<option value="april">April</option>
<option value="may">May</option>
<option value="june">June</option>
<option value="july">July</option>
<option value="august">August</option>
<option value="september">September</option>
<option value="october">October</option>
<option value="november">November</option>
<option value="december">December</option>
</select>

<select style="width:65px;" name="occendyy" id="occendyy" onchange="validateOccPeriod()">
<option>YYYY</option>
<option value="1997">1997</option>
<option value="1998">1998</option>
<option value="1999">1999</option>
<option value="2000">2000</option>
<option value="2001">2001</option>
<option value="2002">2002</option>
<option value="2003">2003</option>
<option value="2004">2004</option>
<option value="2005">2005</option>
<option value="2006">2006</option>
<option value="2007">2007</option>
<option value="2008">2008</option>
<option value="2009">2009</option>
<option value="2010">2010</option>
<option value="2011">2011</option>
<option value="2012">2012</option>
<option value="2013">2013</option>
<option value="2014">2014</option>
<option value="2015">2015</option>
<option value="2016">2016</option>
<option value="2017">2017</option>
<option value="2018">2018</option>
<option value="2019">2019</option>
<option value="2020">2020</option>
<option value="2021">2021</option>
<option value="2022">2022</option>
<option value="2023">2023</option>
</select>
</td>
</tr>
       
    </table>
    <br><br>
    <input type="button" value="Add Row" onclick="addRow('nonoccupation')" />

<input type="button" value="Delete Row" onclick="deleteRow('nonoccupation')" />

<table id="nonoccupation" width="650px" border="1">
    <tr>
         <h4>Non Occupation Period</h4>
       <th></th>
       <th>s.no</th>
       <th>Start</th>
       <th>End</th>
       <th>Period</th>
    </tr>
</table>
<br><br><br>
 <input type="hidden" name="occperiod" id="occperiod"/>
 <input type="hidden" name="nonoccperiod" id="nonoccperiod"/>
 <input type="hidden" name="total" id="total"/>
  
<input type="button" value="Calculate" onclick="validateForm()">

</form>
</div>
</body>
</html>