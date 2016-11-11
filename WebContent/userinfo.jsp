<!doctype html>
<html>
  <head>
    <script src="http://code.angularjs.org/1.0.6/angular.min.js"></script>
    <script src="javascripts/login.js"></script>
    <link href="css/userinfo.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
  <body ng-app="myapp7" ng-controller="myctrl7">
 
  <form ng-submit="submit()" >
  <br>
<center><h3 style="color:skyblue">Welcome <%= request.getParameter("name") %></h3></center> <input type="submit" value="UserInfo"  id="c"><br><br><br>
  <table border="1" align="center" style="color:white">
  <tr style="color:skyblue"><th><center>NAME</center></th><th><center>EMAIL</center></th><th>EDIT</th><th>DELETE</th></tr>
  <tr ng-repeat="x in result">
  
    <td><center>{{ x.name }}</center></td>
    <td><center>{{ x.email }}</center></td>
    <td><center><span class="glyphicon glyphicon-pencil" ng-click="edit(x)"></span></center></td>
    <td><center><span class="glyphicon glyphicon-trash" ng-click="delet(x)"></span></center></td>
  </tr>
</table></center>
  </form>
   <modal  visible="showModal">
    <form name="popup" ng-submit="submit1()">
      <div class="form-group">
        <label for="pin">Name</label>
        <input type="text" class="form-control" id="name"  ng-model="modalState.name" name="name"/>
        <label for="pin">Email</label>
         <input type="text" class="form-control" id="email"  ng-model="modalState.email" name="email" readonly/>
      </div>
     
     <center> <button type="submit" class="btn btn-default">Save</button></center>
    </form>
   
  </modal>
  <br>
  
  <input type="submit" value="Logout" id="buttons" ng-click="logout()">
</body>
</html>