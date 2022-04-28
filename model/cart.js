const mongoose = require('mongoose');
var Schema = mongoose.Schema;
var addCart = new Schema({
    name : String,
    cate: String,
    price: Number,
    quantity: Number,
    img: String
    
}, {collection: 'addcart'});
module.exports = mongoose.model("addCart", addCart);