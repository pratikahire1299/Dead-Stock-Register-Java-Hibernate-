<%-- 
    Document   : logout
    Created on : Aug 17, 2018, 10:02:38 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
             try{
          session.removeAttribute("login");
          session.invalidate();
          response.sendRedirect("../index.jsp");
             } catch(Exception e){ e.printStackTrace();}
      %>
    </body>
</html>
