<%@page import="DSR.POJO.DDSR"%>
<%@page import="DSR.DAO.Display_distribution_DAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DSR.POJO.CDSR"%>
<%@page import="java.util.ListIterator"%>
<%@page import="org.hibernate.Session"%>
<%@page import="DSR.Helper.NewHibernateUtil"%>
<%
    if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CDSR Product info</title>
        <%@include file="Sidebar/fileinclude.html"%>
    </head>
    <body>
        <%@include file="Sidebar/sidebar.html"%>
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
                                    long cdsr_table_id=0;
                                    long pid=Long.parseLong(request.getParameter("procdsr_id"));
                                    Session ss=NewHibernateUtil.getSessionFactory().openSession();
                                    ListIterator lit=ss.createQuery("FROM CDSR where CDSR_Id="+pid).list().listIterator();
                                        CDSR dd=new CDSR();
                                    while(lit.hasNext())
                                    {
                                        dd=(CDSR)lit.next();
                                                            SimpleDateFormat date1=new SimpleDateFormat("yyyy-MM-dd");
                    SimpleDateFormat date2=new SimpleDateFormat("dd/MM/yyyy");
                    String date_purchase=date2.format(date1.parse(dd.getDate_of_purchase()));
                                %>
                                <div class="row">
                                    <div class="col-lg-12 col-xs-12">
                                        <table class="table table-hover table-bordered">
                                            <tbody>
                                                <tr>
                                                    <td class="font-weight-bold">Product Description:</td>
                                                    <td><u><b><%= dd.getProduct_description()%></u></b></td>
                                                </tr>
                                                <tr>
                                                    <td>Cdsr Name:</td>
                                                    <td><%= dd.getCdsr_name()%></td>
                                                </tr>
                                                <tr>
                                                    <td>CDSR No.:</td>
                                                    <td><%= dd.getCDSR_no()%></td>
                                                </tr>
                                                <tr>
                                                    <td>CDSR Page No.:</td>
                                                    <td><%= dd.getCDSR_page_no() %></td>
                                                </tr>
                                                <tr>
                                                    <td>CDSR Sr.No.:</td>
                                                    <td><%= dd.getCDSR_Sr_No() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Supplier:</td>
                                                    <td><%= dd.getSupplier() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Product Category:</td>
                                                    <td><%= dd.getProduct_category() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Product Type:</td>
                                                    <td><%= dd.getProduct_type() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Purchase Authority:</td>
                                                    <td><%= dd.getPurchase_authority() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Date Of Purchase:</td>
                                                    <td><%= date_purchase%></td>
                                                </tr>
                                                <tr>
                                                    <td>Purchase Year:</td>
                                                    <td><%= dd.getPurchase_year() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Cost/unit:</td>
                                                    <td><%= dd.getSingle_cost() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Total Cost:</td>
                                                    <td><%= dd.getTotal_cost() %></td>
                                                </tr>
                                </tbody>
                                        </table>
                                                
                                                <h2>Product Quantity Information:</h2>
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Total Accepted Product Quantity:</th>
                                                            <th>Remaining Product Quantity:</th>
                                                            <th>Total Active Product Quantity:</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td><%= dd.getProduct_quantity() %></td>
                                                            <td><%= dd.getRemaining_Quantity() %></td>
                                                            <td><%= dd.getActive_product() %></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                        <%  cdsr_table_id=(long)dd.getCdsr_id();
                        }
                        ListIterator lit1=Display_distribution_DAO.showDistributionDeadStock(cdsr_table_id);
                       
                        DDSR c=new DDSR();
                    %>
                    <h2>Product Distribution Information:</h2>
                    <table class="table table-bordered table-hover table-responsive-lg">
                        <thead>
                            <tr>
                                <th class="text-center align-middle">Date of issue</th>
                                <th class="text-center align-middle">DDSR No</th>
                                <th class="text-center align-middle">DDSR Pg No</th>
                                <th class="text-center align-middle">DDSR SR No</th>
                                <th class="text-center align-middle">Department</th>
                                <th class="text-center align-middle">Qty Issued</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% while(lit1.hasNext()){
                                c=(DDSR)lit1.next();
                                SimpleDateFormat date1=new SimpleDateFormat("yyyy-MM-dd");
                            SimpleDateFormat date2=new SimpleDateFormat("dd/MM/yyyy");
                            String date_purchase=date2.format(date1.parse(c.getDate_of_receive()));
                            %>
                            <tr>
                                <td class="text-center align-middle"><%=date_purchase%></td>
                                <td class="text-center align-middle"><%=c.getDdsr_no()%></td>
                                <td class="text-center align-middle"><%=c.getDdsr_pg_no()%></td>
                                <td class="text-center align-middle"><%=c.getDdsr_sr_no()%></td>
                                <td class="text-center align-middle"><%=c.getDepartment()%></td>
                                <td class="text-center align-middle"><%= c.getRealAcceptedProduct_Quantity() %></td>
                            </tr>
                        
                             <%}%>
                        </tbody>
                    </table>                  
                
            </div>
        </main>
    </body>
</html>
<%
    } else { response.sendRedirect("index.jsp"); }
%>