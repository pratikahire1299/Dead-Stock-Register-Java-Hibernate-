<%-- 
    Document   : ShowWithWriteoff
    Created on : 23-May-2019, 16:21:02
    Author     : Pritam
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DSR.POJO.DDSR"%>
<%@page import="java.util.ListIterator"%>
<%@page import="DSR.DAO.FilterDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
      <% 
          String dept=request.getParameter("department");
          String criteria=request.getParameter("criteria1");
          ListIterator lit=null;
         if(criteria.equals("Year"))
                    {try{
                        String startyear =request.getParameter("startyear");
                        String endyear=request.getParameter("endyear");
                        lit=FilterDAO.FiltershowYearwithwriteoff(dept,startyear, endyear);
                         while(lit.hasNext()){
                            DDSR ddsr=(DDSR)lit.next();
                            SimpleDateFormat date1=new SimpleDateFormat("yyyy-MM-dd");
                            SimpleDateFormat date2=new SimpleDateFormat("dd/MM/yyyy");
                            String date_purchase=date2.format(date1.parse(ddsr.getDate_of_receive()));
                        %>
                        <tr>
                            <%if(dept.equals("All Departments")){%><td class="text-center" style="vertical-align:middle;"><%= ddsr.getDepartment() %></td><%}%>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getDdsr_no()%></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getDdsr_pg_no()%></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getDdsr_sr_no()%></td>
                            <td class="text-center" style="vertical-align:middle;"><a href="productinfo.jsp?pid=<%= ddsr.getDdsr_id()%>"><%= ddsr.getProduct_description()%></a></td>
                            <td class="text-center" style="vertical-align:middle;"><%= date_purchase%></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getProduct_category() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getProduct_quantity() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getTotal_cost() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getProduct_type() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getYear_of_buy() %></td>
                            <td class="text-center" style="vertical-align:middle;"><a href="Controller/DeleteTransferEntry.jsp?id=<%= ddsr.getDdsr_id()%>&qty=<%= ddsr.getProduct_quantity()%>&cdsr_no=<%= ddsr.getCdsr_no()%>&cdsr_pageno=<%= ddsr.getCdsr_pg_no()%>&cdsr_srno=<%= ddsr.getCdsr_sr_no()%>&dept=<%= dept %>" class="btn btn-danger">Remove</a></td>
                            
                        </tr>
                        <%}
                  }
                  catch(Exception e)
                  {
                        e.printStackTrace();
                  }
               }
                   else if(criteria.equals("Category"))
                  {
                       try{
                        String category=request.getParameter("category");
                        lit=FilterDAO.FiltershowCategorywithwriteoff(dept,category);
                          while(lit.hasNext()){
                            DDSR ddsr=(DDSR)lit.next();
                            SimpleDateFormat date1=new SimpleDateFormat("yyyy-MM-dd");
                            SimpleDateFormat date2=new SimpleDateFormat("dd/MM/yyyy");
                            String date_purchase=date2.format(date1.parse(ddsr.getDate_of_receive()));
                        %>
                        <tr>
                            <%if(dept.equals("All Departments")){%><td class="text-center" style="vertical-align:middle;"><%= ddsr.getDepartment() %></td><%}%>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getDdsr_no()%></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getDdsr_pg_no()%></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getDdsr_sr_no()%></td>
                            <td class="text-center" style="vertical-align:middle;"><a href="productinfo.jsp?pid=<%= ddsr.getDdsr_id()%>"><%= ddsr.getProduct_description()%></a></td>
                            <td class="text-center" style="vertical-align:middle;"><%= date_purchase%></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getProduct_category() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getProduct_quantity() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getTotal_cost() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getProduct_type() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getYear_of_buy() %></td>
                            <td class="text-center" style="vertical-align:middle;"><a href="Controller/DeleteTransferEntry.jsp?id=<%= ddsr.getDdsr_id()%>&qty=<%= ddsr.getProduct_quantity()%>&cdsr_no=<%= ddsr.getCdsr_no()%>&cdsr_pageno=<%= ddsr.getCdsr_pg_no()%>&cdsr_srno=<%= ddsr.getCdsr_sr_no()%>&dept=<%= dept %>" class="btn btn-danger">Remove</a></td>
                            
                        </tr>
                        <%}
                }
                  catch(Exception e)
                  {
                        e.printStackTrace();
                  }
              }               
              else if(criteria.equals("All Items"))
                    {
                          try{
                             lit=FilterDAO.Filtershowwriteoff(dept);
                            while(lit.hasNext()){
                            DDSR ddsr=(DDSR)lit.next();
                            SimpleDateFormat date1=new SimpleDateFormat("yyyy-MM-dd");
                            SimpleDateFormat date2=new SimpleDateFormat("dd/MM/yyyy");
                            String date_purchase=date2.format(date1.parse(ddsr.getDate_of_receive()));
                        %>
                        <tr>
                            <%if(dept.equals("All Departments")){%><td class="text-center" style="vertical-align:middle;"><%= ddsr.getDepartment() %></td><%}%>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getDdsr_no()%></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getDdsr_pg_no()%></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getDdsr_sr_no()%></td>
                            <td class="text-center" style="vertical-align:middle;"><a href="productinfo.jsp?pid=<%= ddsr.getDdsr_id()%>"><%= ddsr.getProduct_description()%></a></td>
                            <td class="text-center" style="vertical-align:middle;"><%= date_purchase%></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getProduct_category() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getProduct_quantity() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getTotal_cost() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getProduct_type() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getYear_of_buy() %></td>
                            <td class="text-center" style="vertical-align:middle;"><a href="Controller/DeleteTransferEntry.jsp?id=<%= ddsr.getDdsr_id()%>&qty=<%= ddsr.getProduct_quantity()%>&cdsr_no=<%= ddsr.getCdsr_no()%>&cdsr_pageno=<%= ddsr.getCdsr_pg_no()%>&cdsr_srno=<%= ddsr.getCdsr_sr_no()%>&dept=<%= dept %>" class="btn btn-danger">Remove</a></td>
                            
                        </tr>
                        <%}
                }
                  catch(Exception e)
                  {
                        e.printStackTrace();
                  }
               }
             
         
%>
           
    </body>
</html>
