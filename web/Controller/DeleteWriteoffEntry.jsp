<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
%>
<%@page import="DSR.POJO.DDSR"%>
<%@page import="DSR.DAO.UpdateDAO"%>
<%@page import="DSR.POJO.CDSR"%>
<%@page import="java.util.ListIterator"%>
<%@page import="DSR.DAO.DeleteEntry"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%
            int writeoff_id=Integer.parseInt(request.getParameter("wid"));
           int quantity=Integer.parseInt(request.getParameter("qty"));
           long ddsr_table_id=Long.parseLong(request.getParameter("ddsr_table_id"));
           long cdsr_table_id=Long.parseLong(request.getParameter("cdsr_table_id"));
            ListIterator lit=DeleteEntry.getcdsrWriteoffQuantity(cdsr_table_id);
            ListIterator lit1=DeleteEntry.getddsrwriteoffQuantity(ddsr_table_id,cdsr_table_id);
            try
            {
            int cdsr_product_qnt=0;
            int ddsr_product_qnt=0;
            while(lit.hasNext())
            {
                CDSR cdsr=(CDSR)lit.next();
                cdsr_product_qnt=(int)cdsr.getActive_product();
                
            }
            cdsr_product_qnt=cdsr_product_qnt+quantity;
            while(lit1.hasNext())
            {
                DDSR ddsr=(DDSR)lit1.next();
                ddsr_product_qnt=(int)ddsr.getProduct_quantity();
                
            }
            ddsr_product_qnt=ddsr_product_qnt+quantity;
            int final_result=DeleteEntry.deletewriteoffProduct(writeoff_id,cdsr_table_id,ddsr_table_id,cdsr_product_qnt,ddsr_product_qnt);
            
            if(final_result==1)
            {
                response.sendRedirect("../All_write_off_product.jsp?succ_id=1");
            }
            if(final_result==2)
            {
                response.sendRedirect("../All_write_off_product.jsp?succ_id=2");
            }
            
            } catch(Exception e)
            {
                out.println("no");
                e.printStackTrace();
            }
        %>
    </body>
</html>
<%
    } else { response.sendRedirect("index.jsp"); }
%>