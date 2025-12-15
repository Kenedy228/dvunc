const Router = require('express')
const moduleController = require('../controllers/moduleController')
const router = new Router()
const multer = require('multer')
const authMiddleware = require('../middleware/authMiddleware')

router.post('/', authMiddleware, moduleController.create)
router.get('/', moduleController.get)
router.delete('/', authMiddleware, moduleController.delete)

module.exports = router