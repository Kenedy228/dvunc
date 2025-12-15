const Router = require('express')
const courseController = require('../controllers/courseController')
const router = new Router()
const multer = require('multer')
const authMiddleware = require('../middleware/authMiddleware')

router.post('/', authMiddleware, courseController.create)
router.get('/', courseController.get)
router.get('/:course_id', courseController.getOne)
router.put('/:course_id', authMiddleware, courseController.update)
router.delete('/', authMiddleware, courseController.delete)

module.exports = router