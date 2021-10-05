<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="DSR.POJO.CDSR"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="DSR.Helper.NewHibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transfer Page</title>
        <%@include file="Sidebar/fileinclude.html"%>
        <link href='Sidebar/CSS/component-chosen.css' rel='stylesheet'>
    </head>
    <body>
        <%
            long find_id=Long.parseLong(request.getParameter("tpid"));
            System.out.println(find_id);
            try{
            Session s=NewHibernateUtil.getSessionFactory().openSession();
            Transaction trans=s.beginTransaction();
            Object obj=s.get(CDSR.class, find_id);
            CDSR cdsr=new CDSR();
            cdsr=(CDSR)obj;
        %>
        <%@include file="Sidebar/sidebar.html"%>
        <main class="page-content">
        <div class="container-fluid">
            <h1 class='display-4' style='font-size:46px;'>Transfer Details:</h1><hr style="border-width:2px; border-color:black;"/>
            <br/>
        <div class="card shadow-lg p-4 mb-4">
        <div class="card-body">
        <!--Form to Get the Details of Transfer Inventory-->
            <form action="Controller/transferinsert.jsp" id="transferform" method="post">
        <div class="row">
            <input type="hidden" name="item_id" value="<%= find_id%>"/>
            <input type="hidden" name="cdsr_no" value="<%= cdsr.getCDSR_no()%>"/>
            <input type="hidden" name="cdsr_pg_no" value="<%= cdsr.getCDSR_page_no()%>"/>
            <input type="hidden" name="cdsr_sr_no" value="<%= cdsr.getCDSR_Sr_No()%>"/>
            <input type="hidden" name="product_type" value="<%= cdsr.getProduct_type()%>"/>
            <input type="hidden" name="cost_unit" id="single_unit" value="<%= cdsr.getSingle_cost()%>"/>
            <input type="hidden" name="CDSR_name" id="CDSR_name" value="<%= cdsr.getCdsr_name()%>"/>
            <input type="hidden" name="supplier_name" id="supplier_name" value="<%= cdsr.getSupplier()%>"/>
            <input type="hidden" name="cdsr_table_id" id="cdsr_table_id" value="<%= cdsr.getCdsr_id()%>"/>
            <div class="form-group col-lg-7">
                <label for="Product_description" class='font-weight-bold'>Product_Description</label>
                <input type="text" name="product_description" class="form-control" id="Product_description" value="<%= cdsr.getProduct_description()%>" readonly required/>
            </div>
            <div class="form-group col-lg-2">
                <label for="Remaining_item" class='font-weight-bold'>Remaining Item:</label>
                <input type="number" class="form-control" name="remaining_item" id="Remaining_item" value="<%= cdsr.getRemaining_Quantity()%>" readonly required/>
            </div>
            <div class="form-group col-lg-3">
                <label for="Product_Category" class='font-weight-bold'>Product Category:</label>
                <input type="text" class="form-control" name="product_category" id="Product_Category" value="<%= cdsr.getProduct_category()%>" readonly required/>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-lg-6">
                <label for="department" class='font-weight-bold'>Choose Department:</label>
                    <select class="form-control form-control-chosen" name="department" id="dept" data-placeholder="Choose Department" required>
                    <option value="Choose_dept" selected hidden>Choose Department</option>
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
    
            <div class="form-group col-lg-3">
                <label for="Required_item" class='font-weight-bold'>Required Item:</label>
                <input type="number" class="form-control" name="product_quantity" id="Required_item" required/>
            </div>
            <div class="form-group col-lg-3">
                <label for="Sending_Date" class='font-weight-bold'>Sending Date:</label>
                <input type="date" class="form-control" name="date_of_receive" id="Sending_Date" placeholder="Enter Date of Send" onfocus="Max_item_valid();" onclick="Max_item_valid();" required/>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-lg-3">
                <label for="year_of_buy" class='font-weight-bold'>Year of Buy:</label>
                <input type="text" class="form-control" name="year_of_buy" id="year_of_buy" maxlength="9" placeholder="Enter Year of Buy" required/>
            </div>
            <div class="form-group col-lg-3">
                <label for="DDSR_No" class='font-weight-bold'>DSR No:</label>
                <input type="number" class="form-control" name="ddsr_no" id="DDSR_No" placeholder="Enter DDSR No" maxlength="3" onclick="total_value_cost();" onfocus="total_value_cost();" required/>
            </div>
            <div class="form-group col-lg-3">
                <label for="DDSR_Pg_No" class='font-weight-bold'>DSR Page No:</label>
                <input type="number" class="form-control" name="ddsr_pg_no" id="DDSR_Pg_No" maxlength="4" placeholder="Enter DDSR Page No" required/>
            </div>
            <div class="form-group col-lg-3">
                <label for="DDSR_Sr_No" class='font-weight-bold'>DSR Serial No:</label>
                <input type="number" class="form-control" name="ddsr_sr_no" id="DDSR_Sr_No" maxlength="2" placeholder="Enter DDSR Serial No" required/>
            </div>
        </div>
            <input type="hidden" name="total_cost" id="total"/>
                    <br/>
                    <h4 class="text-danger text-center">Check All Entered Data Carefully befored Clicking Submit Button.... Because Entered Data is Permenant and never be changed ....</h2>
                    <button class="btn btn-danger btn-lg font-weight-bold" type="submit" style="width:75%;margin-left:10%;"><i class="fa fa-spinner mb-2"></i>&nbsp;&nbsp;Submit</button>
          </form><br/><br/>
            
       </div>
       </div>
       </div>
      </main>
            
        <script type="text/javascript">
            function Max_item_valid()
            {
                var rem_item=0; req_item=0;
                rem_item=parseInt(document.getElementById("Remaining_item").value);
                req_item=parseInt(document.getElementById("Required_item").value);
                if(req_item>rem_item)
                {
                    alert("Sorry.... Required No of Items are not available");
                    var new_val=prompt("Please Again Enter Valid No of Required Items");
                    document.getElementById("Required_item").value=new_val;
                }
            }
            function total_value_cost()
            {
                var a=parseInt(document.getElementById("single_unit").value);
                var b=parseInt(document.getElementById("Required_item").value);
                var c;
                c=a*b;
                document.getElementById("total").value=c;
            }

        </script>
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
               $("#transferform").bind("submit",function(){

                       var dept=$("#dept").val();
                       if(dept=="Choose_dept")
                       {
                           alert("Wrong Department.... Choose Proper Department ....");
                           $("#dept").focus();
                           return false;
                       }
                       else
                       {
                           return true;
                       }
                   });
                   $("#transferform").bind("submit",function(){
                        var a=parseInt(document.getElementById("single_unit").value);
                        var b=parseInt(document.getElementById("Required_item").value);
                        var c;
                        c=a*b;
                        document.getElementById("total").value=c;
                        alert("Total is:"+c);
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
                   $("#transferform").bind("submit",function(){
                        var rem_item=0; req_item=0;
                        rem_item=parseInt(document.getElementById("Remaining_item").value);
                        req_item=parseInt(document.getElementById("Required_item").value);
                        if(req_item>rem_item)
                        {
                            alert("Sorry.... Required No of Items are not available");
                            var new_val=prompt("Please Again Enter Valid No of Required Items");
                            document.getElementById("Required_item").value=new_val;
                        } 
                   });
               }); 

        </script>
    </body>
    <% s.close();} catch(Exception e){e.printStackTrace();}%>
</html>
<%} else{ response.sendRedirect("index.jsp");}%>