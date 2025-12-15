const { Request, Personal, Firm, Member } = require('../models/models.js')
const ApiError = require('../error/ApiError')

class PersonalController {
    async create(req, res, next) {
        try {
            let { personal_lastname, personal_name, personal_surname, personal_phone, personal_email } = req.body
            const request = await Personal.create({ personal_lastname, personal_name, personal_surname, personal_phone, personal_email })

            return res.json(request)

        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }
    async getOne(req, res, next) {
        try {
            const { personal_id } = req.query
            const personal = await Personal.findOne(
                {
                    where: { personal_id }
                }
            )
            return res.json(personal)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }
}

module.exports = new PersonalController()