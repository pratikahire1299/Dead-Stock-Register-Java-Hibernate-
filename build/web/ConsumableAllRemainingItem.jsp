<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="DSR.POJO.Consume_CDSR"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="DSR.Helper.NewHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consumable All Remaining Item</title>
        <%@include file="Sidebar/fileinclude.html"%>
        <link rel='stylesheet' href='Sidebar/CSS/dataTables.bootstrap4.min.css'/>
        <style>
            th,td{
                vertical-align:middle;
            }
        </style>
    </head>
    <body>
        <%
            
            try{
                Session se=NewHibernateUtil.getSessionFactory().openSession();
            Transaction trans=se.beginTransaction();
            Query q=se.createQuery("from Consume_CDSR where final_product_quantity>0");
            Consume_CDSR dd=new Consume_CDSR();
            List li=q.list();
            ListIterator lit=li.listIterator();     
        %>
        <%@include file="Sidebar/sidebar.html"%>
        <main class="page-content">
            <div class="container-fluid">
                <h2>Consumable All Remaining Item</h2>
                <hr/>
                <br/>
                <table class="table table-bordered table-hover table-responsive-lg" id='example'>
                    <thead class='thead-light'>
                        <tr>
                            <th class="text-center" style="vertical-align:middle;">Consume_Order_No</th>
                            <th class="text-center" style="vertical-align:middle;">ConsumeCDSR_Product_Name</th>
                            <th class="text-center" style="vertical-align:middle;">Consume_Purchase_Year</th>
                            <th class="text-center" style="vertical-align:middle;">Consume_Remaining_Quantity</th>
                            <th class="text-center" style="vertical-align:middle;">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            while(lit.hasNext())
                            {
                                dd=(Consume_CDSR)lit.next();
                                float final_pro_qty1=dd.getFinal_product_quantity();
                                String pro_unit1=dd.getProduct_unit();
                                float total_quantity1=1;
                            if(pro_unit1.equals("Meter"))
                            {
                                total_quantity1=(final_pro_qty1/100);
                            }
                            else if(pro_unit1.equals("Liter"))
                            {
                                total_quantity1=(final_pro_qty1/1000);
                            }
                            else if(pro_unit1.equals("Kilogram"))
                            {
                                total_quantity1=final_pro_qty1/1000;
                            }
                            else if(pro_unit1.equals("Feet"))
                            {
                                total_quantity1=final_pro_qty1/30;
                            }
                            else
                            {
                                total_quantity1=final_pro_qty1;
                            }
                        %>
                        <tr>
                            <td class="text-center" style="vertical-align:middle;"><%= dd.getConsume_order_no()%></td>
                            <td class="text-center" style="vertical-align:middle;"><a href="consumecdsrinfo.jsp?procdsr_id=<%= dd.getConsume_CDSR_Id()%>"><%= dd.getConsume_product_name()%></a></td>
                            <td class="text-center" style="vertical-align:middle;"><%= dd.getConsume_purchase_year()%></td>
                            <td class="text-center" style="vertical-align:middle;"><% out.print(total_quantity1+" "+dd.getProduct_unit()); %></td>
                            <td class="text-center" style="vertical-align:middle;"><a href="ConsumableDistribute2.jsp?item_id=<%= dd.getConsume_CDSR_Id()%>" class="btn btn-info">Transfer</a></td>
                        </tr>
                       <%}%>
                        
                    </tbody>
                     <%   se.close();}catch(Exception e){ e.printStackTrace(); } %>
                </table>
            </div>
                        
        </main>
              <script src='Sidebar/JS/jquery.dataTables.min.js'></script>
              <script src='https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js'></script>
    <script>
        $(document).ready(function() {
    $('#example').DataTable();
} );
    </script>   
    </body>
</html>
<%} else{ response.sendRedirect("index.jsp"); }%>
