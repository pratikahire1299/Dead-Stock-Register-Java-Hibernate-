<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DSR.DAO.CDSRFilterDAO"%>
<%@page import="DSR.POJO.CDSR"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filter and report generation using CDSR</title>
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
    </head>
    
    <body>
        <%
            String cdsr_name=request.getParameter("CDSR_Name");
            List li=null;
            ListIterator lit=null;
            CDSR cdsr=new CDSR();
            int cdsr_no=Integer.parseInt(request.getParameter("CDSR_No"));
            li=CDSRFilterDAO.CDSRshowRecords(cdsr_name,cdsr_no);
            lit=li.listIterator();
           %>
        <%@include file="Sidebar/sidebar.html"%>
        <main class='page-content'>
            <div class='container-fluid'>
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
                        <h1><strong>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Government Polytechnic, Nashik</strong></h1>
                        <h5 class='offset-2'>(An Autonomous Institute of Government of Maharashtra)</h5>
                        <div class="row text-center">
                            <div class="col-lg-6"><h4 class="pull-left"><b>CDSR NAME:</b><%= cdsr_name%></h4></div>
                            <div class="col-lg-6"><h4 class="pull-right"><b>CDSR NO:</b><%= cdsr_no%></h4></div>
                        </div>
                        
                    </div>                          
                            <button type="button" class="btn btn-danger btn-sm" style="margin-left:20%;" data-toggle="modal" data-target="#mydepartmentModel">Print_Report</button>
                </div>
                <hr style="border-width:2px; border-color:black;"/>
                <table class="table table-bordered table-hover table-sm table-responsive-lg" id="example">
                    <thead>
                        <tr style="background-color:yellowgreen;">
                            <th class="text-center">Pg No</th>
                            <th class="text-center">Sr No</th>
                            <th class="text-center align-middle">Product Description</th>
                            <th class="text-center" style='vertical-align:middle;'>Product Category</th>
                            <th class="text-center" style="vertical-align: middle;">Date of Purchase</th>                          
                            <th class="text-center" style="vertical-align: middle;">Product Quantity</th>
                            <th class="text-center" style="vertical-align: middle;">Purchase Year</th>
                            <th class="text-center" style="vertical-align: middle;">Cost/unit</th>
                            <th class="text-center" style="vertical-align: middle;">Total Cost</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% while(lit.hasNext()){
                            cdsr=(CDSR)lit.next();
                            SimpleDateFormat date1=new SimpleDateFormat("yyyy-MM-dd");
                            SimpleDateFormat date2=new SimpleDateFormat("dd/MM/yyyy");
                            String date_purchase=date2.format(date1.parse(cdsr.getDate_of_purchase()));
                        %>
                        <tr>
                            
                            <td class="text-center" style="vertical-align:middle;"><%= cdsr.getCDSR_page_no() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= cdsr.getCDSR_Sr_No() %></td>
                            <td class="text-center" style="vertical-align:middle;"><a href="cdsrproductinfo.jsp?procdsr_id=<%= cdsr.getCdsr_id()%>"><%= cdsr.getProduct_description()%></a></td>
                            <td class="text-center" style="vertical-align:middle;"><%= cdsr.getProduct_category() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= date_purchase %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= cdsr.getProduct_quantity() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= cdsr.getPurchase_year() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= cdsr.getSingle_cost() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= cdsr.getTotal_cost() %></td>
                        </tr>
                        <%}%>
                    </tbody>
                    <tfoot>
                        <th colspan="9" style="text-align:right">Total:</th>
                    </tfoot>
                </table> 
                    <script src='Sidebar/JS/jquery.dataTables.min.js'></script>
              <script src='https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js'></script>
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
    });
 });
    </script>
    </body>
    <div class="modal fade" id="mydepartmentModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                           <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                   <div class="modal-header">
                                        <h4 class="modal-title" id="myModalLabel"><strong>Enter Page No. of CDSR from which do you want to print</strong></h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="cdsrreport.jsp" method="post" class="form-inline">
                                            <input type="hidden" name="cdsrname" value="<%= cdsr_name%>"/>
                                            <input type="hidden" name="cdsrno" value="<%= cdsr_no%>"/>
                                            <div class="form-group text-center">
                                                <input type="number" name="pg_no" class="form-control" placeholder="Enter Page No" required/>
                                            </div>
                                                
                                                <input type="submit" class="btn btn-info  btn-lg ml-4" value="Print"/>
                                            
                                        </form>
                                    </div>
                                </div>
                           </div>
</html>
<%} else{ response.sendRedirect("index.jsp");}%>