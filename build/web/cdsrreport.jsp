<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DSR.DAO.AjaxTableShow"%>
<%@page import="java.util.ListIterator"%>
<%@page import="DSR.POJO.CDSR"%>
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
        String cdsr_name=request.getParameter("cdsrname");
        int cdsr_no=Integer.parseInt(request.getParameter("cdsrno"));
        int page_no=Integer.parseInt(request.getParameter("pg_no"));
            CDSR cdsr=new CDSR();
            ListIterator lit=AjaxTableShow.printCDSRdata(cdsr_name,cdsr_no,page_no);
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
                                    <span class="float-left"><strong>CDSR Name:</strong><%= cdsr_name%></span><span class="float-right"><strong>CDSR No:</strong><%= cdsr_no%></span>
				</div>
			</div>
		</div>	
        <hr style="border-width:2px; border-style:dashed;">
        <div class="container-fluid">
            <div class="row">
                <table class="table table-bordered table-sm">
                    <thead>
                    <tr>
                        <th class="text-center align-middle">1 Sr.No.</th>
                        <th class="text-center align-middle">2 Pg.No</th>
                        <th class="text-center align-middle">3 Description of Article</th>
                        <th class="text-center align-middle">4 Purchase Autority & Purchase Date</th>
                        <th class="text-center align-middle">5 No.of Quantity</th>
                        <th class="text-center align-middle">6 Total Cost</th>
                        <th class="text-center align-middle">7 No.of Quantity and Disposal Nature 8 Authority or Voucher 9 Amt Realized & Dt. of Cr. at Treasury 10 Amt Written</th>
                        <th class="text-center align-middle">11 Remaining Item</th>
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
                            <td class="text-center"><%= cdsr.getCDSR_Sr_No()%></td>
                            <td class="text-center"><%= cdsr.getCDSR_page_no()%></td>
                            <td class="text-center"><%= cdsr.getProduct_description()%></td>
                            <td class="text-center"><% out.println(cdsr.getPurchase_authority()+"  "+date_purchase);%></td>
                            <td class="text-center"><%= cdsr.getProduct_quantity()%></td>
                            <td class="text-center"><%= cdsr.getTotal_cost()%></td>
                            <td class="text-center"></td>
                            <td class="text-center"><%= cdsr.getRemaining_Quantity()%></td>
                        </tr>
                        <%}%>
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