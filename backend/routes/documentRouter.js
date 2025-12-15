const Router = require('express')
const documentController = require('../controllers/documentController')
const router = new Router()

router.get('/', documentController.get)

module.exports = router