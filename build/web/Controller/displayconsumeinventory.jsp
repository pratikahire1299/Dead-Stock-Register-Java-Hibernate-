<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DSR.DAO.AjaxTableShow"%>
<%@page import="java.util.ListIterator"%>
<%@page import="DSR.POJO.Consume_CDSR"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
<%
    long tid=Long.parseLong(request.getParameter("tid"));
    Consume_CDSR cd1=new Consume_CDSR();
    ListIterator lit=null;
    try
    {
        if(tid==1)
        {
            String product_name=request.getParameter("pro_name");
            String supplier_name=request.getParameter("sup_name");
            lit=AjaxTableShow.consumableTransfer(product_name,supplier_name);
            while(lit.hasNext())
            {
                cd1=(Consume_CDSR)lit.next();
                SimpleDateFormat date1=new SimpleDateFormat("yyyy-MM-dd");
                            SimpleDateFormat date2=new SimpleDateFormat("dd/MM/yyyy");
                            String date_purchase=date2.format(date1.parse(cd1.getConsume_date_of_purchase()));
                            float final_pro_qty=cd1.getFinal_product_quantity();
            String pro_unit=cd1.getProduct_unit();
            float total_quantity;
                            if(pro_unit.equals("Meter"))
                            {
                                total_quantity=(final_pro_qty/100);
                            }
                            else if(pro_unit.equals("Liter"))
                            {
                                total_quantity=(final_pro_qty/1000);
                            }
                            else if(pro_unit.equals("Kilogram"))
                            {
                                total_quantity=final_pro_qty/1000;
                            }
                            else if(pro_unit.equals("Feet"))
                            {
                                total_quantity=final_pro_qty/30;
                            }
                            else
                            {
                                total_quantity=final_pro_qty;
                            }
            %>
            <tr class="tr1">
                <td class="text-center" style="vertical-align:middle;"><a href="consumecdsrinfo.jsp?procdsr_id=<%= cd1.getConsume_CDSR_Id()%>"><%= cd1.getConsume_order_no() %></a></td>
                <td class="text-center" style="vertical-align:middle;"><%= date_purchase %></td>
                <td class="text-center" style="vertical-align:middle;"><%= cd1.getConsume_purchase_year()%></td>
                <td class="text-center" style="vertical-align:middle;"><% out.print(total_quantity+" "+cd1.getProduct_unit()); %></td>
                <td><a href="ConsumableDistribute2.jsp?item_id=<%= cd1.getConsume_CDSR_Id()%>" class="btn btn-warning mx-auto d-block">Transfer</a></td>
            </tr>
        <%}
        }
        if(tid==2)
        {
            String supplier=request.getParameter("supplier");
            String date_of_purchase=request.getParameter("date_of_purchase");
            lit=AjaxTableShow.consumableDistribution(supplier,date_of_purchase);
            while(lit.hasNext())
            {
                cd1=(Consume_CDSR)lit.next();
                SimpleDateFormat date1=new SimpleDateFormat("yyyy-MM-dd");
                            SimpleDateFormat date2=new SimpleDateFormat("dd/MM/yyyy");
                            String date_purchase=date2.format(date1.parse(cd1.getConsume_date_of_purchase()));
            %>
            <tr>
                <td class="text-center" style="vertical-align:middle;"><%= cd1.getConsume_CDSR_no()%></td>
                <td class="text-center" style="vertical-align:middle;"><%= cd1.getConsume_CDSR_page_no()%></td>
                <td class="text-center" style="vertical-align:middle;"><a href="consumecdsrinfo.jsp?procdsr_id=<%= cd1.getConsume_CDSR_Id()%>"><%= cd1.getConsume_product_name()%></a></td>
                <td class="text-center" style="vertical-align:middle;"><%= date_purchase %></td>
                <td class="text-center" style="vertical-align:middle;"><%= cd1.getConsume_purchase_quantity()%></td>
                <td class="text-center" style="vertical-align:middle;"><%= cd1.getConsume_cost_per_unit()%></td>
                <td class="text-center" style="vertical-align:middle;"><%= cd1.getConsume_total()%></td>
                <td><a href="UpdateConsume.jsp?lid=<%= cd1.getConsume_CDSR_Id()%>" class="btn btn-success">Update</a></td>
            </tr>
        <%}
        }
    } catch(Exception e)
    {
        e.printStackTrace();
    } finally{
        
    }
%>
    </body>
</html>
<%} else{ response.sendRedirect("index.jsp");}%>