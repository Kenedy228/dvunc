const Router = require('express')
const personalController = require('../controllers/personalController')
const router = new Router()
const multer = require('multer')
const authMiddleware = require('../middleware/authMiddleware')

router.post('/', personalController.create)
router.get('/', authMiddleware, personalController.getOne)

module.exports = router