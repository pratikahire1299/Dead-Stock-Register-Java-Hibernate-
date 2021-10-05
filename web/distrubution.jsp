<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="Sidebar/fileinclude.html"%>
        <link rel='stylesheet' href='Sidebar/CSS/component-chosen.css'>
        <title>Distribution</title>
    </head>
    <body class="bg-light">
        <%@include file="Sidebar/sidebar.html"%>
        <main class="page-content">
            <div class="container-fluid">
                <h1 class="display-4" style="font-family:arial; font-size:46px;">Inventory Distribution Forum</h1>
                <!--Form for Acceptace of Inventory-->
                <div class="card shadow-lg p-4 mb-4 bg-white">
                    <div class="card-header bg-white border border-0">
                    <h5 class="display-4" style="font-size:40px;">Acceptance of Inventory</h5>
                    </div>
                        <% try{
                            int success_id=0; 
                            success_id=Integer.parseInt(request.getParameter("succ_id")); 
                            if(success_id==1){%><div class="alert alert-success alert-dismissible fade show"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>Product Accepted Successfully....!</strong></div><%}
                            if(success_id==2){%><div class="alert alert-danger alert-dismissible fade show"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>Sorry Not Accepted Properly</strong></div><%}
                            } catch(Exception e){ e.printStackTrace();}%>
                    <% try{
                            int success_uid=0; 
                            success_uid=Integer.parseInt(request.getParameter("uid")); 
                            if(success_uid==1){%><div class="alert alert-success alert-dismissible fade show"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>Product Updated Successfully....!</strong></div><%}
                            if(success_uid==2){%><div class="alert alert-danger alert-dismissible fade show"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>Sorry Not Updated Properly</strong></div><%}
                            } catch(Exception e){ e.printStackTrace();}%>
                    <div class="card-body">
                    <form action="Controller/DistributionInsert.jsp" method="post" id="myform1" name="acceptanceform">
                        <div class="row">
                            <div class="form-group col-lg-8">
                                <label for="supplier" class='font-weight-bold'>Supplier Description:</label>
                                <input type="text" class="form-control supppp" name="supplier" id="supplier" placeholder="Enter Supplier Details" maxlength="78" required/>
                                <div id="names_list" class="shadow rounded"></div>
                            </div>
                            <div class="form-group col-lg-4">
                                <label for="cdsr_name" class='font-weight-bold'>CDSR Name:</label>
                                <select name="cdsr_name" class="form-control form-control-chosen" id="selectbox1" required>
                                    <option value="Choose_CDSR_Name"selected hidden>Choose CDSR Name</option>
                                    <option>C/S DSR/M&E</option>
                                    <option>C/S DSR/CC</option>
                                    <option>C/S DSR/Furniture</option>
                                    <option>C/S DSR/Semi C R</option>
                                    <option>C/S Consumable Register</option>
                                    <option>C/S DSR/CC/Furniture</option>
                                    <option>C/S DSR/M&E/Community Polytechnic</option>
                                    <option>C/S DSR/Utility Article</option>
                                    <option>C/S DSR/M&E/World Bank</option>
                                    <option>C/S DSR/PRU/WB</option>
                                    <option>C/S DSR/UPSBTY/SCR</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-3">
                                <label for="purchase_year" class='font-weight-bold'>Purchase Year:</label>
                                <input type="text" class="form-control" name="purchase_year" id="purchase_year" maxlength="9" placeholder="Enter Purchase Year" required/>      
                            </div>
                            <div class="form-group col-lg-3">
                                <label for="DSR_no" class='font-weight-bold'>CDSR_No:</label>
                                <input type="number" class="form-control" name="CDSR_no" id="DSR_no" placeholder="Enter DSR_no" maxlength="3" required/>
                            </div>
                            <div class="form-group col-lg-3">
                                <label for="DSR_page_no" class='font-weight-bold'>CDSR_Page_No:</label>
                                <input type="number" class="form-control" name="CDSR_page_no" id="DSR_page_no" maxlength="4" placeholder="Enter DSR_page_no" required/>
                            </div>
                            <div class="form-group col-lg-3">
                                <label for="dsr_sr_no" class='font-weight-bold'>CDSR_Sr_No:</label>
                                <input type="number" class="form-control" name="CDSR_Sr_No" id="dsr_sr_no" maxlength="2" placeholder="Enter DSR_sr_no" required/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-6">
                                <label for="product_description" class='font-weight-bold'>Product Description:</label>
                                <input type="text" id="Pro_Des" class="form-control" name="product_description" maxlength="200" id="product_description" placeholder="Enter Product Description" required/>                 
                            </div>
                            <div class="form-group col-lg-3">
                                <label for="product_type" class='font-weight-bold'>Product Type:</label><br/>
                                <div class="custom-control custom-radio">
                                <input type="radio" name="product_type" class="custom-control-input" id="semi_product_type" value="SemiConsumable" required>
                                <label class="custom-control-label" for="semi_product_type">Semi Consumable</label>
                                </div>
                                <div class="custom-control custom-radio">
                                <input type="radio" name="product_type" class="custom-control-input" id="dead_product_type" value="Dead Stock" required>
                                <label class="custom-control-label" for="dead_product_type">Dead Stock</label>
                                </div>
                            </div>
                            <div class="form-group col-lg-3">
                                <label for="Product_Category" class='font-weight-bold'>Product Category:</label>
                                <select name="product_category" class="custom-select" id="pro_cat" required>
                                    <option value="Choose_Product_Category" selected hidden>Choose Product Category</option>
                                    <option value="Computer and pheripherals" name="Computer_and_andpheripherals" id="Computer_and_andpheripherals">Computer and pheripherals</option>
                                    <option value="Furniture" name="Furniture" id="Furniture">Furniture</option>
                                    <option value="Machinary & Equipment" name="Equipment" id="Equipment">Machinary & Equipment</option>
                                    <option value="Measurement Equipment" name="Others" id="Others">Measurement Equipment</option>
                                    <option value="Software" name="Others" id="Others">Software</option>
                                    <option value="Others" name="Others" id="Others">Others</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-2">
                                <label for="product_quantity" class='font-weight-bold'>Product Quantity:</label>
                                <input type="number" class="form-control" name="product_quantity" id="product_quantity" placeholder="Total No of Items" required/>
                            </div>
                            <div class="form-group col-lg-6">
                                <label for="purchase_authority" class='font-weight-bold'>Purchase Authority:</label>
                                <input type="text" class="form-control" name="purchase_authority" id="purchase_authority" maxlength="60" placeholder="Enter Purchase Authority" required/>
                            </div>
                            <div class="form-group col-lg-4">
                                <label for="Date_of_purchase" class='font-weight-bold'>Date of Purchase:</label>
                                <input type="date" class="form-control" name="date_of_purchase" id="Date_of_purchase" placeholder="Enter Date of Purchase" required/>    
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-4">
                                <label for="Single_value" class='font-weight-bold'>Cost of Single Item:</label>
                                <input type="number" class="form-control" name="single_cost" id="Single_value" maxlength="9" placeholder="Enter Cost of Single Item" required/>
                            </div>
                            <div class="form-group col-lg-4">
                                <label for="total_cost" class='font-weight-bold'>Total Cost:</label>
                                <input type="number" class="form-control" name="total_cost" readonly id="total_cost" onfocus="calculate();" onclick="calculate();" required/>
                            </div>
                            <div class="form-group col-lg-4">
                                <br/>
                                <button type="submit" id="submit" class="btn btn-primary font-weight-bold btn-lg" style="width:100%;"><i class="fa fa-spinner mb-2"></i>&nbsp;&nbsp;Submit</button>
                            </div>
                        </div>
                    </form>
                    </div>
                </div>
                    
                <table class="table table-striped table-bordered table-hover bg-white shadow table-responsive-lg">
                    <thead>
                        <tr>
                            <th class="text-center">CDSR_Sr_No</th>
                            <th class="text-center">Product_Description</th>
                            <th class="text-center">Purchase_Date</th>
                            <th class="text-center">Product_Quantity</th>
                            <th class="text-center">Cost/item</th>
                            <th class="text-center">Total Amount</th>
                            <th class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody class="display_inventory" ></tbody>       
                </table>
                    <!--Function for Calculating Total Cost-->
                <script type="text/javascript">
                    function calculate()
                    {
                        var a=parseInt(document.getElementById("Single_value").value);
                        var b=parseInt(document.getElementById("product_quantity").value);
                        var d=a*b;
                        document.getElementById("total_cost").value=(d);
                    }
                </script>
                <script>
                   $(document).ready(function(){
                   $('#submit').click(function(){ 
                          var supplier=$('#supplier').val();
                          var date_of_purchase=$('#Date_of_purchase').val();
                   $.ajax({  
                      url:'Controller/distributiondisp.jsp?lid=1',
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
                <script src="Sidebar/JS/chosen.jquery.min.js"></script>
                <script>
                    $(document).ready(function(){
                                              $('.form-control-chosen').chosen({
                                            allow_single_deselect: true,
                                     width: '100%' 
                                 });
                                 $('.font-control-chosenn').chosen({
                                            allow_single_deselect: true,
                                     width: '100%' 
                                 });
                    });
                </script>
                <script>
                   
                    $(document).ready(function(){
                       $(".supppp").keyup(function(){
                          var supplier_name=$(this).val();
                          if(supplier_name!='')
                          {
                              $.ajax({
                                 url:"search.jsp?idddd=1",
                                 method:"POST",
                                 data:{ supplier_name:supplier_name },
                                 success: function(names)
                                 {
                                     $("#names_list").fadeIn();
                                     $("#names_list").html(names);
                                 }
                              });
                          }
                          else
                          {
                              $("#names_list").fadeOut();
                              $("#names_list").html("");
                              }
                       });
                       $(document).on('click','#searchli',function(){
                              $(".supppp").val($(this).text());
                              $("#names_list").fadeOut();
                       });
                    });
                </script>
               <script>
            $(document).ready(function(){
               $("#myform1").bind("submit",function(){

                       var dept=$("#selectbox1").val();
                       if(dept=="Choose_CDSR_Name")
                       {
                           alert("Wrong CDSR Name.... Choose Proper CDSR Name ....");
                           $("#selectbox1").focus();
                           return false;
                       }
                       else
                       {
                           return true;
                       }
                   });
                   $("#myform1").bind("submit",function(){

                       var dept=$("#pro_cat").val();
                       if(dept=="Choose_Product_Category")
                       {
                           alert("Wrong Product Category.... Choose Proper Product Category ....");
                           $("#pro_cat").focus();
                           return false;
                       }
                       else
                       {
                           return true;
                       }
                   });
                   $("#myform1").bind("submit",function(){
                        var a=parseInt(document.getElementById("Single_value").value);
                        var b=parseInt(document.getElementById("product_quantity").value);
                        var c;
                        c=a*b;
                        document.getElementById("total_cost").value=c;
                        if(c=="" || c=="0")
                        {
                            alert("Wrong Total"+c);
                            return false;
                        }
                        else
                        {
                            return true;
                        }
                   });
               }); 

        </script>
              
            </div>
            
        </main>
   
    </body>
</html>
<%} else{ response.sendRedirect("index.jsp"); }%>
