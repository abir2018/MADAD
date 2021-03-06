<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="org.iwan.madad.utils.*"%>
<%-- 
    Document   : relatedTasks
    Created on : Jan 4, 2016, 12:07:47 PM
    Author     : Giri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <title>تقييم مقروئية النص (مطلق)</title>
        <link rel="stylesheet" href="css.css">
        <style>
             #buttons{
            display: block;
           // top: 150px;
             max-width: auto;
             min-width: auto;
             margin: 90px auto auto auto;
             padding: 10px 20px;
             border-radius: 8px;
             position: relative;
             max-height: auto;
           }
           #textareas h1 
           {
         background-color: #33cc77;
	-webkit-border-radius: 20px 20px 0 0;
	-moz-border-radius: 20px 20px 0 0;
	border-radius: 20px 20px 0 0;
	color: #fff;
	font-size: 28px;
	/*padding: 20px 26px;*/  
           }
            iframe{
         padding: 10px 20px;
         background: #f4f7f8;
         border-radius: 8px;
         position: relative;

           }
            button {
        background-color: #33cc77;
	color: #fff;
	display: block;
	margin: 0 auto;
	padding: 4px 0;
	width: 100px;
        
}
      .slider-width100
{
    width: 180px !important;
}
           </style>
           <script>
               function loadDescription(taskID)
               {
                   var descriptionID="task"+taskID;
                   var description=document.getElementById(descriptionID).value;
                   document.getElementById("description").value=description;
               }
           </script>
    </head>
    <body>
       <div id="wrapper">
  <div id="header">
      <img src="madad.png" alt="logo" width="122" height="100" style="float:right; right:0px; top:0px;">

  		<ul class="nav"> <!-- this Arabic word means logout -->
                        <li>
  				<a href="logout.jsp">تسجيل الخروج</a>
  			</li>
                        <li> <!-- this Arabic word means main page -->
  				<a href="index.jsp">الرئيسية</a>
  			</li>
  		</ul>
   <header style="margin-top: 10px;">
          <label style="font-size:30pt; font-weight: bold;">Arabic annotation tool</label><br><br>
            <label style="font-size:20pt; ">(تحشية المدونات العربية)</label>
    </header>
  </div>
   <% 
    int datasetID=Integer.parseInt(request.getParameter("datasetID").toString());
    %>
      <form method="post" action="relatedTasks.jsp" name="form_list">
          
       <h1>
        العمل تشغيل
       </h1>
        
          <div align="center">
          <table border="1" width="100%">
              <tr>
                  <td align="center"><h3>العمل العضوية</h3></td>
                  <td align="center"><h3>العمل تشغيل</h3></td>
              </tr>
              <tr>
                  <td>
                    <div align="center">

                        <sql:query var="rs" dataSource="jdbc/madad">
                              SELECT * FROM task WHERE D_ID=<%=datasetID%> and status='Ended';
                          </sql:query>  
                     <c:choose>    
                              <c:when test="${rs.rowCount == 0}">   <!--  this print mean "nothing" -->
                                  <%

                                     out.print("لا يوجد");     
                                  %>
                              </c:when>
                      <c:when test="${rs.rowCount > 0}">
                          <c:forEach var="row" items="${rs.rows}"> 
                           <input type="hidden" id="task${row.ta_ID}" value="${row.Description}"/>
                           <input type="radio" id="taskID" name="taskID" onclick="loadDescription(this.value)" value="${row.ta_ID}">${row.Task_Name}<br>
                          </c:forEach>
                      </c:when>
                          </c:choose>
                    </div>
                  </td>
                  <td>
                    <div align="center">
                        <sql:query var="rs" dataSource="jdbc/madad">
                              SELECT * FROM task WHERE D_ID=<%=datasetID%> and status='running';
                          </sql:query>  

                     <c:choose>    
                              <c:when test="${rs.rowCount == 0}">   <!--  this print mean "nothing" -->
                                  <%

                                     out.print("لا يوجد");     
                                  %>
                              </c:when>
                      <c:when test="${rs.rowCount > 0}">
                          <c:forEach var="row" items="${rs.rows}"> 
                           <input type="hidden" id="task${row.ta_ID}" value="${row.Description}"/>
                           <input type="radio" id="taskID" name="taskID" onclick="loadDescription(this.value)" value="${row.ta_ID}">${row.Task_Name}<br>
                          </c:forEach>
                      </c:when>
                          </c:choose>
                    </div>
                  </td>
              </tr>
          </table>
              <br>
              <h2 align="right">الوصف</h2>
              <div align="right">
                   <textarea id="description" style="min-height:100px;"></textarea>
              </div> 
          </div>
</form>
                <div id="footer">
<p><small>Copyright by KSU &copy2015. All rights reserved.</small></p>
</div>
            </div>
    </body> 
</html>
