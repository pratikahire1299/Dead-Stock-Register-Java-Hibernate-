<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
%>
<%@page import="DSR.DAO.UpdateDAO"%>
<%@page import="java.util.ListIterator"%>
<%@page import="DSR.POJO.CDSR"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DSR.DAO.DeleteEntry"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            int trans_id=Integer.parseInt(request.getParameter("id"));
            int quantity=Integer.parseInt(request.getParameter("qty"));
            String dept=request.getParameter("dept");
            long cdsr_Table_id=Long.parseLong(request.getParameter("cdsr_table_id"));
            
            int result=DeleteEntry.EntryDeletion(trans_id,quantity,cdsr_Table_id);
           
            
            if(result==1)
            {
                response.sendRedirect("../filtershow.jsp?id=1&criteria=All Items&department="+dept);
            }
            if(result==2)
            {
                response.sendRedirect("../filtershow.jsp?id=2&criteria=All Items&department="+dept);
            }
            
        %>
    </body>
</html>
<%
    } else { response.sendRedirect("index.jsp"); }
%>