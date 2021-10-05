<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>CDSR Filter</title>
         <%@include file="Sidebar/fileinclude.html"%>
    </head>
    <body>
         <%@include file="Sidebar/sidebar.html"%>
              <div class="container">
                <div class="container-fluid">
                     <center>
                         <div class='display-4 text-center' style='font-size:46px;margin-top:10%;margin-left:32%;'>Display CDSR</div>
                      <div class="card shadow-lg p-4 mb-4" style="margin-left:30%;margin-top:2%; background-repeat: no-repeat;">
                          
                              <div class="card-body bg-light shadow-lg">
                                  <form action="CDSRFilter.jsp" method="post" id="display_cdsr_form">
                                  <div class="form-group">
                                  <label for="CDSR Name" class='font-weight-bold text-warning'>CDSR NAME:</label>
                                   <select name="CDSR_Name" class="form-control" style='width:50%' id="cdsr_name">
                                       <option value="Choose CDSR Name" selected hidden>Select CDSR Name</option>
                                       <option>C/S DSR/M&E</option>
                                       <option>C/S DSR/CC</option>
                                       <option>C/S DSR/Furniture</option>
                                       <option>C/S DSR/Semi CR</option>
                                       <option>C/S DSR/Consumable Register</option>
                                       <option>C/S DSR/M&E/Community Polytechnic</option>
                                       <option>C/S DSR/Utility Article</option>
                                       <option>C/S DSR/M&E/World Bank</option>
                                       <option>C/S DSR/PRU/WB</option>
                                       <option>C/S DSR/UPSBty/SCR</option>
                                  </select>
                                  </div>
                                  <br/>                             
                                  <div class="form-group">
                                      <label for="CDSR No" class='font-weight-bold text-warning'>CDSR NO:</label>
                                      <input type="number" name="CDSR_No" class="form-control" placeholder="Enter CDSR NO." style="width:50%" required/>
                                      </div>
                                  <div class="form-group">
                                 <input type='submit' class='btn btn-success' value="Submit" name='button'/>
                                  </div> 
                                  </form>
                                </div>       
                               </div>    
                           </div>
                </div>
              </div>
        </div>
       </center>
                    <script>
                        $(document).ready(function(){
                            
                            $("#display_cdsr_form").bind("submit",function(){

                       var dept=$("#cdsr_name").val();
                       if(dept=="Choose CDSR Name")
                       {
                           alert("Wrong CDSR Name.... Choose Proper CDSR Name ....");
                           $("#cdsr_name").focus();
                           return false;
                       }
                       else
                       {
                           return true;
                       }
                   });
                        });
                    </script>
    </body>
</html>
<%} else{ response.sendRedirect("index.jsp");}%>
