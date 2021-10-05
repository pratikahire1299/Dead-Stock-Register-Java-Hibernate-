<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consumable Distribute</title>
        <%@include file="Sidebar/fileinclude.html"%>
    </head>
    <body>
        <%@include file="Sidebar/sidebar.html"%>
        <main class="page-content">
                <h1 class='display-4' style='font-size:46px;'>Distribute of Consumable Product</h1>
            <div class="container-fluid">
                <div class="card shadow-lg p-4 mb-4">
                    <% try{
                            int success_id=0; 
                            success_id=Integer.parseInt(request.getParameter("tran_id")); 
                            if(success_id==1){%><div class="alert alert-success alert-dismissible fade show"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>Product Transfer Successfully....!</strong></div><%}
                            if(success_id==2){%><div class="alert alert-danger alert-dismissible fade show"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>Sorry Product Not Transfer Successfully</strong></div><%}
                            } catch(Exception e){ e.printStackTrace();}%>
                    <div class="card-body">
                            <div class="form-group">
                                <label for="product_name" class='font-weight-bold'>Product Name:</label>
                                <input type="text" name="product_name" id="product_name" class="form-control" placeholder="Enter Product Name" required/>
                                <div id="product_names" class="shadow rounded"></div>
                            </div>
                            <div class="form-group">
                                <label for="supplier_name" class='font-weight-bold'>Supplier Name:</label>
                                <input type="text" name="supplier_name" id="supplier_name" class="form-control supply" placeholder="Enter Supplier Name" required/>
                                <div id="consume_supplier" class="shadow rounded"></div>
                            </div>
                            <button class="btn btn-danger center-block" type="submit" id="submit" style="width:60%; margin-left:20%;"><i class="fa fa-spinner mb-2"></i>&nbsp;&nbsp;Submit</button>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <h3 class="text-center text-danger">To See Detail Information of Product click on its <b><u>Order No</u></b></h3>
                <table class="table table-bordered table-hover shadow table-responsive-lg">
                    <thead class='thead-light'>
                        <th class="text-center">Order No.</th>
                        <th class="text-center">Date of Purchase</th>
                        <th class="text-center">Purchase Year</th>
                        <th class="text-center">Balance in Hand</th>
                        <th class="text-center">Action</th>
                    </thead>
                    <tbody class="disp_item"></tbody>
                </table>
            </div>
        </main>
        <script>
           $(document).ready(function(){
               $("#submit").click(function(){
                   var pro_name=$("#product_name").val();
                   var sup_name=$("#supplier_name").val();
                    $.ajax({
                     url: 'Controller/displayconsumeinventory.jsp?tid=1',
                     type: 'POST',
                     data:{
                         "pro_name":pro_name,
                         "sup_name":sup_name
                     }, 
                     success: function(inventory)
                     {
                         $(".disp_item").html(inventory);
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
                <script>
                    $(document).ready(function(){
                       $("#product_name").keyup(function(){
                          var product_name=$(this).val();
                          if(product_name!='')
                          {
                              $.ajax({
                                  url:"search.jsp?idddd=3",
                                  method:"POST",                
                                  data:{ product_name:product_name },
                                 success: function(names)
                                 {
                                     $("#product_names").fadeIn();
                                     $("#product_names").html(names);
                                 }
                              });
                          }
                          else
                          {
                              $("#product_names").fadeOut();
                              $("#product_names").html("");
                           }
                       });
                       $(document).on('click','#searchliii',function(){
                              $("#product_name").val($(this).text());
                              $("#product_names").fadeOut();
                       });
                    });
                </script>
                <script>
                    $(function(){
                        $("#Prod_Name").keyup(function(){
                            var l1=$("#Prod_Name").val();
                            if(l1.length==144)
                            {
                                alert("244 charcters allowed");
                                $("#Prod_Name").prop('readonly', true);
                            }
                        });
                    });
                </script>
                <script>
                    $(function(){
                        $("#Supp_Name").keyup(function(){
                            var l2=$("#Supp_Name").val();
                            if(l2.length==144)
                            {
                                alert("244 characters allowed");
                                $("#Supp_Name").prop('readonly', true);
                            }
                        });
                    });
                </script>
    </body>
</html>
<%} else{ response.sendRedirect("index.jsp");}%>