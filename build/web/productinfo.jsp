<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DSR.POJO.DDSR"%>
<%@page import="java.util.ListIterator"%>
<%@page import="org.hibernate.Session"%>
<%@page import="DSR.Helper.NewHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Info</title
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
                                    ListIterator lit=ss.createQuery("FROM DDSR where DDSR_Id="+pid).list().listIterator();
                                        DDSR dd=new DDSR();
                                    while(lit.hasNext())
                                    {
                                        dd=(DDSR)lit.next();
                                                            SimpleDateFormat date1=new SimpleDateFormat("yyyy-MM-dd");
                    SimpleDateFormat date2=new SimpleDateFormat("dd/MM/yyyy");
                    String date_purchase=date2.format(date1.parse(dd.getDate_of_receive()));
                                %>
                                <div class="row">
                                    <div class="col-lg-12 col-xs-12">
                                        <table class="table table-hover table-bordered">
                                            <tbody>
                                                <tr>
                                                    <td class="font-weight-bold">Product Description:</td>
                                                    <td><u><b><%= dd.getProduct_description() %></u></b></td>
                                                </tr>
                                                <tr>
                                                    <td>CDSR No.:</td>
                                                    <td><%= dd.getCdsr_no() %></td>
                                                </tr>
                                                <tr>
                                                    <td>CDSR Page No.:</td>
                                                    <td><%= dd.getCdsr_pg_no() %></td>
                                                </tr>
                                                <tr>
                                                    <td>CDSR Sr No.:</td>
                                                    <td><%= dd.getCdsr_sr_no() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Dept. DSR No:</td>
                                                    <td><%= dd.getDdsr_no() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Dept. DSR Page No:</td>
                                                    <td><%= dd.getDdsr_pg_no() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Dept. DSR Sr. No:</td>
                                                    <td><%= dd.getDdsr_sr_no() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Department:</td>
                                                    <td><%= dd.getDepartment() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Supplier Name:</td>
                                                    <td><%= dd.getSupplier_name() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Product Category:</td>
                                                    <td><%= dd.getProduct_category() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Date of Receive:</td>
                                                    <td><%= date_purchase %></td>
                                                </tr>
                                                <tr>
                                                    <td>Product Type:</td>
                                                    <td><%= dd.getProduct_type() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Real Accepted Product Quantity:</td>
                                                    <td><%= dd.getRealAcceptedProduct_Quantity() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Running Product Quantity:</td>
                                                    <td><%= dd.getProduct_quantity() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Single Product Cost:</td>
                                                    <td><%= dd.getCost_unit() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Total Cost:</td>
                                                    <td><%= dd.getTotal_cost() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Year of Buy:</td>
                                                    <td><%= dd.getYear_of_buy() %></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                                <%}%>
                                               
                        
                                    </div>
                                </div>
                                                
                           
        </main>
    </body>
</html>
<% } else { response.sendRedirect("index.jsp"); }%>