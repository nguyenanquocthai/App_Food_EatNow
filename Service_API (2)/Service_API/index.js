const express = require('express');
const dotenv = require('dotenv');
const mongoose = require('mongoose');
const app = express();
const authRoute = require("./routes/auth");
const userRoute = require("./routes/User");
const categoriesRoute = require("./routes/category");
const productRoute = require("./routes/product");
const cartRoute = require("./routes/cart");
const fs = require('fs');
const path = require('path');

dotenv.config();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

app.set('view engine', 'ejs'); // Set the view engine to EJS
app.set('views', path.join(__dirname, 'views')); // Set the views directory

app.use("/food/auth", authRoute);
app.use("/food/user", userRoute);
app.use("/food/categories", categoriesRoute);
app.use("/food/product", productRoute);
app.use("/food/cart", cartRoute);

const connectToMongo = async () => {
   try {
     await mongoose.connect(process.env.MONGOODB_URL);
     console.log("Connected to MongoDB");
   } catch (error) {
     console.error("Error connecting to MongoDB", error);
     process.exit(1); // Exit the process with failure
   }
 };

connectToMongo();
const PORT = process.env.PORT || 3000;
app.set('view engine','ejs')
app.use(express.static(__dirname+'/public/'))

// app.get('/', (req, res) => {
//   res.render('../views/backend/admin-dashboard')
// });



let adminroute = require('./routes/backend/admin');
let pageroute = require('./routes/backend/page');
app.use('/admin', adminroute);
app.use('/admin/page', pageroute);


app.use(express.static('public'));

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
