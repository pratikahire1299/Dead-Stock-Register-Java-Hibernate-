<!DOCTYPE html>
<html>
<head>
    	<meta charset="UTF-8">
	<meta http-equiv="X-UA-compatible" content="IE-edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">-->
<link rel="icon" type="ico" sizes="16x16" href="Images/lg.ico">
<link rel="stylesheet" href="Sidebar/CSS_for_bootstrap/bootstrap.min.css"/>
<script src="Sidebar/JS_for_bootstrap/bootstrap.min.js"></script>
<script src="Sidebar/JS_for_bootstrap/jquery-2.2.4.min.js"></script>
<script src="Sidebar/JS_for_bootstrap/popper.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"/>
    <%@include file="Sidebar/fileinclude.html"%>
    <link rel="stylesheet" href="Sidebar/CSS/loginpage.css">
    <title>DSR | Login</title>
    <!-- Latest compiled and minified CSS -->

</head>
<body>

<section class="login-block">
  <div class="container">
	  <div class="row">
		  <div class="box col-md-4 login-sec">
		    <h2 class="text-center">DSR LOGIN</h2>
                    <form action="Controller/db.jsp" method="post">
          <div class="inputBox"> 
            <input type="text" class="" placeholder="" name="usname" required>
            <label class="text-uppercase" >USERNAME</label>
          </div>
          <div class="input-group inputBox"> 
              
            <input type="password" id="password_input" placeholder="" name="passw" maxlength="8" required/>
            

            <label class="text-uppercase">PASSWORD</label>
              
          </div>
                       
        <form class="login-form">
          <div class="form-check">
              <span class="custom-control custom-checkbox">
    <input type="checkbox" class="custom-control-input" onclick="showpass();" id="customCheck" name="example1">
    <label class="custom-control-label" for="customCheck">Show Password</label>
  </span>
            <button type="submit" class="btn btn-login float-right">Submit</button>
          </div>
        </form><br/><br/><br/><br/>
        <%
                    String msg1=request.getParameter("msg");
                    try{      
                        if(!msg1.equals(null))
                        {
                %>          <p style="margin-left: 10%; color:red;"><b><%out.println("Incorrect Username or Password");%></b></p><%
                        }
                        } catch(Exception e){  }  %>
      </div>
		  <div class="col-md-8 banner-sec">
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
        </ol>
      <div class="carousel-inner" role="listbox">
        <div class="carousel-item active">
            <img class="d-block img-fluid" src="Images/gpn1.JPG" alt="First slide">
          <div class="carousel-caption d-none d-md-block">
            <div class="banner-text">
              <h2>GOVERNMENT POLYTECHNIC, NASHIK</h2>
              <p>An AUTONOMOUS INSTITUTE OF GOVERNMENT OF MAHARASHTRA</p>
            </div>
          </div>
        </div>
             <div class="carousel-item">
            <img class="d-block img-fluid" src="Images/logodsr.jpg" alt="First slide">
          <div class="carousel-caption d-none d-md-block">
              <div class="banner-text">
              <h2>DSR LOGO</h2>    
              </div>	
          </div>
          </div>
        <div class="carousel-item">
            <img class="d-block img-fluid" src="Images/centralstore.jpg"  alt="First slide">
          <div class="carousel-caption d-none d-md-block">
              <div class="banner-text">
              <h2>CENTRAL STORE</h2>    
              </div>	
          </div>
          </div>
        <div class="carousel-item">
            <img class="d-block img-fluid" src="Images/gpn2.JPG" alt="First slide">
          <div class="carousel-caption d-none d-md-block">
            <div class="banner-text">
         
            </div>	
          </div>
        </div>
      </div>	      
		</div>
	</div>
</div>
      <marquee><b style="font-size:30px;" class="mr-2">Developed By:</b><span style="font-size: 20px;">Pranav Vikharankar, Pratik Ahire    </span><b style="font-size:30px;" class="ml-3">Guided By:</b><span class="ml-1" style="font-size: 20px;">Prof. P.B. Mali</span></marquee>
  </div>
</section>
      <script>
          function showpass()
                    {
                        var x=document.getElementById("password_input");
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
</body>
</html>