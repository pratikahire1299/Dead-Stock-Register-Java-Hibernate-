<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

%>
<%@page import="DSR.DAO.UpdateDAO"%>
<%@page import="DSR.DAO.InsertDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

            <jsp:useBean id="ddsrobj" class="DSR.POJO.DDSR">                
            </jsp:useBean>
            <jsp:setProperty property="*" name="ddsrobj"/>
            <%
                int i=0,j=0;
                ddsrobj.setWriteOff_status("NULL");
                int real_product_quantity=Integer.parseInt(request.getParameter("product_quantity"));
                ddsrobj.setRealAcceptedProduct_Quantity(real_product_quantity);
                int Quantity=Integer.parseInt(request.getParameter("product_quantity"));
                int rem_item=Integer.parseInt(request.getParameter("remaining_item"));
                rem_item=rem_item-Quantity;
                long item_id=Integer.parseInt(request.getParameter("item_id"));
                i=InsertDAO.AddTransferinDDSR(ddsrobj,Quantity,rem_item,item_id);
                if(i==1)
                {
                        
                        response.sendRedirect("../transferinventory.jsp?tran_id=1");
                }
                if(i==2)
                {
                        
                        response.sendRedirect("../transferinventory.jsp?tran_id=2");
                }
          
            %>
            

<%} else{ response.sendRedirect("index.jsp");}%>