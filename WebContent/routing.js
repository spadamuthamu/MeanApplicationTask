var express = require('express');
var cors = require('cors');
var session = require('express-session');
var MongoClient = require('mongodb').MongoClient;
var app = express();
app.use(session({resave: true, saveUninitialized: true, secret: 'SOMERANDOMSECRETHERE', cookie: { maxAge: 60000 }}));
//app.use(session({secret: 'ssshhhhh'}));
app.use(cors());
app.get('/login', function (req, res) {
   res.sendFile( __dirname + "/" + "login.html" );
})

app.get('/reg', function (req, res) {
	
   // Prepare output in JSON format
   response = {
      name:req.query.name,
      pwd:req.query.pwd,
     email:req.query.email,
   };
   console.log(response);
MongoClient.connect("mongodb://localhost:27017/API", function(err, db) {
  if(!err) {
    console.log("We are connected");
 var collection = db.collection('register');
 var c1= response;
collection.insert(c1);
	db.close();
	res.send("true");
 }
 else{console.log("error in connection");}
})
})

app.get('/logi', function (req, res) {
   // Prepare output in JSON format
   console.log("entered log");
    sess=req.session;
   response= {
	  email:req.query.email,
      pwd:req.query.pwd,
      
              };
  
   console.log(response);
 
 // res.end(JSON.stringify(response));

MongoClient.connect("mongodb://localhost:27017/API", function(err, db) {
  if(!err) {
    console.log("We are connected");
 var collection = db.collection('register');
 
collection.find({email: response.email}).toArray(function (err, result) {
      if (err) {
        console.log(err);
      } 
	  else if (result.length) {
		  console.log(response.email);
        console.log('Found:', result[0].email);
		 console.log('Found:', result[0].pwd);
		cid=result[0].email;
		name=result[0].name;
		pass=result[0].pwd;
		console.log(cid);
		if(cid==response.email && pass==response.pwd)
		{
			if(response.pwd=="Admin"){
				console.log("true2");
		  sess.cid1 = cid;
		  sess.name1 = name;
	      console.log(sess.cid1);
			res.send({ valid: 'valid1',email: sess.cid1,name: sess.name1 });
			}
			else
			{
			console.log("true1");
		  sess.cid = cid;
		  sess.name = name;
	      console.log(sess.cid);
			res.send({ valid: 'valid',email: sess.cid,name: sess.name });}
			
		}
		
		else{
			 console.log("not valid");
			res.send("not valid");
			}
      }
	  else {
		   console.log(response.pwd);
        console.log('No document(s) found with defined "find" criteria!');
      }
     
    })
db.close();
  }
})
})

app.get('/update', function (req, res) {
   // Prepare output in JSON format
   sess=req.session;
   response = {
      fname:req.query.fname,
	  lname:req.query.lname,
      dob:req.query.dob,
     city:req.query.city,
	 zip:req.query.zip,
	 addr:req.query.addr,
   };
   
   var c = sess.cid ;
     var n = sess.name ;
   console.log(c);
  console.log(n);
   console.log(response);
MongoClient.connect("mongodb://localhost:27017/API", function(err, db) {
  if(!err) {
    console.log("We are connected");
 var collection = db.collection('register');
 console.log(sess.cid);
collection.update({email : c},{$set:{"fname":response.fname,"lname":response.lname,"dob":response.dob,"city":response.city,"zipcode":response.zip,"addr":response.addr,}})
	db.close();
	res.send(n);
	
 }
})
})

app.get('/update1', function (req, res) {
   // Prepare output in JSON format
   sess=req.session;
   response = {
      name:req.query.name,
	  email:req.query.email
   };
   console.log(response);
MongoClient.connect("mongodb://localhost:27017/API", function(err, db) {
  if(!err) {
    console.log("We are connected");
 var collection = db.collection('register');
collection.update({email : response.email},{$set:{"name":response.name}})
	db.close();
	res.send("true1");
 }
})
})







app.get('/retrive', function (req, res) {
	 sess=req.session;
	console.log('retrive');
	console.log(sess.cid);
	//sess.cid=null;
	//sess.name=null;
   res.send("true");
})

app.get('/delete', function (req, res) {
   // Prepare output in JSON format
   console.log("addfghjk");
   response= {
      email:req.query.email
     };
  
   console.log(response);
MongoClient.connect("mongodb://localhost:27017/API", function(err, db) {
  if(!err) {
    console.log("We are connected");
 var collection = db.collection('register');
 
collection.remove({email: response.email});
db.close();
res.send("deleted");
  }
})
})

app.get('/pin', function (req, res) {
   // Prepare output in JSON format
   console.log("addfghjk");
   response= {
      pin:req.query.pin
      
   };
  
   console.log(response);
MongoClient.connect("mongodb://localhost:27017/API", function(err, db) {
  if(!err) {
    console.log("We are connected");
 var collection = db.collection('register');
 
collection.find({Pin: response.pin}).toArray(function (err, result) {
      if (err) {
        console.log(err);
      } 
	  else if (result.length) {
		 
        console.log('Found:', result[0].Pin);
		 
		
	var	pin=result[0].Pin;
		
	  
		if(pin==response.pin)
		{
			console.log("true1");
		 res.send({ valid:'valid',name: result[0].name })
		}
		else{
			res.send("notvalid");
		}
	  }

		else {
		   console.log(response.pwd);
        console.log('No document(s) found with defined "find" criteria!');
      }
     
    })
db.close()
  }
})
})


app.get('/adminretrive', function (req, res) {
   // Prepare output in JSON format
   console.log("addfghjk"); 
 // res.end(JSON.stringify(response));

MongoClient.connect("mongodb://localhost:27017/API", function(err, db) {
  if(!err) {
    console.log("We are connected");
 var collection = db.collection('register');
 
collection.find().toArray(function (err, result) {
      if (err) {
        console.log(err);
      } else if (result.length) {
		  
		for(i=0;i<result.length;i++)
		{
		console.log('Found:', result[i].email);
		}
		res.send(result);
      }
	  else {
		   console.log(response.pwd);
        console.log('No document(s) found with defined "find" criteria!');
      }
     
    })
db.close()
  }
})
})




var server = app.listen(8081, function () {
   var host = server.address().address
   var port = server.address().port
   console.log("Example app listening at http://%s:%s", host, port)

})