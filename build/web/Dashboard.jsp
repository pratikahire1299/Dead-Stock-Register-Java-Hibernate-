<%if((String)session.getAttribute("login")!=null){
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="DSR.POJO.DDSR"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="DSR.POJO.CDSR"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="DSR.Helper.NewHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Dashboard</title>
        <%@include file="Sidebar/fileinclude.html"%>
        <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="Sidebar/CSS/Dash_board.css"/>
    </head>
    <body class="bg-light">


        <%@include file="Sidebar/sidebar.html"%>
        <main class="page-content">
           
            <div class="container-fluid">
                <div class="row">
                    <h1><i class="fa fa-tachometer-alt"></i>&nbsp;&nbsp;Dashboard</h1>
                </div>
                <strong><font color="green" size="20">DEAD &nbsp;  STOCK  &nbsp;  REGISTER</font></strong>
            </div>  
       
        
        <div class="container-fluid">
	<div class="row">
		<div class="col-md-4">
			<div class="dash-box dash-box-color-1 shadow-lg">
				<div class="dash-box-icon">
					<i class="fa fa-book"></i>
				</div>
				<div class="dash-box-body">
					<span class="dash-box-count">CDSR</span>
					<span class="dash-box-count">11</span>
                                </div>
				<div class="dash-box-action">
                                    <button type="button"  data-toggle="modal" data-target="#myCDSRModel">More Info</button>
				</div>
                                
                        </div>
                </div>
                        
			
                <div class="col-md-4">
			<div class="dash-box dash-box-color-2 shadow-lg">
				<div class="dash-box-icon">
					<i class="fa fa-globe"></i>
				</div>
				<div class="dash-box-body">
					<span class="dash-box-count">DeadStock / SemiConsumable</span>
					<span class="dash-box-count">21</span>
				</div>
				
				<div class="dash-box-action">
                                    <button type="button" data-toggle="modal" data-target="#mydepartmentModel">More Info</button>
				</div>				
			</div>
		</div>
		<div class="col-md-4">
			<div class="dash-box dash-box-color-3 shadow-lg">
				<div class="dash-box-icon">
					<i class="fa fa-shopping-cart"></i>
				</div>
				<div class="dash-box-body">
					<span class="dash-box-count">CONSUMEBLE</span>
					<span class="dash-box-count">21</span>
				</div>
				
				<div class="dash-box-action">
                                    <button type="button" data-toggle="modal" data-target="#myConsumableModel">More Info</button>
				</div>				
			</div>
		</div>
	</div>
            <div class="card shadow-lg p-4 mb-4">
                <div class="card-body">
                <center><button type="button" data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-primary btn-lg"><i class="fa fa-key"></i>&nbsp;&nbsp;Change Password</button></center>
                </div>
            </div>
                        <div class="modal fade" id="myCDSRModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                           <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                   <div class="modal-header">
                                        <h4 class="modal-title" id="myModalLabel"><strong>CDSR</strong></h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                <div class="modal-body">
                       <table class="table table-hover table-striped">
                        <thead>
                        <tr> 
                            <th class="text-center" style="vertical-align:middle;"><strong>SR.NO</strong></th>
                            <th class="text-center" style="vertical-align:middle;"><strong>CDSR</strong></th>
                            <th class="text-center" style="vertical-align:middle;"><strong>ACTION</strong></th>
                        </tr>
                        </thead>
                    <tbody>
                          <tr> 
                            <td class="text-center" style="vertical-align:middle;">01</td>
                            <td class="text-center" style="vertical-align:middle;">All CDSR Info</td> 
                            <td class="text-center" style="vertical-align:middle;"><a href="All_cdsr_list.jsp?CDSR_Name=All CDSR" class="btn btn-info">VIEW</a></td>
                        </tr>
            
                        <tr>
                            <td class="text-center" style="vertical-align:middle;">02</td>
                            <td class="text-center" style="vertical-align:middle;">C/S DSR/M&E</td>   
                            <td class="text-center" style="vertical-align:middle;"><a href="All_cdsr_list.jsp?id=1" class="btn btn-info">VIEW</a></td>
                        </tr> 
                        <tr>
                            <td class="text-center" style="vertical-align:middle;">03</td>
                            <td class="text-center" style="vertical-align:middle;">C/S DSR/CC</td>
                            <td class="text-center" style="vertical-align:middle;"><a href="All_cdsr_list.jsp?CDSR_Name=C/S DSR/CC" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr>
                            <td class="text-center" style="vertical-align:middle;">04</td>
                            <td class="text-center" style="vertical-align:middle;">C/S DSR/FURNITURE</td> 
                            <td class="text-center" style="vertical-align:middle;"><a href="All_cdsr_list.jsp?C/S DSR/FURNITURE" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr>
                            <td class="text-center" style="vertical-align:middle;">05</td>
                            <td class="text-center" style="vertical-align:middle;">C/S DSR/SEMI CR</td>
                            <td class="text-center" style="vertical-align:middle;"><a href="All_cdsr_list.jsp?CDSR_Name=C/S DSR/SEMI CR" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr>  
                            <td class="text-center" style="vertical-align:middle;">06</td>
                            <td class="text-center" style="vertical-align:middle;">C/S CONSUMEBLE REGISTER</td>
                            <td class="text-center" style="vertical-align:middle;"><a href="All_cdsr_list.jsp?CDSR_Name=C/S CONSUMEBLE REGISTER" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr>  
                            <td class="text-center" style="vertical-align:middle;">07</td>
                            <td class="text-center" style="vertical-align:middle;">C/S DSR/CC/FURNITURE</td>  
                            <td class="text-center" style="vertical-align:middle;"><a href="All_cdsr_list.jsp?CDSR_Name=C/S DSR/CC/FURNITURE" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr>  
                            <td class="text-center" style="vertical-align:middle;">08</td>
                            <td class="text-center" style="vertical-align:middle;">C/S DSR/M&E/COMMUNITY POLYTECNIC</td>
                            <td class="text-center" style="vertical-align:middle;"><a href="All_cdsr_list.jsp?id=2" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">09</td>
                            <td class="text-center" style="vertical-align:middle;">C/S DSR/UTILITY ARTICLE</td> 
                            <td class="text-center" style="vertical-align:middle;"><a href="All_cdsr_list.jsp?CDSR_Name=C/S DSR/UTILITY ARTICLE" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr>
                            <td class="text-center" style="vertical-align:middle;">10</td>
                            <td class="text-center" style="vertical-align:middle;">C/S DSR/M&E/WORLD BANK</td> 
                            <td class="text-center" style="vertical-align:middle;"><a href="All_cdsr_list.jsp?id=3" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr>
                            <td class="text-center" style="vertical-align:middle;">11</td>
                            <td class="text-center" style="vertical-align:middle;">C/S DSR/PRU/WB</td> 
                            <td class="text-center" style="vertical-align:middle;"><a href="All_cdsr_list.jsp?CDSR_Name=C/S DSR/PRU/WB" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">12</td>
                            <td class="text-center" style="vertical-align:middle;">C/S DSR/USBBTY/SCR</td> 
                            <td class="text-center" style="vertical-align:middle;"><a href="All_cdsr_list.jsp?CDSR_Name=C/S DSR/USBBTY/SCR" class="btn btn-info">VIEW</a></td>
                        </tr>
                       
             </tbody>
                   
          </table>
      </div>
    </div>
  </div>
</div>
 <!--modal for department -->                     
                      <div class="modal fade" id="mydepartmentModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                           <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                   <div class="modal-header">
                                        <h4 class="modal-title" id="myModalLabel"><strong>DEPARTMENT</strong></h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                <div class="modal-body">
                       <table class="table table-hover table-striped">
                        <thead>
                        <tr> 
                            <th class="text-center" style="vertical-align:middle;">SR.NO</th>
                            <th class="text-center" style="vertical-align:middle;">DEPARTMRNT</th>
                            
                            <th class="text-center" style="vertical-align:middle;">ACTION</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="text-center" style="vertical-align:middle;">01</td>
                            <td class="text-center" style="vertical-align:middle;">All Department</td>
                            
                            <td class="text-center" style="vertical-align:middle;"><a href="filtershow.jsp?department=All Departments&criteria=All Items" class="btn btn-info">VIEW</a></td>
                        </tr> 
                        <tr>
                            <td class="text-center" style="vertical-align:middle;">02</td>
                            <td class="text-center" style="vertical-align:middle;">Computer Technology</td>
                            
                            <td class="text-center" style="vertical-align:middle;"><a href="filtershow.jsp?department=Computer Technology&criteria=All Items" class="btn btn-info">VIEW</a></td>
                        </tr> 
                        <tr>
                            <td class="text-center" style="vertical-align:middle;">03</td>
                            <td class="text-center" style="vertical-align:middle;">Information Technology</td>
                            
                            <td class="text-center" style="vertical-align:middle;"><a href="filtershow.jsp?criteria=All Items&department=Information Technology" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr>
                            <td class="text-center" style="vertical-align:middle;">04</td>
                            <td class="text-center" style="vertical-align:middle;">Civil Engineering</td>
                            
                            <td class="text-center" style="vertical-align:middle;"><a href="filtershow.jsp?criteria=All Items&department=Civil Engineering" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr>
                            <td class="text-center" style="vertical-align:middle;">05</td>
                            <td class="text-center" style="vertical-align:middle;">Mechanical Engineering</td>
                            
                            <td class="text-center" style="vertical-align:middle;"><a href="filtershow.jsp?criteria=All Items&department=Mechanical Engineering" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr>  
                            <td class="text-center" style="vertical-align:middle;">06</td>
                            <td class="text-center" style="vertical-align:middle;">Automobile Engineering</td>
                            
                            <td class="text-center" style="vertical-align:middle;"><a href="filtershow.jsp?criteria=All Items&department=Automobile Engineering" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr>  
                            <td class="text-center" style="vertical-align:middle;">07</td>
                            <td class="text-center" style="vertical-align:middle;">Electronics and Telecommunication Engineering</td>
                            
                            <td class="text-center" style="vertical-align:middle;"><a href="filtershow.jsp?criteria=All Items&department=Electronics and Telecommunication Engineering" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr>  
                            <td class="text-center" style="vertical-align:middle;">08</td>
                            <td class="text-center" style="vertical-align:middle;">Plastic Engineering</td>
                            
                            <td class="text-center" style="vertical-align:middle;"><a href="filtershow.jsp?criteria=All Items&department=Plastic Engineering" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">09</td>
                            <td class="text-center" style="vertical-align:middle;">Dress Desigining and Garments Manufacturing</td> 
                            
                            <td class="text-center" style="vertical-align:middle;"><a href="filtershow.jsp?criteria=All Items&department=Dress Desigining and Garments Manufacturing" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr>
                            <td class="text-center" style="vertical-align:middle;">10</td>
                            <td class="text-center" style="vertical-align:middle;">Interior Desigining and Decoration</td>
                            
                            <td class="text-center" style="vertical-align:middle;"><a href="filtershow.jsp?criteria=All Items&department=Interior Desigining and Decoration" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr>
                            <td class="text-center" style="vertical-align:middle;">11</td>
                            <td class="text-center" style="vertical-align:middle;">Electrical Engineering</td>
                            
                            <td class="text-center" style="vertical-align:middle;"><a href="filtershow.jsp?criteria=All Items&department=Electrical Engineering" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">12</td>
                            <td class="text-center" style="vertical-align:middle;">Science (Physics)</td>
                            
                            <td class="text-center" style="vertical-align:middle;"><a href="filtershow.jsp?criteria=All Items&department=Science (Physics)" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">13</td>
                            <td class="text-center" style="vertical-align:middle;">Science (Chemistry)</td>
                            
                            <td class="text-center" style="vertical-align:middle;"><a href="filtershow.jsp?criteria=All Items&department=Science (Chemistry)" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">14</td>
                            <td class="text-center" style="vertical-align:middle;">Gymkhana</td> 
                            
                            <td class="text-center" style="vertical-align:middle;"><a href="filtershow.jsp?criteria=All Items&department=Gymkhana" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">15</td>
                            <td class="text-center" style="vertical-align:middle;">Applied Mechanics</td> 
                            
                            <td class="text-center" style="vertical-align:middle;"><a href="filtershow.jsp?criteria=All Items&department=Applied Mechanics" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">16</td>
                            <td class="text-center" style="vertical-align:middle;">Workshop</td> 
                            
                            <td class="text-center" style="vertical-align:middle;"><a href="filtershow.jsp?criteria=All Items&department=Workshop" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">17</td>
                            <td class="text-center" style="vertical-align:middle;">Library</td> 
                            
                            <td class="text-center" style="vertical-align:middle;"><a href="filtershow.jsp?criteria=All Items&department=Library" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">18</td>
                            <td class="text-center" style="vertical-align:middle;">Hostel Boys</td> 
                            
                            <td class="text-center" style="vertical-align:middle;"><a href="filtershow.jsp?criteria=All Items&department=Hostel Boys" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">19</td>
                            <td class="text-center" style="vertical-align:middle;">Hostel Girls</td> 
                            
                            <td class="text-center" style="vertical-align:middle;"><a href="filtershow.jsp?criteria=All Items&department=Hostel Girls" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">20</td>
                            <td class="text-center" style="vertical-align:middle;">Office</td> 
                            
                            <td class="text-center" style="vertical-align:middle;"><a href="filtershow.jsp?criteria=All Items&department=Office" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">21</td>
                            <td class="text-center" style="vertical-align:middle;">Exam Section</td>
                            
                            <td class="text-center" style="vertical-align:middle;"><a href="filtershow.jsp?criteria=All Items&department=Exam Section" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">22</td>
                            <td class="text-center" style="vertical-align:middle;">Others</td>
                            
                            <td class="text-center" style="vertical-align:middle;"><a href="filtershow.jsp?criteria=All Items&department=Others" class="btn btn-info">VIEW</a></td>
                        </tr>
             </tbody>
                   
          </table>
      </div>
    </div>
  </div>
</div>     
         <div class="modal fade" id="myConsumableModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                 <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                 <div class="modal-header">
                                        <h4 class="modal-title" id="myModalLabel"><strong>DEPARTMENT</strong></h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                <div class="modal-body">
                       <table class="table table-hover table-striped">
                        <thead>
                        <tr> 
                            <th class="text-center" style="vertical-align:middle;">SR.NO</th>
                            <th class="text-center" style="vertical-align:middle;">DEPARTMRNT</th>
                            <th class="text-center" style="vertical-align:middle;">ACTION</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="text-center" style="vertical-align:middle;">01</td>
                            <td class="text-center" style="vertical-align:middle;">All Department</td>
                            <td class="text-center" style="vertical-align:middle;"><a href="ConsumeDDSR_View.jsp?department=All Departments" class="btn btn-info">VIEW</a></td>
                        </tr> 
                        <tr>
                            <td class="text-center" style="vertical-align:middle;">02</td>
                            <td class="text-center" style="vertical-align:middle;">Computer Technology</td>
                           <td class="text-center" style="vertical-align:middle;"><a href="ConsumeDDSR_View.jsp?department=Computer Technology" class="btn btn-info">VIEW</a></td>
                        </tr> 
                        <tr>
                            <td class="text-center" style="vertical-align:middle;">03</td>
                            <td class="text-center" style="vertical-align:middle;">Information Technology</td>
                            <td class="text-center" style="vertical-align:middle;"><a href="ConsumeDDSR_View.jsp?department=Information Technology" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr>
                            <td class="text-center" style="vertical-align:middle;">04</td>
                            <td class="text-center" style="vertical-align:middle;">Civil Engineering</td>
                            <td class="text-center" style="vertical-align:middle;"><a href="ConsumeDDSR_View.jsp?department=Civil Engineering" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr>
                            <td class="text-center" style="vertical-align:middle;">05</td>
                            <td class="text-center" style="vertical-align:middle;">Mechanical Engineering</td>
                            <td class="text-center" style="vertical-align:middle;"><a href="ConsumeDDSR_View.jsp?department=Mechanical Engineering" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr>  
                            <td class="text-center" style="vertical-align:middle;">06</td>
                            <td class="text-center" style="vertical-align:middle;">Automobile Engineering</td>
                            <td class="text-center" style="vertical-align:middle;"><a href="ConsumeDDSR_View.jsp?department=Automobile Engineering" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr>  
                            <td class="text-center" style="vertical-align:middle;">07</td>
                            <td class="text-center" style="vertical-align:middle;">Electronics and Telecommunication Engineering</td>
                            <td class="text-center" style="vertical-align:middle;"><a href="ConsumeDDSR_View.jsp?department=Electronics and Telecommunication Engineering" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr>  
                            <td class="text-center" style="vertical-align:middle;">08</td>
                            <td class="text-center" style="vertical-align:middle;">Plastic Engineering</td>
                            <td class="text-center" style="vertical-align:middle;"><a href="ConsumeDDSR_View.jsp?department=Plastic Engineering" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">09</td>
                            <td class="text-center" style="vertical-align:middle;">Dress Desigining and Garments Manufacturing</td> 
                            <td class="text-center" style="vertical-align:middle;"><a href="ConsumeDDSR_View.jsp?department=Dress Desigining and Garments Manufacturing" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr>
                            <td class="text-center" style="vertical-align:middle;">10</td>
                            <td class="text-center" style="vertical-align:middle;">Interior Desigining and Decoration</td>
                            <td class="text-center" style="vertical-align:middle;"><a href="ConsumeDDSR_View.jsp?department=Interior Desigining and Decoration" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr>
                            <td class="text-center" style="vertical-align:middle;">11</td>
                            <td class="text-center" style="vertical-align:middle;">Electrical Engineering</td>
                            <td class="text-center" style="vertical-align:middle;"><a href="ConsumeDDSR_View.jsp?department=Electrical Engineering" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr>
                            <td class="text-center" style="vertical-align:middle;">12</td>
                            <td class="text-center" style="vertical-align:middle;">Science (Physics)</td>
                            <td class="text-center" style="vertical-align:middle;"><a href="ConsumeDDSR_View.jsp?department=Science (Physics)" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">13</td>
                            <td class="text-center" style="vertical-align:middle;">Science (Chemistry)</td>
                            <td class="text-center" style="vertical-align:middle;"><a href="ConsumeDDSR_View.jsp?department=Science (Chemistry)" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">14</td>
                            <td class="text-center" style="vertical-align:middle;">Gymkhana</td>
                            <td class="text-center" style="vertical-align:middle;"><a href="ConsumeDDSR_View.jsp?department=Gymkhana" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">15</td>
                            <td class="text-center" style="vertical-align:middle;">Applied Mechanics</td> 
                            <td class="text-center" style="vertical-align:middle;"><a href="ConsumeDDSR_View.jsp?department=Applied Mechanics" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">16</td>
                            <td class="text-center" style="vertical-align:middle;">Workshop</td> 
                            <td class="text-center" style="vertical-align:middle;"><a href="ConsumeDDSR_View.jsp?department=Workshop" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">17</td>
                            <td class="text-center" style="vertical-align:middle;">Library</td> 
                            <td class="text-center" style="vertical-align:middle;"><a href="ConsumeDDSR_View.jsp?department=Library" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">18</td>
                            <td class="text-center" style="vertical-align:middle;">Hostel Boys</td>
                            <td class="text-center" style="vertical-align:middle;"><a href="ConsumeDDSR_View.jsp?department=Hostel Boys" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">19</td>
                            <td class="text-center" style="vertical-align:middle;">Hostel Girls</td>
                            <td class="text-center" style="vertical-align:middle;"><a href="ConsumeDDSR_View.jsp?department=Hostel Girls" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">20</td>
                            <td class="text-center" style="vertical-align:middle;">Office</td> 
                            <td class="text-center" style="vertical-align:middle;"><a href="ConsumeDDSR_View.jsp?department=Office" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">21</td>
                            <td class="text-center" style="vertical-align:middle;">Exam Section</td>
                            <td class="text-center" style="vertical-align:middle;"><a href="ConsumeDDSR_View.jsp?department=Exam Section" class="btn btn-info">VIEW</a></td>
                        </tr>
                        <tr> 
                            <td class="text-center" style="vertical-align:middle;">22</td>
                            <td class="text-center" style="vertical-align:middle;">Others</td>
                            <td class="text-center" style="vertical-align:middle;"><a href="ConsumeDDSR_View.jsp?department=Others" class="btn btn-info">VIEW</a></td>
                        </tr>
                       
             </tbody>
          </table>
      </div>
    </div>
  </div>
</div>     
 <!--modal for change password --> 
 
 <div class="modal fade"  id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle"><strong>CHANGE PASSWORD</strong></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         
        <form action="Controller/pass_change.jsp" id="mypass" method="post" style="margin-left: 5%;">
       
        <div class="form-group">
            <label><strong>Enter Username:</strong></label>
            <input type="text" class="form-control" name="usname1" id="username" placeholder="Enter Username" style="width: 90%;"/> 
        </div>
      
        <div class="form-group">
            <label><strong>Enter Old Password:</strong></label>
            <input type="password" class="form-control" name="passw1" id="Old_Password" placeholder="Old Password" style="width: 90%;"/> 
        </div>
        <div class="checkbox">
            <label><input type="checkbox" onclick="showpass();">&nbsp;&nbsp;&nbsp;&nbsp;<strong>Show Password</strong></label>
        </div>
        
        <div class="form-group">
            <label><strong>Enter New Password:</strong></label>
            <input type="password" class="form-control" name="passw2" maxlength="8" id="nNew_Password" placeholder="New Password" style="width: 90%;"/> 
        </div>
            <div class="form-group">
            <label><strong>Confirm Password:</strong></label>
            <input type="password" class="form-control" name="cpassw2" maxlength="8" id="New_Password" placeholder="Confirm Password" style="width: 90%;"/> 
        </div>
            
        <div class="form-group">
        <div class="row">
        <div class="col-lg-6 checkbox">
            <label><input type="checkbox" onclick="showpass1();">&nbsp;&nbsp;&nbsp;&nbsp;<strong>Show Password</strong></label>
        </div>
        <div class="col-lg-6">
        <button type="submit" class="btn btn-success pull-right" style="margin-right:20%;">Submit</button>
        </div></div></div>
         </form>
          <script>
              $(document).ready(function(){
                  $("#mypass").submit(function(){
                      var pass1=$("#nNew_Password").val();
                      var pass2=$("#New_Password").val();
                      if(pass1==pass2)
                      {
                          return true;
                      }
                      else
                      {
                          alert("Enter Password Correctly");
                          return false;
                      }
                  });
              });
          </script>
        <%
        String msg1=null;
        msg1=request.getParameter("msg"); 
        
        //int ID=Integer.parseInt(request.getParameter("id"));
        try{      
        if(!msg1.equals(null))
        {
        %>  
            <br/>
            <p style="margin-left: 5%; color:red;"><b><%out.println("Incorrect Username and Password");%></b></p><%
        }
        }
         catch(Exception e){  }  %>
        
       
        <script>
                    function showpass()
                    {
                        var x=document.getElementById("Old_Password");
                        if(x.type==="password")
                        {
                            x.type="text";
                        }
                        else
                        {
                            x.type="password";
                        }
                    }
                    function showpass1()
                    {
                        var x=document.getElementById("New_Password");
                        if(x.type==="password")
                        {
                            x.type="text";
                        }
                        else
                        {
                            x.type="password";
                        }
                    }
                </script>
       
      </div>
   </div>
    </div>
  </div>

 
        </main>
    </body>
</html>
<%}else{ response.sendRedirect("index.jsp"); }%>





          