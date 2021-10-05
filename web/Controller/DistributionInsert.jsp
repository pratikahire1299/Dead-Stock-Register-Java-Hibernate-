<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="DSR.DAO.UpdateDAO"%>
<%@page import="DSR.DAO.InsertDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        
        <jsp:useBean id="cdsrobj" class="DSR.POJO.CDSR">
        </jsp:useBean>
        <jsp:setProperty property="*" name="cdsrobj"></jsp:setProperty>
        <%
            int Remaining_item=Integer.parseInt(request.getParameter("product_quantity"));
            cdsrobj.setRemaining_Quantity(Remaining_item);
            cdsrobj.setWriteOff_status("NULL");
            int product_quantity=Integer.parseInt(request.getParameter("product_quantity"));
            cdsrobj.setActive_product(product_quantity);
            int i=InsertDAO.AddDistribute(cdsrobj);
            if(i>0)
            { response.sendRedirect("../distrubution.jsp?succ_id=1"); }
            else{response.sendRedirect("../distrubution.jsp?succ_id=2");} 
        %>
        
    </body>
</html>
<%
}else{ response.sendRedirect("../index.jsp"); }%>