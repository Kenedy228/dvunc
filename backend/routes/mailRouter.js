const Router = require('express')
const mailController = require('../controllers/mailController')
const router = new Router()
const authMiddleware = require('../middleware/authMiddleware')

router.post('/', mailController.post)
router.get('/', authMiddleware, mailController.getMails)
router.post('/addMail', authMiddleware, mailController.addMail)
router.delete('/', authMiddleware, mailController.delete)

module.exports = router