const Router = require('express')
const typeofserviceController = require('../controllers/typeofserviceController')
const router = new Router()

router.get('/', typeofserviceController.get)

module.exports = router