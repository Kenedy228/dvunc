const Router = require('express')
const router = new Router()
const userController = require('../controllers/userController')
const authMiddleware = require('../middleware/authMiddleware')

router.post('/registration', authMiddleware, userController.registration)
router.post('/login', userController.login)
router.put('/updLogin', authMiddleware, userController.updLogin)
router.put('/updPass', authMiddleware, userController.updPass)
router.get('/auth', authMiddleware, userController.check)
router.get('/users', authMiddleware, userController.getAll)
router.delete('/', authMiddleware, userController.delete)
router.put('/', authMiddleware, userController.update)

module.exports = router