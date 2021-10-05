<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ListIterator"%>
<%@page import="DSR.POJO.DDSR"%>
<%@page import="DSR.DAO.FilterDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filter Report Page</title>
        <%@include file="Sidebar/fileinclude.html"%>
        <style>
                         #myBtn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  background-color: #0062cc;
  color: white;
  cursor: pointer;
  padding: 16px;
  border-radius: 60%;
}

#myBtn:hover {
  background-color: #d39e00;
}
        </style>
        <link rel='stylesheet' href='Sidebar/CSS/dataTables.bootstrap4.min.css'/>
            <script type="text/javascript">
            function myfunction(divName)
            {
                     var printContents = document.getElementById(divName).innerHTML;
     var originalContents = document.body.innerHTML;

     document.body.innerHTML = printContents;

     window.print();

     document.body.innerHTML = originalContents;
            }
            </script>
    </head>
    <body>
                <%
                    int dept_show=0;
                    String department=null;
                    try{
                    department=request.getParameter("department");} catch(Exception e){ e.printStackTrace(); } 
                    List li=null;
                    ListIterator lit=null;
                    DDSR ddsr=new DDSR();
                   
                    String criteria=request.getParameter("criteria");
                    System.out.println(criteria+"\n"+department);
                    String start_year =request.getParameter("start_year");
                    String end_year=request.getParameter("end_year");
                    String category=request.getParameter("category");
                    
                    System.out.println(criteria+"\n"+department);
                    if(criteria.equals("Year"))
                    {
                        
                        li=FilterDAO.FiltershowYear(department, criteria, start_year, end_year);
                    }
                    else if(criteria.equals("Category"))
                    {
                       
                        li=FilterDAO.FiltershowCategory(department,criteria,category);
                    }
                    else if(criteria.equals("All Items"))
                    {
                        li=FilterDAO.FiltershowAll(department,criteria);
                    }
                  lit=li.listIterator();
                %>
        <%@include file="Sidebar/sidebar.html"%>
        <main class='page-content'>
            <div class='container-fluid' id="printarea">
                <div class="row">
                    <button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fa fa-chevron-down"></i></button>
                    <script>
// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
    var a=document.body.height;
    //alert(a);
    
  if (document.body.scrollTop > 5 || document.documentElement.scrollTop > 5) {
    document.getElementById("myBtn").style.display = "block";
  } else {
    document.getElementById("myBtn").style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
/*function topFunction() {
  document.body.scrollBottom = 0;
  document.documentElement.scrollBottom = 0;*/
    
$(document).ready(function() {
   
    $('#myBtn').click(function(){
        var a=$(document).height();
        //alert(a);
        $('html, body').animate({scrollTop:$(document).height()}, 'slow');
        return false;
    });

});
</script>
                    <div class="col-lg-3">
                        <img src='Images/LOGO.png' class="center-block" alt='Collage Logo' width="130" height="140"/>
                    </div>
                    <div class="col-lg-9">
                        <h1 class="text-center"><strong>Government Polytechnic, Nashik</strong></h1>
                        <h5 class="text-center">(An Autonomous Institute of Government of Maharashtra)</h5>
                        <div class="row text-center">
                            <div class="col-lg-6 "><h4 class="pull-left"><b>Department:</b><%= department %></h4></div>
                            <div class="col-lg-6"><h4 class="pull-right"><b>Criteria:</b><%= criteria %></h4></div>
                        </div>
                        
                    </div>
                </div>
                <hr style="border-width:2px; border-color:black;"/>
                                        <% try{
                            int success_id=0; 
                            success_id=Integer.parseInt(request.getParameter("id")); 
                            if(success_id==1){%><div class="alert alert-success alert-dismissible fade show"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>Product Deleted Successfully....!</strong></div><%}
                            if(success_id==2){%><div class="alert alert-danger alert-dismissible fade show"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>Sorry Not Deleted Properly</strong></div><%}
                            } catch(Exception e){ e.printStackTrace();}%>
                            <input type="hidden" name="department" value="<%=department%>" class="dept" id="dept1">
  <input type="hidden" name="criteria" value="<%=criteria%>" class="crite" id="crite1">
  <input type="hidden" name="category" value="<%=category%>" class="category1" id="category">
  <input type="hidden" name="start_year" value="<%=start_year%>" class="start_year1" id="start_year">
  <input type="hidden" name="end_year" value="<%=end_year%>" class="end_year1" id="end_year">
        
       WriteOff &nbsp;&nbsp;<input type="checkbox" id="writeoff">
                <table class="table table-bordered table-hover table-sm table-responsive-lg" id="example">
                    <thead class="thead-light">
                        <tr>
                            <%if(department.equals("All Departments")){%><th class="text-center" style="vertical-align:middle;">Department</th><%}%>
                            <th class="text-center">DDSR No</th>
                            <th class="text-center">DDSR Pg No</th>
                            <th class="text-center">DDSR Sr No</th>
                            <th class="text-center p-0" style="vertical-align:middle;">Product Description</th>
                            <th class="text-center" style="vertical-align:middle;">Date of Receive</th>
                            <th class="text-center" style="vertical-align:middle;">Product Category</th>
                            <th class="text-center" style="vertical-align:middle;">Quantity</th>
                            <th class="text-center" style="vertical-align:middle;">Total Cost</th>
                            <th class="text-center" style="vertical-align:middle;">Product Type</th>
                            <th class="text-center" style="vertical-align:middle;">Year of Buy</th>
                            <!--<th class="text-center" style="vertical-align:middle;">Supplier Name</th>-->
                            <th class="text-center" style="vertical-align:middle;">Action</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <% while(lit.hasNext()){
                            ddsr=(DDSR)lit.next();
                            SimpleDateFormat date1=new SimpleDateFormat("yyyy-MM-dd");
                            SimpleDateFormat date2=new SimpleDateFormat("dd/MM/yyyy");
                            String date_purchase=date2.format(date1.parse(ddsr.getDate_of_receive()));
                        %>
                        <tr>
                            <%if(department.equals("All Departments")){%><td class="text-center" style="vertical-align:middle;"><%= ddsr.getDepartment()%></td><%}%>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getDdsr_no()%></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getDdsr_pg_no()%></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getDdsr_sr_no()%></td>
                            <td class="text-center" style="vertical-align:middle;"><a href="productinfo.jsp?pid=<%= ddsr.getDdsr_id()%>"><%= ddsr.getProduct_description()%></a></td>
                            <td class="text-center" style="vertical-align:middle;"><%= date_purchase%></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getProduct_category()%></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getProduct_quantity()%></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getTotal_cost()%></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getProduct_type()%></td>
                            <td class="text-center" style="vertical-align:middle;"><%= ddsr.getYear_of_buy()%></td>
                            <td class="text-center" style="vertical-align:middle;"><a href="Controller/DeleteTransferEntry.jsp?id=<%= ddsr.getDdsr_id()%>&qty=<%= ddsr.getProduct_quantity()%>&dept=<%= department%>&cdsr_table_id=<%= ddsr.getCdsr_table_id()%>" class="btn btn-danger"><i class="fa fa-trash-alt"></i></a></td>

                            
                        </tr>
                        <%}%>
                    </tbody>
                    <tfoot>
            <tr>
                <% if(department.equals("All Departments")){%><th colspan="8" style="text-align:right">Total:</th><%}
                else{%> <th colspan="7" style="text-align:right">Total:</th>  <%}%>
                <th></th>
            </tr>
        </tfoot>
                </table>
  	     <a href="#" class="btn btn-info btn-md hidden-print" onclick="myfunction('printarea');">
                                        <i class="fa fa-print"></i> Print
                                        </a>       
            </div>
        </main>
                    <script src='Sidebar/JS/jquery.dataTables.min.js'></script>
                    <!--<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>-->
              <script src='https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js'></script>
              <% if(!department.equals("All Departments"))
              {%>
              <script>
        $(document).ready(function() {
    $('#example').DataTable({
        "lengthMenu": [ [20, 50, 100, -1], [20, 50, 100, "All"] ],
         "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data;
 
            // Remove the formatting to get integer data for summation
            var intVal = function ( i ) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '')*1 :
                    typeof i === 'number' ?
                        i : 0;
            };
 
            // Total over all pages
            total = api
                .column( 7 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Total over this page
            pageTotal = api
                .column( 7, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Update footer
            $( api.column( 7 ).footer() ).html(
                ''+pageTotal +' ('+ total +' total)'
            );
        }
    });
 });
    </script>
    <%}
    else
    {%>
    <script>
        $(document).ready(function() {
    $('#example').DataTable({
         "lengthMenu": [ [20, 50, 100, -1], [20, 50, 100, "All"] ],
         "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data;
 
            // Remove the formatting to get integer data for summation
            var intVal = function ( i ) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '')*1 :
                    typeof i === 'number' ?
                        i : 0;
            };
 
            // Total over all pages
            total = api
                .column( 8 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Total over this page
            pageTotal = api
                .column( 8, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Update footer
            $( api.column( 8 ).footer() ).html(
                ''+pageTotal +' ('+ total +' total)'
            );
        }
        //"lengthMenu": [10, 25, 50,150, "All"];
    });
 });
    </script>
    <%}%>
    <script>
                  $(document).ready(function(){
                   $('#writeoff').change(function(){
                      if($(this).is(":checked")){  
                        
                        var department=$("#dept1").val();
                         var criteria1=$("#crite1").val();
                         var category=$("#category").val();
                         var startyear=$("#start_year").val();
                         var endyear=$("#end_year").val();
                   $.ajax({ 
                      url:'Controller/ShowWithWriteoff.jsp',
                      type:'POST',
                      data:{
                          "department":department,
                          "criteria1":criteria1,
                          "category":category,
                          "startyear":startyear,
                          "endyear":endyear
                           },
                      success:
                           function(data_display){
                             $('#display_with_writeoff').html(data_display);
                         }              
                     });
                   }    
               });
           });
            </script>
    </body>
</html>
<%}else{response.sendRedirect("index.jsp");}%>