<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
%>
<%@page import="org.hibernate.HibernateException"%>
<%@page import="DSR.DAO.UpdateDAO"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Update the accepted </title>
    </head>
    <body>
        <%
            try{
            String supplier_name=request.getParameter("supplier");
            String year_purchase=request.getParameter("purchase_year");
            int cdsr_no=Integer.parseInt(request.getParameter("CDSR_no"));
            int cdsr_page_no=Integer.parseInt(request.getParameter("CDSR_page_no"));
            int cdsr_sr_no=Integer.parseInt(request.getParameter("CDSR_Sr_No"));
            String product_Description=request.getParameter("product_description");
            int product_Quantity=Integer.parseInt(request.getParameter("product_quantity"));
            String purchase_Authority=request.getParameter("purchase_authority");
            String date_Of_purchase=request.getParameter("date_of_purchase");
            long cost_per_unit=Long.parseLong(request.getParameter("single_cost"));
            long Total=Long.parseLong(request.getParameter("total_cost"));
            long id=Long.parseLong(request.getParameter("item_id"));
            String product_category=request.getParameter("product_category");
            int result=0;
            result=UpdateDAO.updateCDSRRecords(id,supplier_name,year_purchase,cdsr_no,cdsr_page_no,cdsr_sr_no,product_Description,product_Quantity,purchase_Authority,date_Of_purchase,cost_per_unit,Total,product_category);
             
            if(result>0)
            {
                response.sendRedirect("../distrubution.jsp?uid=1");
            }
            else
            {
                response.sendRedirect("../distribution.jsp?uid=2");
            }
            } 
           catch(HibernateException he)
           {
               he.printStackTrace();
           }
         
        %>
    </body>
</html>
<%} else{ response.sendRedirect("index.jsp");}%>