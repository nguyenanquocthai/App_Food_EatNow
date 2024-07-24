const cartController=require("../controller/cartController");
const router=require("express").Router();
const middlewareController = require("../middleware/middlewareController");

router.post("/addCart",middlewareController.verifyToken,cartController.addCart);
router.delete("/removeCart",middlewareController.verifyToken,cartController.removeItem);
router.post("/oder",middlewareController.verifyToken,cartController.placeOrder);
module.exports=router;