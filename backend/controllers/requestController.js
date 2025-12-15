const { Request, Personal, Firm, Member } = require('../models/models.js')
const ApiError = require('../error/ApiError')

class RequestController {
    async create(req, res, next) {

        try {
            let { request_type, sheduleSheduleId, request_personal, request_message } = req.body
            if (!request_type || !sheduleSheduleId) {
                return next(ApiError.internal('Заполните все обязательные поля'))
            }
            const request = await Request.create({ request_type, sheduleSheduleId, request_message })
            if (request_personal) {
                request_personal = JSON.parse(request_personal)
                if (!request_personal.personal_lastname || !request_personal.personal_name || !request_personal.personal_phone || !request_personal.personal_email) {
                    return next(ApiError.internal('Заполните все обязательные поля'))
                }
                request.createPersonal({
                    personal_lastname: request_personal.personal_lastname,
                    personal_name: request_personal.personal_name,
                    personal_surname: request_personal.personal_surname,
                    personal_phone: request_personal.personal_phone,
                    personal_email: request_personal.personal_email,
                })
            }

            return res.json(request)

        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async get(req, res, next) {
        try {
            const { sheduleSheduleId } = req.query
            let requests
            if (!sheduleSheduleId) {
                requests = await Request.findAll({
                    order: [
                        ['request_id', 'DESC']
                    ],
                })
            } else {
                requests = await Request.findAll({

                    where: { sheduleSheduleId },
                    order: [
                        ['request_id', 'DESC']
                    ],
                })
            }
            return res.json(requests)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async createFirm(req, res, next) {
        try {
            let { request_type, sheduleSheduleId, request_firm, firm_member, request_message } = req.body
            if (!request_type || !sheduleSheduleId) {
                return next(ApiError.internal('Заполните все обязательные поля'))
            }

            const request = await Request.create({ request_type, sheduleSheduleId, request_message })

            if (request_firm) {
                request_firm = JSON.parse(request_firm)
                if (!request_firm.firm_name || !request_firm.firm_represantivename || !request_firm.firm_phone || !request_firm.firm_email) {
                    return next(ApiError.internal('Заполните все обязательные поля'))
                }
                const firm = await request.createFirm({
                    firm_name: request_firm.firm_name,
                    firm_represantivename: request_firm.firm_represantivename,
                    firm_phone: request_firm.firm_phone,
                    firm_email: request_firm.firm_email,
                    firm_message: request_firm.firm_message
                })
                if (firm_member) {
                    firm_member = JSON.parse(firm_member)

                    firm_member.forEach((i) => {
                        Member.create({
                            member_lastname: i.member_lastname,
                            member_name: i.member_name,
                            member_surname: i.member_surname,
                            member_jobtitle: i.member_jobtitle,
                            member_email: i.member_email,
                            firmFirmId: firm.firm_id
                        })
                    })

                }
            }

            return res.json(request)

        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }
    async get(req, res, next) {
        try {
            const { sheduleSheduleId } = req.query
            let requests
            if (!sheduleSheduleId) {
                requests = await Request.findAll({
                    order: [
                        ['request_id', 'DESC']
                    ],
                })
            } else {
                requests = await Request.findAll({

                    where: { sheduleSheduleId },
                    order: [
                        ['request_id', 'DESC']
                    ],
                })
            }
            return res.json(requests)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async getOne(req, res, next) {
        try {
            const { request_id } = req.params
            const request = await Request.findOne(
                {
                    where: { request_id },
                    include: [{ model: Personal }, { model: Firm, include: [{ model: Member, as: "firm_member" }] }]
                }
            )
            return res.json(request)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async delete(req, res, next) {
        try {
            const { personal_id } = req.query
            const del = await Personal.destroy({ where: { personal_id } })
            return res.json(`deleted row(s): ${del}`)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async deleteFirm(req, res, next) {
        try {
            const { firm_id } = req.query
            const del = await Firm.destroy({ where: { firm_id } })
            return res.json(`deleted row(s): ${del}`)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }
}

module.exports = new RequestController()