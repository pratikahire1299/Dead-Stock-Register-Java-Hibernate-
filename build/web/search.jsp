<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="DSR.POJO.Consume_CDSR"%>
<%@page import="DSR.POJO.CDSR"%>
<%@page import="DSR.DAO.AjaxSearchDAO"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>search jsp</title>
        <%@include file="Sidebar/fileinclude.html"%>
        <style>
            #searchul{
                background-color: #ffffff;
                cursor:pointer;
            }
           #searchli{
                padding:12px;
           }
           #searchli:hover{
               background-color:#ddd;
               color:blue;
           }
           #searchliii{
                padding:12px;
           }
           #searchliii:hover{
               background-color:#ddd;
               color:blue;
           }
        </style>
    </head>
    <body>
       <%
           Long idddd=Long.parseLong(request.getParameter("idddd"));
           ListIterator output=null;
           String search_char=request.getParameter("supplier_name");
           if(idddd==1)
           {
           output=AjaxSearchDAO.Filtersupplier(search_char);
           CDSR c1=new CDSR();    
       %>
           <ul class="list-unstyled" id="searchul">
               <%
                   while(output.hasNext())
                   {
                       c1=(CDSR)output.next();
                   %>
                   <li id="searchli"><%= c1.getSupplier() %></li>
               <% }%>
           </ul>
           <%}
            if(idddd==2)
            {
                output=AjaxSearchDAO.FilterConsumeSupplier(search_char);
                Consume_CDSR c1=new Consume_CDSR();    
       %>
           <ul class="list-unstyled" id="searchul">
               <%
                   while(output.hasNext())
                   {
                       c1=(Consume_CDSR)output.next();
                   %>
               <li id="searchli"><%= c1.getConsume_supplier_name() %></li>
               <% }%>
           </ul>
        <%}
            if(idddd==3)
            {
                String product_name=request.getParameter("product_name");
                output=AjaxSearchDAO.FilterConsumeProduct(product_name);
                Consume_CDSR c1=new Consume_CDSR();    
       %>
           <ul class="list-unstyled" id="searchul">
               <%
                   while(output.hasNext())
                   {
                       c1=(Consume_CDSR)output.next();
                   %>
               <li id="searchliii"><%= c1.getConsume_product_name() %></li>
               <% }%>
           </ul>
        <%}%>
    </body> 
</html>
<%} else{ response.sendRedirect("index.jsp");}%>