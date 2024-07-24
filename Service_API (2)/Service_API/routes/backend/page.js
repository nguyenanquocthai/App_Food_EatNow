let express = require('express');
const { model } = require('mongoose');
let router = express()
router.get('/' , (req,res)=> {
    res.render('../views/backend/page-file')
})

router.get('/addpage' , (req,res)=> {
    res.render('../views/backend/add-page-file')
})

router.get('/editpage' , (req,res)=> {
    res.render('../views/backend/edit-page-file')
})

module.exports = router