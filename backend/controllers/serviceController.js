const { Service, TypeOfService, Option } = require('../models/models.js')
const ApiError = require('../error/ApiError')

class ServiceController {
    async create(req, res, next) {
        try {
            let { service_title, service_optionTitle, service_description, typeofserviceTypeofserviceId, service_option } = req.body
            const service = await Service.create({ service_title, service_optionTitle, service_description, typeofserviceTypeofserviceId })

            if (service_option) {
                service_option = JSON.parse(service_option)
                service_option.forEach((i) => {
                    Option.create({
                        option_name: i.option_name,
                        serviceServiceId: service.service_id,
                    })
                })
            }
            return res.json(service)

        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async get(req, res, next) {
        try {
            const { typeofserviceTypeofserviceId } = req.query

            let services = await Service.findAll({
                include: [{
                    model: TypeOfService // will create a left join
                }],
                where: { typeofserviceTypeofserviceId },
                order: [
                    ['service_id', 'ASC']
                ],

            })
            return res.json(services)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async getAll(req, res, next) {
        try {
            let services = await Service.findAll({
                include: [{
                    model: TypeOfService // will create a left join
                }],
                order: [
                    ['service_id', 'ASC']
                ]
            })
            return res.json(services)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async getOne(req, res, next) {
        try {
            const { service_id } = req.params
            const service = await Service.findOne(
                {
                    where: { service_id },
                    include: [{ model: TypeOfService }, { model: Option, as: "service_option" }]
                }
            )
            return res.json(service)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async delete(req, res, next) {
        try {
            const { service_id } = req.query
            const del = await Service.destroy({ where: { service_id } })
            return res.json(`deleted row(s): ${del}`)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async update(req, res, next) {
        try {
            const { service_id } = req.params
            let { service_title, service_optionTitle, service_description, typeofserviceTypeofserviceId } = req.body

            const service = await Service.findOne({
                where: { service_id }
            })
            const serviceUpd = service.update({ service_title, service_optionTitle, service_description, typeofserviceTypeofserviceId })

            return res.json(serviceUpd)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }
}

module.exports = new ServiceController()