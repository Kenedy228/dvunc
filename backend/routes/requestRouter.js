const Router = require('express')
const requestController = require('../controllers/requestController')
const router = new Router()
const multer = require('multer')
const authMiddleware = require('../middleware/authMiddleware')

router.post('/', requestController.create)
router.post('/firm', requestController.createFirm)
router.get('/', authMiddleware, requestController.get)
router.get('/:request_id', requestController.getOne)
router.delete('/', requestController.delete)
router.delete('/firm', requestController.deleteFirm)

module.exports = router