const productController = require("../controller/productController");
const product= require("../controller/productController");
const path = require('path');
const multer = require('multer');
const router=require("express").Router();

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'uploads/'); // Directory to store files
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + path.extname(file.originalname)); // Unique file name based on timestamp
    },
});


const upload = multer({ storage: storage });

//
router.get('/product' , (req,res)=> {
    res.render('../views/backend/product-file')
})

router.get('/addproduct' , (req,res)=> {
    res.render('../views/backend/add-product-file')
})

router.get('/editproduct' , (req,res)=> {
    res.render('../views/backend/edit-product-file')
})

router.post("/createProduct",upload.single('img'),productController.createProduct);

router.get("/getProduct",productController.getProduct);

router.patch("/updateProdcut/:id",productController.updateProduct);

router.delete("/deleteProduct",productController.deleteProduct);
module.exports=router;