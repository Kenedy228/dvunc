const { Format } = require('../models/models.js')

class FormatController {

    async get(req, res, next) {
        try {
            const formats = await Format.findAll()
            return res.json(formats)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }
}

module.exports = new FormatController()