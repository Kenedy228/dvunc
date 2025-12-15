const { Document } = require('../models/models.js')

class DocumentController {

    async get(req, res, next) {
        try {
            const documents = await Document.findAll()
            return res.json(documents)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }
}

module.exports = new DocumentController()