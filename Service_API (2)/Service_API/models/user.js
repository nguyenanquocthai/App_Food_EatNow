const mongoose= require("mongoose");

const UserSchema=new mongoose.Schema({
    username: {
        type: String,
        required: true,
        unique: true
    },
    password: {
        type: String,
        required: true
    },
    email:{
        type:String,
        required:true,
        unique:true,

    },
    phone: {
        type: String,
        required: true
    },
    address: {
        type: String,
        required: true
    },
    role: {
        type: String,
        enum: ["admin", "user"],
        default: "user"
    } 
    
});

const User =mongoose.model("User",UserSchema);

module.exports= User;