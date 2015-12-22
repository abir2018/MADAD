<%-- 
    Document   : sendRequest
    Created on : 29/09/2015, 04:59:52 
    Author     : Aysha Al-Mahmoud
this page adds a new request from annotator to database with related information
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
        String name = (String)session.getAttribute("name");
    int  Task_ID = Integer.parseInt(request.getParameter("Task_ID"));
Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MADAD?useUnicode=true&characterEncoding=UTF-8",
            "root", "");  
        Statement st = con.createStatement();
        ResultSet  rs1 = st.executeQuery("select U_ID from annotator where Name='" + name + "'");
          int Annotator_ID=0;
        if(rs1.next()){
         Annotator_ID= Integer.parseInt(rs1.getString("U_ID"));}
        
        int M_ID=0;
   ResultSet  rs2 = st.executeQuery("select U_ID from task where T_ID='" + Task_ID + "'");
           if(rs2.next()){
     M_ID= Integer.parseInt(rs2.getString("U_ID"));}
int i = st.executeUpdate("insert into Request(Task_ID, Annotator_ID, Manager_ID, Status) values ('" + Task_ID + "','" + Annotator_ID + "','" + M_ID+ "','"+"waiting" +"')");
    if (i >0 ){
        session.setAttribute("userid", name);
        out.println("<script type=\"text/javascript\">");
   out.println("alert('Request has been sent');");
   out.println("location='viewAvailableTasks.jsp';");
   out.println("</script>");
    }
%>
