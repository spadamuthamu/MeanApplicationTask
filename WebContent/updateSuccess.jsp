<!DOCTYPE html>
<html lang="en">
<head>
<link href="css/registration.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
<script src="javascripts/registration.js"></script>
</head>
<center>
<body ng-app="myApp4">
<div ng-controller="myCtrl4" >
<form name="user" ng-submit="submit()" novalidate>
<div class="testbox1">
  <h2 style="color:red">Updated Successfully</h2>
  <h2 style="color:blue">Welcome <%= request.getParameter("name") %></h2>
  <table border="0">
 <tr> <h3 style="color:blue">Your Updated Information</h3></tr>
  <br>
   Name : <%= request.getParameter("name") %>
   <br>
   First Name : <%= request.getParameter("fname") %>
   <br>
   Last Name : <%= request.getParameter("lname") %>
   <br>
   Date Of Birth : <%= request.getParameter("dob") %>
   <br>
   Address : <%= request.getParameter("addr") %>
   <br>
   City : <%= request.getParameter("city") %>
   <br>
   Zip : <%= request.getParameter("zip") %>
   <br>
<div> <tr><center><input type="submit" value="Click Here To Logout" id="button"/></center></tr></div>
</table>
</div>
</form>
</div>
<br><br><br><br>
</body>
</center>
</html>
