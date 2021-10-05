<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DSR.DAO.CDSRFilterDAO"%>
<%@page import="DSR.POJO.Consume_CDSR"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Consume CDSR Filter and report generation</title>
        <link rel='stylesheet' href='Sidebar/CSS/dataTables.bootstrap4.min.css'/>
        <%@include file="Sidebar/fileinclude.html"%>
    </head>
    <body>
         <%
             int consumecdsr_no=Integer.parseInt(request.getParameter("Consume_CDSR_NO"));
         try{
            Consume_CDSR consumecdsr=new Consume_CDSR();
            
            List li=CDSRFilterDAO.ConsumeCDSRshowRecords(consumecdsr_no);
            ListIterator lit=li.listIterator();
           %> 
        <%@include file="Sidebar/sidebar.html"%>
        <main class='page-content'>
            <div class='container-fluid' id="printarea">
                <div class="row">
                    <div class="col-lg-3">
                        <img src='Images/LOGO.png' class='float-right' alt='Collage Logo' width="130" height="140"/>
                    </div>
                    <div class="col-lg-9">         
                        <h1 class='text-center'><strong>Government Polytechnic, Nashik</strong></h1>
                        <h5 class='text-center'>(An Autonomous Institute of Government of Maharashtra)</h5>
                        
                            <h4 class="text-center"><b>Consumable CDSR_NO:</b><%= consumecdsr_no%></h4>
                    </div>
                    
                            <button  class="btn btn-info" style="margin-left:26%;" data-toggle="modal" data-target="#mydepartmentModel">Print Report</button>
                </div>
                <hr style="border-width:2px; border-color:black;"/>
                <table class="table table-bordered table-hover table-responsive-lg" id="example">
                    <thead>
                        <tr>
                            <th class="text-center" style="vertical-align:middle;">CC/R Page No</th>
                            <th class="text-center" style="vertical-align:middle;">CC/R Sr No</th>
                            <th class="text-center" style="vertical-align:middle;">Product Name</th>
                            <th class="text-center" style="vertical-align:middle;">Purchase Quantity</th>
                            <th class="text-center" style="vertical-align:middle;">Purchase Date</th>                            
                            <th class="text-center" style="vertical-align:middle;">Cost/unit</th>
                            <th class="text-center" style="vertical-align:middle;">Total Cost</th>
                            <th class="text-center" style="vertical-align:middle;">Remaining items</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% while(lit.hasNext()){
                            consumecdsr=(Consume_CDSR)lit.next();
                            SimpleDateFormat date1=new SimpleDateFormat("yyyy-MM-dd");
                            SimpleDateFormat date2=new SimpleDateFormat("dd/MM/yyyy");
                            String date_purchase=date2.format(date1.parse(consumecdsr.getConsume_date_of_purchase()));
                            float final_pro_qty1=consumecdsr.getFinal_product_quantity();
                                String pro_unit1=consumecdsr.getProduct_unit();
                                float total_quantity1=1;
                            if(pro_unit1.equals("Meter"))
                            {
                                total_quantity1=(final_pro_qty1/100);
                            }
                            else if(pro_unit1.equals("Liter"))
                            {
                                total_quantity1=(final_pro_qty1/1000);
                            }
                            else if(pro_unit1.equals("Kilogram"))
                            {
                                total_quantity1=final_pro_qty1/1000;
                            }
                            else if(pro_unit1.equals("Feet"))
                            {
                                total_quantity1=final_pro_qty1/30;
                            }
                            else
                            {
                                total_quantity1=final_pro_qty1;
                            }
                        %>
                        <tr>
                            <td class="text-center" style="vertical-align:middle;"><%= consumecdsr.getConsume_CDSR_page_no() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= consumecdsr.getConsume_CDSR_sr_no() %></td>
                            <td class="text-center" style="vertical-align:middle;"><a href="consumecdsrinfo.jsp?procdsr_id=<%= consumecdsr.getConsume_CDSR_Id()%>"><%= consumecdsr.getConsume_product_name()%></a></td>
                            <td class="text-center" style="vertical-align:middle;"><%= consumecdsr.getConsume_purchase_quantity() %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= date_purchase %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= consumecdsr.getConsume_cost_per_unit()%></td>
                            <td class="text-center" style="vertical-align:middle;"><%= consumecdsr.getConsume_total() %></td>
                            <td class="text-center" style="vertical-align:middle;"><% out.print(total_quantity1+" "+consumecdsr.getProduct_unit()); %></td>
                        </tr>
                        <%}              } catch(Exception e){ e.printStackTrace();}%>
                    </tbody>
                </table> 
                    <script src='Sidebar/JS/jquery.dataTables.min.js'></script>
                    <script src='https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js'></script>
              <script>
        $(document).ready(function() {
    $('#example').DataTable();
} );
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
                                       <form action="cdsrreportConsumable.jsp" method="post">
                            <input type="hidden" name="cdsrno" value="<%= consumecdsr_no%>"/>
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