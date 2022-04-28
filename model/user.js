const mongoose = require('mongoose');
var Schema = mongoose.Schema;

var User = new Schema({
  Username : String,
  Password : String,
  Name : String,
  Email : String,
  Phone : Number
},{collection : 'user'});
module.exports =  mongoose.model('user', User);