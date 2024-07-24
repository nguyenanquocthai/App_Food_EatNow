

 const middlewareController = require("../middleware/middlewareController");
const userController=require("../controller/userController");
 const router=require("express").Router();
 const {
    verifyToken,
    veryTokenAndAdminAuth,}=require("../middleware/middlewareController");

   

//get All User

router.get("/",verifyToken,userController.getAlluser);

//delete user
router.delete("/delete/:id",veryTokenAndAdminAuth,userController.deleteUser);
module.exports=router;