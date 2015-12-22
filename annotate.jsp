<%-- 
    Document   : index
    Created on : 22/06/2015, 06:19:01 ص
    Author     : aysha
--%>
<%@page import="java.util.Date" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Annotate text</title>
	<!--<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Varela+Round">-->
	<link rel="stylesheet" href="minimal.css">

    </head>
    <body>
        <div id="wrapper">
  <div id="header">
      <header style="margin-top: 10px;">
          <img src="madad.png" alt="logo" style="float: right; right: 0px; top: 0px;">
          <label style="font-size:30pt; font-weight: bold;">(Arabic annotation tool)</label><br><br>
            <label style="font-size:20pt; ">(تحشية المدونات العربية)</label>
                        
    </header>
  </div>
	<div id="content">
            <H1>Annotate text</H1>
            <FORM ACTION="saveSchema.jsp" METHOD="POST">
                <BR>
                <TEXTAREA NAME="schema" ROWS="12" COLS="125"></TEXTAREA>
                <BR>
                <INPUT TYPE="SUBMIT" VALUE="Submit"><INPUT TYPE="RESET" VALUE="Reset">
            </FORM>
	</div> <!-- end login -->
	
        <div id="footer">
<p><small>Copyright by KSU &copy2015. All rights reserved.</small></p>
</div>
        </div>
    </body>
</html>
