<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DSR.POJO.CDSR"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="DSR.Helper.NewHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Remaining Item</title>
        <%@include file="Sidebar/fileinclude.html"%>
        <link rel='stylesheet' href='Sidebar/CSS/dataTables.bootstrap4.min.css'>
        <style>
            th,td{
                vertical-align:middle;
            }
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
            
            try{
            Session se=NewHibernateUtil.getSessionFactory().openSession();
            Transaction trans=se.beginTransaction();
            Query q=se.createQuery("from CDSR where Remaining_Quantity>0");
            CDSR dd=new CDSR();
            List li=q.list();
            ListIterator lit=li.listIterator();
                 
        %>
        <%@include file="Sidebar/sidebar.html"%>
        <main class="page-content">
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
            <div class="container-fluid">
                <h2>All Remaining Item</h2>
                <hr/>
                <br/>
                <table id="example" class="table table-bordered table-hover table-responsive-lg">
                    <thead class=' thead-light'>
                        <tr>
                            <th class="text-center" style="vertical-align:middle;">Supplier</th>
                            <th class="text-center" style="vertical-align:middle;">Product Description</th>
                            <th class="text-center" style="vertical-align:middle;">Product Category</th>
                            <th class="text-center" style="vertical-align:middle;">Date of Buy</th>
                            <th class="text-center" style="vertical-align:middle;">Remaining Item</th>
                            <th class="text-center" style="vertical-align:middle;">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            while(lit.hasNext())
                            {
                                dd=(CDSR) lit.next();
                                SimpleDateFormat date1=new SimpleDateFormat("yyyy-MM-dd");
                            SimpleDateFormat date2=new SimpleDateFormat("dd/MM/yyyy");
                            String date_purchase=date2.format(date1.parse(dd.getDate_of_purchase()));
                        %>
                        <tr>
                            <td class="text-center" style="vertical-align:middle;"><%= dd.getSupplier()%></td>
                            <td class="text-center" style="vertical-align:middle;"><a href="cdsrproductinfo.jsp?procdsr_id=<%= dd.getCdsr_id()%>"><%= dd.getProduct_description()%></a></td>
                            <td class="text-center" style="vertical-align:middle;"><%= dd.getProduct_category()%></td>
                            <td class="text-center" style="vertical-align:middle;"><%= date_purchase %></td>
                            <td class="text-center" style="vertical-align:middle;"><%= dd.getRemaining_Quantity()%></td>
                            <td class="text-center" style="vertical-align:middle;"><a href="transfer.jsp?tpid=<%= dd.getCdsr_id()%>" class="btn btn-info">Transfer</a></td>
                        </tr>
                        <%  }se.close();}catch(Exception e){ e.printStackTrace(); }%>
                    </tbody>  
                </table>
            </div>         
        </main>       
    </body>
    <script src='Sidebar/JS/jquery.dataTables.min.js'></script>
    <script src='https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js'></script>
    <script>
        $(document).ready(function() {
    $('#example').DataTable();
} );
    </script>
</html>
<%} else{ response.sendRedirect("index.jsp"); }%>