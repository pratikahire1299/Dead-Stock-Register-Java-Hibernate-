<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DSR.DAO.CDSRFilterDAO"%>
<%@page import="DSR.POJO.ConsumeDDSR"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filter Report Page</title>
        <link rel='stylesheet' href='Sidebar/CSS/dataTables.bootstrap4.min.css'/>
        <%@include file="Sidebar/fileinclude.html"%>
         <style>
             th,td{vertical-align: middle;}
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
          try{
             List li=null;
             ListIterator lit=null;
            ConsumeDDSR consumeddsr=new ConsumeDDSR();
            int dept_show=0;
            String consume_department=null;
            consume_department=request.getParameter("department");
            li=CDSRFilterDAO.ConsumeDDSRrecords(consume_department);
            lit=li.listIterator(); 
         %>
         <%@include file="Sidebar/sidebar.html"%>
          <main class='page-content'>
           <button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fa fa-chevron-down"></i></button>
                    <script>
// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
    var a=document.body.height;
    
  if (document.body.scrollTop > 5 || document.documentElement.scrollTop > 5) {
    document.getElementById("myBtn").style.display = "block";
  } else {
    document.getElementById("myBtn").style.display = "none";
  }
}


    
$(document).ready(function() {
   
    $('#myBtn').click(function(){
        var a=$(document).height();
        $('html, body').animate({scrollTop:$(document).height()}, 'slow');
        return false;
    });

});
</script>
              <div class='container-fluid' id="printarea">
                <div class="row">
                    
                    <div class="col-lg-3">
                        <img src='Images/LOGO.png' class='float-right' alt='Collage Logo' width="130" height="140"/>
                    </div>
                    <div class="col-lg-9">         
                        <h1 class='text-center'><strong>Government Polytechnic, Nashik</strong></h1>
                        <h5 class='text-center'>(An Autonomous Institute of Government of Maharashtra)</h5>
                       <div class="row">
                        <div class="col-lg-auto mx-auto"><h4 class="pull-left"><b>Department:</b><%= consume_department %></h4></div>
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
                <table class="table table-bordered table-hover table-responsive table-sm" id="example">
                    <thead class="thead-light">
                        <tr>
                            <% if(consume_department.equals("All Departments")){ %><th class="text-center" style="vertical-align:middle;">Department</th><% } %>
                            
                            <th class="text-center" style="vertical-align:middle;">Indent No.</th>
                            <th class="text-center" style="vertical-align:middle;">Product Name</th>
                            
                            <th class="text-center" style="vertical-align:middle;">Purchase Year</th>
                             <th class="text-center" style="vertical-align:middle;">Purchase Date</th>
                            <th class="text-center" style="vertical-align:middle;">Purchase Quantity</th>
                            <th class="text-center" style="vertical-align:middle;">Total Cost</th>
                            <th class="text-center" style="vertical-align:middle;">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% while(lit.hasNext()){
                            consumeddsr=(ConsumeDDSR)lit.next();
                            SimpleDateFormat date1=new SimpleDateFormat("yyyy-MM-dd");
                            SimpleDateFormat date2=new SimpleDateFormat("dd/MM/yyyy");
                            String date_purchase=date2.format(date1.parse(consumeddsr.getDate_of_issue()));
                        %>
                        <tr>
                            <% if(consume_department.equals("All Departments")){ %><td class="text-center" style="vertical-align:middle;"><%= consumeddsr.getDepartment()%></td><% } %>
                            
                            <td class="text-center" style="vertical-align:middle;"><%= consumeddsr.getIndent_no() %></td>
                            <td class="text-center" style="vertical-align:middle;"><a href="productinfoconsumeddsr.jsp?pid=<%= consumeddsr.getConsumeddsr_id()%>"><%= consumeddsr.getProduct_name()%></a></td>
                            
                            <td class="text-center" style="vertical-align:middle;"><%= consumeddsr.getPurchase_year() %> </td>
                            <td class="text-center" style="vertical-align:middle;"><%= date_purchase %></td>
                            <td class="text-center" style="vertical-align:middle;"><% out.print(consumeddsr.getQuantity_issued()+"  "+consumeddsr.getC_Purchase_Unit());%></td>
                            <td class="text-center" style="vertical-align:middle;"><%= consumeddsr.getDdsr_total() %> </td>
                            <td class="text-center" style="vertical-align:middle;"><a class="btn btn-danger" href="Controller/DeleteTransferEntry2.jsp?id=<%= consumeddsr.getConsumeddsr_id()%>&qty=<%=consumeddsr.getQuantity_issued()%>&unit=<%=consumeddsr.getC_Purchase_Unit()%>&dept=<%= consume_department%>&consumecdsr_table_id=<%= consumeddsr.getConsumecdsr_id()%>"><i class="fa fa-trash-alt"></i></a></td>
                             
                        </tr>
                       <%}%>
                   
                    </tbody>
                    <tfoot>
            <tr>
                <% if(consume_department.equals("All Departments")){ %>
                <th colspan="6" style="text-align:right">Total:</th>
                <% } else{ %>
                <th colspan="5" style="text-align:right">Total:</th><% } %>
                <th></th>
                
            </tr>
        </tfoot>
        
                </table> 
                <a href="#" class="btn btn-info btn-md hidden-print" onclick="myfunction('printarea');">
                                        <i class="fa fa-print"></i> Print
                 </a>       
            </div>
          </main>            
    </body>
    
    <script src='Sidebar/JS/jquery.dataTables.min.js'></script>
    <script src='https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js'></script>
    <% if(consume_department.equals("All Departments")){%>
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
                .column( 6 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Total over this page
            pageTotal = api
                .column( 6, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Update footer
            $( api.column( 6 ).footer() ).html(
                ''+pageTotal +' ('+ total +' total)'
            );
        }
    });
 });
    </script>
    <% } else {%>
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
                .column( 5 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Total over this page
            pageTotal = api
                .column( 5, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Update footer
            $( api.column( 5 ).footer() ).html(
                ''+pageTotal +' ('+ total +' total)'
            );
        }
    });
 });
    </script>
    <% } }
                         catch(Exception e)
                           { e.printStackTrace();}
                        %>
</html>
<%}else{response.sendRedirect("index.jsp");}%>    
    