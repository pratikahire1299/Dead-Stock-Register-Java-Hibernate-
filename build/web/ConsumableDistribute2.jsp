<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="DSR.POJO.Consume_CDSR"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="DSR.Helper.NewHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transfer Consumable</title>
        <%@include file="Sidebar/fileinclude.html"%>
        <link rel='stylesheet' href='Sidebar/CSS/component-chosen.css'/>
    </head>
    <body>
        <%
            try{
            long item_id=Integer.parseInt(request.getParameter("item_id"));
            Session se=NewHibernateUtil.getSessionFactory().openSession();
            Transaction trans=se.beginTransaction();
            Object obj=se.get(Consume_CDSR.class,item_id);
            Consume_CDSR cdsr1=new Consume_CDSR();
            cdsr1=(Consume_CDSR)obj;
            float final_pro_qty=cdsr1.getFinal_product_quantity();
            String pro_unit=cdsr1.getProduct_unit();
            float total_quantity;
                            if(pro_unit.equals("Meter"))
                            {
                                total_quantity=(final_pro_qty/100);
                            }
                            else if(pro_unit.equals("Liter"))
                            {
                                total_quantity=(final_pro_qty/1000);
                            }
                            else if(pro_unit.equals("Kilogram"))
                            {
                                total_quantity=final_pro_qty/1000;
                            }
                            else if(pro_unit.equals("Feet"))
                            {
                                total_quantity=final_pro_qty/30;
                            }
                            else
                            {
                                total_quantity=final_pro_qty;
                            }
        %>
        <%@include file="Sidebar/sidebar.html"%>
        <main class="page-content">
            <div class="container-fluid">
                <h1>Trasfer Consumable Inventory</h1><br/>
                <div class="card shadow-lg p-4 mb-4" style="padding:18px;">
                    <div class="card-body">
                        <form action="Controller/Consume_transfer.jsp" id="consume_form_transfer" method="post">
                            <div class="row">
                            <input type="hidden" name="final_product_quantity" id="final_product_quantity" value="<%= cdsr1.getFinal_product_quantity()%>" />
                            <input type="hidden" name="final_product_quantity1" id="final_product_quantity1" />
                            <!--<input type="hidden" name="new_remainprod_qty" id="new_remainprod_qty"/>-->
                            <input type="hidden" name="cdsr_id" value="<%= cdsr1.getConsume_CDSR_Id()%>"/>
                            <input type="hidden" name="cdsr_pg_no" value="<%= cdsr1.getConsume_CDSR_page_no()%>"/>
                            <input type="hidden" name="cdsr_sr_no" value="<%= cdsr1.getConsume_CDSR_sr_no()%>"/>
                            <input type="hidden" name="cdsr_no" value="<%= cdsr1.getConsume_CDSR_no()%>"/>
                            <input type="hidden" name="supplier" value="<%= cdsr1.getConsume_supplier_name()%>"/>
                            <input type="hidden" name="cost_per_unit" value="<%=cdsr1. getConsume_cost_per_unit()%>" id="Single_Cost"/>
                            <input type="hidden" name="consumecdsr_id" value="<%= cdsr1.getConsume_CDSR_Id()%>"/>    
                                <div class="form-group col-lg-6">
                                    <label for="product_name" class='font-weight-bold'>Product Name:</label>
                                    <input type="text" name="product_name" id="product_name" value="<%= cdsr1.getConsume_product_name()%>" class="form-control" readonly required/>
                                </div>
                                <input type="hidden" name="remain_item" value="<%= cdsr1.getFinal_product_quantity()%>" id="remain_item"/>
                                <div class="form-group col-lg-3">
                                    <label for="remain_item" class='font-weight-bold'>Remaining Item:</label>
                                    <input type="text" name="remain1_item" id="remain1_item" value="<% out.print(total_quantity+" "+cdsr1.getProduct_unit()); %>" class="form-control" readonly required/>
                                </div>
                                   <div class="form-group col-lg-3">
                                    <label for="quantity_issued" class='font-weight-bold'>Quantity Issued:</label>
                                    <input type="number" name="Quantity_issued" class="form-control" id="qunatity_issued" maxlength="8" placeholder="Quantity Issued" required/>
                                </div>
                                
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-6">
                                    <label for="department" class='font-weight-bold'>Department:</label>
                                    <select class="form-control form-control-chosen" name="department" id="dept" data-placeholder="Choose Department" required>
                                        <!--<option value="Choose_Department" selected hidden>Choose Department</option>-->
                                        <option value="" selected hidden>Choose Department</option>
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
                            </div>
                            <div class="row">
                             <div class="form-group col-lg-3">
                                    <label for="indent_no" class='font-weight-bold'>Indent No:</label>
                                    <input type="number" name="indent_no" class="form-control" id="indent_no" maxlength="6" placeholder="Indent No." required/>
                                </div>
                                <div class="form-group col-lg-3">
                                <label for="purchase_unit" class='font-weight-bold'>C_Product Purchase Unit:</label>
                                <select name="C_Purchase_Unit" class="form-control " id="c_purchase_unit"  required/>
                                    <!--<option value="Choose_Pro_unit" selected>Choose Product Unit</option>-->
                                    <option value="" selected>Choose Product Unit</option>
                                    <option>Liter</option>
                                    <option>MiliLiter</option>
                                    <option>Gram</option>
                                    <option>Kilogram</option>
                                    <option>Centimeter</option>
                                    <option>Meter</option>
                                    <option>Feet</option>
                                    <option>Packets</option>
                                    <option>Bottles</option>
                                    <option>NOS</option>
                                </select>
                                </div>
                                <div class="form-group col-lg-3">
                                    <label for="date_of_issue" class='font-weight-bold'>Date of Issued:</label>
                                    <input type="date" name="date_of_issue" class="form-control" id="date_of_issue" placeholder="Date of Issue" required/>
                                </div>
                                <div class="form-group col-lg-3">
                                    <label for="purchase_year" class='font-weight-bold'>Purchase Year:</label>
                                    <input type="text" name="purchase_year" class="form-control" maxlength="9" id="purchase_year" placeholder="Purchase Year" required/>
                                </div>
                            </div>
                                <input type="hidden" name="ddsr_total" id="total"/>
                                <div class="row justify-content-center"><br/>
                                    <h4 class="text-danger text-center">Check All Entered Data Carefully befored Clicking Submit Button.... Because Entered Data is Permenant and never be changed ....</h2>
                                <input type="submit" class="btn btn-warning mb-2 btn-lg" style="width:60%;" value="Submit"/>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
                                
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
                        
                   $("#consume_form_transfer").bind("submit",function(){
                       alert("Hello");
                       var a=parseInt(document.getElementById("Single_Cost").value);
                                           var b=parseInt(document.getElementById("qunatity_issued").value);
                                           var c=1;
                                           var purchase_unit=document.getElementById("c_purchase_unit").value;
                                           if(purchase_unit=="MiliLiter")
                                            {
                                                c=a/1000;
                                                 c=c*b;
                                                 c1=c.toFixed(2);
                                                document.getElementById("total").value=c1;
                                            }
                                            else if(purchase_unit=="Gram")
                                            {
                                                c=a/1000;
                                                 c=c*b;
                                              c1=c.toFixed(2);
                                                document.getElementById("total").value=c1;
                                            }
                                            else if(purchase_unit=="Centimeter")
                                            {
                                                c=a/100;
                                                 c=c*b;
                                               c1=c.toFixed(2);
                                                document.getElementById("total").value=c1;
                                            }
                                             else if(purchase_unit=="Feet")
                                            {
                                                c=a/100;
                                                var c2=b*30;
                                                 c=c*c2;
                                               c1=c.toFixed(2);
                                                document.getElementById("total").value=c1;
                                            }
                                          
                                           else
                                           {
                                           c=a*b;
                                           c1=c.toFixed(2);
                                                document.getElementById("total").value=c1;
                                           }                                   
                   });
                   $("#consume_form_transfer").bind("submit",function(){
                       var purchase_quantity=parseInt(document.getElementById("qunatity_issued").value);
                                            var purchase_unit=document.getElementById("c_purchase_unit").value;
                                            var remain=document.getElementById("final_product_quantity").value;                                            
                                        
                                            var total_quantity=1;
                        
                                            if(purchase_unit=="Liter")
                                            {
                                                total_quantity=purchase_quantity*1000;
                                            }
                                            else if(purchase_unit=="Kilogram")
                                            {
                                                total_quantity=purchase_quantity*1000;
                                            }
                                            else if(purchase_unit=="Meter")
                                            {
                                                total_quantity=purchase_quantity*100;
                                            }
                                            else if(purchase_unit=="Feet")
                                            {
                                                total_quantity=purchase_quantity*30;
                                            }
                                            else
                                            {
                                                total_quantity=1*purchase_quantity;
                                            }     
                                                
                                                document.getElementById("final_product_quantity1").value=total_quantity; 
                                                document.getElementById("final_product_quantity").value=(remain-total_quantity);
                                           
                   });
               });
                </script>
                                <%
                                    se.close();
                                    } catch(Exception e){ e.printStackTrace(); }
                                %>
    </body>
</html>
<%} else{response.sendRedirect("index.jsp");}%>