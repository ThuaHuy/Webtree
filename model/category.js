const mongoose = require('mongoose');
var Schema = mongoose.Schema;
var Category = new Schema({
    name : String
}, {collection: 'category'});
module.exports = mongoose.model("category", Category);