<%-- 
    Document   : saveSchema
    Created on : 22/06/2015, 06:19:01 
    Author     : Aysha Al-Mahmoud
 this page is supposed to save a schema into the database
--%>

<%@page import="org.w3c.dom.Element"%>
<%@page import="org.xml.sax.InputSource"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@ page import="java.io.*" %>
<%@ page import="parse.SimpleErrorHandler" %>
<%@ page import ="java.sql.*" %>

        <%
            String schema = request.getParameter("write_schema");
        
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
factory.setValidating(false);
factory.setNamespaceAware(true);
try{
DocumentBuilder builder = factory.newDocumentBuilder();

builder.setErrorHandler(new SimpleErrorHandler());

Document doc = builder.parse(new InputSource(new StringReader(schema)));
 doc.getDocumentElement().normalize();
 
 
 Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MADAD?useUnicode=true&characterEncoding=UTF-8",
            "root", "");
    
    request.setCharacterEncoding("UTF8");
    String type ="";
    String task_name = request.getParameter("task_name");
    String task_des = request.getParameter("task_des");
    String corpus_text = request.getParameter("corpus_text");//!
    String anno_level = request.getParameter("anno_level");//!
    String anno_num = request.getParameter("qty");
    int anno_numint = Integer.parseInt(anno_num);
    String read_type = request.getParameter("read_type");
    String guides = request.getParameter("guides");
    
    Statement st = (Statement) con.createStatement();
    Statement st2 = (Statement) con.createStatement();
    int i = 0, i2=0; 
     i = st.executeUpdate("insert into annotation_style (Name, Description, Annotation_Scheme, Level_Of_Annoation, D_ID) values('"+ task_name + "','" +task_des+"','"+schema+"','"+anno_level+"','"+corpus_text+"')");
    i2 = st2.executeUpdate("insert into dom_file (name, Dom_URL, schema_id) values('"+ "domeFile" + "','" +doc+"','"+4+"')");
          
   
       
out.println("Schema created successfully");
}
catch(Exception e ){
out.println("The schema syntax was NOT well-formed, here's the error: "+e);}
%>
