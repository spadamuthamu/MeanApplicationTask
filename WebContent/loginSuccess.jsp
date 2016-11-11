<!DOCTYPE html>
<html lang="en">
<head>
<link href="css/registration.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
<script src="javascripts/login.js"></script>
</head>
<center>
<%
String email=request.getParameter("email");
Cookie cookie = new Cookie ("email1",email);
response.addCookie(cookie);
cookie.setMaxAge(50 * 50); //Time is in Minutes
%> 
<body ng-app="loginSuccessApp">
<div ng-controller="loginSuccessCtrl" >
<form name="userForm" ng-submit="loginSuccessSubmitForm()" novalidate>
<div class="testbox">
  <h2 style="color:blue">Welcome <%= request.getParameter("name") %></h2>
  <table border="0">
  <h3 style="color:blue">Your Information</h3>
  <br>
   name : <%= request.getParameter("name") %>
   <br>
   email : <%= request.getParameter("email") %>
<div> <tr><center><input type="submit" value="Edit" id="button"/></center></tr></div>
</table>
</div>
</form>
</div>
<br><br><br><br>
</body>
</center>
</html>