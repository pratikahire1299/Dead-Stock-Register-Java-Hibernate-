<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filter and Report Generation</title>
        <%@include file="Sidebar/fileinclude.html"%>
    </head>
    <body>
        <% 
            String criteria=request.getParameter("criteria");
            String department=request.getParameter("department");
        %>
        <%@include file="Sidebar/sidebar.html"%>
        <main class="page-content">
            <div class="container-fluid">
                <% if((request.getParameter("button")).equals("Submit")){%>
                <center>
                <div class='card shadow-lg mb-4 p-4' style='margin-top:6%;'>
                    <div class='card-header'>
                        <h3>Report Generation Information</h3>
                    </div>
                    <div class='card-body'>
                        <h2>Criteria:<%= criteria %></h2>
                        <form action='filtershow.jsp' id="myform" method='post'>
                            <input type='hidden' name='department' value='<%= department %>'/>
                            <input type="hidden" name="criteria" value="<%= criteria%>"/>
                            <% if(criteria.equals("Year")){%>
                            <div class='form-group'>
                                <label for='Start_year' class='font-weight-bold'>To:</label>
                                <input type='date' name='start_year' class='form-control' placeholder='Enter Starting Year' required/>
                            </div>
                            <div class='form-group'>
                                <label for='End_year' class='font-weight-bold'>From:</label>
                                <input type='date' name='end_year' class='form-control' placeholder='Enter Ending Year' required/>
                            </div>
                            <%} else if(criteria.equals("Category")){%>
                            <div class='form-group'>
                                <label for='category' class='font-weight-bold'>Select Category:</label>
                                <select class='form-control' name='category' id="category">
                                    <option value="category" selected hidden>Select Category</option>
                                    <option>Furniture</option>
                                    <option>Machinary & Equipment</option>
                                    <option>Measurement Equipment</option>
                                    <option>Computer and pheripherals</option>
                                    <option>Software</option>
                                    <option>Others</option>
                                </select>
                            </div>
                            <%} else if(criteria.equals("All Items")){%>
                            <h5>Click here to Show All Items</h5><%}%>
                            <input type='submit' value='Submit' class='btn btn-success btn-lg'/>
                        </form>
                    </div>
                </div><%}%>
                </center>
            </div>
                <script>
                    $(document).ready(function(){
                       $("#myform").submit(function(){
                              var dept=$("#category").val();
                       if(dept=="category")
                       {
                           alert("Wrong category.... Choose Proper category ....");
                           $("#category").focus();
                           return false;
                       }
                       else
                       {
                           return true;
                       }
                        }); 
                    });
                </script>
        </main>
    </body>
</html>
<%} else{ response.sendRedirect("index.jsp");}%>
