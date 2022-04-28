const express = require("express");
const bodyParser = require("body-parser");
const ejs = require('ejs');
const mongoose = require('mongoose');
const session = require('express-session');
const app = express();
mongoose.connect('mongodb://localhost:27017/doan', {useNewUrlParser: true });
var User = require('./model/user');
var addCart = require('./model/cart');
var Product = require("./model/product");
var Category = require("./model/category");
const { json } = require("body-parser");
var categories ;
Category.find({}, function (err, results) {
  if (err) {
    console.log(err);
  } else {
      categories = results;
  }
});
var cart = [];


  app.use(session({
    secret: 'secret',
    resave: true,
    saveUninitialized: true,
    maxAge: 86400000
  }));




app.use(express.static("public"));

app.set('view engine', 'ejs');

app.use(bodyParser.urlencoded({extended: true}));


app.get("/", function(req, res){
  
res.render("index",{username: req.session.username});
});

app.post("/register", function (req, res) {
  const newUser = new User({
    Username: req.body.username,
    Password: req.body.password,
    Phone: req.body.phone,
    Email: req.body.email,
    Name: req.body.name
  })
  newUser.save(function (err) {
    if (err) {
      res.send("Username already");
    } else {
      res.render("index");
    }
    
  })
});

app.get("/login", function(req, res) {
  res.render("register");
});

app.post('/login', function(req, res) {
	
	let username = req.body.username;
	let password = req.body.password;
  
  User.findOne({Username: username}, function (err, results) {
    if (err) {
      console.log(err);
    } 
    
      if (results.Password === password) {
        req.session.password = password;
        req.session.username = username;
        res.render("index", {username: req.session.username});
      } else {
        res.send("Password or Username incorrect");
      }
    }
  )

});


app.get("/user", function(req, res){
   if (req.session.username) {
     User.findOne({Username: req.session.username}, function (err, results) {
       if (err) {
         console.log(err);
       } else {
         res.render("customer", {my_account: results})
       }
         });
       
     
   }else{
     res.render("register");
   }
});
app.get("/logout", function(req, res){
  req.session.destroy();
  addCart.deleteMany({}, function (err, result) {
    if (err) {
      console.log(err);
    } else {
      res.render("index");
    }
  })

  });

app.post("/account/update_account", function(req, res){
    let name = req.body.name;
    let email = req.body.email;
    let phone = req.body.phone;
 
   User.findOneAndUpdate({Username: req.session.username}, {Name: name, Email: email, Phone: phone}, function (err, result) {
     if (err) {
       console.log(err);
     } else {
       res.redirect("/User");
     }
   })
    
 });
app.get("/account/change_pass", function(req, res){
      res.render("customer2");
    });

app.post("/account/change_pass", function(req, res){
  
    let old_pass = req.body.passold;
    let new_pass = req.body.passnew;
   
     if (old_pass === req.session.password) {
      User.findOneAndUpdate({Username: req.session.username}, {Password: new_pass}, function (err, result) {
        if (err) {
          console.log(err);
        } else {
          res.redirect("/logout");
        }
      });
     } else {
      res.send('Incorrect Password!');
     }
    });
    ///////////////////////////////////////////////////////////////////////////////// Xong user //////////////////////////////////
app.get("/product_detail/:id", function(req, res){
  const id = req.params.id;
  Product.findOne({_id: id}, function (err, result) {
    if (err) {
      console.log(err);
    } else {
    
       res.render("product_detail", {detail: result, category: categories, username: req.session.username})
      }
    })
  });
  
  

app.get("/products", function (req, res) {
  Product.find({}, function (err, results) {
    if (err) {
      console.log(err);
    } else {
      
      res.render("products",{username: req.session.username, products: results, category: categories});
     
    }
    
  })
  
});
app.get("/category/:id_category", function (req, res) {
  var id_category = req.params.id_category;
  console.log(id_category);
  Product.find({category_name: id_category }, function (err, results) {
    if (err) {
      console.log(err);
    } else {
      res.render("products",{username: req.session.username, products: results, category: categories})
      
    }
  })
  
});

app.get("/search", function (req, res) {
  let key = req.query.key;
  let name = '%' + key + '%'
  Product.find({ name: { $regex: key, $options: 'i' } }, function (err, results) {
    if (err) {
      console.log(err);
    } else {
      res.render("products",{username: req.session.username, products: results, category: categories})
    }
    
  })
  
});

app.post("/cart", function (req, res) {

  let quantity = Number(req.body.quantity);
  let id = req.body.id;
  
  Product.findOne({_id: id}, function (err, result) {
    if (err) {
      console.log(err);
    } else {
      const newAdd = new addCart({
        name: result.name,
        cate: result.category_name,
        price: result.price,
        quantity: quantity,
        img: result.img
      })
      newAdd.save(function (err) {
        if (err) {
          res.send("Username already");
        } else {
          res.redirect("/showcart");
        }
        
      })
      
    }
    
  })
  
})
app.get("/showcart", function (req, res) {
  var tt = 0;
  addCart.find({}, function (err, results) {
    if (err) {
      console.log(err);
    } else {
      results.forEach(element => {
        var last_price = element.quantity*element.price;
        tt+=last_price;
        
      });
      
      res.render("cart", {username: req.session.username, category: categories, cart: results, tt: tt})
    }
    
  })
  
})
app.get("/delcart", function (req, res) {
  item_cart = [];
  req.session.cart.destroy;
 
  res.redirect("/")
  
})
app.listen(3000, function(){
    console.log("This port is 3000");
});