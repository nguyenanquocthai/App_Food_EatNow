const mongoose = require("mongoose");

const ProductSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
        unique: true
    },
    price: {
        type: Number,
        requried: true
    },
    quantity: {
        type: Number,
        required: true,
    },
    img: {
        type: String,
        required: true
    },
    Size: {
        type: String,
        required: true

    },
    category_id: {
        type: mongoose.SchemaTypes.ObjectId,
        ref: "Category"
    }
})

const Product = mongoose.model("Product", ProductSchema);

module.exports = Product;