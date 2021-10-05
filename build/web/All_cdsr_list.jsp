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
        <title>CDSR List</title>
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
            try{
            int id1=Integer.parseInt(request.getParameter("id"));
            if(id1==1)
            {
                cdsr_name="C/S DSR/M&E";
            }
            if(id1==2)
            {
                cdsr_name="C/S DSR/M&E/COMMUNITY POLYTECNIC";
            }
            if(id1==3)
            {
                cdsr_name="C/S DSR/M&E/WORLD BANK";
            }
            
            }
            catch(Exception e){}

            
            List li=null;
            ListIterator lit=null;
            CDSR cdsr=new CDSR(); 
            if(cdsr_name.equals("All CDSR"))
            {
             li=CDSRFilterDAO.CDSRInfoDisplay();
            lit=li.listIterator();
             }
             else
            {
                li=CDSRFilterDAO.CDSRshowbyonlyName(cdsr_name);
                lit=li.listIterator();
             
            }
           
                         
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
    
  if (document.body.scrollTop > 5 || document.documentElement.scrollTop > 5) {
    document.getElementById("myBtn").style.display = "block";
  } else {
    document.getElementById("myBtn").style.display = "none";
  }
}


    
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
                        <div class="row">
                            <div class="col-lg-6 mx-auto d-block"><h4><b>CDSR NAME:</b><%= cdsr_name %></h4></div>
                        </div>
                        
                    </div>
                        
                </div>
                <hr style="border-width:2px; border-color:black;"/>
                <table class="table table-bordered table-hover table-sm table-responsive-lg" id="example">
                    <thead>
                        <tr style="background-color:yellowgreen;">
                            <% if(cdsr_name.equals("All CDSR")){ %><th class="text-center">Cdsr Name</th><%}%>
                            <th class="text-center">CDSR No</th>
                            <th class="text-center">Pg No</th>
                            <th class="text-center">Sr No</th>
                            <th class="text-center align-middle">Supplier</th>
                            <th class="text-center align-middle">Product Description</th>
                            <th class="text-center" style='vertical-align:middle;'>Product Category</th>
                            <th class="text-center" style='vertical-align:middle;'>Product Type</th>
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
                            <% if(cdsr_name.equals("All CDSR")){ %><td class="text-center" style="vertical-align:middle;"><%= cdsr.getCdsr_name()%></td><% } %>
                            <td class="text-center" style="vertical-align:middle;"><%= cdsr.getCDSR_no() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= cdsr.getCDSR_page_no() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= cdsr.getCDSR_Sr_No() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= cdsr.getSupplier() %></td>
                            <td class="text-center" style="vertical-align:middle;"><a href="cdsrproductinfo.jsp?procdsr_id=<%= cdsr.getCdsr_id()%>"><%= cdsr.getProduct_description()%></a></td>
                            
                            <td class="text-center" style="vertical-align:middle;"><%= cdsr.getProduct_category() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= cdsr.getProduct_type() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= date_purchase %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= cdsr.getProduct_quantity() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= cdsr.getPurchase_year() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= cdsr.getSingle_cost() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= cdsr.getTotal_cost() %></td>
                        </tr>
                        <%}%>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th colspan="12" style="text-align:right">Total:</th>
                        </tr>
                    </tfoot>
                </table> 
           
             <script src='Sidebar/JS/jquery.dataTables.min.js'></script>
              <script src='https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js'></script>
              
     
                </table>
  	     <a href="#" class="btn btn-info btn-md hidden-print" onclick="myfunction('printarea');">
                                        <i class="fa fa-print"></i> Print
                                        </a>       
            </div>
        </main>
                 
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
                .column( 11 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Total over this page
            pageTotal = api
                .column( 11, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Update footer
            $( api.column( 11 ).footer() ).html(
                ''+pageTotal +' ('+ total +' total)'
            );
        }
    });
 });
    </script>
     
     </main>
    </body>
</html>
<%} else{ response.sendRedirect("index.jsp");}%>