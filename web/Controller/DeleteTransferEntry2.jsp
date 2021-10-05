<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
%>
<%@page import="DSR.DAO.UpdateDAO"%>
<%@page import="DSR.POJO.Consume_CDSR"%>
<%@page import="java.util.ListIterator"%>
<%@page import="DSR.DAO.DeleteEntry"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>
    <body>
        <%
            long trans_id=Long.parseLong(request.getParameter("id"));
            long quantity=Long.parseLong(request.getParameter("qty"));
            String unit=request.getParameter("unit");
            String dept=request.getParameter("dept");
            long cdsr_table_id=Long.parseLong(request.getParameter("consumecdsr_table_id"));
            if(unit.equals("Liter"))
            {
               quantity=quantity*1000;  
            }
            else if(unit.equals("Kilogram"))
            {
                quantity=quantity*1000;
            }
            else if(unit.equals("Meter"))
            {
                quantity=quantity*100;
            }
            else if(unit.equals("Feet"))
            {
                quantity=quantity*30;
            }
            else
            {
                quantity=quantity*1;
            }
            int result=DeleteEntry.deleteConsumableEntry(trans_id,cdsr_table_id,quantity);    
            
            
            if(result==1)
            {
                response.sendRedirect("../ConsumeDDSR_View.jsp?id=1&department="+dept);
            }
            if(result==2)
            {
                response.sendRedirect("../ConsumeDDSR_View.jsp?id=2&department="+dept);
            }            
        %>
            
       
    </body>
</html>
<%
    } else { response.sendRedirect("index.jsp"); }
%>