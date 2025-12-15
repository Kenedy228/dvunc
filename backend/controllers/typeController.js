const { Type } = require('../models/models.js')

class TypeController {

    async get(req, res, next) {
        try {
            const types = await Type.findAll()
            return res.json(types)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }
}

module.exports = new TypeController()