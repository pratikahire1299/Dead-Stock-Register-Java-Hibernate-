<%@page import="java.text.SimpleDateFormat"%>
<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="org.hibernate.Session"%>
<%@page import="DSR.Helper.NewHibernateUtil"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="DSR.POJO.writeoff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Write Off List</title>
          <%@include file="Sidebar/fileinclude.html" %>
          <link rel='stylesheet' href='Sidebar/CSS/dataTables.bootstrap4.min.css'>
    </head>
    <body>
           <%@include file="Sidebar/sidebar.html"%>
        <main class='page-content'>
            <div class='container-fluid' id="printarea">
                <div class="row">
                                 
                 <h1 class="mx-auto">All Write off Products</h1>
                </div>
                <% try{
                            int success_id=0; 
                            success_id=Integer.parseInt(request.getParameter("succ_id")); 
                            if(success_id==1){%><div class="alert alert-success alert-dismissible fade show"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>Entry Removed Successfully....!</strong></div><%}
                            if(success_id==2){%><div class="alert alert-danger alert-dismissible fade show"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>Sorry Entry not removed Properly</strong></div><%}
                            } catch(Exception e){ e.printStackTrace();}%>
            
                 <div class='form-group'>
                            <label for='department' class='font-weight-bold'>Select Department:</label>
                            <select name='department' class='form-control form-control-chosen' id="department" name="department" style='width:20%;'>
                                <option value="Choose_Dept" selected hidden>Select Department</option>
                                <option value="All Departments">All Departments</option>
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
    
                 <table class="table table-striped table-bordered table-hover table-responsive-sm" id="example">
                    <thead>
                        <tr>
                            <th class="text-center align-middle p-1">Cdsr No</th>
                            <th class="text-center align-middle">Cdsr Page No</th>
                            <th class="text-center align-middle">Cdsr Sr No</th>
                            <th class="text-center align-middle">Product Description</th>
                            <th class="text-center align-middle">Order No</th>
                            <th class="text-center align-middle">Receipt No</th>
                            <th class="text-center align-middle">Write off Date</th>
                            <th class="text-center align-middle">Product Category</th>
                            <th class="text-center align-middle">Department</th>
                            <th class="text-center align-middle">Year</th>
                            <th class="text-center align-middle">Action</th>
                        </tr>
                    </thead>
                    <%
                      List li;
                ListIterator lit;
                Session se=NewHibernateUtil.getSessionFactory().openSession();
                Query q;       
                q=se.createQuery("from writeoff");   
                li=q.list();
                lit=li.listIterator();
                while(lit.hasNext())
                {
                    writeoff writeoff= new writeoff();
                    writeoff=(writeoff)lit.next();
                    
                    
                    SimpleDateFormat date1=new SimpleDateFormat("yyyy-MM-dd");
                            SimpleDateFormat date2=new SimpleDateFormat("dd/MM/yyyy");
                            String date_purchase=date2.format(date1.parse(writeoff.getWrite_off_date()));
                            
            %>
            <tbody id="dept_display">
                       
                        
                        <%
                            }%>
                            
                           
                    </tbody>
                
               
                </table>
                
                                
           <script>
                   $(document).ready(function(){
                   $('#department').click(function(){ 
                          var department=$('#department').val();
                          if(department!="Choose_Dept")
                          {
                              
                   $.ajax({  
                      url:'Controller/filterdept.jsp',
                      type:'POST',
                      data:{
                          "department":department                   
                      },
                      success:
                              
                              function(dept_display){
                              $('#dept_display').html(dept_display);
                              }
                        });
                         }
                    });
                });
                </script>
                    <script src='Sidebar/JS/jquery.dataTables.min.js'></script>
    <script src='https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js'></script>
    <script>
        $(document).ready(function() {
    $('#example').DataTable();
} );
    </script>
        </main>
    </body>
</html>
<%} else{ response.sendRedirect("index.jsp");}%>