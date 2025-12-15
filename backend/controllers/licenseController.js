const { License } = require('../models/models.js');
const ApiError = require('../error/ApiError');
const uuid = require('uuid');
const path = require('path');
const fs = require("fs");

class LicenseController {
    async create(req, res, next) {
        try {
            let fileName = '.pdf'

            if (req.files != null) {
                const { license_file } = req.files
                fileName = uuid.v4() + ".pdf"
                license_file.mv(path.resolve(__dirname, '..', 'static', fileName))
            }

            let { license_name } = req.body

            const candidate = await License.findOne({ where: { license_name } })
            if (candidate) {
                return next(ApiError.badRequest('Лицензия с таким названием уже существует'))
            }
            const license = await License.create({ license_name, license_file: fileName, license_type: 1 })
            return res.json(license)

        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async get(req, res, next) {
        try {
            const licenses = await License.findAll(
                {
                    where: { license_type: 1 },
                    order: [
                        ['license_id', 'ASC']
                    ]
                }
            )
            return res.json(licenses)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async getPdn(req, res, next) {
        try {
            const pdn = await License.findAll({
                where: { license_type: 2 }
            })

            return res.json(pdn)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async delete(req, res, next) {
        try {
            const { license_id } = req.query
            const license = await License.findOne({
                where: { license_id }
            })

            if (license.license_file !== null) {
                fs.access(path.resolve(__dirname, '..', 'static', license.license_file), function (error) {
                    if (error) {
                        console.log("Файл не найден")
                    } else {
                        fs.unlinkSync(path.resolve(__dirname, '..', 'static', license.license_file))
                    }
                })

            }
            const del = await License.destroy({ where: { license_id } })
            return res.json(del)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async update(req, res, next) {
        try {
            if (req.files == null) {
                return next(ApiError.internal('Выберите файл'))
            }

            const { license_file } = req.files

            const license = await License.findOne({
                where: { license_type: 2 }
            })
            fs.access(path.resolve(__dirname, '..', 'static', license.license_file), function (error) {
                if (error) {
                    let fileName = uuid.v4() + ".pdf"
                    license_file.mv(path.resolve(__dirname, '..', 'static', fileName))
                    license.update({ license_file: fileName })
                } else {
                    fs.unlinkSync(path.resolve(__dirname, '..', 'static', license.license_file))
                    license_file.mv(path.resolve(__dirname, '..', 'static', license.license_file))
                }
            })

            return res.json(license)
        }
        catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }
}

module.exports = new LicenseController()