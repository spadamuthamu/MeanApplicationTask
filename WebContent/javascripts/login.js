var mainApp = angular.module('mainApp', ['ngRoute']);
mainApp.config(function($routeProvider) {
	$routeProvider
		.when('/login', {
			templateUrl: 'login.jsp',
			controller: 'mainController'
		})
		.when('/registrationSuccess', {
			templateUrl: 'registrationSuccess.jsp',
			controller: 'mainController'
		})
		.when('/registrationPage', {
			templateUrl: 'registrationPage.jsp',
			controller: 'mainController'
		})
		.when('/loginSuccess', {
			templateUrl: 'loginSuccess.jsp',
			controller: 'mainController'
		})
		.when('/updateProfile', {
			templateUrl: 'updateProfile.jsp',
			controller: 'mainController'
		})
		.when('/updateSuccess', {
			templateUrl: 'updateSuccess.jsp',
			controller: 'mainController'
		})
		.otherwise('/login');
});


mainApp.controller('mainController', function ($scope,$http,$window,$location) {
	$scope.modalState = {};
    $scope.showModal = false;
    $scope.loginSubmit = function(){
    	
    	$scope.submitted = true;
        
        if ($scope.adminForm.$valid) {
        	 var email=$scope.name;
        	 var pwd=$scope.password;
         
        	  $http.get('http://localhost:8081/logi?email='+email+'&pwd=' +pwd)
             .then(function(response) {
              if(response.status==200)
        	     {
            	  
            	  if(response.data.valid=="valid")
       		   {
       			  
               $window.location.href ="loginSuccess.jsp?name="+response.data.name+"&email="+response.data.email;
       		   }
       		   else if(response.data.valid=="valid1")
       		   {
       			  $scope.showModal = !$scope.showModal;
       		   }
       	       else{
       	    $window.location.href ="login.jsp";
       	       }
                 }
             });
        }
        else{
        	alert("form invalid");
        } 
    }
    
    
    $scope.adminLoginSubmit= function(){
    	
    	var c = $scope.modalState.pin;
    	
    	$http.get('http://localhost:8081/pin?pin='+c)
        .then(function(response) {
         if(response.status==200)
   	     {
       	 
        	 if(response.data)
             {
                
              $window.location.href ="userinfo.jsp?name="+response.data.name;
             }     	    
               else{
            	   alert("not entered");
            	   $window.location.href ="login.jsp";
   	             }
            }
        });	
    }
    $scope.registrationFormSubmit = function () {
        
        // Set the 'submitted' flag to true
        $scope.submitted = true;
        
        if ($scope.userForm.$valid) {
   	 
        //alert("Form is valid!");
   	   var name=$scope.name;
   		var pwd=$scope.password;
   		var email=$scope.email;
   	
   	  $http.get('http://localhost:8081/reg?name='+name+ '&pwd='+pwd+'&email=' +email)
     .then(function(response) {
       if(response.status==200)
   	{
           $window.location.href ="registrationSuccess.jsp";
   		}
   	  });
        }
        else {
        alert("Please correct errors!");
        }
        }; 
       
}); 

mainApp.directive('modal', function () {
    return {
      template: '<div class="modal fade">' + 
          '<div class="modal-dialog">' + 
            '<div class="modal-content">' + 
              '<div class="modal-header">' + 
                '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>' + 
                '<h4 class="modal-title">{{ title }}</h4>' + 
              '</div>' + 
              '<div class="modal-body" ng-transclude></div>' + 
            '</div>' + 
          '</div>' + 
        '</div>',
      restrict: 'E',
      transclude: true,
      replace:true,
      scope:true,
      link: function postLink(scope, element, attrs) {
        scope.title = attrs.title;

        scope.$watch(attrs.visible, function(value){
          if(value == true)
            $(element).modal('show');
          else
            $(element).modal('hide');
        });

        $(element).on('shown.bs.modal', function(){
          scope.$apply(function(){
            scope.$parent[attrs.visible] = true;
          });
        });

        $(element).on('hidden.bs.modal', function(){
          scope.$apply(function(){
            scope.$parent[attrs.visible] = false;
          });
        });
      }
    };
    $scope.registrationFormSubmit = function () {
        
        // Set the 'submitted' flag to true
        $scope.submitted = true;
        
        if ($scope.userForm.$valid) {
   	 
        //alert("Form is valid!");
   	   var name=$scope.name;
   		var pwd=$scope.password;
   		var email=$scope.email;
   	
   	  $http.get('http://localhost:8081/reg?name='+name+ '&pwd='+pwd+'&email=' +email)
     .then(function(response) {
       if(response.status==200)
   	{
           $window.location.href ="registrationSuccess.jsp";
   		}
   	  });
        }
        else {
        alert("Please correct errors!");
        }
        };
  });
var loginSuccessApp = angular.module('loginSuccessApp',[]);
loginSuccessApp.controller('loginSuccessCtrl', function ($scope,$http,$window,$location) {
		
	//	var data = factory.retrive();
		//alert(data);
		/* $scope.name = service.name;
		 $scope.email = service.email;
		*/
		$scope.loginSuccessSubmitForm = function () {
			alert("hello")
 $window.location.href ="updateProfile.jsp";
 }; 
	 
});
var myapp7 = angular.module('myapp7', []);
myapp7.controller('myctrl7', function ($scope,$http,$window,$location) {
    // function to submit the form after all validation has occurred 
    $scope.modalState = {};
   $scope.showModal = false;
    $scope.submit = function () {
   	
   	 $http.get('http://localhost:8081/adminretrive')
        .then(function(response) {
         if(response.status==200)
   	     {
       	 
   		   if(response.data) 
   		   {
   			  $scope.result = response.data;
   		   }
   	       else{
   	    	   alert("data not retrived");
   	       }
   		}
   	  }); 
   	
    }
    
    $scope.delet = function (x) {
  	   alert(x.email);
  	   $http.get('http://localhost:8081/delete?email='+x.email)
         .then(function(response) {
          if(response.status==200)
    	     {
        	 
    		   if(response.data=="deleted") 
    		   {
    			  alert("Deleted");
    		   }
    	       else{
    	    	   alert("data not deleted");
    	       }
    		}
    	  }); 
  	   
    }
    
    $scope.edit = function (x) {
  	  $scope.modalState.name = x.name;
  	  $scope.modalState.email = x.email;
  	  $scope.showModal = !$scope.showModal;
  	 	  
    }
    
    $scope.submit1= function(){
    	
    	var name = $scope.modalState.name;
    	var email = $scope.modalState.email;
    	$http.get('http://localhost:8081/update1?name='+name+'&email='+email)
        .then(function(response) {
         if(response.status==200)
   	     {
       	 
   		         if(response.data=="true1") 
   		         {
   		        	 
   		         alert("Updated");
   		        $scope.showModal = false;
   		         }    	    
               else{
            	   alert("not Updated");
            	   
   	             }
            }
        });
    	
    	
    	
    }
    $scope.logout= function(){
  	  $window.location.href ="index.jsp";
    }
});

myapp7.directive('modal', function () {
	    return {
	      template: '<div class="modal fade">' + 
	          '<div class="modal-dialog">' + 
	            '<div class="modal-content">' + 
	              '<div class="modal-header">' + 
	                '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>' + 
	                '<h4 class="modal-title">{{ title }}</h4>' + 
	              '</div>' + 
	              '<div class="modal-body" ng-transclude></div>' + 
	            '</div>' + 
	          '</div>' + 
	        '</div>',
	      restrict: 'E',
	      transclude: true,
	      replace:true,
	      scope:true,
	      link: function postLink(scope, element, attrs) {
	        scope.title = attrs.title;

	        scope.$watch(attrs.visible, function(value){
	          if(value == true)
	            $(element).modal('show');
	          else
	            $(element).modal('hide');
	        });

	        $(element).on('shown.bs.modal', function(){
	          scope.$apply(function(){
	            scope.$parent[attrs.visible] = true;
	          });
	        });

	        $(element).on('hidden.bs.modal', function(){
	          scope.$apply(function(){
	            scope.$parent[attrs.visible] = false;
	          });
	        });
	      }
	    };
	  });
