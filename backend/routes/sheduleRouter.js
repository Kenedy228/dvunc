const Router = require('express')
const sheduleController = require('../controllers/sheduleController')
const router = new Router()
const multer = require('multer')
const authMiddleware = require('../middleware/authMiddleware')

router.post('/', authMiddleware, sheduleController.create)
router.get('/', sheduleController.get)
router.delete('/', authMiddleware, sheduleController.delete)

module.exports = router