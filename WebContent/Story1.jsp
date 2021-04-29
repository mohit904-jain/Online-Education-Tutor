
<!DOCTYPE html>
<html>
<title>Unit 1</title>
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
    <h5>English Unit 1</h5>
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
    <h3><b><a id="anchor" href="kg.jsp">KG</a> > <a id="anchor" href="Storymain.jsp">Story Telling</a> > <a id="anchor" href="Story1.jsp">Story 1</a></b></h3>
  </header>

   <!--row-->

  <div class="w3-row">
    <div class="w3-content">

      <div class="w3-card w3-white w3-hover-shadow w3-padding">
      <br>
      <br>

      <iframe width="100%" height="500" src="https://www.youtube.com/embed/uwzViw-T0-A"></iframe>
     
      <br>
      <br>
	<form action="Story1Servlet" method="post">
    <div class="w3-content">
      <div class="w3-card w3-white w3-hover-shadow w3-padding">
	<h4><b><span></span>Question 1:  What is the title of our story?</b><span></span></h4>
       <input class="w3-radio" type="radio" name="question1" value="The Lion and the mouse" checked>
<label>The Lion and the mouse</label><br>

<input class="w3-radio" type="radio" name="question1" value="The Thirsty crow">
<label>The Thirsty crow</label><br>

<input class="w3-radio" type="radio" name="question1" value="The crocodile and the rabbit" >
<label>The crocodile and the rabbit</label><br>


<h4><b><span></span>Question 2: What is the weather in the story?</b><span></span></h4>
       <input class="w3-radio" type="radio" name="question2" value="Summer day" checked>
<label>Summer day</label><br>

<input class="w3-radio" type="radio" name="question2" value="Winter day">
<label>Winter day</label><br>

<input class="w3-radio" type="radio" name="question2" value="Rainy day" >
<label>Rainy day</label><br>


<h4><b><span></span>Question 3: Its hot I'm thirsty I need to find Water who said this line?</b><span></span></h4>
       <input class="w3-radio" type="radio" name="question3" value="Crow" checked >
<label>Crow</label><br>

<input class="w3-radio" type="radio" name="question3" value="Monkey">
<label>Monkey</label><br>

<input class="w3-radio" type="radio" name="question3" value="Lion" >
<label>Lion</label><br>



<h4><b><span></span>Question 4: What kind of thing in our story its neck is very narrow?</b><span></span></h4>
       <input class="w3-radio" type="radio" name="question4" value="Paper" checked>
<label>Paper</label><br>

<input class="w3-radio" type="radio" name="question4" value="Shoes">
<label>Shoes</label><br>

<input class="w3-radio" type="radio" name="question4" value="Pitcher" >
<label>Pitcher</label><br>




<h4><b><span></span>Question 5: What idea come from crow so that he can drink water?</b><span></span></h4>
       <input class="w3-radio" type="radio" name="question5" value="He picked up small stones" checked>
<label>He picked up small stones</label><br>

<input class="w3-radio" type="radio" name="question5" value="He eat only">
<label>He eat only</label><br>

<input class="w3-radio" type="radio" name="question5" value="He call other animals" >
<label>He call other animals</label><br>



<h4><b><span></span>Question 6: What did he do after he picked up some stones?</b><span></span></h4>
       <input class="w3-radio" type="radio" name="question6" value="He eats the stones" checked>
<label>He eats the stones</label><br>

<input class="w3-radio" type="radio" name="question6" value="He dropped the stones one by one in the pitcher">
<label>He dropped the stones one by one in the pitcher</label><br>

<input class="w3-radio" type="radio" name="question6" value="He throw away the stones" >
<label>He throw away the stones</label><br>



<h4><b><span></span>Question 7: What happened when the crow drops one by one the stone in the pitcher?</b><span></span></h4>
       <input class="w3-radio" type="radio" name="question7" value="The water becomes juice" checked>
<label>The water becomes juice</label><br>

<input class="w3-radio" type="radio" name="question7" value="Nothing happened">
<label>Nothing happened</label><br>

<input class="w3-radio" type="radio" name="question7" value="The water rise in pitcher" >
<label>The water rise in pitcher</label><br>


<h4><b><span></span>Question 8: After the water rise in the pitcher what happened next?</b><span></span></h4>
       <input class="w3-radio" type="radio" name="question8" value="The crow drinks water" checked>
<label>The crow drinks water</label><br>

<input class="w3-radio" type="radio" name="question8" value="He breaks the pitcher">
<label>He breaks the pitcher</label><br>

<input class="w3-radio" type="radio" name="question8" value="He flies away" >
<label>He flies away</label><br>



<h4><b><span></span>Question 9: Is the crow satisfy to the water</b><span></span></h4>
       <input class="w3-radio" type="radio" name="question9" value="Yesr" checked>
<label>Yes</label><br>

<input class="w3-radio" type="radio" name="question9" value="No">
<label>No</label><br>

<input class="w3-radio" type="radio" name="question9" value="Maybe" >
<label>Maybe</label><br>
<h4><b><span></span>Question 10: Ah its cold and good who said this line?</b><span></span></h4>
       <input class="w3-radio" type="radio" name="question10" value="Crow" checked >
<label>Crow</label><br>

<input class="w3-radio" type="radio" name="question10" value="Rabbit">
<label>Rabbit</label><br>

<input class="w3-radio" type="radio" name="question10" value="Lion" >
<label>Lion</label><br>
  
  </div>
  
</div>
<br>
<br>
<input type="submit" value="Submit" style="margin-left: 83%; width:130px; padding: 10px; outline: none" class="w3-button w3-black  w3-hover-blue">
   <br>
   <br> </form>
       
        </div>
        </div>
        </div>
  </div>

<br>
<br>

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