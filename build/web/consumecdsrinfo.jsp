<%@page import="DSR.POJO.ConsumeDDSR"%>
<%@page import="DSR.DAO.Display_distribution_DAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DSR.POJO.Consume_CDSR"%>
<%@page import="java.util.ListIterator"%>
<%@page import="DSR.Helper.NewHibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%
    if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consumable Product Information</title>
        <%@include file="Sidebar/fileinclude.html"%>
    </head>
    <body>
        <%@include file="Sidebar/sidebar.html"%>\
        <main class="page-content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-xs-12">
                        <div class="card">
                            <div class="card-header">
                                <h2>Product Information:</h2>
                            </div>
                            <div class="card-body">
                                <%
                                    int cdsr_no=0;
                                    int cdsr_pg_no=0;
                                    int cdsr_sr_no=0;
                                    long pid=Long.parseLong(request.getParameter("procdsr_id"));
                                    Session ss=NewHibernateUtil.getSessionFactory().openSession();
                                    ListIterator lit=ss.createQuery("FROM Consume_CDSR where Consume_CDSR_Id="+pid).list().listIterator();
                                        Consume_CDSR dd=new Consume_CDSR();
                                    while(lit.hasNext())
                                    {
                                        dd=(Consume_CDSR)lit.next();
                                                            SimpleDateFormat date1=new SimpleDateFormat("yyyy-MM-dd");
                    SimpleDateFormat date2=new SimpleDateFormat("dd/MM/yyyy");
                    String date_purchase=date2.format(date1.parse(dd.getConsume_date_of_purchase()));
                                %>
                                <div class="row">
                                    <div class="col-lg-12 col-xs-12">
                                        <table class="table table-hover table-bordered">
                                            <tbody>
                                                <tr>
                                                    <td class="font-weight-bold">Product Description:</td>
                                                    <td><u><b><%= dd.getConsume_product_name() %></u></b></td>
                                                </tr>
                                                <tr>
                                                    <td>CDSR No.:</td>
                                                    <td><%= dd.getConsume_CDSR_no()%></td>
                                                </tr>
                                                <tr>
                                                    <td>CDSR Page No.:</td>
                                                    <td><%= dd.getConsume_CDSR_page_no() %></td>
                                                </tr>
                                                <tr>
                                                    <td>CDSR Sr.No.:</td>
                                                    <td><%= dd.getConsume_CDSR_sr_no() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Supplier:</td>
                                                    <td><%= dd.getConsume_supplier_name() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Product Grant:</td>
                                                    <td><%= dd.getProduct_grant() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Product Order No.:</td>
                                                    <td><%= dd.getConsume_order_no() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Date Of Purchase:</td>
                                                    <td><%= date_purchase%></td>
                                                </tr>
                                                <tr>
                                                    <td>Cost Per Unit:</td>
                                                    <td><%= dd.getConsume_cost_per_unit() %></td>
                                                </tr>
                                                
                                                <tr>
                                                    <td>Total Cost:</td>
                                                    <td><%= dd.getConsume_total() %></td>
                                                </tr>
                                </tbody>
                                        </table>
                                                <%
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
                                                <h2>Product Quantity Information:</h2>
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Total Accepted Product Quantity:</th>
                                                            <th>Remaining Product Quantity:</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td><% out.print(dd.getConsume_purchase_quantity()+" "+dd.getProduct_unit()); %></td>
                                                            <td><% out.print(total_quantity1+" "+dd.getProduct_unit()); %></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                        <%  cdsr_no=(int)dd.getConsume_CDSR_no();
                         cdsr_pg_no=(int)dd.getConsume_CDSR_page_no();
                         cdsr_sr_no=(int)dd.getConsume_CDSR_sr_no();
                        }
                        ListIterator lit1=Display_distribution_DAO.showDistribution(cdsr_no,cdsr_pg_no,cdsr_sr_no);
                       
                        ConsumeDDSR c=new ConsumeDDSR();
                    %>
                    <h2>Product Distribution Information:</h2>
                    <table class="table table-bordered table-hover table-responsive-lg">
                        <thead>
                            <tr>
                                <th class="text-center align-middle">Date of issue</th>
                            
                                <th class="text-center align-middle">Indent No</th>
                                <th class="text-center align-middle">Department</th>
                                <th class="text-center align-middle">Qty Issued</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% while(lit1.hasNext()){
                                c=(ConsumeDDSR)lit1.next();
                                SimpleDateFormat date1=new SimpleDateFormat("yyyy-MM-dd");
                            SimpleDateFormat date2=new SimpleDateFormat("dd/MM/yyyy");
                            String date_purchase=date2.format(date1.parse(c.getDate_of_issue()));
                            %>
                             <tr>
                                <td class="text-center align-middle"><%=date_purchase%></td>
                             
                                <td class="text-center align-middle"><%=c.getIndent_no()%></td>
                                <td class="text-center align-middle"><%=c.getDepartment()%></td>
                          
                                <td class="text-center align-middle"><% out.print(c.getQuantity_issued()+" "+c.getC_Purchase_Unit()); %></td>
                            </tr>
                        
                             <%}%>
                        </tbody>
                    </table>                  
                
            </div>
        </main>
    </body>
</html>
<%
    } else
{
response.sendRedirect("index.jsp");
}
%>