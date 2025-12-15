const Router = require('express')
const licenseController = require('../controllers/licenseController')
const router = new Router()
const authMiddleware = require('../middleware/authMiddleware')

router.post('/', authMiddleware, licenseController.create)
router.get('/', licenseController.get)
router.get('/pdn', licenseController.getPdn)
router.delete('/', authMiddleware, licenseController.delete)
router.post('/pdn', authMiddleware, licenseController.update)

module.exports = router