const { Module, Course } = require('../models/models.js')
const ApiError = require('../error/ApiError')

class ModuleController {
    async create(req, res, next) {
        try {
            const { course_id } = req.params
            let { course_module, courseCourseId } = req.body
            course_module = JSON.parse(course_module)

            course_module.forEach(i =>
                Module.create({
                    module_name: i.module_name,
                    courseCourseId: courseCourseId
                })
            )

            return res.json()

        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async get(req, res, next) {
        try {
            const { courseCourseId } = req.query
            let modules
            if (!courseCourseId) {
                modules = await Module.findAll({
                    include: [{
                        model: Course // will create a left join
                    }]
                })
            } else {
                modules = await Module.findAll({
                    include: [{
                        model: Course // will create a left join
                    }],
                    where: { courseCourseId }
                })
            }
            return res.json(modules)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async delete(req, res, next) {
        try {
            const { module_id } = req.query
            const del = await Module.destroy({ where: { module_id } })
            return res.json(`deleted row(s): ${del}`)

        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }
}

module.exports = new ModuleController()