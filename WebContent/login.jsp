<div>
<title> Login Page </title>
<br><br><br>
<center>
<h1 style="color:white">Login Form</h1>
<section class="login"><br>

<img src="images/key.png" class="a"></img>
<div>

<form name="adminForm" ng-submit="loginSubmit()" novalidate>
  <table border="0"> 
  <br>
  <div>  
     <tr>
		<td>
	         <label for="username"><h3 style="color:white">User Name:</h3></label>
	    </td>
	   <td>
			
              <input type="name" name="name" class="form-control" ng-model="name" placeholder="Your ID" ng-required="true" > 
               <div class="form-group" ng-class="{ 'has-error' : adminForm.name.$invalid && (adminForm.name.$dirty || submitted)}">
              <p ng-show="adminForm.name.$error.required && (adminForm.name.$dirty || submitted)" class="help-block">ID is required.</p>
              <p ng-show="adminForm.name.$error.name && (adminForm.name.$dirty || submitted)" class="help-block">Enter a valid ID.</p>
              </div>
    	 </td>
		    
     </tr>    
        <tr>
	       <td>  
		        <label for="password"><h3 style="color:white">Password: </h3></label>
		   </td>
		   <td>
		        <div class="form-group" ng-class="{ 'has-error' : adminForm.password.$invalid && (adminForm.password.$dirty || submitted)}">
           <input type="Password" name="password" class="form-control" ng-model="password" placeholder="Your Password" ng-required="true" ng-maxlength="8" maxlength="8"  >
        <p ng-show="adminForm.password.$error.required && (adminForm.password.$dirty || submitted)" class="help-block">Your password is required.</p>
		 <p ng-show="adminForm.password.$error.maxlength && (adminForm.password.$dirty || submitted)" class="help-block">Enter a valid password.</p>
		  <p ng-show="adminForm.password.$error.pattern && (adminForm.password.$dirty || submitted)" class="help-block">Enter a valide password.</p>
      </div>
    	         
		   </td>
	  </tr>
	        <br>
			 <tr>
			  
	      <td> 
		 <input type="submit" value="Login" class="btn-btn-primary" id="buttons1">
		  </form>
		  
		  </td>
          <td> 
		  <a href="#/registrationPage" style="text-decoration:none"><input type="button" value="Register" id="buttons" ></a>
		  
		  
		  </td>
	  </tr>
	  
	
	 </table>
	  </div></br></br></br></br></br></br></br></br></br>
	 </form>
    
	
  
  <modal  visible="showModal">
    <form name="popup" ng-submit="adminLoginSubmit()">
      <div class="form-group">
        <label for="pin">Enter pin</label>
        <input type="Password" class="form-control" id="pin" placeholder="Enter pin" ng-model="modalState.pin" name="pin"/>
      </div>
     
      <button type="submit" class="btn btn-default">ok</button>
    </form>
  </modal>
 
</div>

	  </section>
	   </div>
