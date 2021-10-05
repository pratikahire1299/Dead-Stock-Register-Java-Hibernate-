<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<!Doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Write Off</title>
        <%@include file="Sidebar/fileinclude.html" %>        <!-- file include file in included-->
    </head>
    <body>
        <%@include file="Sidebar/sidebar.html"%>
        <main class="page-content">
            <div class="container-fluid">
            <center><br/>
                   <h1 class='display-4 text-left' style='font-size:46px;'>Write Off of Dead Stock Product</h1>
                    <div class='card shadow-lg mb-4 p-4'>
                      <div class="card-body">
                             <% try{
                            int success_id=0; 
                            success_id=Integer.parseInt(request.getParameter("wo_id")); 
                            if(success_id==1){%><div class="alert alert-success alert-dismissible fade show text-left"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>Product WriteOff Succssfully....!</strong></div><%}
                            if(success_id==2){%><div class="alert alert-danger alert-dismissible fade show text-left"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>Sorry Not WriteOff Properly</strong></div><%}
                            } catch(Exception e){ e.printStackTrace();}%>        
                            <div class="form-inline">
                            <label for="CDSR_no" class="mr-sm-2 mb-2 font-weight-bold">CDSR No:</label>
                            <input type="number" class="form-control mb-2 mr-sm-2" name="CDSR_no" id="CDSR_no" placeholder="Enter DSR NO" required/>
                            
                            <label for="CDSR_page_no" class="mr-sm-2 mb-2 font-weight-bold">CDSR Page No:</label>
                            <input type="number" class="form-control mb-2 mr-sm-2" name="CDSR_page_no" id="CDSR_page_no" placeholder="Enter DSR SR NO" required/>
                            
                            
                            <label for="CDSR_Sr_No" class="mr-sm-2 mb-2 font-weight-bold">CDSR Sr No:</label>
                            <input type="number" class="form-control mb-2 mr-sm-2" name="CDSR_Sr_No" id="CDSR_Sr_No" placeholder="Enter DSR PAGE NO" required/>                           
                            </div>
                            <div class="form-inline">
                            <label for="department" class="mr-sm-2 mb-2 font-weight-bold">Department:</label>
                            <select class="form-control form-control-chosen" name="department" data-placeholder="Choose Department" id="department_idddd">
                    <option value="" selected hidden>Choose Department</option>
                    <option>Computer Technology</option>
                    <option>Information Technology</option>
                    <option>Civil Engineering</option>
                    <option>Mechanical Engineering</option>
                    <option>Automobile Engineering</option>
                    <option>Electronics and Telecommunication Engineering</option>
                    <option>Plastic Engineering</option>
                    <option>Dress Desigining and Garments Manufacturing</option>
                    <option>Interior Desigining and Decoration</option>
                    <option>Electrical Engineering</option>
                    <option>Science (Physics)</option>
                    <option>Science (Chemistry)</option>
                    <option>Gymkhana</option>
                    <option>Applied Mechanics</option>
                    <option>Workshop</option>
                    <option>Library</option>
                    <option>Hostel Boys</option>
                    <option>Hostel Girls</option>
                    <option>Office</option>
                    <option>Exam Section</option>
                    <option>Others</option>
                </select>
                            <label for="cdsr_name" class='font-weight-bold ml-4'>CDSR Name:</label>
                                <select name="cdsr_name" class="form-control form-control-chosen ml-2" id="cdsr_name" required>
                                    <option value="" selected hidden>Choose CDSR Name</option>
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
                            
                            
                <input type='submit' class='btn btn-success btn-lg mb-2 ml-4' id="submit" value="Submit" name='button'/>
                            
                            </div>
                    </div>
                    </div>
                       <table class="table table-bordered table-hover shadow-lg mb-4 p-4 table-responsive-lg">
                    <thead class="thead-light">
                        <tr>
                            <th class="text-center">Product Description</th>
                            <th class="text-center">Product Category</th>
                            <th class="text-center">Product Quantity</th>
                            <th class="text-center">Purchase Year</th>
                            <th class="text-center">Writeoff</th>
                        </tr>
                    </thead>
                    <tbody class="writeoff"></tbody>
                       </table>
                </center>
            </div>
        </main>
                 <script>
                   $(document).ready(function(){
                   $('#submit').click(function(){ 
                       
                          var CDSR_no=$('#CDSR_no').val();
                          var CDSR_page_no=$('#CDSR_page_no').val();
                          var CDSR_Sr_No=$('#CDSR_Sr_No').val();
                          var department=$('#department_idddd').val();
                          var cdsr_name=$('#cdsr_name').val();
                                  
                   $.ajax({  
                      url:'Controller/writeoffcontroller.jsp',
                      type:'POST',
                      data:{
                          CDSR_no:CDSR_no,
                          CDSR_page_no:CDSR_page_no,
                          CDSR_Sr_No:CDSR_Sr_No,
                          department:department,
                          cdsr_name:cdsr_name
                      },
                      success:
                              function(writeoff){
                              $('.writeoff').html(writeoff);
                              }
                        });
                    });
                });
                   
                   
                </script>
    </body>
</html>
<%} else{ response.sendRedirect("index.jsp"); }%>