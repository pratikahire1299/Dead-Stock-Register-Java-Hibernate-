<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DSR.POJO.ConsumeDDSR"%>
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
        <title>Dept. Consumable Pro. Info</title>
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
                                    long pid=Long.parseLong(request.getParameter("pid"));
                                    Session ss=NewHibernateUtil.getSessionFactory().openSession();
                                    ListIterator lit=ss.createQuery("FROM ConsumeDDSR where Consumeddsr_id="+pid).list().listIterator();
                                        ConsumeDDSR dd=new ConsumeDDSR();
                                    while(lit.hasNext())
                                    {
                                        dd=(ConsumeDDSR)lit.next();
                                                            SimpleDateFormat date1=new SimpleDateFormat("yyyy-MM-dd");
                    SimpleDateFormat date2=new SimpleDateFormat("dd/MM/yyyy");
                    String date_purchase=date2.format(date1.parse(dd.getDate_of_issue()));
                                %>
                                <div class="row">
                                    <div class="col-lg-12 col-xs-12">
                                        <table class="table table-hover table-bordered">
                                            <tbody>
                                                <tr>
                                                    <td class="font-weight-bold">Product Description:</td>
                                                    <td><u><b><%= dd.getProduct_name() %></u></b></td>
                                                </tr>
                                                <tr>
                                                    <td>CC/R No.:</td>
                                                    <td><%= dd.getCdsr_no() %></td>
                                                </tr>
                                                <tr>
                                                    <td>CC/R Page No.:</td>
                                                    <td><%= dd.getCdsr_pg_no() %></td>
                                                </tr>
                                                <tr>
                                                    <td>CC/R Sr. No.:</td>
                                                    <td><%= dd.getCdsr_sr_no() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Department:</td>
                                                    <td><%= dd.getDepartment() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Supplier Name:</td>
                                                    <td><%= dd.getSupplier() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Date of Receive:</td>
                                                    <td><%= date_purchase %></td>
                                                </tr>
                                                <tr>
                                                    <td>Accepted Product Quantity:</td>
                                                    <td><% out.print(dd.getFinal_product_quantity1()+" "+dd.getC_Purchase_Unit()); %></td>
                                                </tr>
                                                <tr>
                                                    <td>Total Cost:</td>
                                                    <td><%= dd.getDdsr_total() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Year of Buy:</td>
                                                    <td><%= dd.getPurchase_year() %></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                                <%}%>
                                               
                        
                                    </div>
                                </div>
                                                
                           
        </main>
    </body>
</html>
<%
    } else { response.sendRedirect("index.jsp"); }
%>