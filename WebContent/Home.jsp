
<!DOCTYPE html>
<html>
<title>VGuru</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
.w3-hover-blue{
	
	background: #0366D6 !important;
}
</style>
<body class="w3-light-grey">

  <%
  if (session.getAttribute("username")==null)
  {
    response.sendRedirect("login.jsp");
  }
%>
<%
String name= (String)session.getAttribute("username");
%>



<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i> &nbsp;Menu</button>
  <span class="w3-bar-item w3-left w3-hide-small">VGuru</span>
  <span class="w3-bar-item w3-right w3-hide-small">The Learning Site</span>
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container w3-row">
    
    <div class="w3-col s8 w3-bar">
      <span>Welcome <strong><% out.print(name); %></strong></span><br>
      
    </div>
  </div>
  <hr>
  <div class="w3-container">
    <h5>Dashboard</h5>
  </div>
  <div class="w3-bar-block">
    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>&nbsp; Close Menu</a>
    <a href="Home.jsp" class="w3-bar-item w3-button w3-padding "><i class="fa fa-home fa-fw"></i>&nbsp; Over View</a>
    <a href="Profile.jsp" class="w3-bar-item w3-button w3-padding"><i class="	fa fa-user-circle fa-fw"></i>&nbsp; Profile</a>
    <form action="LogoutServlet" method="post">
    <button class="w3-bar-item w3-button w3-padding" type="submit"><i class="fas fa-external-link-alt"></i>&nbsp; Logout</button>
    </form>
  </div>
</nav>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <!-- Header -->
  <header class="w3-container" style="padding-top:22px">
    <h3><b>My Dashboard</b></h3>
  </header>

   <!--row-->

  <div class="w3-row">
  
  <div class="w3-col m6">
  	<div class="w3-content w3-margin w3-padding" style="padding: 10px;margin: 5px">
  	<!--card-->
  	<div class="w3-card w3-white w3-hover-shadow w3-padding">
  		<h4><b><i class='fas fa-book-open' ></i>&nbsp;Class Pre Kinder Garden</b></h4>
  <p>Includes Fun Quizzes and Assignments</p>

   <p><a href="taketest.html" class="w3-button w3-black  w3-hover-blue"> View</a></p>
	</div>
  </div>
</div>

 <div class="w3-col m6">
 	<div class="w3-content w3-margin w3-padding"  style="padding: 10px;margin: 5px">
 <!--card-->
 	<div class="w3-card w3-white w3-hover-shadow w3-padding">
 		<h4><b><i class='fas fa-book-open'></i>&nbsp;Class Lower Kinder Garden</b></h4>
  <p>Includes Fun Quizzes and Assignments</p>

  <p><a href="kg.jsp" class="w3-button w3-black w3-hover-blue"> View</a></p>
	</div>
  </div>
</div>
  </div>

  <div class="w3-row">
  
    <div class="w3-col m6">
      <div class="w3-content w3-margin w3-padding" style="padding: 10px;margin: 5px">
      <!--card-->
      <div class="w3-card w3-white w3-hover-shadow w3-padding">
        <h4><b><i class='fas fa-book-open'></i>&nbsp;Class Upper Kinder Garden</b></h4>
    <p>Includes Fun Quizzes and Assignments</p>
 
     <p><a href="taketest.html" class="w3-button w3-black  w3-hover-blue"> View</a></p>
    </div>
    </div>
  </div>
  
   <div class="w3-col m6">
     <div class="w3-content w3-margin w3-padding"  style="padding: 10px;margin: 5px">
   <!--card-->
     <div class="w3-card w3-white w3-hover-shadow w3-padding">
       <h4><b><i class='fas fa-book-open'></i>&nbsp; Class I</b></h4>
    <p>Includes Fun Quizzes and Assignments</p>
  
    <p><a href="report.html" class="w3-button w3-black w3-hover-blue"> View</a></p>
    </div>
    </div>
  </div>
    </div>
    <div class="w3-row">
  
      <div class="w3-col m6">
        <div class="w3-content w3-margin w3-padding" style="padding: 10px;margin: 5px">
        <!--card-->
        <div class="w3-card w3-white w3-hover-shadow w3-padding">
          <h4><b><i class='fas fa-book-open'></i>&nbsp;Class II</b></h4>
      <p>Includes Fun Quizzes and Assignments</p>
    
       <p><a href="taketest.html" class="w3-button w3-black  w3-hover-blue"> View</a></p>
      </div>
      </div>
    </div>
    
     <div class="w3-col m6">
       <div class="w3-content w3-margin w3-padding"  style="padding: 10px;margin: 5px">
     <!--card-->
       <div class="w3-card w3-white w3-hover-shadow w3-padding">
         <h4><b><i class='fas fa-book-open'></i>&nbsp;Class III</b></h4>
      <p>Includes Fun Quizzes and Assignments</p>
    
      <p><a href="report.html" class="w3-button w3-black w3-hover-blue"> View</a></p>
      </div>
      </div>
    </div>
      </div>
      <div class="w3-row">
  
        <div class="w3-col m6">
          <div class="w3-content w3-margin w3-padding" style="padding: 10px;margin: 5px">
          <!--card-->
          <div class="w3-card w3-white w3-hover-shadow w3-padding">
            <h4><b><i class='fas fa-book-open'></i>&nbsp;Class IV</b></h4>
        <p>Includes Fun Quizzes and Assignments</p>
      
         <p><a href="taketest.html" class="w3-button w3-black  w3-hover-blue"> View</a></p>
        </div>
        </div>
      </div>
      
       <div class="w3-col m6">
         <div class="w3-content w3-margin w3-padding"  style="padding: 10px;margin: 5px">
       <!--card-->
         <div class="w3-card w3-white w3-hover-shadow w3-padding">
           <h4><b><i class='fas fa-book-open'></i>&nbsp;Class V</b></h4>
        <p>Includes Fun Quizzes and Assignments</p>
      
        <p><a href="report.html" class="w3-button w3-black w3-hover-blue"> View</a></p>
        </div>
        </div>
      </div>
        </div>
        <div class="w3-row">
  
          <div class="w3-col m6">
            <div class="w3-content w3-margin w3-padding" style="padding: 10px;margin: 5px">
            <!--card-->
            <div class="w3-card w3-white w3-hover-shadow w3-padding">
              <h4><b><i class='fas fa-book-open'></i>&nbsp;Class VI</b></h4>
          <p>Includes Fun Quizzes and Assignments</p>
        
           <p><a href="taketest.html" class="w3-button w3-black  w3-hover-blue"> View</a></p>
          </div>
          </div>
        </div>
        
         <div class="w3-col m6">
           <div class="w3-content w3-margin w3-padding"  style="padding: 10px;margin: 5px">
         <!--card-->
           <div class="w3-card w3-white w3-hover-shadow w3-padding">
             <h4><b><i class='fas fa-book-open'></i>&nbsp;Class VII</b></h4>
          <p>Includes Fun Quizzes and Assignments</p>
       
          <p><a href="report.html" class="w3-button w3-black w3-hover-blue"> View</a></p>
          </div>
          </div>
        </div>
          </div>
          <div class="w3-row">
  
            <div class="w3-col m6">
              <div class="w3-content w3-margin w3-padding" style="padding: 10px;margin: 5px">
              <!--card-->
              <div class="w3-card w3-white w3-hover-shadow w3-padding">
                <h4><b><i class='fas fa-book-open'></i>&nbsp;Class VIII</b></h4>
            <p>Includes Fun Quizzes and Assignments</p>
          
             <p><a href="taketest.html" class="w3-button w3-black  w3-hover-blue"> View</a></p>
            </div>
            </div>
          </div>
          
           <div class="w3-col m6">
             <div class="w3-content w3-margin w3-padding"  style="padding: 10px;margin: 5px">
           <!--card-->
             <div class="w3-card w3-white w3-hover-shadow w3-padding">
               <h4><b><i class='fas fa-book-open'></i>&nbsp;Class IX</b></h4>
            <p>Includes Fun Quizzes and Assignments</p>
          
            <p><a href="report.html" class="w3-button w3-black w3-hover-blue"> View</a></p>
            </div>
            </div>
          </div>
            </div>
            <div class="w3-row">
  
              <div class="w3-col m6">
                <div class="w3-content w3-margin w3-padding" style="padding: 10px;margin: 5px">
                <!--card-->
                <div class="w3-card w3-white w3-hover-shadow w3-padding">
                  <h4><b><i class='fas fa-book-open'></i>&nbsp;Class X</b></h4>
              <p>Includes Fun Quizzes and Assignments</p>
           
               <p><a href="taketest.html" class="w3-button w3-black  w3-hover-blue"> View</a></p>
              </div>
              </div>
            </div>
            
             <div class="w3-col m6">
               <div class="w3-content w3-margin w3-padding"  style="padding: 10px;margin: 5px">
             <!--card-->
               <div class="w3-card w3-white w3-hover-shadow w3-padding">
                 <h4><b><i class='fas fa-book-open'></i>&nbsp;Class XI</b></h4>
              <p>Includes Fun Quizzes and Assignments</p>
            
              <p><a href="report.html" class="w3-button w3-black w3-hover-blue"> View</a></p>
              </div>
              </div>
            </div>
              </div>
              <div class="w3-row">
  
                <div class="w3-col m6">
                  <div class="w3-content w3-margin w3-padding" style="padding: 10px;margin: 5px">
                  <!--card-->
                  <div class="w3-card w3-white w3-hover-shadow w3-padding">
                    <h4><b><i class='fas fa-book-open'></i>&nbsp;Class XII</b></h4>
                <p>Includes Fun Quizzes and Assignments</p>
              
                 <p><a href="class12.jsp" class="w3-button w3-black  w3-hover-blue"> View</a></p>
                </div>
                </div>
              </div>
              
               
                </div>

  <!-- End page content -->
</div>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script>
// Get the Sidebar
var mySidebar = document.getElementById("mySidebar");

// Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {
  if (mySidebar.style.display === 'block') {
    mySidebar.style.display = 'none';
    overlayBg.style.display = "none";
  } else {
    mySidebar.style.display = 'block';
    overlayBg.style.display = "block";
  }
}

// Close the sidebar with the close button
function w3_close() {
  mySidebar.style.display = "none";
  overlayBg.style.display = "none";
}
</script>

</body>
</html>