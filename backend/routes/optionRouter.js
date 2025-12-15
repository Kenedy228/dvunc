const Router = require('express')
const optionController = require('../controllers/optionController')
const router = new Router()
const multer = require('multer')
const authMiddleware = require('../middleware/authMiddleware')

router.post('/', authMiddleware, optionController.create)
router.get('/', optionController.get)
router.delete('/', authMiddleware, optionController.delete)

module.exports = router