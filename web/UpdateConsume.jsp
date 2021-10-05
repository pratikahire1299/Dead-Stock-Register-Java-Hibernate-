<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="DSR.POJO.Consume_CDSR"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="DSR.Helper.NewHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>  
   <%@include file="Sidebar/fileinclude.html"%>
   <title>Consumable Update</title>
    </head>
    <body>
        <%
            long find_id=Long.parseLong(request.getParameter("lid"));
            Session s=NewHibernateUtil.getSessionFactory().openSession();
            Transaction trans=s.beginTransaction();
            Object obj=s.get(Consume_CDSR.class, find_id);
            Consume_CDSR consumecdsr=new Consume_CDSR();
            consumecdsr=(Consume_CDSR)obj;
         %>   
       <%@include file="Sidebar/sidebar.html"%>
        <main class="page-content">
            <div class="container-fluid">
               <div class='card shadow-lg p-4 mb-4'>
                <div class='card-header border border-0 bg-white'>
                    <h3 class='display-4' style='font-size:40px;'>Update Consumable Product Acceptance</h3>
                </div>
                <div class="card-body">
                <form action="Controller/UpdateConsumeAcceptance.jsp" id="update_form" method="post">
                  <input type="hidden" name="tpid" value="<%=find_id%>"/>  
                   <div class="row">
                    <div class="form-group col-lg-6">
                        <label for="supplier_name" class='font-weight-bold'><b>C_Product Supplier Name:</b></label>
                        <input type="text" class="form-control" value="<%=consumecdsr.getConsume_supplier_name()%>" maxlength="80" name="consume_supplier_name" id="consume_product_supplier_name" placeholder="Enter  Product_Supplier_Name" required/>    
                  </div>
                    <div class="form-group col-lg-6">
                        <label for="product_name" class='font-weight-bold'><b>C_Product Name:</b></label>
                        <input type="text" class="form-control" value="<%=consumecdsr.getConsume_product_name()%>" maxlength="80" name="consume_product_name" id="consume_product_name" placeholder="Enter Product_Name" required/>      
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-lg-3">
                        <label for="CDSR_no" class='font-weight-bold'><b>C_CDSR No:</b></label>
                        <input type="text" class="form-control" value="<%=consumecdsr.getConsume_CDSR_no()%>" maxlength="3" name="consume_CDSR_no" id="consumeCDSR_no" placeholder="Enter CDSR No" required/>
                    </div>
                    <div class="form-group col-lg-3">
                        <label for="CDSR_page_no" class='font-weight-bold'><b>C_CDSR Page No:</b></label>
                        <input type="text" class="form-control" value="<%=consumecdsr.getConsume_CDSR_page_no()%>" maxlength="3" name="consume_CDSR_page_no" id="consumeCDSR_page_no" placeholder="Enter CDSR Page No" required/>
                    </div>
                    <div class="form-group col-lg-3">
                        <label for="cdsr_no" class='font-weight-bold'><b>C_Product Sr No:</b></label>
                        <input type="text" class="form-control" value="<%=consumecdsr.getConsume_CDSR_sr_no()%>" maxlength="3" name="consume_CDSR_sr_no" id="consume_sr_no" placeholder="Enter SR No" required/>      
                    </div>
                    <div class="form-group col-lg-3">
                        <label for="order_name" class='font-weight-bold'><b>C_Product Order No:</b></label>
                        <input type="text" class="form-control" value="<%=consumecdsr.getConsume_order_no()%>" maxlength="3" name="Consume_order_no" id="consume_product_order_no" placeholder="Enter Product Order_No" required/>      
                    </div>
                </div>
                <div class="row">
                        <div class="form-group col-lg-3">
                            <label for="purchase_quantity" class='font-weight-bold'><b>C_Product Purchase Quantity:</b></label>
                            <input type="text" class="form-control" value="<%=consumecdsr.getConsume_purchase_quantity()%>" name="consume_purchase_quantity" id="consume_product_purchase_quantity" placeholder="Enter Product_Purcahse " required/>      
                        </div>
                        <div class="form-group col-lg-3">
                            <label for="product_unit" class="font-weight-bold">Product Unit:</label>
                            <select name="product_unit" class="form-control" id="c_purchase_unit" required>
                                    <option value="Choose_Product_Unit" selected>Choose Product Unit</option>
                                    <option>Liter</option>
                                    <option>MiliLiter</option>
                                    <option>Gram</option>
                                    <option>Kilogram</option>
                                    <option>Feet</option>
                                    <option>Meter</option>
                                    <option>Packets</option>
                                    <option>Bottles</option>
                                    <option>NOS</option>
                            </select>
                        </div>
                        <input type="hidden" name="final_product_qty_accept" id="final_product" />
                        <div class="form-group col-lg-3">
                            <label for="cost_per_unit" class='font-weight-bold'><b>C_Product Cost/Unit:</b></label>
                            <input type="text" class="form-control" value="<%=consumecdsr.getConsume_cost_per_unit()%>" maxlength="9" name="consume_cost_per_unit" id="consume_product_cost_per_unit" placeholder="Enter Product_Cost_Per_Unit " required/>      
                        </div>
                        <div class="form-group col-lg-3">
                            <label for="total_amount" class='font-weight-bold'><b>C_Product Total amount:</b></label>
                            <input type="text" class="form-control" value="<%=consumecdsr.getConsume_total()%>" readonly name="consume_total" id="consume_product_total_amount" onfocus="calculate();" onclick="calculate();" required/>      
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-lg-4">
                            <label for="purchase_year" class='font-weight-bold'><b>C_Product Purchase Year:</b></label>
                            <input type="text" class="form-control" value="<%=consumecdsr.getConsume_purchase_year()%>" maxlength="9" name="consume_purchase_year" id="consume_product_purchase_year" onfocus="calculate_unit();" onclick="calculate_unit();" placeholder="Enter  Product_Purcahse_Year " required/>      
                        </div>
                        <div class="form-group col-lg-4">
                            <label for="date_of_purchase" class='font-weight-bold'><b>C_Product Date Of Purchase:</label>
                            <input type="date" class="form-control" value="<%=consumecdsr.getConsume_date_of_purchase()%>" name="consume_date_of_purchase" id="consume_product_date_of_purchase" placeholder="Enter Product Date_Of_Purchase" required/>  
                        </div>
                        <div class="col-lg-4">
                            <br/><input type="submit" value="Update" name="update" class="btn btn-danger mt-2">
                        </div>
                    </div> 
              </form>
           </div>
      </div>
     </body>
     <script>
         function calculate_unit()
                    {
                        var purchase_unit=document.getElementById("c_purchase_unit").value;
                        
                        var purchase_quantity=parseInt(document.getElementById("consume_product_purchase_quantity").value);
                        var total_quantityy=1;
                        
                        if(purchase_unit=="Liter")
                        {
                            total_quantityy=1000*purchase_quantity;
                         }
                         else if(purchase_unit=="Kilogram")
                         {
                             total_quantityy=1000*purchase_quantity;
                         }
                         else if(purchase_unit=="Meter")
                         {
                             total_quantityy=100*purchase_quantity;
                         }
                          else if(purchase_unit=="Feet")
                         {
                             total_quantityy=30*purchase_quantity;
                         }
                         else
                         {
                             total_quantityy=purchase_quantity;
                         }
                    document.getElementById("final_product").value=(total_quantityy);
                     //var temp=parseLong(document.getElementById("final_product").value=(total_quantityy));
                }
                function calculate()
                {
                     var a=parseInt(document.getElementById("consume_product_cost_per_unit").value);
                        var b=parseInt(document.getElementById("consume_product_purchase_quantity").value);
                        var d=a*b;
                        document.getElementById("consume_product_total_amount").value=(d);
                }
     </script>
     <script>
            $(document).ready(function(){
               $("#update_form").bind("submit",function(){

                       var dept=$("#c_purchase_unit").val();
                       if(dept=="Choose_Product_Unit")
                       {
                           alert("Wrong Product Unit.... Choose Proper Product Unit ....");
                           $("#c_purchase_unit").focus();
                           return false;
                       }
                       else
                       {
                           return true;
                       }
                   });
                   $("#update_form").bind("submit",function(){
                       var purchase_unit=document.getElementById("c_purchase_unit").value;
                        
                        var purchase_quantity=parseInt(document.getElementById("consume_product_purchase_quantity").value);
                        var total_quantityy=1;
                        
                        if(purchase_unit=="Liter")
                        {
                            total_quantityy=1000*purchase_quantity;
                         }
                         else if(purchase_unit=="Kilogram")
                         {
                             total_quantityy=1000*purchase_quantity;
                         }
                         else if(purchase_unit=="Meter")
                         {
                             total_quantityy=100*purchase_quantity;
                         }
                          else if(purchase_unit=="Feet")
                         {
                             total_quantityy=30*purchase_quantity;
                         }
                         else
                         {
                             total_quantityy=purchase_quantity;
                         }
                    document.getElementById("final_product").value=(total_quantityy);
                   });
                   $("#update_form").bind("submit",function(){
                       var a=parseInt(document.getElementById("consume_product_cost_per_unit").value);
                        var b=parseInt(document.getElementById("consume_product_purchase_quantity").value);
                        var d=a*b;
                        document.getElementById("consume_product_total_amount").value=(d);
                   });
               });
     </script>
</html>
<% } else{response.sendRedirect("index.jsp");}%>