<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
%>
<%@page import="DSR.DAO.UpdateDAO"%>
<%@page import="DSR.DAO.InsertDAO"%>
<jsp:useBean id="consumeddsrobj" class="DSR.POJO.ConsumeDDSR">
</jsp:useBean>
<jsp:setProperty property="*" name="consumeddsrobj"></jsp:setProperty>
<%
    String unt =request.getParameter("C_Purchase_Unit");     
    consumeddsrobj.setC_Purchase_Unit(unt);  
    String qu_issss=request.getParameter("Quantity_issued");
    consumeddsrobj.setQuantity_issued(qu_issss);
       int cdsrno=Integer.parseInt(request.getParameter("cdsr_no"));
       int cdsrsrno=Integer.parseInt(request.getParameter("cdsr_sr_no"));
       int cdsrpageno=Integer.parseInt(request.getParameter("cdsr_pg_no"));
 
        long remain=Long.parseLong(request.getParameter("final_product_quantity1"));
        long remainn=Long.parseLong(request.getParameter("final_product_quantity"));
      
        int required_item=Integer.parseInt(request.getParameter("Quantity_issued"));
        long item_id=Long.parseLong(request.getParameter("cdsr_id"));
        
        int i=InsertDAO.AddConsumeTransfer(consumeddsrobj,item_id,remainn);
        if(i==1)
        {       
         response.sendRedirect("../ConsumableDistribute.jsp?tran_id=1");
        }
        if(i==2)
        {
            response.sendRedirect("../ConsumableDistribute.jsp?tran_id=2");
        }
    
%>
<%} else{ response.sendRedirect("index.jsp"); }%>