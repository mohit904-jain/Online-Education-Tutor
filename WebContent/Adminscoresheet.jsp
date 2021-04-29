<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<title>Scoresheet</title>
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

String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "database";
String userid = "root";
String password = "";
String z=null;
float y=0;
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
.prepareStatement("select * from quizmarks");
resultSet = pst.executeQuery();


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
    <h5><b><i class="fa fa-file-excel-o"></i> Score Sheet</b></h5>
  </header>
   <!--row-->
   <div class="w3-row">
    <div class="w3-content">
    <div class="w3-card w3-white w3-hover-shadow w3-padding">
    <table class="w3-table-all">
<tr>
  <th>Username</th>
  <th>Class</th>
  <th >Subject</th>
  <th>Activity</th>
  <th>Marks</th>
</tr>
<%
while(resultSet.next()){
%>
<tr>
	<td><%=resultSet.getString("username") %></td>
  <td><%=resultSet.getString("class") %></td>
  <td><%=resultSet.getString("subject") %></td>
  <td><%=resultSet.getString("activity") %></td>
  <td class="w3-center"><%=resultSet.getInt("marks") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
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