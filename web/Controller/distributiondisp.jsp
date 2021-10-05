<%@page import="java.text.SimpleDateFormat"%>
<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="DSR.DAO.AjaxTableShow"%>
<%@page import="java.util.ListIterator"%>
<%@page import="DSR.POJO.CDSR"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            int lid=Integer.parseInt(request.getParameter("lid"));
            CDSR cdsr=new CDSR();
            ListIterator lit=null;
            
            try{
            if(lid==1)
            {
                String supplier=request.getParameter("supplier");
                String date_of_purchase=request.getParameter("date_of_purchase");
                lit=AjaxTableShow.deadstockDistribution(supplier,date_of_purchase);
                while(lit.hasNext())
                {
                    cdsr=(CDSR)lit.next();
                    SimpleDateFormat date1=new SimpleDateFormat("yyyy-MM-dd");
                    SimpleDateFormat date2=new SimpleDateFormat("dd/MM/yyyy");
                    String date_purchase=date2.format(date1.parse(cdsr.getDate_of_purchase()));
            %>
            <tr>
                    <td class="text-center"><%= cdsr.getCDSR_Sr_No() %></td>
                    <td class="text-center"><a href="cdsrproductinfo.jsp?procdsr_id=<%= cdsr.getCdsr_id()%>"><%= cdsr.getProduct_description()%></a></td>
                    <td class="text-center"><%= date_purchase %></td>
                    <td class="text-center"><%= cdsr.getProduct_quantity() %></td>
                    <td class="text-center"><%= cdsr.getSingle_cost() %></td>
                    <td class="text-center"><%= cdsr.getTotal_cost() %></td>
                    <td><a href="UpdateCDSRDetails.jsp?lid=<%= cdsr.getCdsr_id()%>" class="btn btn-info">Update</a></td>
            </tr>
            <%}
            }
            if(lid==2){
                String supplierr=request.getParameter("supplierr");
                String date_of_purchasee=request.getParameter("date_of_purchasee");
                lit=AjaxTableShow.deadstockTransfer(supplierr,date_of_purchasee);
                while(lit.hasNext())
                {
                    cdsr=(CDSR)lit.next();
            %>
            <tr>
                <td class="text-center"><%= cdsr.getProduct_description()%></td>
                <td class="text-center"><a href="cdsrproductinfo.jsp?procdsr_id=<%= cdsr.getCdsr_id()%>"><%= cdsr.getProduct_description()%></a></td>
                <td class="text-center"><%= cdsr.getPurchase_authority()%></td>
                <td><a href="transfer.jsp?tpid=<%=cdsr.getCdsr_id()%>" class="btn btn-warning center-block">Transfer</a></td>
            </tr>  
          <%} 
        }
} catch(Exception e){ e.printStackTrace();} %>
    </body>
</html>
<%} else{ response.sendRedirect("index.jsp");}%>