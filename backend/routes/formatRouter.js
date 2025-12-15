const Router = require('express')
const formatController = require('../controllers/formatController')
const router = new Router()

router.get('/', formatController.get)

module.exports = router