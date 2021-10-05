<%@page import="DSR.DAO.InsertDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        
        <jsp:useBean id="consumecdsr" class="DSR.POJO.Consume_CDSR">
        </jsp:useBean>
        <jsp:setProperty property="*" name="consumecdsr"></jsp:setProperty>
        <%
            
            int order_no=Integer.parseInt(request.getParameter("Consume_order_no"));
            consumecdsr.setConsume_order_no(order_no);
            int i=InsertDAO.AcceptConsumableProduct(consumecdsr);
            if(i>0)
            { response.sendRedirect("../ConsumeAcceptance_CDSR.jsp?succ_id=1"); }
            else{ response.sendRedirect("../ConsumeAcceptance_CDSR.jsp?succ_id=2");
            }
        
        
        %>      
    </body>
</html>
<%} else{ response.sendRedirect("../index.jsp"); }%>

