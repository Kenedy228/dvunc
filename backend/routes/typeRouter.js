const Router = require('express')
const typeController = require('../controllers/typeController')
const router = new Router()

router.get('/', typeController.get)

module.exports = router