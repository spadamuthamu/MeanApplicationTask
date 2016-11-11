<!DOCTYPE html>
<html lang="en">
<%@ page language="java" import="java.util.*" %>
<%@ page import="java.io.*" %>
 
<%@ page import = "java.util.ResourceBundle" %>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<script src="javascripts/registration.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" />
<link href="css/updateProfile.css" rel="stylesheet">
</head>
<%
String email2="";
Cookie[] cookies = request.getCookies();
for (int i=0; i<cookies.length; i++)
{
if(cookies[i].getName().equals("email1"))
{
 email2=cookies[i].getValue();
}
}
%> 


 <div class="image">
 <h1 style="color:white">User Information</h1>
  <body ng-app="myApp3">    
  <div ng-controller="myCtrl3">
  
  <div class="testbox">
  <br>
<% ResourceBundle resource = ResourceBundle.getBundle("com.resources.app");

%>

   <form name="userForm" ng-submit="submit()" novalidate>
   <table border="0" align="center">
                   <tr>
				        <center>
                       <input type="text" name="email" class="form-control1" id="email"  placeholder=" <%= email2 %>&#xf0e0"  disabled >                                   
                           
				        </center>
				    </tr>
   <tr><center>
  <div class="form-group" ng-class="{ 'has-error' : userForm.fname.$invalid && (userForm.fname.$dirty || submitted)}">
        <input type="text" name="fname" class="form-control" ng-model="fname" placeholder="First Name" ng-required="true" ng-minlength="2" ng-maxlength="20" >
        <p ng-show="userForm.fname.$error.required && (userForm.fname.$dirty || submitted)" class="help-block"><%=resource.getString("property4") %></p>
        <p ng-show="userForm.fname.$error.minlength && (userForm.fname.$dirty || submitted)" class="help-block"><%=resource.getString("property5") %></p>
        <p ng-show="userForm.fname.$error.maxlength && (userForm.fname.$dirty || submitted)" class="help-block"><%=resource.getString("property6") %></p>
      </div>
      </center>
  </tr>
 <tr><center>
 <div class="form-group" ng-class="{ 'has-error' : userForm.lname.$invalid && (userForm.lname.$dirty || submitted)}">
        <input type="text" name="lname" class="form-control" ng-model="lname" placeholder="Last Name" ng-required="true" ng-minlength="2" ng-maxlength="20" >
        <p ng-show="userForm.lname.$error.required && (userForm.lname.$dirty || submitted)" class="help-block"><%=resource.getString("property4") %></p>
        <p ng-show="userForm.lname.$error.minlength && (userForm.lname.$dirty || submitted)" class="help-block"><%=resource.getString("property5") %></p>
        <p ng-show="userForm.lname.$error.maxlength && (userForm.lname.$dirty || submitted)" class="help-block"><%=resource.getString("property6") %></p>
      </div>
      </center>
  </tr>
  <tr><center>
 <div class="form-group" ng-class="{ 'has-error' : userForm.dob.$invalid && (userForm.dob.$dirty || submitted)}">
        <input type="text" name="dob" class="form-control" ng-model="dob" placeholder="Your BirthDay" ng-required="true" ng-minlength="8" ng-maxlength="10" >
        <p ng-show="userForm.dob.$error.required && (userForm.dob.$dirty || submitted)" class="help-block"><%=resource.getString("property10") %></p>
        <p ng-show="userForm.dob.$error.minlength && (userForm.dob.$dirty || submitted)" class="help-block"><%=resource.getString("property11") %></p>
        <p ng-show="userForm.dob.$error.maxlength && (userForm.dob.$dirty || submitted)" class="help-block"><%=resource.getString("property12") %></p>
      </div>
      </center>
  </tr><br>
 <tr><center>
   <div class="gender">
    <input type="radio" value="None" id="male" name="gender"  ng-model="gender" checked/>
    <label for="male" class="radio" chec>Male</label>
    <input type="radio" value="None" id="female" name="gender" ng-model="gender" />
    <label for="female" class="radio">Female</label>
	</div> 
	</center>
	</tr>
	 <tr>
	 <center>
	 <div class="form-group" ng-class="{ 'has-error' : userForm.addr.$invalid && (userForm.addr.$dirty || submitted)}">
        <input type="text" name="addr" class="form-control" ng-model="addr" placeholder="Address" ng-required="true" ng-minlength="3" ng-maxlength="20" >
        <p ng-show="userForm.addr.$error.required && (userForm.addr.$dirty || submitted)" class="help-block"><%=resource.getString("property13") %></p>
        <p ng-show="userForm.addr.$error.minlength && (userForm.addr.$dirty || submitted)" class="help-block"><%=resource.getString("property14") %></p>
        <p ng-show="userForm.addr.$error.maxlength && (userForm.addr.$dirty || submitted)" class="help-block"><%=resource.getString("property15") %></p>
      </div>
      </center>
  </tr>
  
  <tr><center>
  <div class="form-group" ng-class="{ 'has-error' : userForm.city.$invalid && (userForm.city.$dirty || submitted)}">
        <input type="text" name="city" class="form-control" ng-model="city" placeholder="City" ng-required="true" ng-minlength="2" ng-maxlength="20" >
        <p ng-show="userForm.city.$error.required && (userForm.city.$dirty || submitted)" class="help-block"><%=resource.getString("property16") %></p>
        <p ng-show="userForm.city.$error.minlength && (userForm.city.$dirty || submitted)" class="help-block"><%=resource.getString("property17") %></p>
        <p ng-show="userForm.city.$error.maxlength && (userForm.city.$dirty || submitted)" class="help-block"><%=resource.getString("property18") %></p>
      </div>
      </center>
  </tr>
 <tr><center>
 <div class="form-group" ng-class="{ 'has-error' : userForm.zip.$invalid && (userForm.zip.$dirty || submitted)}">
        <input type="text" name="zip" class="form-control" ng-model="zip" placeholder="Zip Code" ng-required="true" ng-minlength="6" ng-maxlength="7" >
        <p ng-show="userForm.zip.$error.required && (userForm.zip.$dirty || submitted)" class="help-block"><%=resource.getString("property19") %></p>
        <p ng-show="userForm.zip.$error.minlength && (userForm.zip.$dirty || submitted)" class="help-block"><%=resource.getString("property20") %></p>
        <p ng-show="userForm.zip.$error.maxlength && (userForm.zip.$dirty || submitted)" class="help-block"><%=resource.getString("property21") %></p>
      </div>
      </center>
  </tr>
  <tr></tr>

<tr><td><center><input type="submit" value="update" class="button"/></center></td></tr>
   </table>
  </form>
 </div><br><br>
</div>
</body>
</div>
</html>