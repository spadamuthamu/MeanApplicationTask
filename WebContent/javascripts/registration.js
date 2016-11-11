	var myapp1 = angular.module('myApp1', []);
	myapp1.controller('myCtrl1', function ($scope,$http,$window,$location) {
     // function to submit the form after all validation has occurred 
     $scope.registrationSuccessSubmit = function () {
     
     $window.location.href ="index.jsp";
     }; 
    });
	
	var myapp2 = angular.module('myApp2', []);
	myapp2.controller('myCtrl2', function ($scope,$http,$window,$location) {
		
		$scope.submitForm = function () {
     
     $window.location.href ="updateProfile.jsp";
     }; 
	 
    });
	
	
	
	
	var myapp3 = angular.module('myApp3', []);
	myapp3.controller('myCtrl3', function ($scope,$http,$window,$location) {
		
       $scope.submit = function () {
    	   $scope.submitted = true;
    	     
    	     if ($scope.userForm.$valid) {
    	   
    	   
        var fname=$scope.fname;
		var dob=$scope.dob;
		var gender=$scope.gender;
        var lname=$scope.lname;
		var city=$scope.city;
		var zip=$scope.zip;
		var addr=$scope.addr;
		$http.get('http://localhost:8081/update?fname='+fname+ '&lname='+lname+'&dob=' +dob+'&gender='+gender+'&city='+city+'&zip='+zip+'&addr='+addr)
  .then(function(response) {
      if(response.status==200)
	    {
    	 
    	  if(response.data)
		   {
			  // factory.insert(response.data.name,response.data.email);
			   
			  
       $window.location.href ="updateSuccess.jsp?fname="+fname+"&lname="+lname+"&dob="+dob+"&city="+city+"&zip="+zip+"&addr="+addr+"&name="+response.data;
       
		   }
		}
	  });	
     }
     else {
         alert("Please correct errors!");
         }
       }
       
    });
	
	
	var myapp4 = angular.module('myApp4', []);
	myapp4.controller('myCtrl4', function ($scope,$http,$window,$location) {
     // function to submit the form after all validation has occurred 
		     $scope.submit = function () {
		    	
    	 $http.get('http://localhost:8081/retrive').then(function(response) {
    	      if(response.status==200)
    		    {
    	    	  if(response.data)
    			   {   
    	    		  $window.location.href ="adminlogin.jsp";
    			   }
    			}
    		  });
		    	 
    	
     }; 
    });