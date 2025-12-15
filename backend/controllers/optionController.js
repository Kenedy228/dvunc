const { Option, Service } = require('../models/models.js')
const ApiError = require('../error/ApiError')

class OptionController {
    async create(req, res, next) {
        try {
            let { service_option, serviceServiceId } = req.body
            service_option = JSON.parse(service_option)

            service_option.forEach(i =>
                Option.create({
                    option_name: i.option_name,
                    serviceServiceId: serviceServiceId
                })
            )

            return res.json()

        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async get(req, res, next) {
        try {
            const { serviceServiceId } = req.query
            let options

            options = await Option.findAll({
                include: [{
                    model: Service // will create a left join
                }],
                where: { serviceServiceId }
            })

            return res.json(options)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async delete(req, res, next) {
        try {
            const { option_id } = req.query
            const del = await Option.destroy({ where: { option_id } })
            return res.json(`deleted row(s): ${del}`)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }
}

module.exports = new OptionController()