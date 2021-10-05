<%@page import="java.security.MessageDigest"%>
<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="DSR.DAO.UpdateDAO"%>
<%@page import="java.lang.String"%>
<%@page import="DSR.DAO.CheckDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            String usname=request.getParameter("usname1");
            String Passw=request.getParameter("passw1");
            String New_pass=request.getParameter("cpassw2");
          MessageDigest m=MessageDigest.getInstance("MD5");
          m.update((new String(Passw).getBytes("UTF8")));
          String str=new String(m.digest());
                int i;
                
                i=CheckDAO.LoginCheck(usname,str);
                if(i==1)
                {
                    int a=UpdateDAO.Update_pass(usname,New_pass);
                        response.sendRedirect("../Dashboard.jsp");
                }
                else if(i==2)
                {
                    
                    out.println("Password not updated");
                }
           
      %>    
    </body>
</html>
<%} else{ response.sendRedirect("index.jsp");}%>