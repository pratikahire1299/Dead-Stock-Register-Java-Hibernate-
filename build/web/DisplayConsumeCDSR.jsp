<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Consume CDSR Filter</title>
          <%@include file="Sidebar/fileinclude.html"%>
    </head>
    <body class='rounded'>
         <%@include file="Sidebar/sidebar.html"%>
              
                <div class="container-fluid">
                     <center>
                         <div class="card shadow-lg mb-4 p-4" style='width:70%;margin-left:20%;margin-top:4%'>
                             <div class='card-header'><h2>Consumable CDSR</h2></div>
                             <div class='card-body'>
                                  <form action="ConsumeCDSRFIlter.jsp" method="post">
                                  <div class="form-inline" style='margin-left:20%;'>
                                      <label for="CDSR No" class='font-weight-bold mr-sm-2 mb-2'>Consumable CDSR NO:</label>
                                      <input type="number" name="Consume_CDSR_NO" class="form-control mb-2 mr-sm-2" style="width:50%" required/>
                                      <button type='submit' class='btn btn-success mb-2 pull-right' name='button'><i class="fa fa-spinner mb-2"></i>&nbsp;&nbsp;Submit</button>
                                  </div>
                                  </form>
                                  </div>             
                         </div>
                               </div>
    </body>
</html>
<%} else{ response.sendRedirect("index.jsp");}%>