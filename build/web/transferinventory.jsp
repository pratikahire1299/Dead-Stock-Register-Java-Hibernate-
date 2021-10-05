<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transfer Inventory</title>
        <%@include file="Sidebar/fileinclude.html"%>
    </head>
    <body>
      <%@include file="Sidebar/sidebar.html"%>
        <main class="page-content">
            <div class="contrainer-fluid">
                <h1>Inventory Distribution Wizard</h1>
                <br/>
                <div class='card shadow-lg p-4 mb-4'>
                <div class='card-header bg-white border border-0'>
                <h5 class='display-4' style='font-size:36px;'>Transfer Inventory to Departments</h5>
                </div>
                    <% try{
                            int success_id=0; 
                            success_id=Integer.parseInt(request.getParameter("tran_id")); 
                            if(success_id==1){%><div class="alert alert-success alert-dismissible fade show"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>Product Transfer Successfully....!</strong></div><%}
                            if(success_id==2){%><div class="alert alert-danger alert-dismissible fade show"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>Sorry Not Transfer Successfully</strong></div><%}
                            } catch(Exception e){ e.printStackTrace();}%>
                <div class='card-body'>
                    <div class="form-group">
                        <label for="supplier" class='font-weight-bold'>Supplier:</label>
                        <input type="text" class="form-control supppp" name="supplier" id="supplier" placeholder="Enter Supplier" required/>
                        <div id="names_list" class="shadow rounded"></div>
                    </div>
                    <div class="form-group">
                        <label for="date_of_purchase" class='font-weight-bold'>Date of Purchase:</label>
                        <input type="date" class="form-control" name="date_of_purchase" id="date_of_purchase" required/>
                    </div>
                    <button class="btn btn-primary text-center" id="showbutton" style="width:40%; margin-left:30%;" type="submit"><i class="fa fa-spinner mb-2"></i>&nbsp;&nbsp;Submit</button>
                </div>
                </div>
                    <br/><br/>
                <table class="table table-bordered table-hover table-striped table-condensed shadow table-responsive-lg">
                    <thead class='thead-light'>
                        <th class="text-center">Product Description</th>
                        <th class="text-center">Remaining Quantity</th>
                        <th class="text-center">Product Authority</th>
                        <th class="text-center">Action</th>
                        
                    </thead>
                    <tbody id="transferdisplay"></tbody>
                </table>
            </div>
                
            <script>
                $(document).ready(function(){
                   $('#showbutton').click(function(){
                       var supplierr=$('#supplier').val();
                       var date_of_purchasee=$('#date_of_purchase').val();
                       $.ajax({
                           //showitem();
                           url: 'Controller/distributiondisp.jsp?lid=2',
                           method: 'POST',
                           data:{
                               "supplierr":supplierr,
                               "date_of_purchasee":date_of_purchasee
                           },
                           success: function showitem(item){
                               $('#transferdisplay').html(item);                           
                           }
                       });
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
        </main>
    </body>
</html>
<%} else{ response.sendRedirect("index.jsp");}%>