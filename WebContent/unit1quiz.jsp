
<!DOCTYPE html>
<html>

<title>Quiz</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="stylesheet.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
.w3-hover-black{
	
	background: #0366D6 !important;
}
#anchor{
    text-decoration: none;
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

  
  <script src='https://kit.fontawesome.com/a076d05399.js'></script>
 


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
    <h5>English Unit 1 Quiz</h5>
  </div>
  <div class="w3-bar-block">
    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>&nbsp; Close Menu</a>
    <a href="Home.jsp" class="w3-bar-item w3-button w3-padding "><i class="fa fa-home fa-fw"></i>&nbsp; Dashboard</a>
    <a href="Profile.jsp" class="w3-bar-item w3-button w3-padding"><i class="	fa fa-user-circle fa-fw"></i>&nbsp; Profile</a>
    <form action="LogoutServlet" method="post">
        <button class="w3-bar-item w3-button w3-padding" type="submit"><i class="fas fa-external-link-alt"></i>&nbsp; Logout</button>
        </form>
  </div>
</nav>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">
<!-- Header -->
  <header class="w3-container" style="padding-top:22px">
    <h3><b><a id="anchor" href="class12.jsp">Class XII</a> > <a id="anchor" href="class12commerce.jsp">Commerce Stream</a> > <a id="anchor" href="class12english.jsp">English</a> > <a href="class12englishunit1.jsp" id="anchor">Unit 1</a> > Quiz</b></h3>
  	<h5>By default First option is checked</h5>
  </header>
  

  

<br>
<br>
  <div class="w3-row">
  <form action="Checkandsave" method="post">
    <div class="w3-content">
      <div class="w3-card w3-white w3-hover-shadow w3-padding">
	<h4><b><span></span>Question 1: `Who is the author of The Last Lesson?</b><span></span></h4>
       <input class="w3-radio" type="radio" name="question1" value="Jane Austen" checked>
<label>Jane Austen</label><br>

<input class="w3-radio" type="radio" name="question1" value="Rabindra Nath Tagore">
<label>Rabindra Nath Tagore</label><br>

<input class="w3-radio" type="radio" name="question1" value="Alphonse Daudet" >
<label>Alphonse Daudet</label><br>


<h4><b><span></span>Question 2: The story The Last Lesson highlights which human tendency?</b><span></span></h4>
       <input class="w3-radio" type="radio" name="question2" value="Procastination" checked>
<label>Procastination</label><br>

<input class="w3-radio" type="radio" name="question2" value="Courage">
<label>Courage</label><br>

<input class="w3-radio" type="radio" name="question2" value="Cowardice" >
<label>Cowardice</label><br>


<h4><b><span></span>Question 3: What were the things being taken for granted by the people of Alsace?</b><span></span></h4>
       <input class="w3-radio" type="radio" name="question3" value="People around" checked >
<label>People around</label><br>

<input class="w3-radio" type="radio" name="question3" value="Time and school">
<label>Time and school</label><br>

<input class="w3-radio" type="radio" name="question3" value="Money and power" >
<label>Money and power</label><br>



<h4><b><span></span>Question 4: What does The Last Lesson symbolize?</b><span></span></h4>
       <input class="w3-radio" type="radio" name="question4" value="Loss" checked>
<label>Loss</label><br>

<input class="w3-radio" type="radio" name="question4" value="Loss of freedom">
<label>Loss of freedom</label><br>

<input class="w3-radio" type="radio" name="question4" value="Loss of language and freedom" >
<label>Loss of language and freedom</label><br>




<h4><b><span></span>Question 5: What does The Last Lesson signify?</b><span></span></h4>
       <input class="w3-radio" type="radio" name="question5" value="Change of power" checked>
<label>Change of power</label><br>

<input class="w3-radio" type="radio" name="question5" value="Change of teachers">
<label>Change of teachers</label><br>

<input class="w3-radio" type="radio" name="question5" value="Change in life" >
<label>Change in life</label><br>



<h4><b><span></span>Question 6: What do the marching soldiers under the windows represent?</b><span></span></h4>
       <input class="w3-radio" type="radio" name="question6" value="The Dawn of Prussia in defeat of French people" checked>
<label>The Dawn of Prussia in defeat of French people</label><br>

<input class="w3-radio" type="radio" name="question6" value="The defeat of Prussia">
<label>The defeat of Prussia</label><br>

<input class="w3-radio" type="radio" name="question6" value="The victory of French" >
<label>The victory of French</label><br>



<h4><b><span></span>Question 7: From where did the orders come to teach only German in the districts of Alsace and Lorraine?</b><span></span></h4>
       <input class="w3-radio" type="radio" name="question7" value="France" checked>
<label>France</label><br>

<input class="w3-radio" type="radio" name="question7" value="Lorraine">
<label>Lorraine</label><br>

<input class="w3-radio" type="radio" name="question7" value="Berlin" >
<label>Berlin</label><br>


<h4><b><span></span>Question 8: What do the effects this story speaks about?</b><span></span></h4>
       <input class="w3-radio" type="radio" name="question8" value="Power" checked>
<label>Power</label><br>

<input class="w3-radio" type="radio" name="question8" value="Money">
<label>Money</label><br>

<input class="w3-radio" type="radio" name="question8" value="Transition" >
<label>Transition</label><br>



<h4><b><span></span>Question 9: Why was Franz reluctant to go to school?</b><span></span></h4>
       <input class="w3-radio" type="radio" name="question9" value="Wanted to enjoy outdoor" checked>
<label>Wanted to enjoy outdoor</label><br>

<input class="w3-radio" type="radio" name="question9" value="Wanted to see soldiers drill">
<label>Wanted to see soldiers drill</label><br>

<input class="w3-radio" type="radio" name="question9" value="Wanted to enjoy warm Sunlight" >
<label>Wanted to enjoy warm Sunlight</label><br>
<h4><b><span></span>Question 10: What attitude of M.Hamel surprised Franz?</b><span></span></h4>
       <input class="w3-radio" type="radio" name="question10" value="soft and kind" checked >
<label>Soft and kind</label><br>

<input class="w3-radio" type="radio" name="question10" value="rude">
<label>Rude</label><br>

<input class="w3-radio" type="radio" name="question10" value="firm and strict" >
<label>Firm and strict</label><br>
  
  </div>
  
</div>
<br>
<br>
<input type="submit" value="Submit" style="margin-left: 83%; width:130px; padding: 10px; outline: none" class="w3-button w3-black  w3-hover-blue">
   <br>
   <br> </form></div>
  </div>


<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js'></script>
<script type="text/javascript" src='questions.json'></script>
<script type='text/javascript' src='jsquiz.js'></script>

  <!-- End page content -->

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