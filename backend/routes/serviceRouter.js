const Router = require('express')
const serviceController = require('../controllers/serviceController')
const router = new Router()
const authMiddleware = require('../middleware/authMiddleware')

router.post('/', authMiddleware, serviceController.create)
router.get('/', serviceController.get)
router.get('/all', serviceController.getAll)
router.get('/:service_id', serviceController.getOne)
router.delete('/', authMiddleware, serviceController.delete)
router.put('/:service_id', authMiddleware, serviceController.update)


module.exports = router