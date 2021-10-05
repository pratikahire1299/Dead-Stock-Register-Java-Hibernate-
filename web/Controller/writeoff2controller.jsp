<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
%>
<%@page import="DSR.POJO.CDSR"%>
<%@page import="DSR.DAO.CDSRFilterDAO"%>
<%@page import="java.util.ListIterator"%>
<%@page import="DSR.DAO.UpdateDAO"%>
<%@page import="DSR.DAO.InsertDAO"%>
            <jsp:useBean id="writeoffobj" class="DSR.POJO.writeoff">                
            </jsp:useBean>
            <jsp:setProperty property="*" name="writeoffobj"/>
            <%  
                        int j=0;
                int pro_qty_for_wo=Integer.parseInt(request.getParameter("Product_quantity_wo"));
                
                writeoffobj.setProduct_quantity_wo(pro_qty_for_wo);
                
               //int Product_quantity_wo=Integer.parseInt(request.getParameter("Product_quantity_wo"));
                
                int Product_quantity=Integer.parseInt(request.getParameter("Product_quantity"));
                long cdsr_table_id=Long.parseLong(request.getParameter("cdsr_table_id"));
                long ddsr_table_id=Long.parseLong(request.getParameter("ddsr_table_id"));
                int newddsr_Product_quantity=Product_quantity-pro_qty_for_wo;
                ListIterator lit=CDSRFilterDAO.findCDSRProductQuantityforwriteoff(cdsr_table_id);
                CDSR c=new CDSR(); int pro_qty=0;
                while(lit.hasNext()){ c=(CDSR)lit.next(); pro_qty=c.getActive_product();}
                int newcdsr_product_quantity=pro_qty-pro_qty_for_wo;
                
                    j=UpdateDAO.updateWriteoffProduct(writeoffobj,pro_qty_for_wo,newcdsr_product_quantity,newddsr_Product_quantity, cdsr_table_id, ddsr_table_id);
                
                if(j==1)
                {
                    response.sendRedirect("../writeoff.jsp?wo_id=1");
                }
                if(j==2)
                {
                    response.sendRedirect("../writeoff.jsp?wo_id=2");
                }        

            %>
<%} else{ response.sendRedirect("index.jsp");}%>