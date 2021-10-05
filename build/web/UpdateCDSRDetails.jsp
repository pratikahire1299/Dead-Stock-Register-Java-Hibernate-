    <%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="DSR.Helper.NewHibernateUtil"%>
<%@page import="DSR.POJO.CDSR"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Update CDSR Details</title>
        <link rel='stylesheet' href='Sidebar/CSS/component-chosen.css'>
        <%@include file="Sidebar/fileinclude.html"%>
    </head>
    
        <%
             
            long find_id=Long.parseLong(request.getParameter("lid"));
            Session s=NewHibernateUtil.getSessionFactory().openSession();
            Transaction trans=s.beginTransaction();
            Object obj=s.get(CDSR.class, find_id);
            CDSR cdsr=new CDSR();
            cdsr=(CDSR)obj;
        %>
      
       <body class="bg-light">
        <%@include file="Sidebar/sidebar.html"%>
        <main class="page-content">
            <div class="container-fluid">
            <div class="card shadow-lg p-4 mb-4 bg-white">
             <div class="card-header bg-white border border-0">
                 <h5 class="display-4" style="font-size:40px;"><b>Updation of Accepted Inventory</b></h5>
                    </div>
   
               <div class="card-body">  
                   <form action="Controller/UpdateAcceptance.jsp" method="post" id="myform2" name="acceptanceform">
                 <input type="hidden" name="item_id" value="<%= find_id%>"/>
                   <div class="row">
                            <div class="form-group col-lg-8">
                                <label for="supplier"><b>Supplier Description:</b></label>
                            <input type="text" class="form-control" name="supplier" maxlength="80" value="<%= cdsr.getSupplier()%>" id="supplier" required/> 
                           </div>
                            <div class="form-group col-lg-4">
                                <label for="cdsr_name" class='font-weight-bold'><b>CDSR Name</b></label>
                                 <select name="cdsr_name" class="custom-select" id="selectbox1" required>
                                    <option value="Choose_CDSR_Name" selected hidden>Choose CDSR Name</option>
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
                            </div>
                         </div>
                            <div class="row">
                            <div class="form-group col-lg-4">
                                <label for="purchase_year"><b>Purchase Year:</b></label>
                                <input type="text" class="form-control" name="purchase_year" maxlength="9" value="<%= cdsr.getPurchase_year()%>" id="purchase_year" required/>      
                            </div>
                            <div class="form-group col-lg-4">
                                <label for="DSR_no"><b>CDSR_No:</b></label>
                                <input type="text" class="form-control" name="CDSR_no" maxlength="3" value="<%= cdsr.getCDSR_no()%>" id="DSR_no"  required/>
                            </div>
                            <div class="form-group col-lg-4">
                                <label for="DSR_page_no"><b>CDSR_Page_No:</b></label>
                                <input type="text" class="form-control" name="CDSR_page_no" maxlength="3" value="<%= cdsr.getCDSR_page_no()%>" id="DSR_page_no" required/>
                            </div>
                            </div>
                            <div class="row">
                            <div class="form-group col-lg-4">
                                <label for="dsr_sr_no"><b>CDSR_Sr_No:</b></label>
                                <input type="text" class="form-control" name="CDSR_Sr_No" maxlength="3" value="<%= cdsr.getCDSR_Sr_No()%>" id="dsr_sr_no" placeholder="Enter DSR_sr_no" required/>
                            </div>
                            <div class="form-group col-lg-5">
                                <label for="product_description"><b>Product Description:</b></label>
                                <input type="text" class="form-control" name="product_description" maxlength="200" value="<%= cdsr.getProduct_description()%>" id="product_description" required/>                 
                            </div>
                            <div class="form-group col-lg-3">
                                <label for="product_type" class='font-weight-bold'>Product Type:</label><br/>
                                <div class="custom-control custom-radio">
                                <input type="radio" name="product_type" class="custom-control-input" id="semi_product_type" value="SemiConsumable" required>
                                <label class="custom-control-label" for="semi_product_type">Semi Consumable</label>
                                </div>
                                <div class="custom-control custom-radio">
                                <input type="radio" name="product_type" class="custom-control-input" id="dead_product_type" value="Dead Stock" required>
                                <label class="custom-control-label" for="dead_product_type">Dead Stock</label>
                                </div>
                            </div>
                            </div>
                            <div class="row">
                             <div class="form-group col-lg-4 col-xs-12">
                                <label for="Product_Category" class='font-weight-bold'>Product Category:</label>
                                <select name="product_category" class="custom-select" id="pro_cat" required>
                                    <option value="Choose_Product_Category" selected hidden>Choose Product Category</option>
                                    <option value="Computer and pheripherals" name="Computer_and_andpheripherals" id="Computer_and_andpheripherals">Computer and pheripherals</option>
                                    <option value="Furniture" name="Furniture" id="Furniture">Furniture</option>
                                    <option value="Machinary & Equipment" name="Equipment" id="Equipment">Machinary & Equipment</option>
                                    <option value="Measurement Equipment" name="Others" id="Others">Measurement Equipment</option>
                                    <option value="Software" name="Others" id="Others">Software</option>
                                    <option value="Others" name="Others" id="Others">Others</option>
                                </select>
                             </div>
                                
                            <div class="form-group col-lg-3">
                                <label for="product_quantity"><b>Product Quantity:</b></label>
                                <input type="number" class="form-control" name="product_quantity" value="<%= cdsr.getProduct_quantity()%>" id="product_quantit" required/>
                            </div>
                            <div class="form-group col-lg-5">
                                <label for="purchase_authority"><b>Purchase Authority:</b></label>
                                <input type="text" class="form-control" name="purchase_authority" maxlength="60" value="<%= cdsr.getPurchase_authority()%>" id="purchase_authority" required/>
                            </div>
                            </div>
                            <div class="row">
                             <div class="form-group col-lg-3">
                                <label for="Date_of_purchase"><b>Date of Purchase:</b></label>
                                <input type="date" class="form-control" name="date_of_purchase" value="<%= cdsr.getDate_of_purchase()%>" id="Date_of_purchase" required/>    
                            </div>
                            
                            <div class="form-group col-lg-4">
                                <label for="Single_value"><b>Cost of Single Item:</b></label>
                                <input type="text" class="form-control" name="single_cost" maxlength="9" value="<%= cdsr.getSingle_cost()%>" id="Single_value" required/>
                            </div>
                            <div class="form-group col-lg-3">
                                <label for="total_cost"><b>Total Cost:</b></label>
                                <input type="text" class="form-control" name="total_cost"  id="total_cost" readonly onfocus="calculate();" onclick="calculate();" required/>
                            </div>
                           
                            <div class="form-group col-lg-2">
                                <br/><input type="submit" style="width:100%;" value="Update" name="update" class="btn btn-danger btn-lg">
                            </div>    
                            </div>
                        </div>
         </form>               
         </div>
        </div>
                <script type="text/javascript">
                    function calculate()
                    {
                        var a=parseInt(document.getElementById("Single_value").value);
                        var b=parseInt(document.getElementById("product_quantit").value);
                        var d=a*b;
                        document.getElementById("total_cost").value=(d);
                    }
                </script>
                <script>
                    $(document).ready(function(){
                       $("#myform2").bind("submit",function(){
                        var a=parseInt(document.getElementById("Single_value").value);
                        var b=parseInt(document.getElementById("product_quantit").value);
                        var c;
                        c=a*b;
                        document.getElementById("total_cost").value=(c);
                        if(c=="" || c=="0")
                        {
                            alert("Wrong Total"+c);
                            return false;
                        }
                        else
                        {
                            return true;
                        }
                   });
               });  
                    
                </script>
                <script>
                 $(document).ready(function(){
                    $("#myform2").bind("submit",function(){
                       var dept=$("#pro_cat").val();
                       if(dept=="Choose_Product_Category")
                       {
                           alert("Wrong Product Category.... Choose Proper Product Category ....");
                           $("#pro_cat").focus();
                           return false;
                       }
                       else
                       {
                           return true;
                       }
                   });
                   $("#myform2").bind("submit",function(){
                       var dept=$("#selectbox1").val();
                       if(dept=="Choose_CDSR_Name")
                       {
                           alert("Wrong CDSR Name.... Choose Proper CDSR Name ....");
                           $("#selectbox1").focus();
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