<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<!Doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filter</title>
        <%@include file="Sidebar/fileinclude.html" %>        <!-- file include file in included-->
        <link rel='stylesheet' href='Sidebar/CSS/component-chosen.css'/>
    </head>
    <body>
        <%@include file="Sidebar/sidebar.html"%>
        <main class="page-content">
            <div class="container-fluid">
                <!--Form for Choosing Criteria or type of Filter-->
            <center><br/>
                <div class='card shadow-lg mb-4 p-4'>
                    <div class='card-header'>
                        <h2> Select Filter and Report Generation Criteria</h2>
                    </div>
                    <div class='card-body'>
                        <form action="filterdisp2.jsp" method="post" id="form_filter">
                            <div class="form-group">
                            <label for="criteria" class='font-weight-bold'>Select Criteria:</label>
                            <select class="form-control" style='width:50%;' id="criteria" name="criteria">
                                <option value="Choose_Criteria" selected hidden>Select Criteria</option>
                                <option>All Items</option>
                                <option>Category</option>
                                <option>Year</option>            
                            </select>
                            </div>
                            <div class='form-group'>
                            <label for='department' class='font-weight-bold'>Select Department:</label>
                            <select name='department' class='form-control form-control-chosen' id="department" style='width:50%;'>
                                <option value="Choose_Dept" selected hidden>Select Department</option>
                                <option>All Departments</option>
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
                            </div>
                            <input type='submit' class='btn btn-danger btn-lg' value="Submit" name='button'/>
                            <!--<button type='submit' class='btn btn-success btn-lg' id='submit' name='submit'><i class="fa fa-spinner mb-2"></i>&nbsp;&nbsp;Submit</button>-->
                        </form>
                <!--End of Choosing Criteria Form-->
                    </div>
                </div></center>
            </div>
        </main>
        <script src='Sidebar/JS/chosen.jquery.min.js'></script>
        <script>
            $(document).ready(function(){
                                      $('.form-control-chosen').chosen({
                                            allow_single_deselect: true,
                                            width: '100%'
                                        });
            });
        </script>
        <script>
            $(document).ready(function(){
                 $("#form_filter").bind("submit",function(){
                       var dept=$("#criteria").val();
                       if(dept=="Choose_Criteria")
                       {
                           alert("Wrong Criteria.... Choose Proper Criteria ....");
                           $("#criteria").focus();
                           return false;
                       }
                       else
                       {
                           return true;
                       }
                   });
                 $("#form_filter").bind("submit",function(){
                       var dept=$("#department").val();
                       if(dept=="Choose_Dept")
                       {
                           alert("Wrong Department.... Choose Proper Department ....");
                           $("#department").focus();
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
<%} else{ response.sendRedirect("index.jsp"); }%>