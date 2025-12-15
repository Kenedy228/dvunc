const { TypeOfService } = require('../models/models.js')

class TypeOfServiceController {

    async get(req, res, next) {
        try {
            const types = await TypeOfService.findAll()
            return res.json(types)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }
}

module.exports = new TypeOfServiceController()