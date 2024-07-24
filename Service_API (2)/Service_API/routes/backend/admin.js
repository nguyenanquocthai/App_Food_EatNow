let express = require('express');
const { model } = require('mongoose');
let router = express()
router.get('/' , (req,res)=> {
    res.render('../views/backend/admin-file')
})
module.exports = router