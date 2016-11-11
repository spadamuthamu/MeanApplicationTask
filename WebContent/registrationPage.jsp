<%@ page language="java" import="java.util.*" %>
<%@ page import="java.io.*" %> 
<%@ page import = "java.util.ResourceBundle" %>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="css/registration.css">

</head>
<div class="container" style="height:610px;" >
<center>
<div class="initial container" style="margin-top:-50px;">
  <h1 style="color:blue">Registration Form</h1>
<% 
ResourceBundle resource = ResourceBundle.getBundle("app");
%>

 
 <form name="userForm" ng-submit="registrationFormSubmit()" novalidate>
  <table border="0">
  <br>

  <tr>
 <div class="form-group" ng-class="{ 'has-error' : userForm.name.$invalid && (userForm.name.$dirty || submitted)}">
        <input type="text" name="name" class="form-control" ng-model="name" placeholder="Your Name" ng-required="true" ng-minlength="2" ng-maxlength="20" >
        <p ng-show="userForm.name.$error.required && (userForm.name.$dirty || submitted)" class="help-block"><%=resource.getString("property4") %></p>
        <p ng-show="userForm.name.$error.minlength && (userForm.name.$dirty || submitted)" class="help-block"><%=resource.getString("property5") %></p>
        <p ng-show="userForm.name.$error.maxlength && (userForm.name.$dirty || submitted)" class="help-block"><%=resource.getString("property6") %></p>
      </div>
</tr>
    <tr>
  <div class="form-group" ng-class="{ 'has-error' : userForm.email.$invalid && (userForm.email.$dirty || submitted)}">
              <input type="email" name="email" class="form-control" ng-model="email" placeholder="Your Email ID" ng-required="true">
              <p ng-show="userForm.email.$error.required && (userForm.email.$dirty || submitted)" class="help-block"><%=resource.getString("property7") %>.</p>
              <p ng-show="userForm.email.$error.email && (userForm.email.$dirty || submitted)" class="help-block"><%=resource.getString("property1") %>.</p>
              </div>
</tr>
 <tr>
     <div class="form-group" ng-class="{ 'has-error' : userForm.password.$invalid && (userForm.password.$dirty || submitted)}">
           <input type="Password" name="password" class="form-control" ng-model="password" placeholder="Your Password" ng-required="true" ng-maxlength="8" maxlength="8" ng-pattern="/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).*$/" >
        <p ng-show="userForm.password.$error.required && (userForm.password.$dirty || submitted)" class="help-block"><%=resource.getString("property2") %></p>
		 <p ng-show="userForm.password.$error.maxlength && (userForm.password.$dirty || submitted)" class="help-block"><%=resource.getString("property3") %></p>
		  <p ng-show="userForm.password.$error.pattern && (userForm.password.$dirty || submitted)" class="help-block"><%=resource.getString("property3") %></p>
      </div>

</tr><br>
<tr>
 <div class="form-group" ng-class="{ 'has-error' : userForm.terms.$invalid && (userForm.terms.$dirty || submitted)}">
           <input type="checkbox" value="" name="terms" ng-model="user.terms" ng-required="true" />
        <label><h4>Accept Terms & Conditions</h4></label>
     
        <p ng-show="userForm.terms.$error.required && (userForm.terms.$dirty || submitted)" class="help-block"><%=resource.getString("property8") %></p>
      </div>
</tr><tr></tr>
<tr><center><input type="submit" value="submit" class="" id="button"/></center></tr>
</table>
</form>

</div>
</center>
</div>
