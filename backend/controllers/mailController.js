let http = require('request')
const nodemailer = require("nodemailer");
const { Mail } = require('../models/models.js')
const ApiError = require('../error/ApiError')

class MailController {
    async getMails(req, res, next) {
        try {
            const mails = await Mail.findAll()
            return res.json(mails)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }
    async addMail(req, res, next) {
        try {
            let { mail_name } = req.body

            const candidate = await Mail.findOne({ where: { mail_name } })
            if (candidate) {
                return next(ApiError.badRequest('Указанная почта уже существует'))
            }
            const mail = await Mail.create({ mail_name })
            return res.json(mail)

        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }
    async post(req, res, next) {
        try {
            let { request_type, request_type_name, courseTg, sheduleStart, sheduleFinish, request_personal, request_firm, firm_member, request_message } = req.body

            let fields
            let fieldsIn
            if (request_personal) {
                request_personal = JSON.parse(request_personal)
                fields = [
                    '<h2 style="font-size: 16px">Общие данные</h2>',
                    '<p><b>Тип заявки</b></p> ' + request_type_name,
                    '<p><b>Курс</b></p> ' + courseTg,
                    '<p><b>Расписание</b></p> ' + sheduleStart + '-' + sheduleFinish,
                    '<h2 style="font-size: 16px; margin-top: 30px">Данные об обучаемом</h2>',
                    '<p><b>Фамилия</b></p> ' + request_personal.personal_lastname,
                    '<p><b>Имя</b></p> ' + request_personal.personal_name,
                    '<p><b>Отчество</b></p> ' + request_personal.personal_surname,
                    '<p><b>Номер телефона</b></p> ' + request_personal.personal_phone,
                    '<p><b>Почта</b></p> ' + request_personal.personal_email,
                    '<h2 style="font-size: 16px; margin-top: 30px">Дополнительно</h2>',
                    '<p><b>Комментарий</b></p> ' + request_message,
                ]
            }
            if (request_firm) {
                request_firm = JSON.parse(request_firm)
                fields = [
                    '<div>',
                    '<h2 style="font-size: 16px">Общие данные</h2>',
                    '<p><b>Тип заявки:</b></p> ' + request_type_name,
                    '<p><b>Курс:</b></p> ' + courseTg,
                    '<p><b>Расписание:</b></p> ' + sheduleStart + '-' + sheduleFinish,
                    '<h2 style="font-size: 16px; margin-top: 30px">Данные о компании</h2>',
                    '<p><b>Название</b></p> ' + request_firm.firm_name,
                    '<p><b>Имя представителя</b></p> ' + request_firm.firm_represantivename,
                    '<p><b>Номер телефона</b></p> ' + request_firm.firm_phone,
                    '<p><b>Почта</b></p> ' + request_firm.firm_email,
                    '<h2 style="font-size: 16px; margin-top: 30px">Дополнительно</h2>',
                    '<p><b>Комментарий</b></p> ' + request_message,
                    '<h2 style="font-size: 16px; margin-top: 30px">Список сотрудников</h2>',
                    '</div>'
                ]

                if (firm_member) {
                    firm_member = JSON.parse(firm_member)
                    firm_member.forEach((i) => {
                        fields.push(
                            `<p>${i.member_lastname} ${i.member_name} ${i.member_surname} ${i.member_jobtitle} ${i.member_email}`,
                        )
                    })
                }

            }

            let msg = ''
            //проходимся по массиву и склеиваем все в одну строку
            fields.forEach(field => {
                msg += field
            });

            //делаем запрос
            let transporter = nodemailer.createTransport({
                host: 'smtp.mail.ru',
                port: 465,
                auth: {
                    user: 'dvunc_req@mail.ru',
                    pass: 'W2z6aSkw77UNeENk1ZqB'
                }
            });

            const mails = await Mail.findAll()
            const emails = mails.map(
                i => i.mail_name
            )

            let result = await transporter.sendMail({
                from: '"ДВУНЦ (Заявки)" <dvunc_req@mail.ru>',
                to: emails,
                subject: 'Новая заявка',
                html: msg
            });

            console.log(result);
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async delete(req, res, next) {
        try {
            const { mail_id } = req.query
            const del = await Mail.destroy({ where: { mail_id } })
            return res.json(`deleted row(s): ${del}`)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

}

module.exports = new MailController()