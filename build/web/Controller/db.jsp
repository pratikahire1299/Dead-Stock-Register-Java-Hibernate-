<%@page import="java.security.MessageDigest"%>
<%@page import="DSR.DAO.CheckDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
     <%
       
             String usname=request.getParameter("usname");
          String Passw=request.getParameter("passw");
          /*MessageDigest m=MessageDigest.getInstance("MD5");
          m.update((new String(Passw).getBytes("UTF8")));
          String str=new String(m.digest());*/
         
            int i;

                i=CheckDAO.LoginCheck(usname,Passw);
                System.out.println(i);
                if(i==1)
                {
                    session.setAttribute("login",usname);
                    response.sendRedirect("../Dashboard.jsp");
                }
                else if(i==2)
                {
                    response.sendRedirect("../index.jsp?msg=Incorrect Username or Password");
                }
        
     %>           
    </body>
</html>