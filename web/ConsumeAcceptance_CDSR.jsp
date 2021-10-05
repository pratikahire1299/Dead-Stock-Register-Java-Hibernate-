<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Consumable Product Acceptance</title>
      <%@include file="Sidebar/fileinclude.html"%>
    </head>
    <body>
       <%@include file="Sidebar/sidebar.html"%>
        <main class="page-content">
            <div class="container-fluid">
                    <h1 class='display-4' style='font-family:arial; font-size:46px;'>Consumable Product Forum</h1>
                <div class='card shadow-lg p-4 mb-4'>
                <div class='card-header border border-0 bg-white'>
                    <h3 class='display-4' style='font-size:40px;'>Consumable Product Acceptance:</h3>
                </div>
                    <% try{
                            long success_id=0; 
                            success_id=Integer.parseInt(request.getParameter("succ_id")); 
                            if(success_id==1){%><div class="alert alert-success alert-dismissible fade show"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>Product Accepted Successfully....!</strong></div><%}
                            if(success_id==2){%><div class="alert alert-danger alert-dismissible fade show"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>Sorry Not Accepted Properly</strong></div><%}
                            } catch(Exception e){ e.printStackTrace();}%>
                            <% try{
                            long success1_id=0; 
                            success1_id=Integer.parseInt(request.getParameter("uid")); 
                            if(success1_id==1){%><div class="alert alert-success alert-dismissible fade show"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>Product Updated Successfully....!</strong></div><%}
                            if(success1_id==2){%><div class="alert alert-danger alert-dismissible fade show"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>Sorry Not Updated Properly</strong></div><%}
                            } catch(Exception e){ e.printStackTrace();}%>
                    <div class="card-body">
                <form action="Controller/AcceptConsumeControl.jsp" id="Consume_Form" method="post">
                <div class="row">
                    <div class="form-group col-lg-6">
                        <label for="supplier_name" class='font-weight-bold'>C_Product Supplier Name:</label>
                        <input type="text" class="form-control supply" name="consume_supplier_name" id="consume_product_supplier_name" placeholder="Enter Product_Supplier_Name" maxlength="80" required/>
                        <div id="consume_supplier" class="shadow rounded"></div>
                    </div>   
                    <div class="form-group col-lg-6">
                        <label for="product_name" class='font-weight-bold'>C_Product Name:</label>
                        <input type="text" id="C_Pro_Name" class="form-control" name="consume_product_name" id="consume_product_name" maxlength="80" placeholder="Enter Product_Name" required/>      
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-lg-2">
                        <label for="CDSR_no" class='font-weight-bold'>CC/R No:</label>
                        <input type="number" class="form-control" name="consume_CDSR_no" id="consumeCDSR_no" maxlength="3" placeholder="Enter CDSR No" required/>
                    </div>
                    <div class="form-group col-lg-2">
                        <label for="CDSR_page_no" class='font-weight-bold'>CC/R Page No:</label>
                        <input type="number" class="form-control" name="consume_CDSR_page_no" maxlength="3" id="consumeCDSR_page_no" placeholder="Enter CDSR Page No" required/>
                    </div>
                    <div class="form-group col-lg-2">
                        <label for="cdsr_no" class='font-weight-bold'>CC/R Sr No:</label>
                        <input type="number" class="form-control" name="consume_CDSR_sr_no" maxlength="3" id="consume_sr_no" placeholder="Enter SR No" required/>      
                    </div>
                    <div class="form-group col-lg-3">
                        <label for="Consume_order_grant" class="font-weight-bold">Product Grant:</label>
                        <input type="text" class="form-control" name="product_grant" maxlength="20" id="Consume_order_grant" placeholder="Product Grant" required/>      
                    </div>
                    <div class="form-group col-lg-3">
                        <label for="order_name" class='font-weight-bold'>C_Product Order No:</label>
                        <input type="number" name="Consume_order_no" placeholder="Order No" class="form-control" maxlength="8" id="consume_product_order_no"/>
                    </div>
                </div>
                    <div class="row">
                        <div class="form-group col-lg-3">
                            <label for="purchase_quantity" class='font-weight-bold'>C_Product Purchase Quantity:</label>
                            <input type="number" class="form-control" name="consume_purchase_quantity" maxlength="6" id="consume_product_purchase_quantity" placeholder="Enter Product_Purcahse " required/>      
                        </div>
                      
                            <div class="form-group col-lg-3">
                                <label for="purchase_unit" class='font-weight-bold'>C_Product Purchase Unit:</label>
                                <select name="product_unit" class="form-control form-control-chosen" id="c_purchase_unit">
                                    <option value="Choose_Pro_unit" selected hidden>Choose Product Unit</option>
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
                        <input type="hidden" name="final_product_quantity" id="final_product_quantity"/>
                        <div class="form-group col-lg-3">
                            <label for="cost_per_unit" class='font-weight-bold'>C_Product Cost/Unit:</label>
                            <input type="number" class="form-control" name="consume_cost_per_unit" id="consume_product_cost_per_unit" maxlength="4" placeholder="Enter Product_Cost_Per_Unit " required/>      
                        </div>
                        <div class="form-group col-lg-3">
                            <label for="total_amount" class='font-weight-bold'>C_Product Total amount:</label>
                            <input type="number" class="form-control" name="consume_total" id="consume_product_total_amount" readonly onfocus="calculate();" onclick="calculate();" required/>      
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-lg-4">
                            <label for="purchase_year" class='font-weight-bold'>C_Product Purchase Year:</label>
                            <input type="text" class="form-control" name="consume_purchase_year" id="consume_product_purchase_year" maxlength="9" onfocus="calculate_unit();" onclick="calculate_unit();" placeholder="Enter  Product_Purcahse_Year " required/>      
                        </div>
                        <div class="form-group col-lg-4">
                            <label for="date_of_purchase" class='font-weight-bold'>C_Product Date Of Purchase:</label>
                            <input type="date" class="form-control" name="consume_date_of_purchase" id="consume_product_date_of_purchase" placeholder="Enter Product Date_Of_Purchase" required/>  
                        </div>
                        <div class="col-lg-4"><br/>
                            <button type='submit' class='btn btn-success btn-lg' style='width:100%;vertical-align:middle;' id='submit'><i class="fa fa-spinner mb-2"></i>&nbsp;&nbsp;Submit</button>
                        </div>
                    </div> 
              </form>
                    </div></div>
                 <table class="table table-bordered table-hover shadow table-responsive-lg">
                    <thead class='thead-light'>
                        <tr>
                            <th class="text-center" style="vertical-align:middle;">CDSR_No</th>
                            <th class="text-center" style="vertical-align:middle;">CDSR_Page_No</th>
                            <th class="text-center" style="vertical-align:middle;">Product Name</th>
                            <th class="text-center" style="vertical-align:middle;">Date_Of_Purchase</th>
                            <th class="text-center" style="vertical-align:middle;">Purchase_Quantity</th>
                            <th class="text-center" style="vertical-align:middle;">Cost/unit</th>
                            <th class="text-center" style="vertical-align:middle;">Total_Amount</th>
                            <th class="text-center" style="vertical-align:middle;">Action</th>
                        </tr>
                    </thead>
                    <tbody class="display_inventory" ></tbody>       
                </table>
                    <!--Function for Calculating Total Cost-->
                <script type="text/javascript">
                    function calculate()
                    {
                        var a=parseInt(document.getElementById("consume_product_cost_per_unit").value);
                        var b=parseInt(document.getElementById("consume_product_purchase_quantity").value);
                        var d=a*b;
                        document.getElementById("consume_product_total_amount").value=(d);
                    }
                    function calculate_unit()
                    {
                        var purchase_unit=document.getElementById("c_purchase_unit").value;
                        var purchase_quantity=parseInt(document.getElementById("consume_product_purchase_quantity").value);
                        var total_quantityy;
                        
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
                             total_quantityy=1*purchase_quantity;
                         }
                    
                     document.getElementById("final_product_quantity").value=(total_quantityy);
                     
                }
                </script>
                <script>
                   $(document).ready(function(){
                   $('#submit').click(function(){ 
                       
                          var supplier=$('#consume_product_supplier_name').val();
                          var date_of_purchase=$('#consume_product_date_of_purchase').val();
                   $.ajax({  
                      url:'Controller/displayconsumeinventory.jsp?tid=2',
                      type:'POST',
                      data:{
                          "supplier":supplier,
                          "date_of_purchase":date_of_purchase
                      },
                      success:
                              function(inventory_display){
                              $('.display_inventory').html(inventory_display);
                              }
                        });
                    });
                });
                </script>
                <script>
                    $(document).ready(function(){
                       $(".supply").keyup(function(){
                          var supplier_name=$(this).val();
                          if(supplier_name!='')
                          {
                              $.ajax({
                                  url:"search.jsp?idddd=2",
                                  method:"POST",                
                                  data:{ supplier_name:supplier_name },
                                 success: function(names)
                                 {
                                     $("#consume_supplier").fadeIn();
                                     $("#consume_supplier").html(names);
                                 }
                              });
                          }
                          else
                          {
                              $("#consume_supplier").fadeOut();
                              $("#consume_supplier").html("");
                           }
                       });
                       $(document).on('click','#searchli',function(){
                              $(".supply").val($(this).text());
                              $("#consume_supplier").fadeOut();
                       });
                    });
                </script>
                
            </div>
            <script>
                    $(document).ready(function(){
                        $("#Consume_Form").bind("submit",function(){

                       var dept=$("#c_purchase_unit").val();
                       if(dept=="Choose_Pro_unit")
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
                   $("#Consume_Form").bind("submit",function(){
                        var a=parseInt(document.getElementById("consume_product_cost_per_unit").value);
                        var b=parseInt(document.getElementById("consume_product_purchase_quantity").value);
                        var d=a*b;
                        document.getElementById("consume_product_total_amount").value=(d);
                        if(d=="" || d=="0")
                        {
                            alert("Wrong Total"+c);
                            return false;
                        }
                        else
                        {
                            return true;
                        }
                   });
                   $("#Consume_Form").bind("submit",function(){
                       var purchase_unit=document.getElementById("c_purchase_unit").value;
                        var purchase_quantity=parseInt(document.getElementById("consume_product_purchase_quantity").value);
                        var total_quantityy;
                        
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
                             total_quantityy=1*purchase_quantity;
                         }
                    
                     document.getElementById("final_product_quantity").value=(total_quantityy);
                   });
               });
                </script>
        </main>
   
    </body>
</html>
<%} else{ response.sendRedirect("index.jsp"); }%>

