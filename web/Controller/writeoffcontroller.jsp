<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="DSR.POJO.DDSR"%>
<%@page import="DSR.DAO.AjaxTableShow"%>
<%@page import="java.util.ListIterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    </head>
    <body>
                <%
                
            DDSR ddsr=new DDSR();
            ListIterator lit;
                 
                    int cdsr_no=Integer.parseInt(request.getParameter("CDSR_no"));
                    int cdsr_page_no=Integer.parseInt(request.getParameter("CDSR_page_no"));
                    int cdsr_sr_no=Integer.parseInt(request.getParameter("CDSR_Sr_No"));
                    String department=request.getParameter("department");
                    String cdsr_name=request.getParameter("cdsr_name");
                    lit=AjaxTableShow.writeOffProduct(cdsr_no,cdsr_page_no,cdsr_sr_no,department,cdsr_name);
                while(lit.hasNext())
                {
                    ddsr=(DDSR)lit.next();
            %>
            
            <tr>
                    <td class="text-center"><%= ddsr.getProduct_description()%></td>
                    <td class="text-center"><%= ddsr.getProduct_category()%></td>                  
                    <td class="text-center"><%= ddsr.getProduct_quantity()%></td>
                    <td class="text-center"><%= ddsr.getYear_of_buy()%></td> 
                    <td><a href="writeoff2.jsp?tid=<%= ddsr.getDdsr_id()%>" class="btn btn-warning mx-auto d-block">Writeoff</a></td>
            </tr>
            <%}
            %>
                
    </body>
</html>
<%} else{ response.sendRedirect("index.jsp");}%>