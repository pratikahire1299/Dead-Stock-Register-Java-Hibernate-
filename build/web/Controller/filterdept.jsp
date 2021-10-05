<%-- 
    Document   : filterdept.jsp
    Created on : May 15, 2019, 11:48:16 AM
    Author     : Asus
--%>

<%@page import="DSR.DAO.AjaxTableShow"%>
<%@page import="java.util.ListIterator"%>
<%@page import="DSR.POJO.writeoff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    </head>
    <body>
        <%
                 
           writeoff writeoff=new writeoff();
           ListIterator lit=null;
              String dept=request.getParameter("department");
             
               
                   if(dept.equals("All Departments"))
              {
                  lit=AjaxTableShow.deptshow2();
              }
                   else{
                  lit=AjaxTableShow.deptshow(dept);
                   }
                while(lit.hasNext())
                {
                    writeoff=(writeoff)lit.next();
            
            %>
            <tr>
                            <td class="text-center" style="vertical-align:middle;"><%= writeoff.getCdsr_no() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= writeoff.getCdsr_page_no() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= writeoff.getCdsr_sr_no() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= writeoff.getName_of_product() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= writeoff.getOrder_no() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= writeoff.getReceipt_no() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= writeoff.getWrite_off_date() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= writeoff.getProduct_category() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= writeoff.getDepartment() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= writeoff.getWrite_off_year() %></td>  
                            <td class="text-center align-middle"><a href="Controller/DeleteWriteoffEntry.jsp?wid=<%= writeoff.getWriteoff_Id()%>&qty=<%= writeoff.getProduct_quantity_wo()%>&ddsr_table_id=<%= writeoff.getDdsr_table_id()%>&cdsr_table_id=<%= writeoff.getCdsr_table_id()%>" class="btn btn-danger"><i class="fa trash-alt"></i></a></td>
            </tr>
            <%}                
              %>
</body>
</html>