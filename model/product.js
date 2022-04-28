const mongoose = require("mongoose");
const Schema = mongoose.Schema;
var Product = new Schema({
    name: String,
    insurance: String,
    weigh: String,
    origin: String,
    img: String,
    img1: String,
    img2: String,
    img3: String,
    img4: String,
    price: Number,
    category_name: String,
    id_category: Number
}, {collection: 'product'})
module.exports = mongoose.model("product", Product);