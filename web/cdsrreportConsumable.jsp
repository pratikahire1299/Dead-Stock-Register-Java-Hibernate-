<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DSR.DAO.AjaxTableShow"%>
<%@page import="DSR.POJO.Consume_CDSR"%>
<%@page import="java.util.ListIterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!Doctype html>
<html>
<head>
    <%@include file="Sidebar/fileinclude.html"%>
    <style>
            @page {
                size: A3 landscape;
            }
            thead
            {
            display: table-header-group;
            }
    </style>
</head>
<body>
    <%
        try{
        int cdsr_no=Integer.parseInt(request.getParameter("cdsrno"));
        int page_no=Integer.parseInt(request.getParameter("pg_no"));
        Consume_CDSR cdsr=new Consume_CDSR();
            ListIterator lit=AjaxTableShow.printConsumeCDSRdata(cdsr_no,page_no);
    %>
	<section style="font-family:arial;">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-2">
                                    <img src="Images/LOGO.png" class="mx-auto d-block" height="110" width="110"></img>
				</div>
				<div class="col-lg-10">
                                    <h2 class="text-center"><strong>Government Polytechnic, Nashik</strong></h2>
                                    <h4 class="text-center"><u>Form of Register of Dead Stock or Moveable Property</u></h4>
                                    <h5 class="text-center"><strong>CC/R No:</strong><%= cdsr_no%></h5>
				</div>
			</div>
		</div>	
        <hr style="border-width:2px; border-style:dashed;">
        <div class="container-fluid">
            <div class="row">
                <table class="table table-bordered table-sm">
                    <thead>
                    <tr>
                        <th class="text-center align-middle">1 CC/R Sr No:</th>
                        <th class="text-center align-middle">2 CC/R Page No:</th>
                        <th class="text-center align-middle">3 Name of the Item</th>
                        <th class="text-center align-middle">4 Order No & Purchase Date</th>
                        <th class="text-center align-middle">5 Qty. Purchased or Received</th>
                        <th class="text-center align-middle">6 Rate(per item)</th>
                        <th class="text-center align-middle">7 Total Cost</th>
                        <th class="text-center align-middle">8 Remaining Item</th>
                    </tr>
                    </thead>
                    <tbody>
                        <% while(lit.hasNext()){
                            cdsr=(Consume_CDSR)lit.next();
                            /*String unit=cdsr.getProduct_unit();
                            long purchase_quantity=;
                            long remain=cdsr.getConsume_remaining_quantity();
                            long total_quantity;
                            long remain_quantity;
                            if(unit.equals("Meter"))
                            {
                                total_quantity=purchase_quantity/100;
                                remain_quantity=remain/100;
                            }
                            else if(unit.equals("Liter"))
                            {
                                total_quantity=purchase_quantity/1000;
                                remain_quantity=remain/1000;
                            }
                            else if(unit.equals("Kilogram"))
                            {
                                total_quantity=purchase_quantity/1000;
                                remain_quantity=remain/1000;
                            }
                            else if(unit.equals("Feet"))
                            {
                                total_quantity=purchase_quantity/30;
                                remain_quantity=remain/30;
                            }
                            else
                            {
                                total_quantity=purchase_quantity;
                                remain_quantity=remain;
                            }*/
                            SimpleDateFormat date1=new SimpleDateFormat("yyyy-MM-dd");
                            SimpleDateFormat date2=new SimpleDateFormat("dd/MM/yyyy");
                            String date_purchase=date2.format(date1.parse(cdsr.getConsume_date_of_purchase()));
                            float final_pro_qty1=cdsr.getFinal_product_quantity();
                                String pro_unit1=cdsr.getProduct_unit();
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
                            <td class="text-center"><%= cdsr.getConsume_CDSR_sr_no()%></td>
                            <td class="text-center"><%= cdsr.getConsume_CDSR_page_no()%></td>
                            <td class="text-center"><%= cdsr.getConsume_product_name()%></td>
                            <td class="text-center"><% out.println(cdsr.getProduct_grant()+"  "+cdsr.getConsume_purchase_year()+"  "+cdsr.getConsume_order_no()+"  "+date_purchase);%></td>
                            <td class="text-center"><% out.println(cdsr.getConsume_purchase_quantity()+" "+cdsr.getProduct_unit());%></td>
                            <td class="text-center"><%= cdsr.getConsume_cost_per_unit() %></td>
                            <td class="text-center"><%= cdsr.getConsume_total() %>
                            <td class="text-center"><% out.print(total_quantity1+" "+cdsr.getProduct_unit()); %></td>
                        </tr>
                        <%} } catch(Exception e){ e.printStackTrace();}%>
                    </tbody>
                </table>
            </div>
        </div>
	</section>
    <footer>
        <button id="printbutton" onclick="PrintData();">Print</button>
        <script>
            function PrintData() {
                var ButtonControl = document.getElementById("printbutton");
                ButtonControl.style.visibility = "hidden";
                window.print();
            }
        </script>
    </footer>
</body>
</html>
<%} else{ response.sendRedirect("index.jsp");}%>