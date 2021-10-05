<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

%>
<%@page import="org.hibernate.HibernateException"%>
<%@page import="DSR.DAO.UpdateDAO"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <%
            try{
              
            String supplier_name=request.getParameter("consume_supplier_name");
             String product_name=request.getParameter("consume_product_name");
             int cdsr_no=Integer.parseInt(request.getParameter("consume_CDSR_no"));
              int cdsr_page_no=Integer.parseInt(request.getParameter("consume_CDSR_page_no"));
              int cdsr_sr_no=Integer.parseInt(request.getParameter("consume_CDSR_sr_no"));
              int order_no=Integer.parseInt(request.getParameter("Consume_order_no"));
              int purchase_quantity=Integer.parseInt(request.getParameter("consume_purchase_quantity"));
              long cost_per_unit=Long.parseLong(request.getParameter("consume_cost_per_unit"));
              int Total=Integer.parseInt(request.getParameter("consume_total"));
              String purchase_year=request.getParameter("consume_purchase_year");
              String date_of_purchase=request.getParameter("consume_date_of_purchase");
              long id=Long.parseLong(request.getParameter("tpid"));
              long final_pro_qty=Long.parseLong(request.getParameter("final_product_qty_accept"));
              String product_unit=request.getParameter("product_unit");
              System.out.println(product_unit);
             
              int result=0;
              result=UpdateDAO.updateConsumeCDSRRecords(supplier_name,product_name,cdsr_no,cdsr_page_no,cdsr_sr_no,order_no,purchase_quantity,cost_per_unit,Total,purchase_year,date_of_purchase,id,final_pro_qty,product_unit);
              if(result>0)
              {
      
                  response.sendRedirect("../ConsumeAcceptance_CDSR.jsp?uid=1");
              }
              else
              {
                  response.sendRedirect("../ConsumeAcceptance_CDSR.jsp?uid=2");
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