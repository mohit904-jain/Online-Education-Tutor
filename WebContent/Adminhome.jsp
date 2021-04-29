<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<title>Admin</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
.w3-hover-black{
	
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
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "database";
String userid = "root";
String password = "";
String z=null;
String q=null;
String r=null;
int x=0;
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
PreparedStatement pst=null;
String modules="";
try{ 
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
pst = connection
.prepareStatement("select count(username) from accounts");
resultSet = pst.executeQuery();
while(resultSet.next()){
	x=resultSet.getInt(1);
}
z=Integer.toString(x);
pst = connection
.prepareStatement("select count(username) from currentusers");
resultSet = pst.executeQuery();
while(resultSet.next()){
	x=resultSet.getInt(1);
}
q=Integer.toString(x);
pst = connection
.prepareStatement("select count(*) from quizmarks");
resultSet = pst.executeQuery();
while(resultSet.next()){
	x=resultSet.getInt(1);
}
r=Integer.toString(x);
} catch (Exception e) {
e.printStackTrace();
}

%>



<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i> &nbsp;Menu</button>
  <span class="w3-bar-item w3-left w3-hide-small">VGuru</span>
  <span class="w3-bar-item w3-right w3-hide-small">Admin</span>
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
    <h5>Administrator</h5>
  </div>
  <div class="w3-bar-block">
    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>&nbsp; Close Menu</a>
    <a href="Adminhome.jsp" class="w3-bar-item w3-button w3-padding "><i class="fa fa-home fa-fw"></i>&nbsp; Dashboard</a>
    
    <form action="LogoutServlet" method="post">
        <button class="w3-bar-item w3-button w3-padding" type="submit"><i class="fa fa-external-link"></i>&nbsp; Logout</button>
        </form>
  </div>
</nav>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <!-- Header -->
  <header class="w3-container" style="padding-top:22px">
    <h5><b><i class="fa fa-dashboard"></i> My Dashboard</b></h5>
  </header>
  <br>
  <Br>
   <!--row-->
   <div class="w3-row-padding w3-margin-bottom">
    
    <div class="w3-quarter">
      <div class="w3-container w3-orange w3-text-white w3-padding-16">
        <div class="w3-left"><i class="fa fa-users w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3><% out.print(z); %></h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Registered Users</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-blue w3-padding-16">
        <div class="w3-left"><i class="fa fa-eye w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3><% out.print(q); %></h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Current Users</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-teal w3-padding-16">
        <div class="w3-left"><i class="fa fa-pencil w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3><% out.print(r); %></h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Assesments</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-red w3-padding-16">
        <div class="w3-left"><i class="fa fa-comment w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3>0</h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Queries</h4>
      </div>
    </div>
  </div>
<div class="w3-row">
  
  <div class="w3-col m6">
    <div class="w3-content w3-margin w3-padding" style="padding: 10px;margin: 5px">
    <!--card-->
    <div class="w3-card w3-white w3-hover-shadow w3-padding">
      <h4><b><i class="fa fa-upload Try it"></i>&nbsp; Upload Videos</b></h4>
  <p>Upload The learning videos</p>

   <p><a href="uploadquestion1.html" class="w3-button w3-black  w3-hover-blue"> Upload</a></p>
  </div>
  </div>
</div>
<div class="w3-col m6">
  <div class="w3-content w3-margin w3-padding"  style="padding: 10px;margin: 5px">
 <!--card-->
  <div class="w3-card w3-white w3-hover-shadow w3-padding">
    <h4><b><i class="fa fa-edit  Try it"></i>&nbsp; Active Users</b></h4>
  <p>View the active users</p>

  <p><a href="Admincurrentusers.jsp" class="w3-button w3-black w3-hover-blue"> Check</a></p>
  </div>
  </div>
</div>
</div>
  <div class="w3-row">
  
  <div class="w3-col m6">
  	<div class="w3-content w3-margin w3-padding" style="padding: 10px;margin: 5px">
  	<!--card-->
  	<div class="w3-card w3-white w3-hover-shadow w3-padding">
  		<h4><b><i class="fa fa-eye fa-fw"></i>&nbsp; Score sheet</b></h4>
  <p>View The Score of users</p>

   <p><a href="Adminscoresheet.jsp" class="w3-button w3-black  w3-hover-blue"> View</a></p>
	</div>
  </div>
</div>
 
  </div>

 
  
  <!-- End page content -->
</div>

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