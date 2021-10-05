<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="DSR.POJO.DDSR"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="DSR.Helper.NewHibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WriteOff Page</title>
        <%@include file="Sidebar/fileinclude.html"%>
        <link rel="stylesheet" href="Sidebar/CSS/component-chosen.css"/>
    </head>
    <body>
        <%        
            long tid=Long.parseLong(request.getParameter("tid"));
            Session s=NewHibernateUtil.getSessionFactory().openSession();
            Transaction trans=s.beginTransaction();
            DDSR ddsr=new DDSR();
            Object obj=s.get(DDSR.class,tid);
            ddsr=(DDSR)obj;
            
        %>
        <%@include file="Sidebar/sidebar.html"%>
        <main class="page-content">
        <div class="container-fluid">
            <h1>Write off details:</h1><hr style="border-width:2px; border-color:black;"/>
            <br/>
        <div class="card shadow-lg p-4 mb-4">
        <div class="card-body">
            <form action="Controller/writeoff2controller.jsp" method="post" id="Writeoff_Form" name="form">
        <div class="row">
            <input type="hidden" name="ddsr_no" value="<%= ddsr.getDdsr_no()%>"/>
            <input type="hidden" name="ddsr_pg_no" value="<%= ddsr.getDdsr_pg_no()%>"/>
            <input type="hidden" name="ddsr_sr_no" value="<%= ddsr.getDdsr_sr_no()%>"/>
            <input type="hidden" name="dsr_name" value="<%= ddsr.getCDSR_name()%>"/>
            <input type="hidden" name="department2" value="<%= ddsr.getDepartment()%>" id="department2"/>
            <input type="hidden" name="cdsr_table_id" value="<%= ddsr.getCdsr_table_id()%>"/>
            <input type="hidden" name="ddsr_table_id" value="<%= ddsr.getDdsr_id()%>"/>
            <div class="form-group col-lg-2">
                <label for="CDSR NO:" class="font-weight-bold">CDSR No:</label>
                <input type="text" name="cdsr_no" class="form-control" id="cdsr_no" value="<%= ddsr.getCdsr_no()%>" readonly required/>
            </div>
            <div class="form-group col-lg-2">
                <label for="CDSR PAGE NO:" class="font-weight-bold">CDSR Page No:</label>
                <input type="number" name="cdsr_page_no" class="form-control" id="cdsr_page_no" readonly value="<%= ddsr.getCdsr_pg_no()%>" required/>
            </div>
            <div class="form-group col-lg-2">
                <label for="CDSR SR NO:" class="font-weight-bold">CDSR Sr No:</label>
                <input type="number" name="cdsr_sr_no" class="form-control" id="cdsr_sr_no" readonly value="<%= ddsr.getCdsr_sr_no()%>" required/>
            </div>
            <div class="form-group col-lg-2">
                  <label for="Product Quantity" class="font-weight-bold">Product Quantity:</label>
                <input type="number" name="Product_quantity" class="form-control" id="Product_quantity" readonly value="<%= ddsr.getProduct_quantity()%>" required/>
            </div>
            <div class="form-group col-lg-4">
                <label for="Name of Product" class="font-weight-bold">Product Name:</label>
                <input type="text" name="name_of_product" class="form-control" id="name_of_product" readonly value="<%= ddsr.getProduct_description()%>" required/>
            </div>
        </div>
        <div class="row">        
            <div class="form-group col-lg-2">
                <label for="Product Quantity" class="font-weight-bold">Pro. Qty. Wo:</label>
                <input type="number" name="Product_quantity_wo" class="form-control" id="Product_quantity_wo" required/>
            </div>
            <div class="form-group col-lg-2">
                <label for="Order No" class="font-weight-bold">Order No:</label>
                <input type="number" name="order_no" class="form-control" maxlength="8" id="order_no" placeholder="Enter Order No" onclick="Max_item_valid();" onfocus="Max_item_valid();" required/>
            </div>
            <div class="form-group col-lg-3">               
                    <label for="Product Category" class="font-weight-bold">Product Category:</label>
                         <select class="form-control form-control-chosenn" name="product_category" id="product_category" data-placeholder="Select Product Category" required>
                                <option value="Select_Pro_Cat" selected hidden>Select category</option>
                                <option>M & E</option>
                                <option>Furniture</option>
                                <option>COMPUTER & PERIPHERALS</option>
                                <option>EQUIPMENT</option>
                                <option>Software</option>
                                <option>Others</option>
                            </select>                  
            </div>
            <div class="form-group col-lg-3">
                <label for="Write off Year" class="font-weight-bold">Write Off Year:</label>
                <input type="text" class="form-control" name="write_off_year" maxlength="9" id="write_off_year" placeholder="Enter Write Off Year" required/>
            </div>
            <div class="form-group col-lg-2">
                <label for="SR NO" class="font-weight-bold">Sr No:</label>
                <input type="number" class="form-control" name="sr_no" id="sr_no" maxlength="6" placeholder="Enter Sr No" required/>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-2">
                <label for="writeOff_year" class="font-weight-bold">WriteOff Date:</label>
                <input type="date" name="write_off_date" class="form-control" required/>
            </div>
            <div class="form-group col-lg-10">
                <label for=" Write off Order No" class="font-weight-bold text-success">WriteOff Order No:</label>
                <input type="text" class="form-control" name="final_product_no" id="final_order_no" onclick="finalorderno();" onfocus="finalorderno();" placeholder="Given WriteOff No is...." required/>
            </div>
        </div>
            
        <div class="row">
                <div class="form-group col-lg-4">
                    <label for="Receiptt_No" class="font-weight-bold">Receipt No:</label>
                    <input type="number" class="form-control" name="receiptt_no" id="receiptt_no" placeholder="Enter Receipt No" maxlength="8" required/>
                </div>
            
                <div class="form-group col-lg-4">
                <label for="Year" class="font-weight-bold">Year:</label>
                <input type="text" class="form-control" name="WriteOff_year" maxlength="9" id="year" placeholder="Enter Year" required/>
                </div>
                 <div class="form-group col-lg-4">
                <label for="Orderr No" class="font-weight-bold">Order No(Receipt):</label>
                <input type="number" class="form-control" name="orderr_no" id="orderr_no" maxlength="6" placeholder="Enter Order No(Receipt)" required/>
                </div>
        </div>
           
        <div class="row">
                <div class="form-group col-lg-3">
                    <label for="Date" class="font-weight-bold">Date(Receipt):</label>
                    <input type="date" class="form-control" name="date" id="date" required/>
                </div>
                <div class="form-group col-lg-9">
                <label for="Receipt No" class="font-weight-bold text-success">WriteOff Receipt No:</label>
                <input type="text" class="form-control" name="receipt_no" id="receipt_no" onclick="finalreceiptno();" onfocus="finalreceiptno();" placeholder="Given Receipt No is...." required/>
                </div>
        </div>    
                    <br/>
                    
                    <button class="btn btn-danger offset-2 btn-lg" type="submit" style="width:60%; font-size:22px;"><i class="fa fa-spinner mb-2"></i>&nbsp;&nbsp;Writeoff</button>
              </form>
        </div>
          </div>
       </div>
       </div>
      </main>
             <script type="text/javascript">
                  function finalreceiptno()
                  {
                   var a=document.getElementById("receiptt_no").value;
                   var b=document.getElementById("department2").value;
                   var c=document.getElementById("year").value;
                   var d=document.getElementById("order_no").value;
                   var e=document.getElementById("date").value;
                   e=new Date(e);
                   e1=e.getDate();
                   e2=e.getMonth()+1;
                   e3=e.getFullYear();
                   e4=e1+"/"+e2+"/"+e3;
                   var total= "GPNSK/STORE/"+b+"/"+c+"/"+d+"/"+e4;
                   document.getElementById("receipt_no").value=(total);
                   }
                     function finalorderno()
                  {
                   var a=document.getElementById("order_no").value;
                   var b=document.getElementById("product_category").value;
                   var c=document.getElementById("write_off_year").value;
                   var d=document.getElementById("sr_no").value;
                   var total= "GPNSK/CS/Writeoff/"+c+"/"+a+"/"+d;
                   document.getElementById("final_order_no").value=(total);
                   }
                   function Max_item_valid()
                {
                var rem_item=0, req_item=0;
                rem_item=parseInt(document.getElementById("Product_quantity").value);
                req_item=parseInt(document.getElementById("Product_quantity_wo").value);
                if(req_item>rem_item)
                {
                    alert("Sorry.... Required No of Items are not available");
                    var new_val=prompt("Please Again Enter Valid No of Required Items");
                    document.getElementById("Product_quantity_wo").value=new_val;
                }
            }
             </script>
             <script src="Sidebar/JS/chosen.jquery.min.js"></script>
             <script>
                                     $(document).ready(function(){
                                              $('.form-control-chosen').chosen({
                                            allow_single_deselect: true,
                                     width: '100%' 
                                 });
                                 $('.font-control-chosenn').chosen({
                                            allow_single_deselect: true,
                                     width: '100%' 
                                 });
                    });
             </script>
             <script>
            $(document).ready(function(){
               $("#Writeoff_Form").bind("submit",function(){

                       var dept=$("#product_category").val();
                       if(dept=="Select_Pro_Cat")
                       {
                           alert("Wrong Product Category.... Choose Proper Product Category ....");
                           $("#product_category").focus();
                           return false;
                       }
                       else
                       {
                           return true;
                       }
                   });
                   
                   $("#Writeoff_Form").bind("submit",function(){
                   var a=document.getElementById("order_no").value;
                   var b=document.getElementById("product_category").value;
                   var c=document.getElementById("write_off_year").value;
                   var d=document.getElementById("sr_no").value;
                   var total= "GPNSK/CS/Writeoff/"+c+"/"+a+"/"+d;
                   document.getElementById("final_order_no").value=(total);
                   });
                   $("#Writeoff_Form").bind("submit",function(){
                     var a=document.getElementById("receiptt_no").value;
                   var b=document.getElementById("department2").value;
                   var c=document.getElementById("year").value;
                   var d=document.getElementById("order_no").value;
                   var e=document.getElementById("date").value;
                   e=new Date(e);
                   e1=e.getDate();
                   e2=e.getMonth()+1;
                   e3=e.getFullYear();
                   e4=e1+"/"+e2+"/"+e3;
                   var total= "GPNSK/STORE/"+b+"/"+c+"/"+d+"/"+e4;
                   document.getElementById("receipt_no").value=(total);
                   });
                   $("#Writeoff_Form").bind("submit",function(){
                       var rem_item=0, req_item=0;
                var rem_item=parseInt(document.getElementById("Product_quantity").value);
                var req_item=parseInt(document.getElementById("Product_quantity_wo").value);
                if(req_item>rem_item)
                {
                    alert("Sorry.... Required No of Items are not available");
                    var new_val=prompt("Please Again Enter Valid No of Required Items");
                    document.getElementById("Product_quantity_wo").value=new_val;
                }
                   });
               }); 

        </script>
    </body>
</html>
<%} else{ response.sendRedirect("index.jsp");}%>
